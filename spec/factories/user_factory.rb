FactoryBot.define do
  factory :user, class: User do
    email    { Faker::Internet.email }
    password { Faker::Internet.password }
    confirmed_at Date.today
    roles { [Role.user || FactoryBot.create(:role, name: "user")] }
  end

  factory :publisher_user, parent: :user, class: User do
    roles { [Role.publisher || FactoryBot.create(:role, name: "publisher")] }
  end

  factory :moderator_user, parent: :user, class: User do
    roles { [Role.moderator || FactoryBot.create(:role, name: "moderator")] }
  end

  factory :admin_user, parent: :user, class: User do
    roles { [Role.admin || FactoryBot.create(:role, name: "admin")] }
  end
end

