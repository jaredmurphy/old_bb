class Admin::PostsController < AdminController
  before_action :authenticate_admin!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
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

  def destroy
    @post.destroy
    flash[:notice] = "Post permanently destroyed"
    redirect_to admin_posts_path(current_user.id)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
