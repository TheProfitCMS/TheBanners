class BaeneroidController < ApplicationController
  # layout 'bootstrap_default'
  include Baeneroid::Controller

  # before_action :set_banner_storage, only: [:show, :edit, :update, :destroy]

  # BannerStorage.insert_chunk("Banner Title", proxy_path)
end
