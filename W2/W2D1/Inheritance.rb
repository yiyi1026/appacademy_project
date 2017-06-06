class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def bonus(multiplier)
    sum = 0
    @employees.each do |employee|
      sum += employee.salary
    end
    sum * multiplier
  end

  def add_employee(staff)
    staff.each do |who|
      @employees << who
    end
    @employees
  end
end

=begin
darren = Manager.new("darren", "TA Manager", 78000, "ned")
shawna = Employee.new("shawna", "TA", 12000, "darren")
david = Employee.new("david", "TA", 10000, "darren")
ned = Manager.new("ned", "Founder", 1000000, "")
ned.add_employee([shawna, darren, david])
darren.add_employee([shawna, david])
=end
