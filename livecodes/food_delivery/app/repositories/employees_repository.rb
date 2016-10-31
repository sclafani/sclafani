require_relative "base_repository"
require_relative "../models/employee"

class EmployeesRepository < BaseRepository

  def find_by_username(username)
    @elements.find{ |employee| employee.username == username }
  end

  def all_delivery_guys
    @elements.select{ |element| element.role == 'delivery_guy' }
  end

  private

  def build_element(row)
    row[:id]       = row[:id].to_i      # Convert column to Fixnum
    Employee.new(row)
  end
end
