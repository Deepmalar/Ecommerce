class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.update(user_id: @current_user.id)
    add_product_to_order
    @order.save!
    reset_sessions_cart
    redirect_to orders_path
  end

  def edit
  end

  def update
    if @order.update(order_params)
       flash[:success] = 'Order updated'
       redirect_to @order
    else
      flash[:error] = 'Failed to edit Order!!!'
       render 'edit'
    end
  end

  def destroy
    @order.destroy
    flash[:success] = 'Order Deleted'
    redirect_to @order
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end
  
  def order_params
    params.require(:order).permit(:user_id, :order_number, :order_amount)
  end
end  