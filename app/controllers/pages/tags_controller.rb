module Pages
	class TagsController < ApplicationController
		def index
			
		end

		def show

		end

		private
		def select_tag
			@tag = Params.find_by(name: params[:id])
		end
	end
end