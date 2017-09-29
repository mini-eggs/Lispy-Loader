(var ls (require "lispyscript/lib/ls.js"))

(set module.exports (function (content)
  (if this.cacheable
    (this.cacheable))
  (set this.value content)
  (try
    (ls._compile content "webpack.input" false false)
    (function (err) 
      (throw (new Error (+
        "\n\n -> Could not transpile LispyScript.\n\n -> "
        err
        "\n\n")))))))

(set module.exports.seperable true)
