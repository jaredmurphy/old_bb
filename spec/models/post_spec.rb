require 'rails_helper'

describe Post do
  before(:each) do 
    FactoryBot.create(:role)
  end

  describe "validations" do 
    describe "presence" do 
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

      it "is invalid without a pseudonym" do 
        post = FactoryBot.build(:post, pseudonym: nil)
        expect(post).to be_invalid
      end
    end

    describe "uniqueness" do 
      it "is invalid without a unique title given a pseudonym" do 
        post = FactoryBot.create(:post)
        invalid_post = FactoryBot.build(
          :post, 
          pseudonym: post.pseudonym, 
          title: post.title
        ) 

        expect(invalid_post).to be_invalid
      end
    end
  end
end
