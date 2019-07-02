require 'rails_helper'

RSpec.describe Pseudonym, type: :model do
  describe "Validations" do
    let(:pseudo) { FactoryBot.build(:pseudonym) }

    it "is valid with valid attributes" do
      expect(pseudo).to be_valid
    end

    it "it is invalid without a name" do
      pseudo.name = nil
      expect(pseudo).to be_invalid
    end

    it "it is invalid without a unqiue name" do
      pseudo.save
      second_pseudo = FactoryBot.build(:pseudonym, name: pseudo.name)

      expect(second_pseudo).to be_invalid
    end
  end

  describe "Scopes" do
    let(:pseudonym) { FactoryBot.create(:pseudonym) }
    let(:not_default) { FactoryBot.create(:pseudonym, user: pseudonym.user) }

    describe "#default" do
      it "returns pseudonyms where default is true" do
        pseudonym.update(default: true)
        user = pseudonym.user

        expect(user.pseudonyms.default).to include pseudonym
      end
    end
  end

  describe "#default" do
    let(:pseudonym) { FactoryBot.create(:pseudonym) }

    it "is set to false if the user sets another pseudonym to default" do
      second_pseudonym = FactoryBot.create(:pseudonym, user: pseudonym.user)
      second_pseudonym.update(default: true)

      expect(pseudonym.default).to be false
    end
  end
end
