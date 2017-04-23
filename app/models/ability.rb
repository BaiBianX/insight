# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # can :manage, :all if user.admin?
    can %i[update destroy], User do |resource|
      resource.id == user.id
    end
  end
end
