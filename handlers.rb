module Handlers
  def create_teacher
    print "Enter teacher's age: "
    age = gets.chomp
    print "Enter teacher's specialization: "
    specialization = gets.chomp
    print "Enter teacher's name: "
    name = gets.chomp
    teacher = Teacher.new(age: age, specialization: specialization, name: name)
    @people << teacher
    puts 'Teacher created succefully'
    start
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.upcase
    parent_permission = permission == 'Y'
    student = Student.new(age: age, classroom: 'Module 4', name: name, parent_permission: parent_permission)
    @people << student
    puts 'Student successfully created'
    start
  end

  def create_book
    print 'Ttile: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title: title, author: author)
    @books << book
    puts 'Book successfully created'
    start
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts

    puts 'Select a person from the following list by number NOT BY ID'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date: date, book: @books[book_index], person: @people[person_index])
    @rentals << rental
    puts 'Rental created successfully'
    start
  end

  def list_rentals_by_id
    puts 'ID of PERSON'
    id = gets.chomp.to_i
    rentals = @rentals.select { |rental| rental.person.id == id }
    if rentals.empty?
      puts 'Rentals: '
    else
      rentals.each { |rental| puts "Date: #{rental.date}, Book: '#{rental.book.title}' By #{rental.book.author}" }
    end
    start
  end

  def list_people
    if @people.empty?
      puts 'You have not added any Teacher or Student'.upcase
      puts
    end
    @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    start
  end

  def list_books
    if @books.empty?
      puts 'You have not added any book'.upcase
      puts
    end
    @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
    start
  end
end
