require_relative 'base_view'

class SessionsView < BaseView
  def correct_credentials(employee)
    puts "Yay, #{employee.username}, you are signed in as a #{employee.role}"
  end
      
  def incorrect_credentials
    puts "Stranger Danger! Incorrect credentials, try again"
  end
      
end