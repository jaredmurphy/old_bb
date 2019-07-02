FactoryBot.define do
  factory :pseudonym do
    user
    name { Faker::Internet.user_name }
  end
end
