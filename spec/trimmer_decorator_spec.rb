$LOAD_PATH << '.'
require 'spec_helper'

describe TrimmerDecorator do
  it 'Trim the string length if greater than 10 characters' do
    @new_person = Person.new(19, 'supercalafragalisticexpialidocious ')
    @trimmed_person = TrimmerDecorator.new(@new_person)
    expect(@trimmed_person.correct_name).to eq('supercala')
  end
end
