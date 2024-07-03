module Pages
	class AboutmeController < ApplicationController
		def index
			@aboutme = Aboutme.first
		end
	end
end