require 'rails_helper'

describe Role do
  describe "class methods" do
    describe "#user" do
      it "returns the user role" do
        FactoryBot.create(:role)
        expect(Role.user.name).to eq("user")
      end
    end

    describe "#publisher" do
      it "returns the publisher role" do
        FactoryBot.create(:publisher_role)
        expect(Role.publisher.name).to eq("publisher")
      end
    end

    describe "#moderator" do
      it "returns the moderator role" do
        FactoryBot.create(:moderator_role)
        expect(Role.moderator.name).to eq("moderator")
      end
    end

    describe "#admin" do
      it "returns the admin role" do
        FactoryBot.create(:admin_role)
        expect(Role.admin.name).to eq("admin")
      end
    end
  end
end
