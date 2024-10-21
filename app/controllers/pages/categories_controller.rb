module Pages
  class CategoriesController < ApplicationController
    before_action :find_category, only: %i[show]

    def show; end

    private

    def find_category
      @category = Category.find_by_name(decode_url(params[:id]))

      return @category if @category

      redirect_to(pages_projects_path)
    end
  end
end
