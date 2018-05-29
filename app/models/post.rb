class Post < ApplicationRecord
  belongs_to :user
  belongs_to :pseudonym

  validates :user, :title, :body, presence: true
  validates_uniqueness_of :title, :scope => :pseudonym_id
end
