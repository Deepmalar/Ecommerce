class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  # GET /products
  # GET /products.json
  
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end
  
  # GET /products/1/edit
  def edit; end

  # POST /products
  # POST /products.json

  def create
    @product = Product.new(product_params)
    if @product.save
      notify_user
      flash[:info] = generate_activation_message.html_safe
      redirect_to root_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json

  def update
    if @product.update(product_params)
       flash[:success] = 'Product updated'
       redirect_to @product
    else
      flash[:error] = 'Failed to edit Product!!!'
       render 'edit'
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json

  def destroy
    @product.destroy
  end
  
  # Use callbacks to share common setup or constraints between actions.

  private

  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.

  def product_params
    params.require(:product).permit(:product_name, :p_description, :quantity, :price)
  end
end  