exports.doS = function(a) {
  return function(s) {
    return function() {
      var newS = s.push(a);
      return {value0: a, value1: newS};
    }
  }
}
