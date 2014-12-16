class BaeneroidGenerator < Rails::Generators::NamedBase
  # source_root File.expand_path('../templates', __FILE__)

  # example: rails g baeneroid install

  def common_generator
    if name.to_s.downcase == 'install'
      cp_config
      cp_models
      cp_controllers
    else
      puts 'Try to use: rails g baeneroid install'
    end
  end

  private

  def root_path
    Baeneroid::Engine.root
  end

  def cp_config
    copy_file "#{ root_path }/config/initializers/baeneroid.rb",
    "config/initializers/the_comments.rb"
  end

  def cp_models
    _path = "#{ root_path }/app/models/_templates_"

    %w(baeneroid.rb).each do |file_name|
      copy_file "#{ _path }/#{ file_name }", "app/models/#{ file_name }"
    end
  end

  def cp_controllers
    _path = "#{ root_path }/app/controllers/_templates_"
    %w(baeneroid_controller.rb).each do |file_name|
      copy_file "#{ _path }/#{ file_name }", "app/controllers/#{ file_name }"
    end
  end
end
