class TaskListsController < ApplicationController

  def index
    @task_list = current_user.profile.task_lists.build
    @task_lists = TaskList.all.where(profile: current_user.profile)
  end

  def show
    @task_list = TaskList.find(params[:id])
    @task = Task.new
    @invitation = Invitation.new
    @profiles = Profile.all.where.not(id: current_user.profile.id)
  end

  def create
    @task_list = current_user.profile.task_lists.build(task_list_params)
    if @task_list.save
      redirect_to task_list_path(@task_list)
    else
      render :new
    end
  end

  def destroy; end

  private

  def task_list_params
    params.require(:task_list).permit(:name)
  end
end
