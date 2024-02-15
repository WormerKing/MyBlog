class ApplicationController < ActionController::Base
	def current_admin
		@current_admin ||= Admin.find_by_username(session[:admin_username]) if session[:admin_username] && Admin.exists?(username:session[:admin_username])
	end
	def signed_in?
		current_admin
	end

	helper_method :signed_in?,:current_admin
end
