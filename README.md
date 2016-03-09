# webpack_assets

adds a webpack build step into your rails `assets:precompile` rake task

## Installation

Add this line to your application's Gemfile:

    gem 'webpack_assets'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install webpack_assets

## Usage

`webpack_assets` assumes you have a webpack build with a `webpack.config.js` in
your rails project root. By default it also assumes your webpack build is
building a javascript bundle into `app/assets/javascripts/bundle.js`. If your
webpack config builds a file into a different location, or with a different
name, update your `config/application.rb` file:

````ruby
# config/application.rb
config.webpack_build_path = 'app/assets/javascripts/your-js-file.js'
````

For multiple files an array may be used:

````ruby
# config/application.rb
config.webpack_build_path = [
  'app/assets/javascripts/your-js-file1.js',
  'app/assets/javascripts/your-js-file2.js',
  'app/assets/javascripts/your-js-file3.js'
]
````

Including the gem will automatically inject the webpack build into the
precompilation of assets. To run your webpack build manually execute:

    bin/rake assets:webpack

To watch for changes from your webpack build files and compile per change, execute:

    bin/rake assets:webpack:watch


### Don't have a front end project yet?

`webpack_assets` assumes you have a webpack build. If you don't, never fear:

```bash
cd <your-rails-root>
bin/rails g webpack_assets:init #will build webpack.config.js, and package.json
npm install

```

Edit the entry point of the newly created `webpack.config.js` and you should be
on your way.



## Contributing

1. Fork it ( https://github.com/[my-github-username]/webpack_assets/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
