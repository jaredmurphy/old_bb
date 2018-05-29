FactoryBot.define do
  factory :post, class: Post do
    user      { FactoryBot.create(:user) }
    title     { Faker::Lorem.word }
    body      { Faker::Lorem.paragraph }
    pseudonym { FactoryBot.create(:pseudonym) }
  end
end
