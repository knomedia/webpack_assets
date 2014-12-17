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
        copy_file 'package.json', destination
      end

    end

  end
end
