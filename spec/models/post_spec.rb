require 'rails_helper'

describe Post do
  before(:each) do 
    FactoryBot.create(:role)
  end

  describe "validations" do 
    it "is invalid without a user" do 
      post = FactoryBot.build(:post, user: nil)
      expect(post).to be_invalid
    end

    it "is invalid without a title" do 
      post = FactoryBot.build(:post, title: nil)
      expect(post).to be_invalid
    end

    it "is invalid without a body" do 
      post = FactoryBot.build(:post, body: nil)
      expect(post).to be_invalid
    end
  end
end
