class Admin::UsersController < AdminController
  before_action :set_user, only: [:show, :edit]
  def index
    @users = User.all
  end

  def show
  end

  def edit
    @roles = Role.all
  end

  private

  def set_user
    @user = User.includes(:pseudonyms).find(params[:id])
  end
end
