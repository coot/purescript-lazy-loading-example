"use strict";

exports.onClick = function(ev) {
  require.ensure(["../Click"], function(require) {
    var click = require("../Click")
    click.onClick(ev)
  })
}
