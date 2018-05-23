class Post < ApplicationRecord
  belongs_to :user

  validates :user, :title, :body, presence: true
end
