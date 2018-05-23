class Role < ApplicationRecord
  has_many :user_roles

  validates :name, uniqueness: true, presence: true

  def self.default
    Role.find_by(name: "user")
  end
end
