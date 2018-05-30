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
    end

    describe "#create" do 
      before(:each) do 
        request.env["HTTP_REFERER"] = post_path(@comment.commentable)
        new_comment = FactoryBot.build(:comment_comment, user: @user)
        post :create, params: { comment_id: @comment.id, comment: new_comment.attributes }
      end

      it "should create the comment" do 
        expect(@comment.comments.count).to eq(1)
      end
    end
  end
end
