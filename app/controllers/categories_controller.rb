class CategoriesController < ApplicationController
    #skip_before_action :verify_authenticity_token
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    after_action :verify_authorized, only: [:new, :create, :edit, :destroy]
    
    # GET /categories
    # GET method to get all categories from database   
  
    def index
      @categories = Category.all
    end
  
    # GET /categories/1
    # GET method to get a category by id
  
    def show
    end 
    
    # GET /categories/1/edit
    # GET method for editing a category based on id
  
    def edit
      authorize Category
    end
  
    # GET /categories/new
    # GET method for the new Category form
  
    def new
      @category = Category.new 
      authorize Category
    end
    
    # POST /categories
    # POST method for processing form data   

    def create
     authorize Category 
     @category = Category.new(category_params)
     if @category.save
      flash[:notice] = 'Category added!'   
      redirect_to root_path   
     else
      render 'new'
    end
  end

  # GET /categories/1/edit
  # GET method for editing a category based on id

  def edit
    authorize Category
  end

  # PATCH/PUT /categories/1
  # PUT method for updating in database a category based on id   

  def update
    authorize Category
    if @category.update(category_params)
      flash[:notice] = 'Category updated!'   
      redirect_to root_path   
    else
      flash[:error] = 'Failed to edit Category!!!'
      render 'edit'
    end
  end

  # DELETE /categories/1
  # DELETE method for deleting a category from database based on id   

  def destroy
    authorize Category
    if @category.destroy
      flash[:notice] = 'Category deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this Category!'   
      render :destroy   
    end   
  end   

  # Use callbacks to share common setup or constraints between actions.

  private

  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.

  def category_params
    params.require(:category).permit(:category_name)
  end

end
