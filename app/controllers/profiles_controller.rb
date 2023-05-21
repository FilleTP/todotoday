class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(nickname: params[:nickname])
  end
end
