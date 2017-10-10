class Hospital

  def initialize
    @name = "Penang Hospital"
    puts "Welcome to #{@name}"
    @location = "Penang"
    @num_of_employees = 200
    @num_of_patients = 1000
  end

end

class Employees

  def initialize
    
  end

end

class Doctors < Employees
  attr_reader :salary

  def initialize
    super
  end

  def salary
    10000
  end

end

class Nurses < Employees
  attr_reader :salary

  def initialize
    super
  end

  def salary
    7000
  end

end

class Receptionists < Employees
  attr_reader :salary

  def initialize
    super
  end

  def salary
    3000
  end

end

class Patients

  def charge
    10000
  end

end

dimitri = Doctors.new
melissa = Nurses.new
sarah = Receptionists.new

lalala = Patients.new
wkwkwk = Patients.new

all_employees = [dimitri, melissa, sarah]
all_patients = [lalala, wkwkwk]

sum_of_salary = 0
all_employees.each do |employee|
  sum_of_salary += employee.salary
end
p sum_of_salary

sum_of_charges = 0
all_patients.each do |patient|
  sum_of_charges += patient.charge
end
p sum_of_charges
