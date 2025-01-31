# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
# app/controllers/tasks_controller.rb
# app/controllers/tasks_controller.rb
# app/controllers/tasks_controller.rb
def index
  @tasks_by_status = Task.all.group_by(&:status)
  @status_order = [ "pending", "in_progress", "completed" ]

  # Optional: Set a default parameter for the tab
  params[:tab] ||= "all"
end

  def new
    @task = Task.new
  end

def destroy
  @task = Task.find(params[:id])
  @task.destroy
  redirect_to tasks_path, notice: "Task was successfully deleted."
end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task was successfully created."
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Task was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Task was successfully deleted."
  end

# app/controllers/tasks_controller.rb
# app/controllers/tasks_controller.rb
def update_status
  @task = Task.find(params[:id])

  case @task.status
  when "pending"
    @task.status = "in_progress"
  when "in_progress"
    @task.status = "completed"
  end

  if @task.save
    # Check if the request came from the all tasks view
    if params[:from_all_tasks] == "true"
      redirect_to tasks_path(tab: "all"), notice: "Task status updated to #{@task.status}."
    else
      redirect_to tasks_path, notice: "Task status updated to #{@task.status}."
    end
  else
    redirect_to tasks_path, alert: "Could not update task status."
  end
end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date)
  end
end
