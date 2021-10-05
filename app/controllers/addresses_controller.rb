class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def show
    @addresses = Address.find(params[:id])
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(params[:user])
    if @user.save
      redirect_to @address
    else
      flash[:error] = 'Failed to edit Address!'
      render "new"
    end
  end
 
  def edit
  end
      
  def update
    if @address.update(address_params)
      flash[:success] = 'Address updated'
      edirect_to @address
    else
      flash[:error] = 'Failed to edit address!'
      render 'edit'
    end
  end
 
  def destroy
   @address.destroy
   flash[:success] = 'Address Deleted'
   redirect_to @address
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:city, :state, :country, :zip_code, :street)
  end
end