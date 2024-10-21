module Pages
  class CommunicationController < ApplicationController
    def index
      @communication = KredisService.get_communication
    end
  end
end
