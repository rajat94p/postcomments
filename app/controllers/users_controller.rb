class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
			session[:user_id] = @user.id
			if @user.update(user_params)
    		redirect_to root_path, notice: 'Successfully Created Account, Please Sign-In'
  		else
    		render :new
  		end
	end

end


private


def user_params
	params.require(:user).permit(:email, :phone, :password)
end
