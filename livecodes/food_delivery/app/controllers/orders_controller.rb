require_relative '../repositories/orders_repository'
require_relative '../repositories/employees_repository'
require_relative '../repositories/customers_repository'
require_relative '../repositories/meals_repository'

require_relative "../models/order.rb"
require_relative "../views/orders_view.rb"
require_relative "../views/meals_view.rb"
require_relative "../views/customers_view.rb"

require 'pry'

class OrdersController
  def initialize(meals_repository, employees_repository, customers_repository, orders_repository)
    @meals_repository = meals_repository
    @employees_repository = employees_repository
    @customers_repository = customers_repository
    @orders_repository = orders_repository
    @view = OrdersView.new
  end

  def list_my_orders(employee)
    my_orders = @orders_repository.undelivered_orders.select{ |order| order.employee == employee }
    @view.list_orders(my_orders)
  end

  def list_undelivered_orders
    # ask repo for all undelivered orders
    undelivered_orders = @orders_repository.undelivered_orders
    @view.list_orders(undelivered_orders)
  end

  def add
    # ask user to select the meal
    MealsView.new.display(@meals_repository.all)
    meal_id = @view.ask_for('meal').to_i
    meal = @meals_repository.find(meal_id)

    # ask user to select the customer
    CustomersView.new.display(@customers_repository.all)
    customer_id = @view.ask_for('customer').to_i
    customer = @customers_repository.find(customer_id)

    # ask user to select the employee
    @view.display_delivery_guys(@employees_repository.all_delivery_guys)
    employee_id = @view.ask_for('employee').to_i
    employee = @employees_repository.find(employee_id)

    # create the order
    order = Order.new(meal: meal, customer: customer, employee: employee)

    # add to orders repo
    # this is currently throwing error (order -> nil)
    @orders_repository.add(order)
  end

  def mark_as_delivered
    # ask for index of order to complete
    index = @view.ask_for('order index').to_i
    # find correct order
    order = @orders_repository.find(index)
    # mark as complete
    order.deliver!
    @orders_repository.save
  end
end