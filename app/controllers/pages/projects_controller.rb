module Pages
  class ProjectsController < ApplicationController
    before_action :find_project, only: %i[show]
    def index
      @projects = Project.all
    end

    def show
      IncrementService.add_count(@project)
      respond_to do |format|
      	format.html
      	format.json {render json: {image: {encoded: Base64.encode64(@project.image.download),type: @project.image.content_type}}}
      end
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
