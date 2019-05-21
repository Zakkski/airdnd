class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
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
end
