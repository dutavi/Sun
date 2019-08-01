# frozen_string_literal: true
class TermPolicy < ApplicationPolicy
  def show?
    super or current_user == model
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
