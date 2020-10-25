class View
  def display_tasks(tasks) 
    puts "--------------------"
    tasks.each_with_index do |task, index|
      status = task.completed? ? "[ X ]" : "[  ]"
      puts "#{index} - #{status} - #{task.description}"
    end
  end


  def ask_user_for_description
    puts "What task would you like to add ?"
    print "> "
    gets.chomp
  end

  def as_user_for_task_id
    puts "Which task index do you want to mark as done ?"
    print "> "
    gets.chomp.to_i - 1
  end
end