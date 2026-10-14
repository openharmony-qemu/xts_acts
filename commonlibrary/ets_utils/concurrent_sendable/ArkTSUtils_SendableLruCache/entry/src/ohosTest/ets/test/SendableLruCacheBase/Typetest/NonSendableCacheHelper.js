// Prebuilt non-sendable value pools for SendableLruCache tests.
// Objects like Function/Map/Set/Date/RegExp are not Sendable. These
// values are built in JS and returned as-is; the .ets side feeds them
// to a SendableLruCache<number, number> (relying on dynamic typing) to
// exercise the runtime sendable check.

class NonSendableObj {
  constructor(id) {
    this.id = id;
  }
}

function plainFunction() {
  return 1;
}

function buildNonSendableValues() {
  return [
    new NonSendableObj(1),
    plainFunction,
    new Map(),
    new Set(),
    new Date(),
    /abc/,
  ];
}

function makeNonSendableObj(id) {
  return new NonSendableObj(id);
}

function toNumber(input) {
  return input;
}

module.exports = {
  buildNonSendableValues: buildNonSendableValues,
  makeNonSendableObj: makeNonSendableObj,
  plainFunction: plainFunction,
  toNumber: toNumber,
};
