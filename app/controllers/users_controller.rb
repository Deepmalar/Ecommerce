class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end
  
  def edit
  end
     
  def update
    if @user.update(user_params)
       flash[:success] = 'Profile updated'
       redirect_to @user
    else
       render 'edit'
    end
  end

  def destroy
    @user.destroy
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
    
end