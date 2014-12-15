# The webpack task must run before assets:environment task.
# Otherwise Sprockets cannot find the files that webpack produces.
# credit where it's due: http://www.tomdooner.com/2014/05/26/webpack.html

Rake::Task['assets:precompile']
  .clear_prerequisites
  .enhance(['assets:compile_environment'])

namespace :assets do

  #In this task, set prerequisites for the assets:precompile task
  task :compile_environment => :webpack do
    Rake::Task['assets:environment'].invoke
  end

  desc 'Compile assets with webpack'
  task :webpack do
    sh "NODE_ENV=#{Rails.env} $(npm bin)/webpack"
  end

  # can you look up the file to clobber based on the webpack file?
  # "#{app.config.root}/#{app.config.}
  task :clobber do

    path = begin
            "#{Rails.root}/#{Rails.application.config.webpack_build_path}"
           rescue
            "#{Rails.root}/app/assets/javascripts/bundle.js"
           end
    rm_rf path
  end

  namespace :webpack do
    desc 'compile with webpack and watch for changes'
    task :watch do
      sh "NODE_ENV=#{Rails.env} $(npm bin)/webpack --config webpack.config.js --watch --devtool inline-source-map"
    end
  end

end
