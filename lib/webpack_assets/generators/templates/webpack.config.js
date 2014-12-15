var webpack = require('webpack');

module.exports = {
  entry: "./client_app/app/routes.js",
  output: {
    filename: "./app/assets/javascripts/bundle.js"
  },
  module: {
    loaders: [
      {test: /\.js$/, loader: 'jsx-loader'}
    ]
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {'NODE_ENV': JSON.stringify(process.env.NODE_ENV)}
    })
  ]
};
