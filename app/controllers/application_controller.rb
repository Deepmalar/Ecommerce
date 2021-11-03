class ApplicationController < ActionController::Base 
	protect_from_forgery with: :exception

	#before_action :update_allowed_parameters, if: :devise_controller?

	before_action :authenticate_user!

	after_action :verify_authorized, :except => :index, unless: :devise_controller?

	include Pundit
	
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	before_action :current_cart


	private

	def user_not_authorized
		flash[:alert] = "You are not authorized to perform this action."
		redirect_to(request.referrer || root_path)
	end
  
    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end
	
	# protected

	# def update_allowed_parameters
	#  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :first_name, :last_name, :email, :phone_no, :password)}
	# 	devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:role, :first_name, :last_name, :email, :phone_no, :password, :current_password)}
	# end
end

