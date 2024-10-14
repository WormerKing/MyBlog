module Pages
  class ProjectsController < ApplicationController
    before_action :find_project, only: %i[show]
    def index
      @projects = Project.all
    end

    def show
      IncrementService.add_count(@project)
    end

    private

    def find_project
      if Project.exists?(title: decode_url(params[:id]))
        @project = Project.find_by(title: decode_url(params[:id]))
      else
        redirect_to(pages_projects_path)
      end
    end
  end
end

