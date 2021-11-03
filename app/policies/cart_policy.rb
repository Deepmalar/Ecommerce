class CartPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end

  def show?
    user.member?
  end

  def destroy?
    user.member?
  end 
end
