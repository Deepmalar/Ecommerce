class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def create
    @address = Address.new(params[:user])
    if @user.save
       redirect_to @address
    else
       render "new"
    end
  end
  def new
    @address = Address.new
  end
    
  def show
    @addresses = Address.find(params[:id])
  end
 
  def edit
  end
      
  def update
    if @address.update(address_params)
       flash[:success] = 'Address updated'
       redirect_to @address
    else
       render 'edit'
    end
  end
 
  def destroy
   @address.destroy
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_address
    @address = Address.find(params[:id])
  end

end