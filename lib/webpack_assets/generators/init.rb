require 'rails/generators'

module WebpackAssets
  class Init < Rails::Generators::Base

    desc "create a default webpack.config.js file if one doesn't exist"

    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def create_webpack_file
      destination = 'webpack.config.js'
      if File.exist?(destination)
        puts "Skipping #{destination} because it already exists"
      else
        copy_file 'webpack.config.js', destination
        puts "** update the entry point in 'webpack.config.js' "
      end
    end

    def create_package_file
      destination = 'package.json'
      if File.exist?(destination)
        puts "Skipping #{destination} because it already exists"
        puts "** make sure 'package.json' includes 'webpack' and 'jsx-loader' dependencies"
      else
        template 'package.json', destination
        system "npm install"
      end
    end

    def add_config
      application "config.webpack_build_path = 'app/assets/javascripts/bundle.js'"
      application "# path or glob to webpack built assets"
    end

    private
    def app_name
      Rails.application.class.parent_name.underscore
    end

  end
end
