class TaskListsController < ApplicationController
  def index
    @task_list = TaskList.new
    @task_list.tasks.build
  end

  def create
    @task_list = TaskList.new(task_list_params)
    @task_list.profile = current_user.profile

    @task_list.save!
    raise
  end

  private

  def task_list_params
    params.require(:task_list).permit(:points, :profile_id, tasks_attributes: [:id, :name, :description, :_destroy, :task_category_id])
  end
end
