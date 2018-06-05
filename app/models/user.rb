class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :username, presence: true, uniqueness: true

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :user_pseudonyms
  has_many :pseudonyms, through: :user_pseudonyms
  has_many :posts
  has_many :comments

  after_create :assign_default_values
  after_update :add_new_pseudonym, if: :username_changed?

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
    add_pseudonym! self.username
  end

  def add_new_pseudonym
    add_pseudonym! self.username
  end

  def add_role!(role)
    self.user_roles << UserRole.create(user: self, role: role)
  end

  def add_pseudonym!(pseudonym)
    self.pseudonyms.create!(name: pseudonym)
  end
end
