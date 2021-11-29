# frozen_string_literal: true

class Ability
  include CanCan::Ability
  

  def initialize(user)
    if user.present?
      if user.admin?
        can :manage, :all
      end
      
      if user.comment?
        can :show, Post
        # can :manage, Comment
        can [:read, :update, :destroy], User
      end
      
      if user.regular?
        can [:read, :update, :destroy], User
        can :show, Post
      end
    else
      can :show, Post
    end
      
  end

end
