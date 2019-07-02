class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :authorize_action!, except: :show
  before_action :set_user_post, only: [:edit, :update]
  before_action :set_user_pseudonyms, only: [:new, :edit]

  def index
    @posts = current_user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
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

  def edit;end

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

  def authorize_action!
    authorize! params[:action].to_sym, Post
  end

  def set_user_post
    @post = current_user.posts.find(params[:id])
  end

  def set_user_pseudonyms
    @pseudonyms = current_user.pseudonyms
  end

  def post_params
    params.require(:post)
      .permit(:title, :body, :pseudonym_id)
      .merge(user_id: current_user.id)
  end
end
