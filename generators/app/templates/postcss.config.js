const CSON = require('cson');
const manifest = CSON.load('./src/manifest.cson');

module.exports = manifest.postCssConfig;
