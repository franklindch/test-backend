class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_comment, only: [:destroy]
  before_action :retrieve_task, only: [:new, :create]

  def new
    @comment = Comment.new
    respond_to :html, :js
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.task = @task
    @comment.user = current_user
    flash[:alert] = 'Please, fill correctly the description comment field' unless @comment.save
    redirect_to projects_path
  end

  def destroy
    @comment.destroy
    redirect_to projects_path
  end

  private

  def retrieve_comment
    @comment ||= Comment.find(params[:id])
  end

  def retrieve_task
    @task ||= Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(
      :description, :task_id, :file, :file_cache
    )
  end
end
