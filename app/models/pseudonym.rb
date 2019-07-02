class Pseudonym < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :user, presence: true

  belongs_to :user
  has_many :posts

  before_save :ensure_one_default

  scope :default, -> { where(default: true) }

  private

  def ensure_one_default
    if default && default_changed? && user.default_pseudonym
      user.default_pseudonym.update_attributes(default: false)
    end
  end
end
