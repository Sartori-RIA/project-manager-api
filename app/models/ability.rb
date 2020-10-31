# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, params)
    can :manage, Project
    can :manage, Activity, project_id: params[:project_id]

    return if user.blank?

    can :manage, User, id: user.id
  end
end
