require 'csv'
require 'date'

class Person
  # Look at the CSV file
  # What attributes should a Person object have?
  attr_reader :id, :first_name, :last_name, :phone, :email, :created_at
  
    def initialize(id, first_name, last_name, email, phone, created_at)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @phone = phone
    @email = email
    @created_at = DateTime.parse(created_at)
  end
  
end

class PersonParser
  attr_reader :file

  def initialize(file)
    @file = file
    @people = people
  end

  def people
    # If we've already parsed the CSV file, don't parse it again.
    # Remember: @people is +nil+ by default.
    return @people if @people
    @people = Array.new
    CSV.read(@file, 'r').each{|person| @people << person}
    @people
    # We've never called people before, now parse the CSV file
    # and return an Array of Person objects here.  Save the
    # Array in the @people instance variable.
  end
  
  def add_person(person)
    people << [person.id, person.first_name, person.last_name, person.email, person.phone, person.created_at]
  end
  
  def save
    new_file = File.new("new_file.csv", "w+")
    CSV.open(new_file, 'w') do |w|
      people.each do |person|
        w << person
      end
    end
    new_file
  end
end

parser = PersonParser.new('people.csv')
puts "There are #{parser.people.size} people in the file '#{parser.file}'."
person = Person.new(100, "Isabel", "Teh", "isabelteh@gmail.com", 20202022,"2013-10-04T18:14:35-07:00")
puts "person= #{person.inspect}"
parser.add_person(person)
puts "There are #{parser.people.size} people in the file after adding #{person.first_name}"
file = parser.save
puts "The new file > #{file.inspect}"

