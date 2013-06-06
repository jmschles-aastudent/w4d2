class UsersController < ApplicationController

	def create
		@user = User.new(params[:user])
		if @user.save
			render user_contacts_path(@user)
		else
			flash[:errors] ||= []
			flash[:errors] << "Invalid username/password combination."
			render :json => @user.errors, :status => :unprocessable_entity
		end
	end

	def destroy
		User.find(params[:id]).destroy
		render :text => "User decimated!"
	end

end
