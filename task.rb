# Model - MVC
class Task

  attr_reader :description, :completed
  def initialize(description)
    @description = description
    @completed = false
  end

  def completed?
    @completed
  end

  def mark_as_done
    @completed = true
  end

end