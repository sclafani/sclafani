require_relative 'app/models/order'
require_relative 'app/repositories/orders_repository'

csv_file = File.join(__dir__, 'data', 'orders.csv')

repo = OrdersRepository.new(csv_file)


repo.undelivered_orders

repo.add



