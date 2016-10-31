# require_relative "app/repositories/meals_repository"
require_relative "app/repositories/employees_repository"

# meals_csv_file = "data/meals.csv"
# repo = MealsRepository.new(csv_file)

# repo.add(Meal.new(name: "Thomas Meaty Steak", price: 10))

employees_csv_file = "data/employees.csv"
repo = EmployeesRepository.new(employees_csv_file)

p repo
