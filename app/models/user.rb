class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :user_roles
  after_create :assign_default_values

  def publisher?
    self.user_roles.include? Role.publisher
  end

  def moderator?
    self.user_roles.include? Role.moderator
  end

  def admin?
    self.user_roles.include? Role.admin
  end

  private 

  def assign_default_values 
    self.user_roles << UserRole.create(user: self, role: Role.default)
  end
end
