# Lispy Loader
A LispyScript Webpack Loader

#### Install
```bash
$ npm install lispy-loader --save-dev
```

#### LispyScript example usage
```lisp
(var http (require "http"))
(var server
  (http.createServer
    (function (request response)
      (response.writeHead 200 {'Content-Type': 'text/plain'})
      (response.end "Hello World\n"))))
(server.listen 1337 "127.0.0.1")
(console.log "Server running at http://127.0.0.1:1337/")
```

#### Webpack config excerpt
```javascript
var path = require("path");
var webpack = require("webpack");

module.exports = {
  entry: "./src/main.ls",
  output: {
    path: path.resolve(__dirname, "./dist"),
    publicPath: "/dist/",
    filename: "build.js"
  },
  module: {
    rules: [
      {
        test: /\.ls$/,
        loader: "lispy-loader"
      },
      {
        test: /\.js$/,
        loader: "babel-loader",
        exclude: /node_modules/
      },
      {
        test: /\.css$/,
        use: ["style-loader", "css-loader"]
      },
      {
        test: /\.(png|jpg|gif|svg)$/,
        loader: "file-loader",
        options: {
          name: "[name].[ext]?[hash]"
        }
      }
    ]
  }
};
```