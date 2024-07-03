module Pages
	class CommunicationController < ApplicationController
		def index
			@communication = Communication.first
		end
	end
end