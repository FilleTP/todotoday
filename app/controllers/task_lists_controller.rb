class TaskListsController < ApplicationController

  def index
    @profile = current_user.profile
    @task_list = @profile.task_lists.build
    @task_lists = @profile.task_lists
  end

  def show
    @task_list = TaskList.find(params[:id])
    @chatroom = Chatroom.find_by(task_list: @task_list) || Chatroom.create(task_list: @task_list)
    @message = Message.new
    @task = Task.new
    @invitation = Invitation.new
    @profiles = Profile.all.where.not(id: current_user.profile.id)
  end

  def create
    # @task_list = current_user.profile.task_lists.build(task_list_params)
    @task_list = TaskList.new(task_list_params)
    @task_list.profiles << current_user.profile
    @task_list.profile = current_user.profile
    if @task_list.save!
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
