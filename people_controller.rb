require './data'

class PeopleController
  attr_reader :people

  def initialize
    @people = read_people
  end

  def all_people
    @people
  end

  def student_data
    age = Services.age_input
    name = Services.name_input
    has_parent_permission = Services.user_has_permission == 'Y'
    [age, name, has_parent_permission]
  end

  def teacher_data
    age = Services.age_input
    name = Services.name_input
    specialization = Services.specialization_input
    [age, name, specialization]
  end

  def all_people_list
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Age: #{person.age} ID: #{person.id} Name: #{person.name}"
    end
  end
end
