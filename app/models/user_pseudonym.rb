class UserPseudonym < ApplicationRecord
  validates :user, :pseudonym, presence: true
  validates_uniqueness_of :user_id, :scope => :pseudonym_id

  belongs_to :user
  belongs_to :pseudonym
end
