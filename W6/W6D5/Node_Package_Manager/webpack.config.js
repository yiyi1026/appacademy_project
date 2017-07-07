let path = require('path');

module.exports = {
  // context: __dirname,
  entry: "./index.jsx",
  output: {
    // path: path.resolve(__dirname),
    filename: "./bundle.js",
  },
  module:{
    loaders: [
      {
        test: [/\.jsx?$/], // Specifies file types to transpile
        exclude: /(node_modules)/, // Leaves dependencies alone
        loader: 'babel-loader', // Sets Babel as the transpiler
        query: {
          presets: ['es2015', 'react'] // Tells Babel what syntaxes to translate
        }
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  }
};
