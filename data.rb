require 'json'
require 'ostruct'
require './rental'
require './person'
require './student'

def file_init
  File.write('./json_files/books.json', []) unless File.exist?('./json_files/books.json')
  File.write('./json_files/people.json', []) unless File.exist?('./json_files/people.json')
  File.write('./json_files/rentals.json', []) unless File.exist?('./json_files/rentals.json')
end

def read_books
  books = []
  JSON.parse(File.read('./json_files/books.json')).each do |book|
    new_book = Book.new(book['title'], book['author'])
    books.push(new_book)
  end
  books
end

def write_books(book)
  all_books = JSON.parse(File.read('./json_files/books.json'))
  temp = {
    title: book.title,
    author: book.author,
    rentals: book.rentals
  }
  all_books.push(temp)

  File.write('./json_files/books.json', JSON.generate(all_books))
end

def write_people(person)
  all_people = JSON.parse(File.read('./json_files/people.json'))
  if person.instance_of? Student
    student = { class: 'Student', name: person.name.to_s, age: person.age.to_s,
                parent_permission: person.parent_permission.to_s, id: person.id.to_s, rentals: person.rentals }
    all_people.push(student)
  else
    teacher = { class: 'Teacher', name: person.name.to_s, age: person.age.to_s,
                specialization: person.specialization.to_s, id: person.id.to_s, rentals: person.rentals }
    all_people.push(teacher)
  end
  File.write('./json_files/people.json', JSON.generate(all_people))
end

def read_people
  people = []
  all_people = File.read('./json_files/people.json')
  if all_people.empty?
    puts "\nNo registered people Yet!!"
  elsif all_people.class != NilClass
    new_all_people = JSON.parse(all_people)
    new_all_people.each do |person|
      people << case person['class']
                when 'Student'
                  Student.new(person['age'], nil, person['name'], parent_permission: person['parent_permission'])
                when 'Teacher'
                  Teacher.new(person['age'], person['specialization'], person['name'])
                end
    end
  end
  people
end

def write_rental(rental)
  all_rental = JSON.parse(File.read('./json_files/rentals.json'))
  new_rental = { date: rental.date.to_s,
                 person: { name: rental.person.name.to_s,
                           age: rental.person.age.to_s,
                           id: rental.person.id.to_s,
                           rentals: rental.person.rentals },
                 book: { title: rental.book.title.to_s, author: rental.book.author.to_s } }
  all_rental.push(new_rental)
  File.write('./json_files/rentals.json', JSON.generate(all_rental))
end
