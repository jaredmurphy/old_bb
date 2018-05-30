class Posts::CommentsController < CommentsController
  before_action :set_commentable, only: :create
  before_action :set_comment, only: :update

  private 

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def set_commentable
    @commentable = Post.find(params[:post_id])
  end
end
