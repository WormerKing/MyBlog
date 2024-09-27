module Pages
	class ProjectsController < ApplicationController
		def index
			@projects = Project.all
		end

		def show
			@project = Project.find_by(title: params[:id].gsub("+"," "))
		end
	end
end