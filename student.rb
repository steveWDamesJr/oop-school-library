require_relative './person'
attr_accessor :classroom

class Student < Person
  def initialize(classroom:, age:, name: 'unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
    classroom.students << self
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
