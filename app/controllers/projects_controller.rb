class ProjectsController < ApplicationController
	def index
		@admins = Admin.all
	end
end
