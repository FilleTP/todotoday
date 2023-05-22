class InvitationsController < ApplicationController

  def create
    @invitation = Invitation.new(invitation_params)
    @inviation.inviter = current_user.profile
    @invitation.task_list = TaskList.find(params[:task_list_id])
    if @invitation.save
      respond_to do |format|
        format.html { redirect_to task_list_path(@invitation.task_list) }
        format.js { render 'create', locals: { invitation: @invitation } }
      end
  end

  def accept; end

  def accept_confirm; end

  private

  def invitation_params
    params.require(:invitation).permit(:inviter_id, :invitee_id, :task_list_id)
  end
end
