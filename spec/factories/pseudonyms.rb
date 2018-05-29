FactoryBot.define do
  factory :pseudonym do
    name { Faker::Internet.user_name }
  end
end
