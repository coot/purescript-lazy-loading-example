"use strict"

exports.then_ = function(fn) {
  return function(promise) {
    return promise.then(fn)
  }
}
