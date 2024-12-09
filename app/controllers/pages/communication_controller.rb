module Pages
  class CommunicationController < ApplicationController
    def index
      @aboutme = KredisService.get_aboutme
      @communication = KredisService.get_communication
    end
  end
end
