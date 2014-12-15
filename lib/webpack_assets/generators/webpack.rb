require 'rails/generators'
module WebpackAssets
  class Webpack < Rails::Generators::Base

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
        puts "** update 'package.json' to include 'webpack' and 'jsx-loader' dependencies"
      end
    end

  end
end
