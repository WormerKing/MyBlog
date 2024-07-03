module Panel
	class AboutmeController < ApplicationController
		before_action :select_aboutme,only: %i[ show edit update ]
		def show
		end
		def edit
			#FIXME aboutme kısmında hata meydana geliyor
			@wormer = "deneme"
		end
		def update
			@param = params.require(:aboutme).permit(:body)["body"]
			puts "#" * 100
			if @aboutme.update(body:@param)
				redirect_to(panel_path)
			else
				puts "Hata meydana geldi"
				render :edit
			end
		end

		private
		def select_aboutme
			@aboutme = Aboutme.first
		end
	end
end