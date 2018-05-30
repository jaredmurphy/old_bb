class CommentsController < ApplicationController
  def create
    comment = @commentable.comments.new(comment_params)

    if comment.save
      redirect_back fallback_location: root_path, notice: "Comment successfully created"
    else 
      redirect_back fallback_location: root_path, alert: "Oops something went wrong"
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end
end
