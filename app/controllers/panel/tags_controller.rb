module Panel
	class TagsController < ApplicationController
		before_action :select_tag, only: %w[ show edit update destroy ]

		def index
			@tags = Tag.all
		end

		def show

		end

		def new
			@tag = Tag.new
		end

		def create
			@tag = Tag.new(params.require(:tag).permit(:title))

			if @tag.valid?
				if @tag.save
					flash[:notice] = "Etiket başarıyla eklendi!"
					redirect_to(tags_path)
				else
					flash[:alert] = "Etiket eklemede bilinmeyen bir hata meydana geldi!"
					render :new,status: 422
				end
			else
				flash[:alert] = "Validasyon başarısız!"
				render :new,status: 422
			end
		end

		def edit

		end

		def update
			if @tag.update(params.require(:tag).permit(:title))
				flash[:notice] = "Etiket #{@tag.id} başarıyla güncellendi"
				redirect_to(tags_path)
			else
				flash[:alert] = "Etiket güncellemede hata meydana geldi"
				render :edit,status: 422
			end
		end

		def destroy
			if @tag.destroy
				flash[:notice] = "Etiket başarıyla silidi"
			else
				flash[:alert] = "Etiket silinemedi"
			end
			redirect_to(tags_path)
		end

		private
		def select_tag
			@tag = Tag.find(params[:id])
		end
	end
end