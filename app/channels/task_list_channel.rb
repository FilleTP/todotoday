class TaskListChannel < ApplicationCable::Channel
  def subscribed
    task_list = TaskList.find(params[:id])
    stream_for task_list
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
