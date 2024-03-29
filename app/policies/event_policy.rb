class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    true
  end

  def my_events?
    true
  end

  def destroy?
    record.user == user
  end
end
