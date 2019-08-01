# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @model        = model
  end

  def index?
    return false unless current_user
    current_user.admin?
  end

  def new?
    return false unless current_user
    current_user.admin?
  end

  def create?
    return false unless current_user
    current_user.admin?
  end

  def show?
    return false unless current_user
    current_user.admin?
  end

  def edit?
    return false unless current_user
    current_user.admin?
  end

  def update?
    return false unless current_user
    current_user.admin?
  end

  def destroy?
    return false unless current_user
    current_user.admin?
  end

  class Scope
    attr_reader :current_user, :scope

    def initialize(current_user, scope)
      @current_user = current_user
      @scope        = scope
    end

    def resolve
      scope.all
    end

    def resolve_admin
      scope.all
    end
  end
end
