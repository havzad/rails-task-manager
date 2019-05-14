class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    new_task = Task.new(task_params) # mass assignment
    new_task.save

    redirect_to task_path(new_task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
   params[:task][:completed] == '1' ? @task.update(completed: true) : @task.update(completed: false)
  end

  private

  def task_params
  params.require(:task).permit(:title, :details, :completed)
  end
end

