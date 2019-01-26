class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :posts
  has_many :comments
  has_many :pseudonyms

  after_create :assign_default_role
  before_destroy :destroy_associations

  Role::TYPES.each do |user_role|
    define_method "#{user_role}?" do
      self.roles.include?(Role.send("#{user_role}"))
    end
  end

  def default_pseudonym
    pseudonyms.default.first || pseudonyms.first
  end

  private

  def assign_default_role
    UserRole.create(user: self, role: Role.user)
  end

  def destroy_associations
    pseudonyms.destroy_all
    user_roles.destroy_all
  end
end
