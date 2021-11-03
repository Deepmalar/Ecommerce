class CartsController < ApplicationController
  after_action :verify_authorized, only: [:show, :destroy]
  
  def show
    authorize Cart
    @cart = @current_cart
  end

  def destroy
    authorize Cart
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

end
