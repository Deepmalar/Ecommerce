class UserPolicy < ApplicationPolicy
  #attr_reader :current_user, :user

  def initialize(current_user, user)
    @user = user
  end

  def update?
    user.admin? 
  end

  def index?
    user.admin?
  end  


end
