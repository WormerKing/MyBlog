module Panel
  class CommunicationController < ApplicationController
    before_action :select_communication, only: %w[index edit update]
    def index
      @communication = Communication.first
    end

    def edit; end

    def show
      redirect_to(edit_communication_path)
    end

    def update
      if @communication.update(params.require(:communication).permit!)
        flash[:notice] = 'İletişim kısmı başarıyla güncellendi'
        redirect_to(panel_path)
      else
        flash[:alert] = 'Validasyon başarısız'
        render :edit, status: 422
      end
    end

    private

    def select_communication
      @communication = Communication.first
    end
  end
end
