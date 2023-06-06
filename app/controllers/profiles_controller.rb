class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(nickname: params[:nickname])
    @received_invitations = @profile.invitations_received
    @sent_invitations = @profile.invitations_sent
  end
end
