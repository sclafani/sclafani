# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb


require_relative "app/repositories/customers_repository"
require_relative "app/controllers/customers_controller"

require_relative "app/repositories/meals_repository"
require_relative "app/controllers/meals_controller"

require_relative "app/controllers/sessions_controller"
require_relative "app/views/sessions_view"

require_relative "app/repositories/orders_repository"
require_relative "app/controllers/orders_controller"
require_relative "app/views/orders_view"

require_relative "app/repositories/employees_repository"

require_relative "router"

customers_csv = "data/customers.csv"
customer_repository = CustomersRepository.new(customers_csv)
customers_controller = CustomersController.new(customer_repository)

meals_csv = "data/meals.csv"
meals_repository = MealsRepository.new(meals_csv)
meals_controller = MealsController.new(meals_repository)

employees_csv = "data/employees.csv"
employees_repository = EmployeesRepository.new(employees_csv)

orders_csv = "data/orders.csv"
orders_repository = OrdersRepository.new(orders_csv, meals_repository, employees_repository, customer_repository)
orders_controller = OrdersController.new(meals_repository, employees_repository, customer_repository, orders_repository)

sessions_controller = SessionsController.new(employees_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller, orders_controller)

router.run
