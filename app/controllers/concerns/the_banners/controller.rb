#encoding: utf-8

module TheBanners
  module Controller
    extend ActiveSupport::Concern

    def proxy
      current_banner.inc_view_count!
      render text: iframe_content(current_banner)
    end

    def click
      current_banner.inc_click_count!
      redirect_to current_banner.uri
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
        redirect_to banners_url, notice: 'Баннер сохранён.'
      else
        render action: 'new'
      end
    end

    def update
      @banner = current_banner

      if @banner.update_attributes banner_params
        redirect_to banners_url, notice: 'Баннер обновлён.'
      else
        render action: 'edit'
      end
    end

    def destroy
      current_banner.destroy
      redirect_to banners_url, notice: 'Баннер удалён.'
    end

    private

    def iframe_content banner
      return %Q(
        <html>
          <body style='margin:0;padding:0'>
            #{ banner.html_code }
          </body>
        </html>
      ) if banner.html_code.present?

      return %Q(
        <html>
          <body style='margin:0;padding:0'>
            <img src="#{ banner.image.url }" alt="#{ banner.name }"/>
          </body>
        </html>
      ) if banner.image.present?

      "<center>Nothing here</center>"
    end

    def banner_params
      params.require(:banner).permit(:name, :location, :html_code, :uri, :w, :h, :state, :image)
    end

    def current_banner
      unless @current_banner ||= Banner.where(id: params[:id]).first
        return render(text: "Banner not found", status: 404)
      end

      @current_banner
    end

  end
end
