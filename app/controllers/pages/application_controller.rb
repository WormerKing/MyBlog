module Pages
  class ApplicationController < ActionController::Base
    # before_action :redirect_if_unsigned
    layout 'application'

    def current_admin
      return unless session[:admin_username] && Admin.exists?(username: session[:admin_username])

      @current_admin ||= Admin.find_by_username(session[:admin_username])
    end

    def signed_in?
      current_admin
    end

    def redirect_if_unsigned
      return if signed_in?

      redirect_to(root_path)
    end

    def decode_url(url)
      url.split('+').map(&:capitalize).join(' ')
    end

    helper_method :signed_in?, :current_admin, :redirect_if_unsigned
  end
end

