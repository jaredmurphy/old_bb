require "rails_helper"

describe Comments::CommentsController, type: :controller do 
  before(:each) do 
    FactoryBot.create(:role)
  end

  context "when the user is authenticated" do 
    before(:each) do 
      @comment = FactoryBot.create(:post_comment)
      @user = FactoryBot.create(:user)
      sign_in(@user)

      request.env["HTTP_REFERER"] = post_path(@comment.commentable)
    end

    describe "#create" do 
      before(:each) do 
        new_comment = FactoryBot.build(:comment_comment, user: @user)
        post :create, params: { comment_id: @comment.id, comment: new_comment.attributes }
      end

      it "should create the comment" do 
        expect(@comment.comments.count).to eq(1)
      end
    end

    describe "#update" do 
      before(:each) do 
        @new_comment = FactoryBot.create(:post_comment, user: @user, commentable: @comment)
        @new_body = "new body"

        patch :update, params: { 
          comment_id: @comment.id, 
          id: @new_comment.id, 
          comment: { body: @new_body }
        }
      end

      it "should update the comment" do 
        comment = Comment.find(@new_comment.id)
        expect(comment.body).to eq(@new_body)
      end
    end
  end
end
