class CategoriesController < ApplicationController
	before_action :redirect_if_unsigned
	before_action :select_category,only: %w[ edit update destroy ]
	def index
		@categories = Category.all
	end
	def new
		@category = Category.new
	end
	def create
		@category = Category.new(params.require(:category).permit(:name))

		if @category.valid?
			if @category.save
				flash[:notice] = "Kategori başarıyla eklendi"
			else
				flash[:alert] = "Kategori eklemede hata meydana geldi!"
			end
			redirect_to(categories_path)
		else
			flash[:alert] = "validasyon başarısız!"
			render :new,status: 422
		end
	end

	def edit

	end
	def update
		if @category.update(params.require(:category).permit(:name))
			flash[:notice] = "Kategori başarıyla güncellendi"
			redirect_to(categories_path)
		else
			flash[:alert] = "Validasyon başarısız"
			render :edit,status: 422
		end
	end

	def destroy
		if @category.destroy
			flash[:notice] = "Kategori başarıyla silindi"
		else
			flash[:alert] = "Kategori silinemedi!"
		end
		redirect_to(categories_path)
	end

	private
	def select_category
		@category = Category.find(params[:id])
	end
end