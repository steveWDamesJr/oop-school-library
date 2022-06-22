require 'json'
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
    author: book.author
  }
  all_books.push(temp)

  File.write('./json_files/books.json', JSON.generate(all_books))
end

def write_people(person)
  file = File.open('./people.json', 'w')
  people_data = person.map do |person|
  if person.instance_of? Student
    { workingStatus: 'Student', name: person.name, age: person.age, parent_permission: person.parent_permission, id: person.id }
    # temp = {
    #   class: 'Student',
    #   name: person.name.to_s,
    #   age: person.age.to_s
    # }
  else 
    { workingStatus: 'Teacher', name: person.name, age: person.age, specialization: person.specialization, id: person.id }
  # elsif person.instance_of? Teacher
    # temp = {
    #   class: 'Teacher',
    #   name: person.name.to_s,
    #   age: person.age.to_s
    # }
  end
end
file.puts(JSON.generate(people_data))
end

#   all_people = File.read('./json_files/people.json')

#   if all_people.instance_of?(NilClass)
#     File.write('./json_files/books.json', [])
#     all_people = File.read('./json_files/people.json')
#     all_people.push(temp)
#     File.write('./json_files/people.json', JSON.generate(all_people))
#   else
#     new_all_people = JSON.parse(all_people)
#     new_all_people.push(temp)
#     File.write('./json_files/people.json', JSON.generate(new_all_people))

#   end
# end

def read_people
  people = []
  all_people = File.read('./json_files/people.json')
  if all_people.instance_of?(String)
    all_people.class
   all_people = JSON.parse(all_people)
    puts all_people.class
   all_people.each do |person|
      people << case person['class']
                when 'Student'
                  Student.new(person['age'], nil, person['name'], parent_permission: person['parent_permission'])
                when 'Teacher'
                  Teacher.new(person['age'], person['specialization'], person['name'])
                end
    end
  else
    puts "\nNo registered people Yet!!"
  end
  people
end
