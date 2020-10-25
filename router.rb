class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "----------------------------------------"
    puts "Welcome to your task manager version 1.0"
    puts "----------------------------------------\n\n"
    while @running
      print_menu
      action = gets.chomp.to_i
      puts 'All right !'
      route(action)
    end
    puts "bye bye, see you later"
  end

  private

  def print_menu
    puts "Hey there, what would you like to do ?"
    puts "1. list tasks"
    puts "2. add task"
    puts "3. mark task as done"
    puts "4. delete task"
    puts "5. exit"
    print"> "
  end

  def stop
    @running = false
  end

  def route(action) 
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then @controller.mark_as_done
    when 4 then @controller.delete
    when 5 then stop
    else puts "invalid choice"
    end
  end
end
