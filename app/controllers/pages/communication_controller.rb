module Pages
  include Rails.application.routes.url_helpers

  class CommunicationController < ApplicationController
    def index
      @aboutme = KredisService.get_aboutme('json')
      @communication = KredisService.get_communication
    end
  end
end
