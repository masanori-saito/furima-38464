const { environment } = require('@rails/webpacker')

// // sass-loaderの設定を取得
// const sassLoader = environment.loaders.get('sass');
// const sassLoaderConfig = sassLoader.use.find(loader => loader.loader === 'sass-loader');

// // dart-sass (sassパッケージ) を使うように設定
// sassLoaderConfig.options = {
//   implementation: require('sass'),
//   webpackImporter: false,
// };

const sassLoader = environment.loaders.get('sass')
sassLoader.use.find(item => item.loader === 'sass-loader').options.implementation = require('sass')

module.exports = environment
