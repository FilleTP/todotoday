class TaskListsController < ApplicationController
  def show
    @task_list = TaskList.new
    @task = Task.new
  end

  def create
    @task_list = TaskList.new(task_list_params)
    @task_list.profile = current_user.profile
    # send task list to partial, insert with JS
  end
end
