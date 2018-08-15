class AdminController < ApplicationController
    before_action :authenticate_moderator_or_admin!

    private

    def authenticate_moderator_or_admin!
      authenticate_user!
      redirect_to "/" unless current_user.admin? || current_user.moderator?
    end
  end
