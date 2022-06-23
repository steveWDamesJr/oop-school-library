$LOAD_PATH << '.'
require 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'unknown', parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
