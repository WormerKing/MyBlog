class AdminsController < ApplicationController
	before_action :redirect_if_unsigned
	before_action :select_admin,only: %w[ edit update destroy ]

	def index
		@admins = Admin.all
	end

	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.new(params.require(:admin).permit(:firstname,:lastname,:username,:email,:password,:password_confirmation))

		if @admin.valid?
			if @admin.save
				flash[:notice] = "Admin başarıyla eklendi!"
				redirect_to(admins_path)
			else
				flash[:alert] = "Admin ekleme işlemi başarısız!"
				render :new,status: 422
			end
		else
			flash[:alert] = "Validasyon başarısız!"
			render :new,status: 422
		end
	end

	def edit

	end

	#FIXME update kısmında sıkıntı çıkıyor

	def update
		if @admin.update(params.require(:admin).permit(:firstname,:lastname,:username,:email,:password,:password_confirmation))
			flash[:notice] = "İdsi #{@admin.id} olan kayıt başarıyla güncellendi!"
			redirect_to(admins_path)
		else
			flash[:alert] = "Validasyon başarısız!"
			render :edit,status: 422
		end
	end

	def destroy
		if @admin.destroy
			flash[:notice] = "Admin başarıyla silindi!"
		else
			flash[:alert] = "Admin silmede hata meydana geldi!"
		end
		redirect_to(admins_path)
	end

	private
	def select_admin
		@admin = Admin.find(params[:id])
	end
end