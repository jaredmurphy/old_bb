require 'rails_helper'
require "cancan/matchers"

describe User do
  describe "Validations" do
    let(:user) { FactoryBot.build(:user) }

    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      user.email = ''
      expect(user).to be_invalid
    end

    it "is invalid without a password" do
      user.password = ""
      expect(user).to be_invalid
    end

    it "is invalid without a unique email" do
      user.save
      second_user = FactoryBot.build(:user, email: user.email)

      expect(second_user).to be_invalid
    end
  end

  describe "callbacks" do
    let(:user) { FactoryBot.create(:user) }
    let(:pseudonym) { FactoryBot.create(:pseudonym, user: user) }

    describe "#after_create" do
      it "assigns a new user to the user role" do
        expect(user.roles).to include(Role.user)
      end
    end

    describe "#before_destroy" do
      before(:each) { user.destroy }

      it "destroys all pseduonyms that belong to the user" do
        expect(user.pseudonyms.count).to eq 0
      end

      it "destroys all user_roles that belong to the user" do
        expect(user.user_roles.count).to eq 0
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

  describe "user's default pseudonym" do
    let(:user) { FactoryBot.create(:user) }
    before { user.pseudonyms << FactoryBot.create(:pseudonym, user: user) }

    describe "#default_pseudonym" do
      it "returns the user's default pseudonym" do
        expect(user.default_pseudonym).to be_truthy
      end
    end
  end

  describe "user abilities" do
    let(:publisher_role) { FactoryBot.create(:publisher_role) }
    let(:moderator_role) { FactoryBot.create(:moderator_role) }
    let(:admin_role) { FactoryBot.create(:admin_role) }

    context "when the user is guest user" do
      let(:user){ nil }
      subject(:ability){ Ability.new(user) }

     it{ should be_able_to(:show, Post) }
     it{ should be_able_to(:index, Post) }
    end

    context "when the user is a user user" do
      let(:user){ FactoryBot.create(:user) }
      subject(:ability){ Ability.new(user) }

      it{ should_not be_able_to(:create, Post) }
    end

    context "when the user is a publisher user" do
      let(:user){ FactoryBot.create(:publisher_user) }
      let(:second_user){ FactoryBot.create(:publisher_user) }
      subject(:ability){ Ability.new(user) }

      it{ should be_able_to(:manage, Post, user_id: user.id) }
      it{ should_not be_able_to(:manage, Post.where(user_id: second_user.id), user_id: user.id) }
    end

    context "when the user is a moderator user" do
      let(:user){ FactoryBot.create(:moderator_user) }
      subject(:ability){ Ability.new(user) }

      it{ should be_able_to(:manage, Post) }
    end

    context "when the user is a admin user" do
      let(:user){ FactoryBot.create(:admin_user) }
      subject(:ability){ Ability.new(user) }

      it{ should be_able_to(:manage, Post) }
      it{ should be_able_to(:manage, User) }
    end
  end
end

