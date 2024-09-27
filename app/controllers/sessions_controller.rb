class SessionsController < ApplicationController
	before_action :signed_admin?,only: %i[ new create ]
	def new
	end

	def create
    flash.clear
    @admin = (
      Admin.find_by(username: get_params[:username_or_email]) ||
      Admin.find_by(email: get_params[:username_or_email])
    )

    unless @admin.nil?
      if @admin.authenticate(get_params[:password])
        # giriş başarılı ise
        flash[:notice] = "Giriş başarılı"
        session[:admin_username] = @admin.username
        redirect_to(panel_path)
      else
        # Kullanıcı adı doğru, şifre yanlış ise
        flash[:password_error] = "Girdiğiniz şifre kullanıcı adı ya da eposta ile eşleşmiyor!"
        flash.now[:before_username_or_password] = get_params[:username_or_email]
        render :new,status: 422
      end
    else
      # kullanıcı adı ve email bulunamadı ise
      flash[:username_or_email_error] = "Kullanıcı adı ya da eposta bulunamadı!"
      render :new,status: 422
    end
  end

	def destroy
		session[:admin_username] = nil
		redirect_to(root_path)
	end

	private
	def get_params
		params.require(:admin).permit(:username_or_email,:password)
	end

	def signed_admin?
		redirect_to(panel_path) if signed_in?
	end
end
