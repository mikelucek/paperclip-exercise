class UsersController < ApplicationController
	def index
		@user =User.new
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		puts "CREATING USER"
	 @user = User.create(my_params)
	 if @user.save
	 	redirect_to users_path
	 else
	 	redirect_to new_user_path
	 end
	end

	def destroy
		puts "*****************DESTRUCTION*************"

		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end


	private

	def my_params
		params.require(:user).permit(:avatar)		
	end

end
