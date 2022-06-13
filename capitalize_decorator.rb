require_relative './decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameavle.correct_name.capitalize
  end
end
