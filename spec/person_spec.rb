$LOAD_PATH << '.'
require 'spec_helper'

describe Person do
  context 'To create a new instance of the Person class we must ensure the following' do
    it 'Return a Person object including age, name, and empty rentals via constructor method' do
      @age = 22
      @name = 'John Kelly'
      @person = Person.new(@age, @name)
      expect(@person.age).to eql @age
      expect(@person.name).to eql @name
      expect(@person.rentals).to eql []
  end
  
    it 'Set a default vaue for name pramameter if not provided' do
      @age = 22
      @person = Person.new(@age)
      expect(@person.name).to eql 'unknown'
  end
end

  context 'To add a new rental we must ensure the following:' do
  it 'Return a rental and add it to book via add_rental method' do
    book = Book.new('Great Book', 'Great Author')
    person = Person.new(22, 'Levy', false)
    rental = Rental.new('2022/06/16', person, book)

    person.add_rental(rental)

    expect(person.rentals).to eql [rental]
  end
end

context 'When verifiying parent_permission' do
   it 'If under age and no has no parent permission return the can_use_services? method' do
    person = Person.new(12, 'Steven', false)
    expect(person.can_use_services?).to be false
   end

   it 'If over age the can_use_services? method returns true' do
    person = Person.new(21, 'Not Young', false)
    expect(person.can_use_services?).to be true
   end

   it 'Return true if person has parent permission via the can_use_services?' do 
     person = Person.new(13, 'Jory', true)
     expect(person.can_use_services?).to be true
   end
  end
end

