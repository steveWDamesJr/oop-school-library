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

  it "return '¯(ツ)/¯' by calling playin_hooky method" do
    @new_class = Classroom.new('Ruby Class')
    @new_student = Student.new(18, @new_class.label, 'Steve')
    expect(@new_student.play_hooky).to eq('¯(ツ)/¯')
  end

  it 'return the newly added student in the classroom when classroom=() method called' do
    @new_class = Classroom.new('Ruby Class')
    @new_student = Student.new(18, @new_class.label, 'Steve')
    expect(@new_student.classroom = (@new_class)).to eql(@new_class)
  end
end
