$LOAD_PATH << '.'
require 'spec_helper'

describe Person do
  it 'Create a new person' do
    @new_person = Person.new(19, 'Levy')
    expect(@new_person.age).to eq(19)
    expect(@new_person.name).to eq('Levy')
    expect(@new_person.parent_permission).to eq(true)
  end
end
