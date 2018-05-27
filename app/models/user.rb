class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :posts

  after_create :assign_default_values

  def publisher?
    has_role? Role.publisher
  end

  def moderator?
    has_role? Role.moderator
  end

  def admin?
    has_role? Role.admin
  end

  private

  def has_role?(role)
    self.roles.include? role
  end

  def assign_default_values
    add_role! Role.default
  end

  def add_role!(role)
    self.user_roles << UserRole.create(user: self, role: role)
  end

end
