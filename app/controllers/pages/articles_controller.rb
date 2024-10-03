module Pages
  class ArticlesController < ApplicationController
    def index
      @articles = Article.all
    end

    def show
      @article = Article.find_by(title: decode_url(params[:id]))
      @string = decode_url(params[:id])
    end
  end
end

