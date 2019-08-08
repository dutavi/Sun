# frozen_string_literal: true

class PhrasePolicy < ApplicationPolicy
  def show?
    super or current_user == model
  end

  
  def edit?
    update?
  end
  
  def update?
    user = current_user
    phrase = model
    return true if user.id == phrase.user_id
  end

  def destroy?
    user = current_user
    phrase = model
    return true if user.id == phrase.user_id
    super
  end
  
  class Scope < Scope
    def resolve
      scope.where(id: current_user.id)
    end
  end
end
