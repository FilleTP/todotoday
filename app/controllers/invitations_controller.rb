class InvitationsController < ApplicationController

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.inviter = current_user.profile
    @invitation.task_list = TaskList.find(params[:task_list_id])
    if @invitation.save
      respond_to do |format|
        format.js { render 'create', locals: { invitation: @invitation } }
      end
    else
      respond_to do |format|
        format.js { render 'fail_create', locals: { invitation: @invitation } }
      end
    end
  end

  def accept
    @invitation = Invitation.find(params[:id])
    if @invitation.token == params[:token]
      # add the profile to the task list
      @invitation.task_list.profiles << @invitation.invitee
      @invitation.destroy
      redirect_to task_list_path(@invitation.task_list)
      # send message to inviter that the invitee accepted
      # destroy the invitation
      # redirect to the task list
    else
      # redirect to the home
      redirect_to root_path
    end
  end

  def decline
     @invitation = Invitation.find(params[:id])
    if @invitation.token == params[:token]
      # send message to inviter that the invitee declined
      # destroy the invitation
      @invitation.destroy
      redirect_to root_path
    else
      # redirect to the home page
      redirect_to root_path
    end
  end


  private

  def invitation_params
    params.require(:invitation).permit(:inviter_id, :invitee_id, :task_list_id)
  end
end
