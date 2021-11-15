require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'handlers'

class App
  include(Handlers)
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def welcome
    puts 'welcome to the school library app '.upcase
    puts
    start
  end

  def message
    puts
    puts 'Please select an option by entering a number'
    puts '1 - list all books'
    puts '2 - list all people'
    puts '3 - create a person'
    puts '4 - create a book'
    puts '5 - create a rental'
    puts '6 - list all rentals for a given person id'
    puts '7 - exit'
  end

  #  rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def start
    message
    option = gets.chomp.to_i
    if option == 3
      print 'Do you want to create a student(1) or a teacher(2)? [input the number]: '
      new_option = gets.chomp.to_i
      case new_option
      when 1
        create_student
      when 2
        create_teacher
      end
    end
    list_people if option == 2
    list_books if option == 1
    create_book if option == 4
    create_rental if option == 5
    list_rentals_by_id if option == 6
    puts 'Thank you for using the app' and exit if option == 7
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
end

def main
  app = App.new
  app.welcome
end
main
