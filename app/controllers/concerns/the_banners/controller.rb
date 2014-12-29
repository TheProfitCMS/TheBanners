#encoding: utf-8

module TheBanners
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
          render text: current_banner.iframe_content
        end
      else
        head(404, content_type: 'text/html')
      end
    end


    def index
      @banners = Banner.all
    end

    def new
      @banner = Banner.new
    end

    def edit
      @banner = current_banner
    end

    def create
      @banner = Banner.new banner_params

      if @banner.save
        redirect_to banners_index_url, notice: 'Баннер сохранён.'
      else
        render action: 'new'
      end
    end

    def update
      @banner = current_banner

      if @banner.update_attributes banner_params
        redirect_to banners_index_url, notice: 'Баннер обновлён.'
      else
        render action: 'edit'
      end
    end

    def destroy
      current_banner.destroy
      redirect_to banners_index_url, notice: 'Баннер удалён.'
    end

    private

    def banner_params
      params.require(:banner).permit(:name, :html_code, :uri, :w, :h, :state, :image)
    end

    def current_banner
      @current_banner ||= Banner.find_by_id params[:id].to_i
    end

  end
end
