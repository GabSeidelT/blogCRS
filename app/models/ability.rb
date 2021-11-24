# frozen_string_literal: true

class Ability
  include CanCan::Ability
  

  # def initialize(user)
  #   # if user.admin?
  #   #   can :manage, :all
  #   # else
  #   #   can [:read, :update, :destroy], Car
  #   #   can :manage, User
  #   # end
  # #   if user.admin?
  # #     can :manage, :all
  # #   else
  # #     can :read, Post
  # #     can :manage, User
  # #   end

  # #   if user.comment?
  # #     can [:read, :update, :destroy], Comment
  # #   end

  # end

end
