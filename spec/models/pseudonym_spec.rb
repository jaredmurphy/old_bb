require 'rails_helper'

RSpec.describe Pseudonym, type: :model do
  describe "validations" do 
    describe "presence" do 
      it "requires presence of name" do
        pseudo = FactoryBot.build(:pseudonym, name: nil)
        expect(pseudo).to be_invalid
      end
    end

    describe "uniqueness" do 
      it "requires uniqueness of name" do
        pseudo = FactoryBot.create(:pseudonym)
        invalid_pseudo = FactoryBot.build(:pseudonym, name: pseudo.name)
        expect(invalid_pseudo).to be_invalid
      end
    end
  end
end
