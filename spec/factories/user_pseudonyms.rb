FactoryBot.define do
  factory :user_pseudonym do
    user      { FactoryBot.create(:user) }
    pseudonym { FactoryBot.create(:pseudonym) }
  end
end
