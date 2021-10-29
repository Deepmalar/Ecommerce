class OrderPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
  def new?
    user.member?
  end  

  def create?
    user.member?
  end  

  def edit?
    user.member?
  end  

  def update?
    user.member? 
  end

  def index?
    user.member?
  end  

  def destroy?
    user.member?
  end  

end
