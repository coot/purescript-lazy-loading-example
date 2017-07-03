"use strict";

exports.clickFn = function(ev) {
  // one cannot use import:
  // FutureToken {tokenSpan = TokenPn 164 8 3, tokenLiteral = "import", tokenComment = [WhiteSpace (TokenPn 161 7 5) "\n  "]}
  // one cannot build a library function, since webpack is replacing
  // `../Click` with a chunkId.
  return function() {
    return new Promise(function(resolve, reject) {
      require.ensure(["../Click"], function(require) {
        var click = require("../Click")
        resolve(click)
      })})
  }
}
