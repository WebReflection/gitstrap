//remove:
var main = require('../build/main.node.js');
//:remove

wru.test([
  {
    name: "main",
    test: function () {
      wru.assert(typeof main == "object");
    }
  }
]);