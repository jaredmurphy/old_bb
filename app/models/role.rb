class Role < ApplicationRecord
  TYPES = %w(user publisher moderator admin)

  has_many :user_roles

  validates :name, uniqueness: true, presence: true

  class << self
    TYPES.each do |role_type|
      define_method "#{role_type}" do
        Role.find_by(name: role_type)
      end
    end
  end
end
