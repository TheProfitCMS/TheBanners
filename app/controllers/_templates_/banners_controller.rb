class BannersController < ApplicationController
  # layout 'bootstrap_default'
  include TheBanners::Controller

  # Banner.insert_chunk("banner_slug", the_banners_proxy_url)
end
