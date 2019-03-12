const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const HtmlWebpackPlugin = require('html-webpack-plugin');

const path = require('path');
const staticDir = path.join(__dirname, 'beluga', 'static');
const srcDir = path.join(staticDir, 'src');
const buildDir = path.join(__dirname, 'dist');

const config = {
  entry: {app: path.join(srcDir, 'js', 'App.jsx')},
  output: {
    path: buildDir,
    filename: 'bundle.js',
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: path.join(srcDir, 'index.html'),
      filename: path.join(buildDir, 'index.html'),
    }),
    new MiniCssExtractPlugin({
      filename: "style.css",
    })
  ],
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        loaders: [{
          loader: 'babel-loader',
          query: {
            presets: ['es2015', 'react']
          }
        }],
      },
      {
        test: /\.css$/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
          },
          "css-loader"
        ]
      },
      {
        test: /\.(png|jpg|gif)$/,
        use: [
          'file-loader',
        ],
      },
    ],
  },
  resolve: {
    extensions: ['.js', '.jsx', '.css'],
    modules: [
      path.join(__dirname, 'node_modules'),
      'node_modules'
    ],
  },
  node: {
    fs: 'empty'
  },
};

module.exports = config;