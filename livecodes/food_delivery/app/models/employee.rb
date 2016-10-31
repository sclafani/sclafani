class Employee
  def initialize(args = {})
    @id = args[:id]
    @username = args[:username]
    @password = args[:password]
    @role = args[:role]
  end

  attr_reader :username, :password, :role
  attr_accessor :id

  def manager?
    @role == 'manager'
  end

  def delivery_guy?
    @role == 'delivery_guy'
  end

  def to_csv_row
    [@id, @username, @password, @role]
  end

  def self.headers
    %w(id username password role)
  end
end
