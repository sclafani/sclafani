require "csv"

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = [] # Array of Customer/Meal etc instances
    @next_id = 1
    load_csv if File.exists?(@csv_file)
  end

  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    write_csv
  end

  def find(id)
    @elements.find{ |element| element.id == id }
  end

  def all
    return @elements
  end

  def write_csv
    CSV.open(@csv_file, "w") do |csv|
      csv << @elements.first.class.headers
      @elements.each do |element|
        csv << element.to_csv_row
      end
    end
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @elements << build_element(row)
      @next_id += 1
    end
  end
end
