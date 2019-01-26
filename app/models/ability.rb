class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :index, :show, :to => :read

    can :read, Post # define rules for all users, also not authorized ones

    if user.present? # logged in user
      if user.publisher?
        can :manage, Post, user_id: user.id
      end

      if user.moderator?
        can :manage, Post
      end

      if user.admin?
        can :manage, :all
      end
    end
  end
end
