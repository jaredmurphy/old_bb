class Users::PostsController < ApplicationController
  before_action :set_post, only: :show

  def index
    @posts = current_user.posts
  end

  def show;end

  def new
    @post = Post.new(user: current_user)
  end

  def create
    post = Post.new(post_params)

    if post.save
      flash[:notice] = "Post successfully created"
      redirect_to root_path
    else
      flash[:alert] = "Oops something went wrong"
      redirect_to root_path
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end
end
