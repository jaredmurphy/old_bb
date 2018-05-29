require 'rails_helper'

RSpec.describe UserPseudonym, type: :model do
  describe "validations" do 
    it "is invalid without a user" do 
      user_pseudonym = FactoryBot.build(:user_pseudonym, user: nil)
      expect(user_pseudonym).to be_invalid
    end

    it "is invalid without a pseudonym" do 
      user_pseudonym = FactoryBot.build(:user_pseudonym, pseudonym: nil)
      expect(user_pseudonym).to be_invalid
    end

    it "it is invalid if user and role are not unique" do 
      user_pseudonym = FactoryBot.create(:user_pseudonym)
      invalid_user_pseudonym = FactoryBot.build(
        :user_pseudonym, 
        user: user_pseudonym.user, 
        pseudonym: user_pseudonym.pseudonym)

      expect(invalid_user_pseudonym).to be_invalid
    end
  end
end
