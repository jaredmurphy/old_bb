FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    user { FactoryBot.create(:user) }
  end

  factory :post_comment, parent: :comment do 
    commentable { FactoryBot.create(:post) }
  end

  factory :comment_comment, parent: :comment do 
    commentable { FactoryBot.create(:post_comment) }
  end
end
