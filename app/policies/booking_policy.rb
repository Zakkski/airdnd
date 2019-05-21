class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    record.event.user != user
  end

  def destroy?
    true
  end
  
  def edit?
    record.user == user
  end

  def update?
    true
  end
end
