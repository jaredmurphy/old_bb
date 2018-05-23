class Users::PostsController < ApplicationController
  def index
    @posts = current_user.posts
  end

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

  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end
end
