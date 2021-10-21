class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  # GET /products
  # GET method to get all products from database   
  
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET method to get a product by id

  def show; end

  # GET /products/new
  # GET method for the new product form

  def new
    @product = Product.new
  end
  
  # POST /products
  # POST method for processing form data   

  def create
     #byebug
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product added!'   
      redirect_to root_path   
    else
      render 'new'
    end
  end

  # GET /products/1/edit
  # GET method for editing a product based on id

  def edit
  end

  # PATCH/PUT /products/1
  # PUT method for updating in database a product based on id   

  def update
    if @product.update(product_params)
      flash[:notice] = 'Product updated!'   
      redirect_to root_path   
    else
      flash[:error] = 'Failed to edit Product!!!'
      render 'edit'
    end
  end

  # DELETE /products/1
  # DELETE method for deleting a product from database based on id   

  def destroy
    if @product.destroy
      flash[:notice] = 'Product deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this product!'   
      render :destroy   
    end   
  end   

  # Use callbacks to share common setup or constraints between actions.

  private

  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.

  def product_params
    params.require(:product).permit(:product_name, :image, :p_description, :quantity, :price, :category_id)
  end
end  