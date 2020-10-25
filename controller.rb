require_relative 'view'
require_relative 'task'
require 'pry-byebug'

class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def list
    list_all_tasks
  end

  def add
    description = @view.ask_user_for_description
    task = Task.new(description)
    @repository.add_task(task)
    # # binding.pry
    # puts @repository.tasks[0]
  end

  def mark_as_done
    list
    id = @view.as_user_for_task_id
    task = @repository.find_task(id)
    task.mark_as_done
    list
  end

  def delete
    list
    id = @view.as_user_for_task_id
    task = @repository.find_task(id)
    @repository.delete_task(id)
    list
  end

  private

  def list_all_tasks
    # tasks = @repository.all
    @view.display_tasks(@repository.all)
  end
end