$LOAD_PATH << '.'
require 'spec_helper'

describe Teacher do
  it 'Create a new student' do
    @specialization = 'Programmer'
    @new_teacher = Teacher.new(55, @specialization, 'Rubith')
    expect(@new_teacher.age).to eq(55)
    expect(@new_teacher.name).to eq('Rubith')
    expect(@new_teacher.specialization).to eq('Programmer')
  end
end
