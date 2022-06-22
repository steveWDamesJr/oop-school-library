class RentalsController
  attr_reader :rentals

  def initialize
    @rentals = []
  end

  def all_rentals
    @rentals
  end

  def all_rentals_list_by_id(peoples_array)
    if JSON.parse(File.read('./json_files/rentals.json')).empty?
      puts 'Please add a rental first.'
    else
      puts "\nSelect a person from the following list by ID number"
      peoples_array.each do |person|
        puts "ID: #{person.id}, [#{person.class}] Name: #{person.name}, Age: #{person.age}"
      end
      person_id = gets.chomp.to_i
      rental_list = JSON.parse(File.read('./json_files/rentals.json')).select do |rental|
        rental['person']['id'] == person_id
      end
      if rental_list.empty?
        puts 'No rentals found for this person.'
      else
        rental_list.each do |rental|
          puts "Date: #{rental.date}, Book:\"#{rental.book.title}\" by #{rental.book.author}"
          puts rental
        end
      end
    end
  end
end
