class BaeneroidController < ApplicationController
  include Baeneroid::Controller

  # BannerStorage.insert_chunk("Banner Title", proxy_path)

  # require 'pry'
  
  def ping
    # binding.pry

    render text: BannerStorage.insert_chunk("Banner Title", proxy_path)
  end
end
