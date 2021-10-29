class OrdersController < ApplicationController
  before_action :set_find, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :create, :edit, :destroy]
  # GET /orders
  # GET method to get all orders from database 

  def index
    #authorize Order
    @orders = Order.all
  end

  # GET /orders/1
  # GET method to get a order by id

  def show
    #authorize Order
  end

  # GET /orders/new
  # GET method for the new order form

  def new
    authorize Order
    @order = Order.new
  end

  # POST /orders
  # POST method for processing form data

  def create
    #byebug
    authorize Order
    @order = Order.new(order_params)
    @order.update(user_id: @current_user.id)
    #add_product_to_order
    @order.save!
    #reset_sessions_cart
    redirect_to orders_path
  end

  # GET /orders/1/edit
  # GET method for editing a order based on id

  def edit
    authorize Order
  end

  # PATCH/PUT /orders/1
  # PUT method for updating in database a order based on id 

  def update
    if @order.update(order_params)
       authorize Order
       flash[:success] = 'Order updated'
       redirect_to @order
    else
      flash[:error] = 'Failed to edit Order!!!'
       render 'edit'
    end
  end

  # DELETE /Orders/1
  # DELETE method for deleting a order from database based on id

  def destroy
    authorize Order
    @order.destroy
    flash[:success] = 'Order Deleted'
    redirect_to @order
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.

  def find_order
    @order = Order.find(params[:id])
  end
  
  def order_params
    params.require(:order).permit(:user_id, :order_number, :order_amount)
  end
end  
