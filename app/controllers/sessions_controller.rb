class SessionsController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def new
	end

	def create
		user = User.find_by(email: params[:email])
			if user && user.authenticate(params[:password])
				session[:user_id] = user.id
				redirect_to root_path, notice: 'Logged in successfully'	
			else
				flash.now[:alert] = "Invalid Email or Password"
				render :new
			end

	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice: "Logged Out!"
	end

end
