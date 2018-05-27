require 'rails_helper'

describe User do
  before(:each) do 
    FactoryBot.create(:role)
  end

  describe "callbacks" do 
    describe "#after_create" do 
      it "assigns a new user to the default role" do 
        user = FactoryBot.create(:user)
        expect(user.roles.include? Role.default)
      end
    end
  end

  describe "validations" do 
    describe "presence" do 
      it "requires presence of email" do 
        user = FactoryBot.build(:user, email: nil)
        expect(user).to be_invalid
      end

      it "requires presence of password" do 
        user = FactoryBot.build(:user, password: nil)
        expect(user).to be_invalid
      end
    end

    describe "uniqueness" do 
      it "requires uniqueness of email" do 
        user = FactoryBot.create(:user)
        invalid_user = FactoryBot.build(:user, email: user.email)
        expect(invalid_user).to be_invalid
      end
    end
  end
 
  # getters

  describe "#publisher?" do 
    it "returns true if the user has the role publisher" do 
      user = FactoryBot.create(:publisher_user)
      expect(user.publisher?).to be_truthy 
    end
  end

  describe "#moderator?" do 
    it "returns true if the user has the role moderator" do 
      user = FactoryBot.create(:moderator_user)
      expect(user.moderator?).to be_truthy 
    end
  end

  describe "#admin?" do 
    it "returns true if the user has the role admin" do 
      user = FactoryBot.create(:admin_user)
      expect(user.admin?).to be_truthy 
    end
  end
end

