const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
    // ここから編集
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
}))

module.exports = environment
