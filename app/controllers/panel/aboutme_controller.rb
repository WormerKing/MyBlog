module Panel
  class AboutmeController < ApplicationController
    before_action :select_aboutme, only: %i[show edit update]
    # after_action :send_message, only: %i[update]
    def show; end

    def edit
        if @aboutme.profile_photo.persisted?
            @filename = @aboutme.profile_photo.filename.to_s
            @file_size = @aboutme.profile_photo.byte_size
            @image_url = rails_blob_url(@aboutme.profile_photo)
        end
    end

    def update
      if @aboutme.update(get_params)
        redirect_to(panel_path)
      else
        render :edit
      end
    end

    private

    def select_aboutme
      @aboutme = Aboutme.first
    end

    def get_params
      params.require(:aboutme).permit(:body, :profile_photo)
    end
  end
end
