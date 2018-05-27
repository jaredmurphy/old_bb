FactoryBot.define do
  factory :user, class: User do
    email    { Faker::Internet.email } 
    password { Faker::Internet.password }
  end

  factory :publisher_user, parent: :user, class: User do 
    roles { [FactoryBot.create(:role, name: "publisher")] }
  end

  factory :moderator_user, parent: :user, class: User do 
    roles { [FactoryBot.create(:role, name: "moderator")] }
  end

  factory :admin_user, parent: :user, class: User do 
    roles { [FactoryBot.create(:role, name: "admin")] }
  end
end

