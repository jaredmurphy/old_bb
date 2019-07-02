require 'rails_helper'

describe UserRole do
  describe "validations" do
    it "is invalid without a user" do
      user_role = FactoryBot.build(:user_role, role: Role.user, user: nil)
      expect(user_role).to be_invalid
    end

    it "is invalid without a role" do
      user_role = FactoryBot.build(:user_role, role: nil)
      expect(user_role).to be_invalid
    end

    it "it is invalid if user and role combination are not unique" do
      user = FactoryBot.create(:user)
      invalid_user_role = FactoryBot.build(
        :user_role,
        user: user,
        role: user.roles.first)

      expect(invalid_user_role).to be_invalid
    end
  end
end
