(var vue (require "vue/dist/vue"))
(var app (require "./app.ls"))
(require "./styles/main.css")

(new vue (object el "#app" render (function(h) (h app))))
