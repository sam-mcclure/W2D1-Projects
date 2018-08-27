class Employee
  attr_reader :name, :salary
  
  def initialize(name, salary, title, boss = nil)
    @name = name
    @salary = salary
    @title = title
    @boss = boss
    @boss.employees << self unless boss.nil?
  end
  
  def bonus(multiplier)
    @salary * multiplier
  end
  
  def inspect
    "#{@name} My Boss: #{@boss.name unless @boss.nil?}"
  end
  
end

class Manager < Employee
  attr_accessor :employees
  
  def initialize(name, salary, title, boss = nil)
    super
    @employees = []
  end
  
  def inspect
    "#{super} my employees are #{@employees.map { |employee| employee.name } }"
  end
  
  def sub_employees
    result_arr = @employees
    @employees.each do |employee|
      if employee.is_a?(Manager)
        result_arr += employee.sub_employees
      end
    end
    
    result_arr
  end
  
  def bonus(multiplier)
    sub_employees = self.sub_employees
    total_sub_employees_salaries = sub_employees.map { |employee| employee.salary }.reduce(:+)
    total_sub_employees_salaries * multiplier
  end
end