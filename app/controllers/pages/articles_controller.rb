module Pages
  class ArticlesController < ApplicationController
    before_action :find_article, only: %i[show]

    def index
      @articles = Article.all
    end

    def show
      IncrementService.add_count(@article)
    end

    private

    def find_article
      if Article.exists?(title: decode_url(params[:id]))
        @article = Article.find_by(title: decode_url(params[:id]))
      else
        redirect_to(pages_articles_path)
      end
    end
  end
end
