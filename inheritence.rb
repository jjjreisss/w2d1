require 'byebug'
class Employee
  attr_accessor :boss, :employees
  attr_reader :salary
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee

  def initialize(name, title, salary, boss, employees = [])
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    # debugger
    total_salaries = 0
    employee_queue = @employees.dup

    until employee_queue.empty?
      current_employee = employee_queue.shift
      total_salaries += current_employee.salary
      employee_queue += current_employee.employees if current_employee.is_a?(Manager)
    end

    total_salaries * multiplier
  end
end


david = Employee.new("David", "TA", 10000, nil)
shawna = Employee.new("Shawna", "TA", 12000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, nil, [shawna, david])
ned = Manager.new("Ned", "Founder", 1000000, nil, [darren])
david.boss = darren
shawna.boss = darren
darren.boss = ned
