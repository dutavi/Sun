# frozen_string_literal: true
class TermPolicy < ApplicationPolicy
  def show?
    super or current_user == model
  end

  def edit?
    update?
  end

  def update?
    user = current_user
    term = model
    return true if user.id == term.user_id
  end

  def destroy?
    user = current_user
    term = model
    return true if user.id == term.user_id
    super
  end

  class Scope < Scope
    def resolve
      scope.where(id: current_user.id)
    end
  end
end
