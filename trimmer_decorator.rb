require_relative './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name > 10 ? @nameable.correct_name[0...9].to_s : @nameable.correct_name
  end
end
