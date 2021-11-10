class ClassRoom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end

  def book=(book)
    @book = book
    book.add_rental(self)
  end
  
  def person=(person)
    @person = person
    person.add_rental(self)
  end
end
