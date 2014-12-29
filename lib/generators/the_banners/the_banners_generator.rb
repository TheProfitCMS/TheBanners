class TheBannersGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  # example: rails g the_banners install

  def common_generator
    if name.to_s.downcase == 'install'
      cp_config
      cp_models
      cp_controllers
    else
      puts 'Try to use: rails g the_banners install'
    end
  end

  private

  def root_path
    TheBanners::Engine.root
  end

  def cp_config
    copy_file "#{ root_path }/config/initializers/the_banners.rb",
    "config/initializers/the_banners.rb"
  end

  def cp_models
    _path = "#{ root_path }/app/models/_templates_"

    %w(banner.rb).each do |file_name|
      copy_file "#{ _path }/#{ file_name }", "app/models/#{ file_name }"
    end
  end

  def cp_controllers
    _path = "#{ root_path }/app/controllers/_templates_"

    %w(the_banners_controller.rb).each do |file_name|
      copy_file "#{ _path }/#{ file_name }", "app/controllers/#{ file_name }"
    end
  end

end
