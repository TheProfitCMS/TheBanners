module Baeneroid
  module Controller
    extend ActiveSupport::Concern

    before_filter { params[:id] ||= 1 } # FIXME: remove
    before_filter { @banner = BannerStorage.find params[:id].to_i }

    def ping
      render text: 'Pong'
    end

    def proxy
      @banner.inc_view_count!

      if @banner
        if params[:click]
          @banner.inc_click_count!
          redirect_to @banner.uri
        else
          render text: @banner.html_code
        end
      else
        render nothing: true
      end

    end

  end
end
