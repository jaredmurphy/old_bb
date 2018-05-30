require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do 
    describe "presence" do 
      it "is invalid without a user" do 
        comment = FactoryBot.build(:comment, user: nil)
        expect(comment).to be_invalid
      end

      it "is invalid without a commentable_type" do 
        comment = FactoryBot.build(:comment, commentable_type: nil)
        expect(comment).to be_invalid
      end

      it "is invalid without a commentable_id" do 
        comment = FactoryBot.build(:comment, commentable_id: nil)
        expect(comment).to be_invalid
      end

      it "is invalid without a body" do 
        comment = FactoryBot.build(:comment, body: nil)
        expect(comment).to be_invalid
      end
    end

    describe "length" do 
      it "is invalid with body length < 1" do 
        comment = FactoryBot.build(:comment, body: "")
        expect(comment).to be_invalid
      end
    end
  end

  describe "commentable types" do 
    context "when it is a comment on a comment" do 
      it "will return comment for commentable" do 
        comment = FactoryBot.create(:comment_comment)
        expect(comment.commentable.class).to be(Comment)
      end
    end

    context "when it is a comment on a post" do 
      it "will return post for commentable" do 
        comment = FactoryBot.create(:post_comment)
        expect(comment.commentable.class).to be(Post)
      end
    end
  end
end
