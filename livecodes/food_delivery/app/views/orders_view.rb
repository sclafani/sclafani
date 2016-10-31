require_relative 'base_view'
class OrdersView < BaseView
  def list_orders(orders)
    orders.each do |order|
      puts "#{order.id}: Customer: #{order.customer.name} - #{order.meal.name}. Employee: #{order.employee.username}"
    end
  end

  def display_delivery_guys(delivery_guys)
     puts "Available delivery guys:"
     delivery_guys.each do |delivery_guy|
       puts "#{delivery_guy.id}: #{delivery_guy.username}"
     end 
  end
end