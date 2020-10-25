require 'csv'
require_relative 'task'

require 'pry-byebug'

class Repository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @tasks = []
    # binding.pry
    load_csv
  end

  def all
    @tasks
  end

  def add_task(task)
    @tasks << task 
    save_csv
  end

  def find_task(id)
    @tasks[id]
  end

  def delete_task(id)
    @tasks.delete_at(id)
    save_csv
  end


  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @tasks << Task.new(row[0])
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @tasks.each do |task|
        csv << [task.description, task.completed]
      end
    end
  end

end