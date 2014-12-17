#encoding: utf-8

module Baeneroid
  module Controller
    extend ActiveSupport::Concern

    def ping
      render text: 'Pong'
    end

    def proxy
      if current_banner
        current_banner.inc_view_count!

        if params[:click] == 'true'
          current_banner.inc_click_count!
          redirect_to current_banner.uri
        else
          render text: current_banner.html_code
        end
      else
        head(404, content_type: 'text/html')
      end
    end


    def index
      @banners = BannerStorage.all
    end

    def new
      @banner = BannerStorage.new
    end

    def edit
      @banner = current_banner
    end

    def create
      @banner = BannerStorage.new banner_storage_params

      if @banner.save
        redirect_to baeneroid_index_url, notice: 'Баннер сохранён.'
      else
        render action: 'new'
      end
    end

    def update
      @banner = current_banner

      if @banner.update_attributes banner_storage_params
        redirect_to baeneroid_index_url, notice: 'Баннер сохранён.'
      else
        render action: 'edit'
      end
    end

    # def destroy
    #   @banner_storage.destroy
    #   respond_to do |format|
    #     format.html { redirect_to banner_storages_url }
    #     format.json { head :no_content }
    #   end
    # end

    private

    def banner_storage_params
      params.require(:banner_storage).permit(:name, :html_code, :uri, :w, :h, :state)
    end


    def current_banner
      @current_banner ||= BannerStorage.find_by_id params[:id].to_i
    end

  end
end
