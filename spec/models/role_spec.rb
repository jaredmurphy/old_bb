require 'rails_helper'

describe Role do
  describe "validations" do 
    it "is invalid without a name" do 
      role = FactoryBot.build(:role, name: nil)
      expect(role).to be_invalid
    end

    it "is invalid without a unique name" do 
      role = FactoryBot.create(:role)
      invalid_role = FactoryBot.build(:role, name: role.name)

      expect(invalid_role).to be_invalid
    end
  end

  describe "class methods" do 
    describe "#default" do 
      it "returns the default role" do 
        default_role = FactoryBot.create(:role)
        expect(Role.default).to eq(default_role)
      end
    end

    describe "#publisher" do 
      it "returns the publisher role" do 
        publisher_role = FactoryBot.create(:publisher_role)
        expect(Role.publisher).to eq(publisher_role)
      end
    end

    describe "#moderator" do 
      it "returns the moderator role" do 
        moderator_role = FactoryBot.create(:moderator_role)
        expect(Role.moderator).to eq(moderator_role)
      end
    end

    describe "#admin" do 
      it "returns the admin role" do 
        admin_role = FactoryBot.create(:admin_role)
        expect(Role.admin).to eq(admin_role)
      end
    end
  end
end
