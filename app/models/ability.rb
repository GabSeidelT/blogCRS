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
        can :create, Comment
        can [:read, :update, :destroy], User
      end

    end
      
  end

end
