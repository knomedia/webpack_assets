module WebpackAssets
  class Railtie <  Rails::Railtie

    rake_tasks do
      load 'webpack_assets/tasks/webpack.rake'
    end

    generators do
     require 'webpack_assets/generators/webpack.rb'
    end

  end
end
