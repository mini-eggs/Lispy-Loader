;; Test promise
(var fetch (function () 
  (new Promise (function (resolve reject)
    (setTimeout (function ()
      (if (> (- (Math.random) 0.5) 0)
        (resolve (object message "Hello, World!"))
        (reject))) 2250)))))

;; Example component
(var app (object 
  data (function () (object
    count 0
    interval null
    loading true
    message "Loading."))
    
  mounted (function ()
    (var vm this)
    ;; Start message loader interval
    (set this.interval 
      (setInterval this.handleInterval 750))
    ;; Start example request
    (var request (fetch))
    (request.then (function (data)
      (set vm.loading false)
      (set vm.message data.message))
    (request.catch (function ()
      (set vm.loading false)
      (set vm.message "Something went wrong.")))))

  methods (object
    handleInterval (function ()
      (var vm this)
      (if this.loading
        ;; If we're still loading add to the loading message
        ((function ()
          (set vm.message (+ vm.message "."))))
        ;; We're done! Clear the setInterval
        ((function () 
          (clearInterval vm.interval)
          (set vm.interval null)))))
    increment (function ()
      (set this.count
        (+ this.count 1)))
    decrement (function ()
      (set this.count
        (- this.count 1))))

  template "
    <div>
      <h1 class='header'>LispyScript demo app (with Vue!)</h1>
      <h2>{{ message }}</h2>
      <p>This test \"request\" will fail 50% of the time.</p>
      <button @click='decrement'>decrement</button>
      <button @click='increment'>increment</button>
      <div class='count'>Count: {{ this.count }}</div>
    </div>"))

(set module.exports app)
