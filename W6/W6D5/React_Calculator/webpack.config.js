let path = require('path');

module.exports = {
  context: __dirname,
  entry: "./app.jsx",
  output: {
    path: path.resolve(__dirname),
    filename: "bundle.js",
  },
  devtool: 'source-maps',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  },
  module:{
    loaders: [
      {
        test: [/\.jsx?$/, /\.js?$/], // Specifies file types to transpile
        exclude: /node_modules/, // Leaves dependencies alone
        loader: 'babel-loader', // Sets Babel as the transpiler
        query: {
          presets: ['es2015', 'react'] // Tells Babel what syntaxes to translate
        }
      }
    ]
  },
  // resolveLoader: {
  //   path.resolve(__dirname, '../node_modules')
  // }
};
