class AdminController < ApplicationController
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    authenticate_user!
    redirect_to "/" unless current_user.admin?
  end
end
