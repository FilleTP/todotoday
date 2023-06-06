class MessagesController < ApplicationController

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.profile = current_user.profile
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    else
      render "task_list/show/#{params[:task_list_id]}"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
