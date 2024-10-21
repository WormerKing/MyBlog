class MainController < ApplicationController
  def index
    @aboutme = KredisService.get_aboutme
    @projects = KredisService.get_top_projects
    @articles = KredisService.get_top_articles
  end
end
