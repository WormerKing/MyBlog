module Panel
	class AboutmeController < ApplicationController
		before_action :select_aboutme,only: %i[ show edit update ]
		def show

		end
		def edit

		end
		def update
			@param = params.require(:aboutme).permit(:body)["body"]
			if @aboutme.update(body:@param)
				flash[:notice] = "Hakkımda kısmı başarıyla güncellendi."
				redirect_to(panel_path)
			else
				render :edit
			end
		end

		private
		def select_aboutme
			@aboutme = Aboutme.first
		end
	end
end