require_relative '../views/sessions_view'
require_relative '../repositories/employees_repository'

class SessionsController
  def initialize(employees_repository)
    @sessions_view = SessionsView.new
    @employees_repository = employees_repository
  end

  def sign_in
    # ask user for username
    username = @sessions_view.ask_for('username')
    # ask user for password
    password = @sessions_view.ask_for('password')

    # find the user with this username (if it exists)
    employee = @employees_repository.find_by_username(username)
    # check if the supplied password matches
    if employee && employee.password == password
      @sessions_view.correct_credentials(employee)
    else
      @sessions_view.incorrect_credentials
      sign_in
    end
    employee
  end
end