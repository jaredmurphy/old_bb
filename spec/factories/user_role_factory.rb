FactoryBot.define do
  factory :user_role, class: UserRole do
    user
    role
  end
end

