module Pages
  class TagsController < ApplicationController
    before_action :select_tag, only: %i[show]

    def show
      puts params[:id]
    end

    private

    def select_tag
      @tag = Tag.find_by(title: decode_url(params[:id]))
    end
  end
end
