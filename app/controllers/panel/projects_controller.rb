module Panel
	class ProjectsController < ApplicationController
		before_action :select_project, only: %i[ show edit update destroy ]
		def index
			@projects = Project.all
			#FIXME end_date ve start_date kısımlarında oluşan hatalar görünmüyor
		end
		def show

		end
		def new
			@project = Project.new
			@categories = Category.pluck(:name)
			@tags = Tag.pluck(:title)
		end
		def create
			@project = Project.new(get_params(:title,:header,:body,:url,:end_date,:start_date))
			@project.category = Category.find_by_name(get_params(:category)[:category]) if Category.exists?(name:get_params(:category)[:category])
			
			@form_tags = params.require(:project).permit!["tags"].delete_if {|tag| !Tag.exists?(title:tag)}
			@project.tags = @form_tags.map {|tag| Tag.find_by_title(tag)}
			#FIXME tag ekleme kısmını düzelt

			
			if @project.invalid?
				puts "hata meydana geldi"
				@categories = Category.pluck(:name)
				@tags = Tag.pluck(:title)
				flash[:alert] = "Validasyon başarısız!"
				render :new, status: 422
			else
				if (@project.save)
					flash[:notice] = "Kayıt başarıyla eklendi"
					redirect_to(projects_path)
				else
					flash[:alert] = "Kayıt eklenemedi"
					redirect_to(new_project_path)
				end
			end
		end
		def edit
			@categories = Category.pluck(:name)
			@tags = Tag.pluck(:title)
		end
		def update
			@update_category = Category.find_by(name:params.require(:project).permit(:category)[:category])
			@update_tags = params.require(:project).permit!["tags"].delete_if {|tag| !Tag.exists?(title:tag)}.map {|tag| Tag.find_by(title:tag)}
			if @project.update(params.require(:project).permit(:title,:header,:url,:body,:start_date,:end_date)) && @project.update(category:@update_category,tags:@update_tags)
				flash[:notice] = "Proje #{@project.id} başarıyla güncellendi"
				redirect_to(projects_path)
			else
				@categories = Category.pluck(:name)
				@tags = Tag.pluck(:title)
				flash[:alert] = "validasyon başarısız"
				render :edit,status: 422
			end
		end

		def destroy
			if @project.destroy
				flash[:notice] = "Kayıt başarıyla silindi"
			else
				flash[:alert] = "Kayıt silmede hata meydana geldi"
			end
			redirect_to(projects_path)
		end

		private 
		def get_params(*arr)
			params.require(:project).permit(arr)
		end

		def select_project
			if Project.exists?(id:params.permit(:id)[:id])
				@project = Project.find(params.permit![:id])
			else
				render :file => "#{Rails.root}/public/404.html",  :status => 404
			end
		end
	end
end