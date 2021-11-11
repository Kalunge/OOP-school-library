require_relative 'corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @correct_name = Corrector.new
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def validate_name
    @name = @correct_name.corrector(@name)
  end

  private :of_age?
end
