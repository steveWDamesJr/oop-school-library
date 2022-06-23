$LOAD_PATH << '.'
require 'spec_helper'

describe CapitalizeDecorator do
  it 'Create a new person with capitalized name' do
    @new_person = Person.new(19, 'levy')
    @decorator_person = CapitalizeDecorator.new(@new_person)
    expect(@decorator_person.correct_name).to eq('Levy')
  end
end
