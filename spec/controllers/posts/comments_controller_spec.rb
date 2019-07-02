require "rails_helper"

describe Posts::CommentsController, type: :controller do
  context "when the user is authenticated" do
    before(:each) do
      @post = FactoryBot.create(:post)
      @user = FactoryBot.create(:user)
      sign_in(@user)

      request.env["HTTP_REFERER"] = post_path(@post.id)
    end

    describe "#create" do
      before(:each) do
        new_comment = FactoryBot.build(:post_comment, user: @user, commentable: @post)

        post :create, params: {
          post_id: @post.id,
          comment: new_comment.attributes
        }
      end

      it "should create the comment" do
        expect(Comment.count).to eq(1)
      end
    end

    describe "#update" do
      before(:each) do
        @comment = FactoryBot.create(:post_comment, user: @user, commentable: @post)
        @new_body = "new body"

        patch :update, params: {
          post_id: @post.id,
          id: @comment.id,
          comment: { body: @new_body }
        }
      end

      it "should update the comment" do
        comment = Comment.find(@comment.id)
        expect(comment.body).to eq(@new_body)
      end
    end
  end
end
