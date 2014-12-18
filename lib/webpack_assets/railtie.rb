module WebpackAssets
  class Railtie <  Rails::Railtie

    rake_tasks do
      load 'webpack_assets/tasks/webpack.rake'
    end

    generators do
     require 'webpack_assets/generators/init.rb'
    end

  end
end
