class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET method to get all addresses from database  

  def index
    @addresses = Address.all
  end

  # GET /users/1
  # GET method to get a user by id

  def show
    @addresses = Address.find(params[:id])
  end
 
  # GET /addresses/new
  # GET method for the new address form

  def new
    @address = Address.new
  end

  # POST /addresses
  # POST method for processing form data   

  def create
    @address = Address.new(params[:user])
    if @user.save
      redirect_to @address
    else
      flash[:error] = 'Failed to edit Address!'
      render "new"
    end
  end
 
  # GET /addresses/1/edit
  # GET method for editing a address based on id
  
  def edit
  end
    
  # PATCH/PUT /addresses/1
  # PUT method for updating in database a address based on id   

  def update
    if @address.update(address_params)
      flash[:success] = 'Address updated'
      edirect_to @address
    else
      flash[:error] = 'Failed to edit address!'
      render 'edit'
    end
  end
 
  # DELETE /addresses/1
  # DELETE method for deleting a address from database based on id  

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