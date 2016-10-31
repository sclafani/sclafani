class Order
  def initialize(args = {})
    @id = args[:id]
    @meal = args[:meal]
    @delivered = args[:delivered] || false
    @customer = args[:customer]
    @employee = args[:employee]
  end

  attr_reader :employee, :meal, :customer
  attr_accessor :id

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end