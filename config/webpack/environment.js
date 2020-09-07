const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.append('ProvidePlugin-jQuery',
  new webpack.ProvidePlugin({
    jQuery: 'jquery',
    jquery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
environment.loaders.append("jquery", {
  test: require.resolve("jquery"),
  use: [
    {
      loader: "expose-loader",
      options: { exposes: ["$", "jQuery"] }
    },
  ],
});

module.exports = environment
