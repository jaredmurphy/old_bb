require "rails_helper"

describe Posts::CommentsController, type: :controller do 
  before(:each) do 
    FactoryBot.create(:role)
  end

  context "when the user is authenticated" do 
    before(:each) do 
      @post = FactoryBot.create(:post)
      @user = FactoryBot.create(:user)
      sign_in(@user)
    end

    describe "#create" do 
      before(:each) do 
        request.env["HTTP_REFERER"] = post_path(@post)
        new_comment = FactoryBot.build(:post_comment, user: @user)
        post :create, params: { post_id: @post.id, comment: new_comment.attributes }
      end

      it "should create the comment" do 
        expect(Comment.count).to eq(1)
      end
    end
  end
end
