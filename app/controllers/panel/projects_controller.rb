module Panel
  class ProjectsController < ApplicationController
    before_action :select_project, only: %i[show edit update destroy]
    def index
      @projects = Project.all.sort
      # FIXME: end_date ve start_date kısımlarında oluşan hatalar görünmüyor
    end

    def show; end

    def new
      @project = Project.new
      @categories = Category.pluck(:name)
      @tags = Tag.pluck(:title)
    end

    def create
      @project = Project.new(get_params(:title, :header, :content, :url, :end_date, :start_date, :image))

      if Category.exists?(name: get_params(:category)[:category])
        @project.category = Category.find_by_name(get_params(:category)[:category])
      end

      @form_tags = params.require(:project).permit!['tags'].delete_if { |tag| !Tag.exists?(title: tag) }
      @project.tags = @form_tags.map { |tag| Tag.find_by_title(tag) }

      if @project.valid?
        if @project.save
          @project.save_project_images
          flash[:notice] = 'Proje başarıyla eklendi'
          KredisService.clear_data('top_projects')
          redirect_to(projects_path)
        else
          @old_tags = params.require(:project)['tags']
          flash[:alert] = 'Teknik bir hatadan dolayı kayıt eklenemedi!'
          render :new, status: 422
        end
      else
        @old_tags = params.require(:project)['tags']
        @categories = Category.pluck(:name)
        @tags = Tag.pluck(:title)
        flash[:alert] = 'Validasyon başarısız!'
        render :new, status: 422
      end
    end

    def edit
      get_image_datas
      @old_tags = @project.tags.pluck(:title)
      @categories = Category.pluck(:name)
      @tags = Tag.pluck(:title)
    end

    def update
      @update_category = Category.find_by(name: params.require(:project).permit(:category)[:category])
      @update_tags = params.require(:project).permit!['tags'].delete_if do |tag|
        !Tag.exists?(title: tag)
      end.map { |tag| Tag.find_by(title: tag) }
      if @project.update(params.require(:project).permit(:title, :header, :url, :content, :start_date,
                                                         :end_date, :image)) && @project.update(category: @update_category,
                                                                                                tags: @update_tags)
        @project.save_project_images
        flash[:notice] = "Proje #{@project.id} başarıyla güncellendi"
        KredisService.clear_data('top_projects')
        redirect_to(projects_path)
      else
        @categories = Category.pluck(:name)
        @tags = Tag.pluck(:title)
        @old_tags = params.require(:project)['tags'] || @project.tags.pluck(:title)
        flash[:alert] = 'validasyon başarısız'
        get_image_datas
        render :edit, status: 422
      end
    end

    def destroy
      if @project.destroy
        flash[:notice] = 'Kayıt başarıyla silindi'
        KredisService.clear_data('top_projects')
      else
        flash[:alert] = 'Kayıt silmede hata meydana geldi'
      end
      redirect_to(projects_path)
    end

    def upload_image
      image = params[:image]

      if image.nil?
        render json: { success: 0, error: 'No image found in request' }
        return
      end

      # Use Active Storage to attach the image without an associated article
      uploaded_image = ProjectImage.create!(image: image)

      # Generate a URL for the uploaded image
      stored_image_url = rails_blob_url(uploaded_image.image)

      render json: { success: 1, file: { url: stored_image_url } }
    rescue StandardError => e
      render json: { success: 0, error: e.message }
    end

    private

    def get_params(*arr)
      params.require(:project).permit(arr)
    end

    def get_image_datas
      return unless @project.image.persisted?

      @filename = @project.image.filename.to_s
      @file_size = @project.image.byte_size
      @image_url = rails_blob_url(@project.image)
    end

    def select_project
      if Project.exists?(id: params.permit(:id)[:id])
        @project = Project.find(params.permit![:id])
      else
        render file: "#{Rails.root}/public/404.html", status: 404
      end
    end
  end
end
