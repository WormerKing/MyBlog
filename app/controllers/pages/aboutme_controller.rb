module Pages
  class AboutmeController < ApplicationController
    def index
      @aboutme = KredisService.get_aboutme
      @email = KredisService.get_communication.email
    end
  end
end

