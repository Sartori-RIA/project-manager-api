# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, params)
    can :manage, Project
  end
end
