class TasksController < ApplicationController

  def create
    @task_list = TaskList.find(params[:task_list_id])
    @task = @task_list.tasks.build(task_params)
    if @task.save
      respond_to do |format|
        format.html { redirect_to task_list_path(@task_list) }
        format.js { render 'create', locals: { task: @task } }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js { render 'fail_create', locals: { task: @task } }
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :task_category_id)
  end
end
