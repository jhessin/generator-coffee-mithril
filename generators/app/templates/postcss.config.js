const CSON = require('cson');
const { postCssPlugins } = CSON.load('./src/manifest.cson');

const isProd = process.env.NODE_ENV === 'production';
const isDev = !isProd;

module.exports = () => ({
  plugins: {
    ...postCssPlugins.common,
    ...(isDev ? postCssPlugins.dev : postCssPlugins.prod)
  }
});
