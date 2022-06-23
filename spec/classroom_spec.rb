$LOAD_PATH << '.'
require 'spec_helper'

describe Classroom do
  it 'Create a new classroom' do
    @new_class = Classroom.new('Ruby Class')
    expect(@new_class.label).to eq('Ruby Class')
  end

  it 'Add a new student into classroom' do
    @new_class = Classroom.new('Ruby Class')
    @new_student = Student.new(18, @new_class.label, 'Steve')
    expect(@new_class.add_student(@new_student)).to eq(@new_class)
  end
end
