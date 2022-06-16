module Services
  def self.print_prompt
    puts '
    Please choose an option by entering in a number:

    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit
    '
    puts ''
    puts 'Please select an option from the list above: '
  end

  def self.name_input
    print 'Name: '
    name = gets.chomp
    name.empty? ? name_input : name
  end

  def self.age_input
    print 'Age: '
    age = gets.chomp.to_i
    (1..1000).include?(age) ? age : age_input
  end

  def self.user_has_permission
    print 'Parent permission granted? [Y/N]: '
    permission = gets.chomp
    %w[Y N].include?(permission.capitalize) ? permission.capitalize : user_has_permission
  end

  def self.specialization_input
    print 'Specialization: '
    specialization = gets.chomp
    specialization.empty? ? specialization_input : specialization
  end
end
