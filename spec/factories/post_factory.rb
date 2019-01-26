FactoryBot.define do
  factory :post, class: Post do
    user
    title     { Faker::Lorem.word }
    body      { Faker::Lorem.paragraph }
    pseudonym
  end
end
