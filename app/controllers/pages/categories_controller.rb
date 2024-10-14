module Pages
  class CategoriesController < ApplicationController
    before_action :find_category, only: %i[show]

    def show; end

    private

    def find_category
      if Category.exists?(name: decode_url(params[:id]))
        @category = Category.find_by_name(decode_url(params[:id]))
      else
        redirect_to(root_path)
      end
    end
  end
end
