require 'rails_helper'

describe UserRole do
  describe "validations" do 
    it "is invalid without a user" do 
      user_role = FactoryBot.build(:user_role, user: nil)
      expect(user_role).to be_invalid
    end

    it "is invalid without a role" do 
      user_role = FactoryBot.build(:user_role, role: nil)
      expect(user_role).to be_invalid
    end

    it "is is invalid if user and role are not unique" do 
      user_role = FactoryBot.create(:user_role)
      invalid_user_role = FactoryBot.build(
        :user_role, 
        user: user_role.user, 
        role: user_role.role)

      expect(invalid_user_role).to be_invalid
    end
  end
end
