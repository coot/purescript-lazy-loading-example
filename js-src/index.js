var c = require("./common.js")
c.log("index.js: hello");

document.addEventListener('click', function(ev) {
  require.ensure(["./click"], function(require) {
    var click = require("./click")
    click.click("click chunk")
  })
})
