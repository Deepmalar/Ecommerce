class LineItemPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
  def create?
    user.member?
  end

  def destroy?
    user.member?
  end
  
  def add_quantity?
    user.member?
  end

  def reduce_quantity?
    user.member?
  end
  
end
