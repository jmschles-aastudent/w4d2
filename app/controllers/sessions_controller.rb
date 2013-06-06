class SessionsController < ApplicationController

	def create
		@user = User.find_by_username(params[:user][:username])

		if @user.verify_password(params[:user][:password])
			@user.reset_token!
			session[:token] = @user.token
			redirect_to user_contacts_url(@user)
		else
			flash[:errors] ||= []
			flash[:errors] << "Invalid username/password combination."
			redirect_to new_session_url
		end
	end

	def destroy
		u = current_user
		if u.nil?
			redirect_to new_session_url
			return
		end

		session[:token] = nil
		u.token = nil
		u.save!

		redirect_to new_session_url
	end

	def new
	end
end
