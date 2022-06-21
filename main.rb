$LOAD_PATH << '.'
require 'app'

def create_selections_for_user(user_input)
  case user_input
  when '3'
    create_person
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

def main
  app = App.new
  app.run
end

main
