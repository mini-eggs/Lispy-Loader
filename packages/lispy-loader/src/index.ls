(var ls (require "lispyscript/lib/ls.js"))

(set module.exports (function (content)
  (if this.cacheable
    (this.cacheable))
  (set this.value content)
  (ls._compile content "webpack.input" false false)))

(set module.exports.seperable true)
