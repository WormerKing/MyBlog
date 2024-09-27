module Pages
	class AboutmeController < ApplicationController
		def index
			@aboutme = Aboutme.first
			@email = Communication.first.email
		end
	end
end