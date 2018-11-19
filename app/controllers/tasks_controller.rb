class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_task, only: [:edit, :update, :destroy]
  before_action :retrieve_project, only: [:new, :create, :edit, :update]

  def new
    @task = Task.new
    respond_to :html, :js
  end

  def create
    @task = Task.new(task_params)
    @task.project = @project
    @task.save ? (redirect_to projects_path) : (render :new)
  end

  def edit
    respond_to :html, :js
  end

  def update
    @task.update(task_params)
    redirect_to projects_path
  end

  def destroy
    @task.destroy
    redirect_to projects_path
  end

  private

  def retrieve_task
    @task ||= Task.find(params[:id])
  end

  def retrieve_project
    @project ||= Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(
      :description, :status, :priority, :deadline, :project_id
    )
  end
end
