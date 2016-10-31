require 'date'

class Student
  def initialize(name)
    @name = name
    @think_thomas_cool = true
    @day = 1
    @stress = 0
    @beginning_of_time = Date.new(2016,10,3)
    @stress_counter = 0
    @survived = true
    instructions
  end

  attr_reader :name, :think_thomas_cool, :survived, :day

  def next_day!
    stress_changer(day_of_week)
    stress_leave
    show_day_info
    finished
    @day += 1
  end

  private

  def instructions
    puts ""
  end

  def show_day_info
    puts "==== Day #{@day} ===="
    puts "Stress: #{@stress}%"
  end

  def day_of_week
    return (@beginning_of_time + @day) - 1
  end

  def stress_changer(dow)
    if dow.sunday? || dow.saturday?
      @stress = [@stress - rand(20..30), 0].max
    else
      @stress += rand(10..15)
    end
  end

  def stress_leave
    if @stress > 100
      @stress_counter += 1
    else
      @stress_counter = 0
    end

    if @stress_counter >= 2
      @think_thomas_cool = false
      @survived = false
    end
  end

  def finished
    if @day == 35
      puts "====================================="
      puts "CONGRATULATIONS #{@name.upcase}!!!"
      puts "YOU DID IT BITCH!!!!!"
      puts "NOW STOP PLAYING GAMES AND GET A JOB!"
      puts "====================================="
    elsif !@think_thomas_cool
      puts "I AM LEAVING I HATE THOMAS"
    else
      puts "Thomas is cool"
    end
    puts ""
  end
end
