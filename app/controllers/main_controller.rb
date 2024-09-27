class MainController < ApplicationController
	def index
		@aboutme = Aboutme.first
		@projects = Project.order(:created_at => :desc).limit(4).in_groups_of(2)
		@articles = Article.order(:created_at => :desc).limit(4).in_groups_of(2)
	end
end