(var react (require "react"))
(var reactDOM (require "react-dom"))
(var app (require "./app.ls"))
(require "./styles/main.css")

(reactDOM.render
  (react.createElement app)
  (document.getElementById "app"))