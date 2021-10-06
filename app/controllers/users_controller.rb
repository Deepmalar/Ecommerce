class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  # GET /users
  # GET method to get all users from database   

  def index
    @users = User.all
  end

  # GET /users/1
  # GET method to get a user by id

  def show
  end 
  
  # GET /users/1/edit
  # GET method for editing a user based on id

  def edit
  end
     
  # PATCH/PUT /users/1
  # PUT method for updating in database a user based on id 

  def update
    if @user.update(user_params)
       flash[:success] = 'Profile updated'
       redirect_to @user
    else
      flash[:error] = 'Failed to edit User!'
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE method for deleting a user from database based on id
  
  def destroy
    @user.destroy
    flash[:success] = 'User deleted'
    redirect_back(fallback_location: users_url)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user)
          .permit(:email, :first_name, :last_name, :phone_no, :password, :password_confirmation)
  end
    
end