module TheBanners
  def self.configure(&block)
    yield @config ||= TheBanners::Configuration.new
  end

  def self.config
    @config
  end

  class Configuration
    include ActiveSupport::Configurable

    config_accessor :images_path, :images_url
  end

end
