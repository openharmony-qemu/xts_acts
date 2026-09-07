// Prebuilt non-sendable values for ConcatArray tests.
// Values like Date/Map/Set/RegExp/functions/plain arrays are not Sendable.
// They are built here in JS and returned as-is; the .ets side feeds them
// to a collections.Array<number> (relying on dynamic typing) to exercise
// the runtime sendable check at construction: the check rejects the
// non-sendable element and the test expects that construction throws.

function toNumber(input) {
  return input;
}

module.exports = {
  toNumber: toNumber,
};
