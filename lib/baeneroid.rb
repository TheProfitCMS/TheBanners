_root_ = File.expand_path('../../',  __FILE__)

require 'baeneroid/config'
require 'baeneroid/version'

module Baeneroid
  class Engine < Rails::Engine
    config.autoload_paths << "#{config.root}/app/models/concerns/baeneroid/**"
    config.autoload_paths << "#{config.root}/app/controllers/concerns/baeneroid/**"
  end

end

require "#{_root_}/config/routes"
