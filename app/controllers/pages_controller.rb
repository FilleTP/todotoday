class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @task_list = current_user.profile.task_lists.build
  end

end
