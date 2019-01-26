class Post < ApplicationRecord
  belongs_to :user
  belongs_to :pseudonym

  has_many :comments, as: :commentable

  validates :user, :title, :body, presence: true
  validates_uniqueness_of :title, :scope => :pseudonym_id
end
