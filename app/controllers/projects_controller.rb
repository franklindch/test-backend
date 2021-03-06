class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_project, only: [:edit, :update, :destroy]

  def new
    @project = Project.new
    respond_to :html, :js
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    authorize @project
    flash[:alert] = 'Please, fill the project name' unless @project.save
    redirect_to projects_path
  end

  def edit
    respond_to :html, :js
  end

  def update
    @project.update(project_params)
    redirect_to projects_path
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def index
    @projects = policy_scope(Project)
  end

  private

  def retrieve_project
    @project ||= Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(
      :name, :user_id
    )
  end
end
