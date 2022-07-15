require_relative 'view'
require_relative 'task'

class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def list
    display_all_tasks
  end

  def add
    # 1. Ask the user for the title of the task
    title = @view.ask_for_title
    # 2. Create the task instance
    task = Task.new(title)
    # 3. Add the task to the repository
    @repository.add_task(task)
  end

  def mark_task_as_done
    # 0. Display the list of tasks
    display_all_tasks
    # 1. Ask user for the index of the task they want to mark as done
    index = @view.ask_for_index
    # 2. Retrieve the task from the repository (using the index)
    task = @repository.find(index)
    # 3. Change the done status of the task (#mark_as_done!)
    task.mark_as_done!
  end

  def destroy
    # 0. Display the list of tasks
    display_all_tasks
    # 1. Ask user for the index of the task they want to delete
    index = @view.ask_for_index
    # 2. Delete the task from the repository (using the index)
    task = @repository.destroy(index)
  end

  private

  def display_all_tasks
    # 1. Retrieve the tasks from the Repository
    tasks = @repository.all
    # 2. Ask the view to display the tasks
    @view.display(tasks)
  end
end