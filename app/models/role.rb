class Role < ApplicationRecord
  has_many :user_roles

  validates :name, uniqueness: true, presence: true

  def self.default
    Role.find_by(name: "user")
  end

  def self.publisher
    Role.find_by(name: "publisher")
  end

  def self.moderator
    Role.find_by(name: "moderator")
  end

  def self.admin
    Role.find_by(name: "admin")
  end
end
