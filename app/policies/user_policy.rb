class UserPolicy < ApplicationPolicy
  #attr_reader :current_user, :user

  #def initialize(current_user, user)
   # @current_user = current_user
  #end

  def edit?
    user.admin?
  end  

  def update?
    user.admin? 
  end

  def index?
    user.admin?
  end  

  def destroy?
    user.admin?
  end  

end
