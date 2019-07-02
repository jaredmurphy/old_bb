require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Validations" do
    let(:comment) { FactoryBot.build(:comment) }

    describe "presence" do
      it "is invalid without a user" do
        comment.user = nil
        expect(comment).to be_invalid
      end

      it "is invalid without a commentable_type" do
        comment.commentable_type = nil
        expect(comment).to be_invalid
      end

      it "is invalid without a commentable_id" do
        comment.commentable_id = nil
        expect(comment).to be_invalid
      end

      it "is invalid without a body" do
        comment.body = nil
        expect(comment).to be_invalid
      end
    end
  end

  describe "commentable types" do
    context "when it is a comment on a comment" do
      let (:comment) { FactoryBot.create(:comment_comment) }

      it "will return comment for commentable" do
        expect(comment.commentable.class).to be(Comment)
      end
    end

    context "when it is a comment on a post" do
      let (:comment) { FactoryBot.create(:post_comment) }

      it "will return post for commentable" do
        expect(comment.commentable.class).to be(Post)
      end
    end
  end
end
