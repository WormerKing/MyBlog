module Pages
	class CategoriesController < ApplicationController
		def index
			@categories = Category.all
		end

		def show
			@category = Category.find_by_name(params[:id])
		end
	end
end