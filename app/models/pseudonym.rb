class Pseudonym < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :user_pseudonyms
  has_many :users, through: :user_pseudonyms

  has_many :posts
end
