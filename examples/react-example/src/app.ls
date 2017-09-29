(var react (require "react"))
(var createClass (require "create-react-class"))
(var jsx react.createElement)

(set module.exports
  (createClass (object
    getInitialState (function () (object
      count 0))
    decrement (function ()
      (this.setState (function (state)
        (object count (- state.count 1)))))
    increment (function ()
      (this.setState (function (state)
        (object count (+ state.count 1)))))
    render (function()
      (jsx "div" null 
        (jsx "h1" (object className "header") "LispyScript demo app (with React!)")
        (jsx "button" (object onClick this.decrement) "decrement")
        (jsx "button" (object onClick this.increment) "increment")
        (jsx "div" (object className "count") (+ "Count: " this.state.count)))))))
