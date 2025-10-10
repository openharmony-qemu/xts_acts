export function testArrayFindJs0032() {
    const arr = [0, -0, 1];
    const result = arr.find((v) => Object.is(v, -0));
    return Object.is(result, -0);
}

export function testArrayFindJs0070() {
    const arr = Object.freeze([1, 2, 3]);
    const result = arr.find((x) => x === 4);
    return result;
}

export function testArrayFindJs0072() {
    const sym = Symbol("test");
    const arr = ["a", "b", "c"];
    const result = arr.find((x) => x === sym);
    return result;
}

export function testArrayFindJs0104() {
    const sym1 = Symbol("a");
    const sym2 = Symbol("b");
    const arr = [sym1, sym2];
    const result = arr.find((x) => x === sym2);
    return result === sym2;
}