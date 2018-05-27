require 'rails_helper'
require "cancan/matchers"

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

  describe "abilities" do 
    before(:each) do 
      FactoryBot.create(:publisher_role)
      FactoryBot.create(:moderator_role)
      FactoryBot.create(:admin_role)
    end

    context "when the user is guest user" do 
      before(:each) do 
        @ability = Ability.new(nil)
      end

      it "can read posts" do 
        @ability.should be_able_to(:read, Post) 
      end
    end

    context "when the user is a default user" do 
      before(:each) do 
        @user = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:user)
        @ability = Ability.new(@user)
      end

      it "cannot write a post" do 
        @ability.should_not be_able_to(:create, Post)
      end
    end

    context "when the user is a publisher user" do 
      before(:each) do 
        @user = FactoryBot.create(:publisher_user)
        @ability = Ability.new(@user)
      end

      it "can manage their own posts" do 
        @ability.should be_able_to(:manage, Post, user_id: @user.id)
      end
    end

    context "when the user is a moderator user" do 
      before(:each) do 
        @user = FactoryBot.create(:moderator_user)
        @ability = Ability.new(@user)
      end

      it "can manage all posts" do 
        @ability.should be_able_to(:manage, Post)
      end
    end

    context "when the user is a admin user" do 
      before(:each) do 
        @user = FactoryBot.create(:admin_user)
        @ability = Ability.new(@user)
      end

      it "can manage all posts" do 
        @ability.should be_able_to(:manage, Post)
      end

      it "can manage all users" do 
        @ability.should be_able_to(:manage, User)
      end
    end
  end
end

