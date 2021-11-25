# frozen_string_literal: true

class Ability
  include CanCan::Ability
  

  def initialize(user)
    if user.admin?
      can :manage, :all
    
    end

    if user.comment?
      can :manage, Comment
      can [:read, :update, :destroy], User
    end

    if user.regular?
      can [:read, :update, :destroy], User
      can :read, Post
      can :read, Category
    end

  end

end
