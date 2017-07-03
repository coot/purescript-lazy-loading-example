"use strict"
const path = require("path")
const webpack = require("webpack")
const HtmlWebpackPlugin = require("html-webpack-plugin")

const distDir = path.resolve(__dirname, "dist")
const publicPath = "/"

module.exports =
  { devtool: "source-map",
    entry:
      { index:  "./output/Main/index.js" },
    output: 
      { path: distDir,
        filename: '[name].bundle.js',
      },
    plugins: 
      [ new HtmlWebpackPlugin({
          title: "App",
        }),
        new webpack.optimize.CommonsChunkPlugin({
          name: "commons",
          filename: "commons.js",
        })
      ],
  }
