class BannersController < ApplicationController
  # layout 'bootstrap_default'
  include TheBanners::Controller

  # Banner.for_location('top-800-150').published.first.try(:insert, banners_proxy_url)
end
