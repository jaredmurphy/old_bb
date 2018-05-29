class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_user_post, only: [:edit, :update]

  def index
    @posts = current_user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @pseudonyms = current_user.pseudonyms
  end

  def create
    post = Post.new(post_params)

    if post.save
      flash[:notice] = "Post successfully created"
      redirect_to post
    else
      flash[:alert] = "Oops something went wrong"
      redirect_to root_path
    end
  end

  def edit 
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post successfully created"
      redirect_to @post
    else
      flash[:alert] = "Oops something went wrong"
      redirect_to root_path
    end
  end

  private

  def set_user_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post)
      .permit(:title, :body, :pseudonym_id)
      .merge(user_id: current_user.id)
  end
end
