class SessionsController < ApplicationController
	before_action :signed_admin?,only: %w[ new create ]
	def new
	end

	def create
		@admin = Admin.find_by(username:get_params[:username],email:get_params[:email])
		
		if @admin && @admin.authenticate(get_params[:password])
			session[:admin_username] = @admin.username
			redirect_to("/panel")
		else
			puts "Geçersiz giriş denemesi"
			render action:"new"
		end
	end

	def destroy
		session[:admin_username] = nil
		redirect_to("/")
	end

	private
	def get_params
		params.require(:admin).permit(:username,:email,:password)
	end

	def signed_admin?
		redirect_to("/") if signed_in?
	end
	def get_login_errors

	end
end
