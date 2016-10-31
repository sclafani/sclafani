class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run
    loop do
      @employee = @sessions_controller.sign_in

      while @employee do
        puts ''
        puts ''
        process_employee_action
      end
    end
  end

  def ask_for_menu_selection
    puts "What do you want to do next?"
    print "> "
    gets.chomp.to_i
  end

  def process_employee_action
    if @employee.manager?
      print_manager_menu
      selection = ask_for_menu_selection
      route_manager_action(selection)
    else
      print_delivery_guy_menu
      selection = ask_for_menu_selection
      route_delivery_guy_action(selection)
    end
  end

  def print_manager_menu
    puts "1. Add a meal"
    puts "2. List available meals"
    puts "3. Add a customer"
    puts "4. List customers"
    puts "5. Add order"
    puts "6. List all orders"
    puts "7. Sign out"
  end

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    when 7 then @employee = nil
    else
      puts "Wrong action"
    end
  end

  def print_delivery_guy_menu

    puts "1. View undelivered orders"
    puts "2. Mark delivery as complete"
  end 

  def route_delivery_guy_action(action)
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered
    else
      puts "Wrong action"
    end
  end
end
