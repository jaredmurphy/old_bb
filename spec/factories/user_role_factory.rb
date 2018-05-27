FactoryBot.define do
  factory :user_role, class: UserRole do
    user { FactoryBot.create(:user) }
    role { FactoryBot.create(:role) }
  end
end

