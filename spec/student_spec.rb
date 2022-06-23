$LOAD_PATH << '.'
require 'spec_helper'

describe Student do
  it 'Create a new student' do
    @new_class = Classroom.new('Ruby Class')
    @new_student = Student.new(18, @new_class.label, 'Steve')
    expect(@new_student.name).to eq('Steve')
    expect(@new_student.age).to eq(18)
    expect(@new_student.classroom).to eq('Ruby Class')
    expect(@new_student.parent_permission).to eq(true)
  end
end
