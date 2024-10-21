module Pages
  class TagsController < ApplicationController
    before_action :select_tag, only: %i[show]

    def show
      puts params[:id]
    end

    private

    def select_tag
      @tag = Tag.find_by_title(decode_url(params[:id]))
      return if @tag

      redirect_to(pages_articles_path)
    end
  end
end
