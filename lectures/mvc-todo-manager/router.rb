class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    puts '=' * 30
    puts "Welcome to the MVC TODO Manager!"
    puts '=' * 30
    puts
    loop do
      puts '-' * 30
      puts "What would you like to do?"
      puts "1. List all your tasks"
      puts "2. Add a task"
      puts "3. Mark a task as done"
      puts "4. Remove a task"
      puts "0. Exit"
      puts
      print "> "
      choice = gets.chomp.to_i

      case choice
      when 1 then @controller.list
      when 2 then @controller.add
      when 3 then @controller.mark_task_as_done
      when 4 then @controller.destroy
      when 0 then break
      else
        puts 'Invalid choice. Please select a number [1, 2, 3, 4 or 0]'
      end
    end
  end
end