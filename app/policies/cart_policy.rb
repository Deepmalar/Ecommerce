class CartPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end

  def add_to_cart?
    user.member?
  end
  
  # def show
  #  
  # end

  # def destroy
  #   
  # end
end
