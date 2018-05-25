class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post # define rules for all users, also not logged ones

    if user.present?
      can :manage, User, :id: user.id

      if user.publisher?
        can :manage, Post, :user_id: user.id
      end

      if user.moderator?
        can :manage, Post
      end

      if user.admin?
        can :manage, Post
        can :manage, User
      end
    end
  end

end
