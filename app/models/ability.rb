class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user if not logged in

    if user.publisher?
      can :create, Post
    end
  end
end
