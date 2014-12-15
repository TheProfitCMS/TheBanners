module Baeneroid
  def self.configure(&block)
    yield @config ||= Baeneroid::Configuration.new
  end

  def self.config
    @config
  end

  class Configuration
    include ActiveSupport::Configurable

    # config_accessor :test_accessor
  end

  # configure do |config|
  #   config.test_accessor = true
  # end

end
