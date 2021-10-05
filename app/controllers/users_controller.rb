class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
  end 
  
  def edit
  end
     
  def update
    if @user.update(user_params)
       flash[:success] = 'Profile updated'
       redirect_to @user
    else
      flash[:error] = 'Failed to edit User!'
      render 'edit'
    end
  end

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