module Panel
  class ArticlesController < ApplicationController
    before_action :select_article, only: %w[edit update destroy]

    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
      @categories = Category.pluck(:name)
      @tags = Tag.pluck(:title)
    end

    def create
      @article = Article.new(get_params(:title, :header, :content, :image))

      @article.category = Category.find_by_name(get_params(:category)[:category])

      @article.tags = params.require(:article).permit!['tags'].delete_if do |tag|
        !Tag.exists?(title: tag)
      end.map { |tag| Tag.find_by_title(tag) }

      if @article.invalid?
        flash[:alert] = 'Validasyon başarısız!'
        @categories = Category.pluck(:name)
        @tags = Tag.pluck(:title)

        render :new, status: 422
      elsif @article.save
        @article.save_article_images
        flash[:notice] = 'yazı başarıyla eklendi'
        redirect_to(articles_path)
      else
        flash[:error] = 'Validasyon başarılı ama kayıt teknik bir sorun nedeniyle eklenemedi!'
        render :new, status: 422
      end
    end

    def edit
      @categories = Category.pluck(:name)
      @tags = Tag.pluck(:title)
    end

    def update
      @tags = params.require(:article).permit!['tags'].delete_if do |tag|
        !Tag.exists?(title: tag)
      end.map { |tag| Tag.find_by_title(tag) }
      if Category.exists?(name: get_params(:category)[:category])
        @category = Category.find_by_name(get_params(:category)[:category])
      end

      if @article.update(get_params(:name, :header, :content,
                                    :image)) && @article.update(category: @category, tags: @tags)
        @article.save_article_images
        flash[:notice] = "Kayıt #{@article.id} başarıyla güncellendi"
        redirect_to(articles_path)
      else
        flash[:alert] = 'Validasyon başarısız!'
        @categories = Category.pluck(:name)
        @tags = Tag.pluck(:title)
        render :edit, status: 422
      end
    end

    def destroy
      if @article.destroy
        flash[:notice] = 'Kayıt başarıyla silindi'
      else
        flash[:alert] = 'Kayıt silmede hata meydana geldi'
      end
      redirect_to(articles_path)
    end

    def upload_image
      image = params[:image]

      if image.nil?
        render json: { success: 0, error: 'No image found in request' }
        return
      end

      # Use Active Storage to attach the image without an associated article
      uploaded_image = ArticleImage.create!(image: image)

      # Generate a URL for the uploaded image
      stored_image_url = rails_blob_url(uploaded_image.image)

      render json: { success: 1, file: { url: stored_image_url } }
    rescue StandardError => e
      render json: { success: 0, error: e.message }
    end

    private

    def get_params(*arr)
      puts '#' * 100
      puts params.require(:article)
      puts '#' * 100
      params.require(:article).permit(arr)
    end

    def select_article
      if Article.exists?(params[:id])
        @article = Article.find(params[:id])
      else
        render file: "#{Rails.root}/public/404.html", status: 404
      end
    end
  end
end

