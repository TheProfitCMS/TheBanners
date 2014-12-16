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

    private

    def current_banner
      params[:id] ||= 1 #fixme
      @current_banner ||= BannerStorage.find_by_id params[:id].to_i
    end

  end
end
