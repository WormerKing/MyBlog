class ArticlesController < ApplicationController
	before_action :redirect_if_unsigned,except: %i[ index ]
	before_action :select_article, only: %w[ edit update destroy ]

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
		@categories = Category.pluck(:name)
		@tags = Tag.pluck(:title)
	end

	def create
		@article = Article.new(get_params(:title,:header,:body))
		@article.category = Category.find_by_name(get_params(:category)[:category])
		@article.tags = params.require(:article).permit!["tags"].delete_if {|tag| !Tag.exists?(title:tag)}.map {|tag| Tag.find_by_title(tag)}

		if @article.invalid?
			flash[:alert] = "Validasyon başarısız!"
			@categories = Category.pluck(:name)
			@tags = Tag.pluck(:title)
			
			render :new,status: 422
		else
			@article.save
			flash[:notice] = "yazı başarıyla eklendi"
			redirect_to(articles_path)
		end
	end

	def edit
		@categories = Category.pluck(:name)
		@tags = Tag.pluck(:title)
	end

	def update
		@tags = params.require(:article).permit!["tags"].delete_if {|tag| !Tag.exists?(title:tag)}.map {|tag| Tag.find_by_title(tag)}
		@category = Category.find_by_name(get_params(:category)[:category]) if Category.exists?(name:get_params(:category)[:category])

		if @article.update(get_params(:name,:header,:body)) && @article.update(category:@category,tags:@tags)
			flash[:notice] = "Kayıt #{@article.id} başarıyla güncellendi"
			redirect_to(articles_path)
		else
			flash[:alert] = "Validasyon başarısız!"
			@categories = Category.pluck(:name)
			@tags = Tag.pluck(:title)
			render :edit, status: 422
		end
	end

	def destroy
		if @article.destroy
			flash[:notice] = "Kayıt başarıyla silindi"
		else
			flash[:alert] = "Kayıt silmede hata meydana geldi"
		end
		redirect_to(articles_path)
	end

	private
	def get_params(*arr)
		params.require(:article).permit(arr)
	end

	def select_article
		if Article.exists?(params[:id])
			@article = Article.find(params[:id])
		else
			render :file => "#{Rails.root}/public/404.html",  :status => 404
		end
	end
end
