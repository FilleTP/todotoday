class TaskListsController < ApplicationController
  def index
    @task_list = TaskList.new
    @task = Task.new
  end

  def create
    @task_list = TaskList.new(task_list_params)
    @task_list.profile = current_user.profile

    task_attributes = task_list_params[:tasks_attributes][:NEW_RECORD]
    if task_attributes.present?
      task_attributes.each do |_key, attributes|
        attributes[:task_category_id] = 1
        @task_list.tasks.build(attributes)
      end
    end

    @task_list.save!
  end

  private

  def task_list_params
    permitted_params = params.require(:task_list).permit(:points, :profile_id, tasks_attributes: [NEW_RECORD:[:id, :name, :description, :_destroy]])
    permitted_params[:tasks_attributes[:NEW_RECORD]]&.each { |_key, attributes| attributes[:task_category_id] = 1 }
    permitted_params
  end
end
