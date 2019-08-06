# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    true
  end

  def destroy?
    return false if current_user == model
    super
  end

  class Scope < Scope
    def resolve
      scope.where(id: current_user.id)
    end
  end
end
