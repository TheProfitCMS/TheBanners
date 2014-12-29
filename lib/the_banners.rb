_root_ = File.expand_path('../../',  __FILE__)

require 'the_banners/config'
require 'the_banners/version'

module TheBanners
  class Engine < Rails::Engine
    config.autoload_paths << "#{config.root}/app/models/concerns/the_banners/**"
    config.autoload_paths << "#{config.root}/app/controllers/concerns/the_banners/**"
  end

end

require "#{_root_}/config/routes"
