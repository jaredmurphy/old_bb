FactoryBot.define do
  factory :role, class: Role do
    name "user"
  end

  factory :publisher_role, class: Role, parent: :role do
    name "publisher"
  end

  factory :moderator_role, class: Role, parent: :role do
    name "moderator"
  end

  factory :admin_role, class: Role, parent: :role do
    name "admin"
  end
end
