require 'rails_helper'

describe Post do
  describe "Validations" do
    let(:post) { FactoryBot.build(:post) }

    it "is valid with valid attributes" do
      expect(post).to be_valid
    end

    it "is invalid without a user" do
      post.user = nil
      expect(post).to be_invalid
    end

    it "is invalid without a title" do
      post.title = ''
      expect(post).to be_invalid
    end

    it "is invalid without a body" do
      post.body = ''
      expect(post).to be_invalid
    end

    it "is invalid without a pseudonym" do
      post.pseudonym = nil
      expect(post).to be_invalid
    end

    it "is invalid without a unique title given a pseudonym" do
      post.save
      invalid_post = FactoryBot.build(
        :post,
        pseudonym: post.pseudonym,
        title: post.title
      )

      expect(invalid_post).to be_invalid
    end
  end
end
