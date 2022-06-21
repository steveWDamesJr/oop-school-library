$LOAD_PATH << '.'
require 'app'
require 'services'

def users_input_valid?(user_input, arr)
  arr.include?(user_input)
end

def create_selections_for_user(user_input)
  case user_input
  when '3'
    print "\nDo you want to create a student (1) or a teacher (2)?[Input the number]: "
    @user_input = gets.chomp.to_s
    name = Services.name_input
    age = Services.age_input
    case @user_input
    when '1'
      parent_permission = Services.user_has_permission
      create_student(age, name, parent_permission)
    when '2'
      specialization = Services.specialization_input
      create_teacher(age, name, specialization)
    end
  when '4'
    @books_controller.create_book
  when '5'
    create_rental
  end
end

def display_selections_for_user(user_input)
  case user_input
  when '1'
    @books_controller.all_books_list
  when '2'
    @people_controller.all_people_list
  when '6'
    all_people1 = @people_controller.all_people
    @rentals_controller.all_rentals_list_by_id(all_people1)
  end
end

def run
  loop do
    case user_input
    when '3', '4', '5'
      create_selections_for_user(user_input)
    when '1', '2', '6'
      display_selections_for_user(user_input)
    when '7'
      puts 'Thanks for interacting with OOP School Library App. Bye Bye!'
      exit(true)
    else
      puts "\nInvalid input \" #{user_input}\"!"
      puts 'Please try selecting from the following options: '
      Services.print_prompt
      @user_input = gets.chomp
      run
    end
    Services.print_prompt
    @user_input = gets.chomp
  end
end

def main
  app = App.new
  app.start
end

main
