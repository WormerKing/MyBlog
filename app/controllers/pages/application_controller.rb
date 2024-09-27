module Pages
	class ApplicationController < ActionController::Base
		# before_action :redirect_if_unsigned
		layout "application"

		def current_admin
			@current_admin ||= Admin.find_by_username(session[:admin_username]) if session[:admin_username] && Admin.exists?(username:session[:admin_username])
		end
		def signed_in?
			current_admin
		end
		def redirect_if_unsigned
			unless signed_in?
				redirect_to(root_path)
			end
		end

		helper_method :signed_in?,:current_admin,:redirect_if_unsigned
	end
end