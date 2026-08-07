/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


function createEntriesIterator(data) {
    let index = 0;
    function next() {
        if (index < data.length) {
            return { value: data[index++], done: false };
        }
        return { done: true };
    }
    return { next };
}


export function fromEntriesBasic() {
    const entries = [["name", "张三"], ["age", 25]];
    const obj = Object.fromEntries(entries);
    return { name: obj["name"], age: obj["age"] };
}

export function fromEntriesMapToObj() {
    const map = new Map([["foo", "bar"], ["baz", 42]]);
    const obj = Object.fromEntries(map);
    return { foo: obj["foo"], baz: obj["baz"] };
}

export function fromEntriesArrayToObj() {
    const arr = [["0", "a"], ["1", "b"], ["2", "c"]];
    const obj = Object.fromEntries(arr);
    return { k0: obj["0"], k1: obj["1"], k2: obj["2"] };
}

export function fromEntriesReverseOfEntries() {
    const obj1 = { a: 1, b: 2, c: 3 };
    const entries = Object.entries(obj1);
    const obj2 = Object.fromEntries(entries);
    return { a: obj2.a, b: obj2.b, c: obj2.c };
}

export function fromEntriesMapEntryValues() {
    const object1 = { a: 1, b: 2, c: 3 };
    const object2 = Object.fromEntries(
        Object.entries(object1).map(([key, val]) => [key, val * 2])
    );
    return { a: object2.a, b: object2.b, c: object2.c };
}

export function fromEntriesEmptyArray() {
    const obj = Object.fromEntries([]);
    return { keys: Object.keys(obj).length, isEmpty: JSON.stringify(obj) === '{}' };
}

export function fromEntriesEmptyMap() {
    const map = new Map();
    const obj = Object.fromEntries(map);
    return { keys: Object.keys(obj).length, isEmpty: JSON.stringify(obj) === '{}' };
}


export function fromEntriesStandard2DArray() {
    const arr = [["key1", "value1"], ["key2", "value2"]];
    const obj = Object.fromEntries(arr);
    return { key1: obj["key1"], key2: obj["key2"] };
}

export function fromEntriesArrayWithExtraElements() {
    const arr = [["key", "value", "extra1", "extra2"]];
    const obj = Object.fromEntries(arr);
    return { value: obj["key"], keyCount: Object.keys(obj).length };
}

export function fromEntriesArrayWithSingleElement() {
    const arr = [["key"]];
    const obj = Object.fromEntries(arr);
    return { value: obj["key"], hasKey: "key" in obj };
}

export function fromEntriesPlainMap() {
    const map = new Map([["a", 1], ["b", 2]]);
    const obj = Object.fromEntries(map);
    return { a: obj["a"], b: obj["b"] };
}

export function fromEntriesMapWithSymbolKeys() {
    const sym = Symbol("key");
    const map = new Map([[sym, "value"], ["normal", 123]]);
    const obj = Object.fromEntries(map);
    return { normal: obj["normal"], symVal: obj[sym] };
}

export function fromEntriesSetAsIterable() {
    try {
        const set = new Set([["a", 1], ["b", 2]]);
        const obj = Object.fromEntries(set);
        return { a: obj["a"], b: obj["b"] };
    } catch (e) {
        return {hasException: true};
    }
}

export function fromEntriesCustomIterator() {
    const data = [["x", 10], ["y", 20]];
    const iterable = {
        [Symbol.iterator]() {
            return createEntriesIterator(data);
        }
    };
    const obj = Object.fromEntries(iterable);
    return { x: obj["x"], y: obj["y"] };
}

export function fromEntriesGeneratorIterator() {
    function* gen() {
        yield ["a", 1];
        yield ["b", 2];
    }
    const obj = Object.fromEntries(gen());
    return { a: obj["a"], b: obj["b"] };
}

export function fromEntriesTypedArrayAsEntries() {
    const typedArr = new Int8Array([72, 101, 108, 108, 111]);
    const entries = Array.from(typedArr).map((v, i) => [i.toString(), v]);
    const obj = Object.fromEntries(entries);
    return { k0: obj["0"], k1: obj["1"], k4: obj["4"] };
}


export function fromEntriesStringKeys() {
    const entries = [["name", "张三"], ["age", "25"]];
    const obj = Object.fromEntries(entries);
    return { name: obj["name"], age: obj["age"] };
}

export function fromEntriesEmptyStringKey() {
    const obj = Object.fromEntries([["", "empty"]]);
    return { val: obj[""], hasKey: "" in obj };
}

export function fromEntriesSpecialCharKeys() {
    const entries = [
        ["key-with-dash", 1],
        ["key.with.dot", 2],
        ["key with space", 3],
        ["key'quote", 4],
        ['key"double', 5]
    ];
    const obj = Object.fromEntries(entries);
    return { dash: obj["key-with-dash"], dot: obj["key.with.dot"], space: obj["key with space"] };
}

export function fromEntriesUnicodeKeys() {
    const entries = [
        ["姓名", "张三"],
        ["年龄", 25],
        ["emoji🎉", "celebration"],
        ["日本語", "Japanese"]
    ];
    const obj = Object.fromEntries(entries);
    return { name: obj["姓名"], emoji: obj["emoji🎉"], jp: obj["日本語"] };
}

export function fromEntriesNumericStringKeys() {
    const entries = [["0", "zero"], ["1", "one"], ["999", "nine-nine-nine"]];
    const obj = Object.fromEntries(entries);
    return { strKey: obj["0"], numKey: obj[0] };
}

export function fromEntriesSymbolKey() {
    const sym = Symbol("description");
    const obj = Object.fromEntries([[sym, "symbol-value"]]);
    return { val: obj[sym], isSymbol: typeof sym === 'symbol' };
}

export function fromEntriesSymbolForKey() {
    const sym = Symbol.for("global-key");
    const obj = Object.fromEntries([[sym, "global-symbol-value"]]);
    return { val: obj[Symbol.for("global-key")] };
}

export function fromEntriesMixedSymbolStringKeys() {
    const sym1 = Symbol("s1");
    const sym2 = Symbol("s2");
    const obj = Object.fromEntries([
        ["string-key", "value1"],
        [sym1, "value2"],
        [sym2, "value3"]
    ]);
    return { stringVal: obj["string-key"], sym1Val: obj[sym1], sym2Val: obj[sym2] };
}

export function fromEntriesIntegerKeys() {
    const obj = Object.fromEntries([[0, "zero"], [1, "one"], [100, "hundred"]]);
    return { strAccess: obj["0"], numAccess: obj[0] };
}

export function fromEntriesFloatKeys() {
    const obj = Object.fromEntries([[3.14, "pi"], [2.5, "half"]]);
    return { pi: obj["3.14"], half: obj["2.5"] };
}

export function fromEntriesSpecialNumericKeys() {
    const obj = Object.fromEntries([
        [NaN, "not-a-number"],
        [Infinity, "positive-infinity"],
        [-Infinity, "negative-infinity"]
    ]);
    return { nan: obj["NaN"], inf: obj["Infinity"], negInf: obj["-Infinity"] };
}

export function fromEntriesBooleanKeys() {
    const obj = Object.fromEntries([[true, "yes"], [false, "no"]]);
    return { trueVal: obj["true"], falseVal: obj["false"] };
}

export function fromEntriesNullKey() {
    const obj = Object.fromEntries([[null, "null-value"]]);
    return { val: obj["null"] };
}

export function fromEntriesUndefinedKey() {
    const obj = Object.fromEntries([[undefined, "undefined-value"]]);
    return { val: obj["undefined"] };
}

export function fromEntriesObjectKey() {
    const keyObj = { a: 1 };
    const obj = Object.fromEntries([[keyObj, "object-key-value"]]);
    return { val: obj["[object Object]"] };
}


export function fromEntriesFunctionKey() {
    function myFunc() {}
    const obj = Object.fromEntries([[myFunc, "function-value"]]);
    const keys = Object.keys(obj);
    return { hasStringKey: keys.length > 0, val: obj[keys[0]] };
}


export function fromEntriesStringValues() {
    const obj = Object.fromEntries([
        ["normal", "hello"],
        ["empty", ""],
        ["special", "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"],
        ["chinese", "中文测试"],
        ["emoji", "🎉🎊🎁"]
    ]);
    return { normal: obj["normal"], empty: obj["empty"], emoji: obj["emoji"] };
}

export function fromEntriesNumberValues() {
    const obj = Object.fromEntries([
        ["integer", 42],
        ["negative", -100],
        ["zero", 0],
        ["float", 3.14159],
        ["max_value", Number.MAX_VALUE],
        ["infinity", Infinity],
        ["nan", NaN],
        ["hex", 0xFF],
        ["epsilon", Number.EPSILON],
        ["max_safe", Number.MAX_SAFE_INTEGER]
    ]);
    return { integer: obj["integer"], zero: obj["zero"], isNan: Number.isNaN(obj["nan"]),
        isMaxVal: obj["max_value"] === Number.MAX_VALUE };
}

export function fromEntriesBooleanValues() {
    const obj = Object.fromEntries([
        ["true_val", true],
        ["false_val", false]
    ]);
    return { trueVal: obj["true_val"], falseVal: obj["false_val"] };
}

export function fromEntriesNullValue() {
    const obj = Object.fromEntries([["null_key", null]]);
    return { val: obj["null_key"], hasKey: "null_key" in obj };
}

export function fromEntriesUndefinedValue() {
    const obj = Object.fromEntries([["undefined_key", undefined]]);
    return { val: obj["undefined_key"], hasKey: "undefined_key" in obj };
}

export function fromEntriesBigIntValues() {
    const obj = Object.fromEntries([
        ["bigint", 9007199254740991n],
        ["bigint_hex", 0xdecafafecacefaden],
        ["bigint_octal", 0o777n],
        ["bigint_binary", 0b101010n]
    ]);
    return { bigint: obj["bigint"], type: typeof obj["bigint"] };
}

export function fromEntriesLargeBigIntValues() {
    const obj = Object.fromEntries([
        ["max_bigint", 18446744073709551615n],
        ["neg_bigint", -9223372036854775808n]
    ]);
    return { maxBigint: obj["max_bigint"], negBigint: obj["neg_bigint"] };
}

export function fromEntriesSymbolValue() {
    const sym = Symbol("value-symbol");
    const obj = Object.fromEntries([["symbol_val", sym]]);
    return { equals: obj["symbol_val"] === sym, type: typeof obj["symbol_val"] };
}

export function fromEntriesObjectValue() {
    const obj = Object.fromEntries([
        ["nested_obj", { a: 1, b: 2 }],
        ["empty_obj", {}]
    ]);
    return { a: obj["nested_obj"].a, b: obj["nested_obj"].b, isEmpty: Object.keys(obj["empty_obj"]).length === 0 };
}

export function fromEntriesNestedObjectValue() {
    const obj = Object.fromEntries([
        ["deep", { level1: { level2: { level3: { value: "deep" } } } }]
    ]);
    return { value: obj["deep"].level1.level2.level3.value };
}

export function fromEntriesObjectWithSymbolKeyValue() {
    const sym = Symbol("obj-key");
    const obj = Object.fromEntries([
        ["sym_obj", { [sym]: "symbol-prop", normal: "normal-prop" }]
    ]);
    return { symProp: obj["sym_obj"][sym], normalProp: obj["sym_obj"].normal };
}

export function fromEntriesObjectWithFunctionValue() {
    const obj = Object.fromEntries([
        ["func_obj", { method: function() { return "hello"; }, prop: 123 }]
    ]);
    return { methodResult: obj["func_obj"].method(), propVal: obj["func_obj"].prop };
}

export function fromEntriesFrozenObjectValue() {
    const frozen = Object.freeze({ a: 1 });
    const obj = Object.fromEntries([["frozen", frozen]]);
    return { isFrozen: Object.isFrozen(obj["frozen"]) };
}

export function fromEntriesSealedObjectValue() {
    const sealed = Object.seal({ a: 1 });
    const obj = Object.fromEntries([["sealed", sealed]]);
    return { isSealed: Object.isSealed(obj["sealed"]) };
}

export function fromEntriesNonExtensibleObjectValue() {
    const nonExt = Object.preventExtensions({ a: 1 });
    const obj = Object.fromEntries([["nonExt", nonExt]]);
    return { isExtensible: Object.isExtensible(obj["nonExt"]) };
}

export function fromEntriesArrayValue() {
    const obj = Object.fromEntries([
        ["array", [1, 2, 3, 4, 5]],
        ["empty_arr", []],
        ["mixed_arr", [1, "two", { three: 3 }, [4]]]
    ]);
    return { len: obj["array"].length, first: obj["array"][0],
        emptyLen: obj["empty_arr"].length, mixedLen: obj["mixed_arr"].length };
}

export function fromEntriesArrayWithSpecialValues() {
    const obj = Object.fromEntries([
        ["special_arr", [null, undefined, NaN, Infinity, -Infinity]]
    ]);
    const arr = obj["special_arr"];
    return { hasNull: arr[0] === null, hasUndef: arr[1] === undefined,
        hasNaN: Number.isNaN(arr[2]), hasInf: arr[3] === Infinity };
}

export function fromEntriesTypedArrayValues() {
    const obj = Object.fromEntries([
        ["int8", new Int8Array([-128, 0, 127])],
        ["uint8", new Uint8Array([0, 128, 255])],
        ["int16", new Int16Array([-32768, 0, 32767])],
        ["float32", new Float32Array([3.14, -3.14, 0])],
        ["float64", new Float64Array([3.141592653589793, -3.141592653589793])]
    ]);
    const float32Val = obj["float32"][0];
    return { int8_0: obj["int8"][0], uint8_2: obj["uint8"][2],
        int16_0: obj["int16"][0], float32_0: parseFloat(float32Val.toFixed(2)) };
}

export function fromEntriesMapAsValue() {
    const map = new Map([["k1", "v1"], ["k2", { nested: "obj" }]]);
    const obj = Object.fromEntries([["map_val", map]]);
    return { getK1: obj["map_val"].get("k1"), hasK2: obj["map_val"].has("k2") };
}

export function fromEntriesSetAsValue() {
    const set = new Set([1, 2, 3, 2, 1]);
    const obj = Object.fromEntries([["set_val", set]]);
    return { has1: obj["set_val"].has(1), size: obj["set_val"].size };
}

export function fromEntriesDateAsValue() {
    const date = new Date("2024-01-01");
    const obj = Object.fromEntries([["date_val", date]]);
    return { isDate: obj["date_val"]?.constructor?.name=== "Date" };
}

export function fromEntriesRegExpAsValue() {
    const obj = Object.fromEntries([
        ["regex", /abc/gi],
        ["regex_flags", /def/m]
    ]);
    return { testResult: obj["regex"].test("ABC"), hasIgnoreCase: obj["regex"].ignoreCase };
}

export function fromEntriesArrayBufferAsValue() {
    const buffer = new ArrayBuffer(16);
    const obj = Object.fromEntries([["buffer", buffer]]);
    return { byteLen: obj["buffer"].byteLength };
}

export function fromEntriesDataViewAsValue() {
    const dv = new DataView(new ArrayBuffer(16));
    const obj = Object.fromEntries([["dataview", dv]]);
    return { byteLen: obj["dataview"].byteLength };
}

export function fromEntriesPromiseAsValue() {
    const promise = new Promise((resolve) => resolve("done"));
    const obj = Object.fromEntries([["promise_val", promise]]);
    return { isPromise: obj["promise_val"]?.constructor?.name=== "Promise" };
}

export function fromEntriesFunctionAsValue() {
    const obj = Object.fromEntries([
        ["func", function() { return "hello"; }],
        ["arrow", () => "world"]
    ]);
    return { funcResult: obj["func"](), arrowResult: obj["arrow"]() };
}


export function fromEntriesArrayEntries() {
    const arr = ["a", "b", "c"];
    const obj = Object.fromEntries(arr.entries());
    return { k0: obj["0"], k1: obj["1"], k2: obj["2"] };
}

export function fromEntriesArrayKeysError() {
    const arr = ["a", "b", "c"];
    try {
        const obj = Object.fromEntries(arr.keys());
        return { hasError: false, value: obj };
    } catch (e) {
        return { hasError: true };
    }
}

export function fromEntriesMapEntries() {
    const map = new Map([["a", 1], ["b", 2]]);
    const obj = Object.fromEntries(map.entries());
    return { a: obj["a"], b: obj["b"] };
}

export function fromEntriesMapDirect() {
    const map = new Map();
    map.set("x", 10);
    map.set("y", 20);
    const obj = Object.fromEntries(map);
    return { x: obj["x"], y: obj["y"] };
}

export function fromEntriesSetEntries() {
    const set = new Set(["a", "b", "c"]);
    const obj = Object.fromEntries(set.entries());
    return { a: obj["a"], b: obj["b"], c: obj["c"] };
}

export function fromEntriesSetDirect() {
    try {
        const set = new Set([["key1", "value1"], ["key2", "value2"]]);
        const obj = Object.fromEntries(set);
        return { key1: obj["key1"], key2: obj["key2"] };
    } catch (error) {
        return {hasException: true};
    }
}

export function fromEntriesCustomSymbolIterator() {
    const data = [["one", 1], ["two", 2], ["three", 3]];
    const customIterable = {
        [Symbol.iterator]() {
            return createEntriesIterator(data);
        }
    };
    const obj = Object.fromEntries(customIterable);
    return { one: obj["one"], two: obj["two"], three: obj["three"] };
}

class MyIterable {
    constructor(entries) {
        this.entries = entries;
    }
    [Symbol.iterator]() {
        return createEntriesIterator(this.entries);
    }
}

export function fromEntriesClassIterator() {
    const iterable = new MyIterable([["a", 1], ["b", 2]]);
    const obj = Object.fromEntries(iterable);
    return { a: obj["a"], b: obj["b"] };
}

function createCountingIteratorWithReturn() {
    let count = 0;
    let closed = false;
    function next() {
        if (count < 3) {
            return { value: ["key" + count, count++], done: false };
        }
        return { done: true };
    }
    function returnIter() {
        closed = true;
        return { done: true };
    }
    return { next, return: returnIter };
}

export function fromEntriesIteratorWithReturn() {
    const iterableWithReturn = {
        [Symbol.iterator]() {
            return createCountingIteratorWithReturn();
        }
    };
    const obj = Object.fromEntries(iterableWithReturn);
    return { key0: obj["key0"], key1: obj["key1"], key2: obj["key2"] };
}

export function fromEntriesGenerator() {
    function* generatorFunc() {
        yield ["first", 1];
        yield ["second", 2];
        yield ["third", 3];
    }
    const obj = Object.fromEntries(generatorFunc());
    return { first: obj["first"], second: obj["second"], third: obj["third"] };
}

export function fromEntriesGeneratorWithParams() {
    function* generateEntries(count) {
        for (let i = 0; i < count; i++) {
            yield ["item" + i, "value" + i];
        }
    }
    const obj = Object.fromEntries(generateEntries(5));
    return { item0: obj["item0"], item4: obj["item4"], keyCount: Object.keys(obj).length };
}

export function fromEntriesAsyncGeneratorError() {
    try {
        const ag = (async function*() { yield ["a", 1]; })();
        const obj = Object.fromEntries(ag);
        return { hasError: false, value: obj };
    } catch (e) {
        return { hasError: e.name=== "TypeError" };
    }
}

export function fromEntriesStringAsIterable() {
    const str = "abc";
    try {
        const obj = Object.fromEntries(str);
        return { hasError: false, value: obj };
    } catch (e) {
        return { hasError: true };
    }
}

export function fromEntriesArgsObject() {
    function testArgs() {
        const entries = Array.from(arguments).map((v, i) => [i.toString(), v]);
        return Object.fromEntries(entries);
    }
    const obj = testArgs("a", "b", "c");
    return { k0: obj["0"], k1: obj["1"], k2: obj["2"] };
}

export function fromEntriesTypedArrayEntriesMethod() {
    const typedArr = new Uint8Array([72, 101, 108, 108, 111]);
    const obj = Object.fromEntries(typedArr.entries());
    return { k0: obj["0"], k1: obj["1"], k4: obj["4"] };
}

export function fromEntriesMatchAllIterator() {
    const str = "test1 test2 test3";
    const matches = str.matchAll(/test\d/g);
    const entries = Array.from(matches).map((m, i) => [i.toString(), m[0]]);
    const obj = Object.fromEntries(entries);
    return { k0: obj["0"], k1: obj["1"], k2: obj["2"] };
}


export function fromEntriesEmptyIterableArray() {
    const obj = Object.fromEntries([]);
    return { keyCount: Object.keys(obj).length, isEmpty: JSON.stringify(obj) === '{}' };
}

export function fromEntriesEmptyMapBoundary() {
    const emptyMap = new Map();
    const obj = Object.fromEntries(emptyMap);
    return { keyCount: Object.keys(obj).length, isEmpty: JSON.stringify(obj) === '{}' };
}

export function fromEntriesEmptySet() {
    const emptySet = new Set();
    const obj = Object.fromEntries(emptySet);
    return { keyCount: Object.keys(obj).length, isEmpty: JSON.stringify(obj) === '{}' };
}

export function fromEntriesEmptyStringKeyValue() {
    const obj = Object.fromEntries([["", ""]]);
    return { val: obj[""], hasKey: "" in obj };
}

export function fromEntriesLargeNumberOfEntries() {
    const largeEntries = Array.from({ length: 10000 }, (_, i) => ["key" + i, i]);
    const obj = Object.fromEntries(largeEntries);
    return { key0: obj["key0"], key9999: obj["key9999"], keyCount: Object.keys(obj).length };
}

export function fromEntriesSingleEntry() {
    const obj = Object.fromEntries([["only", "one"]]);
    return { val: obj["only"], keyCount: Object.keys(obj).length };
}

export function fromEntriesReservedWordKeys() {
    const obj = Object.fromEntries([
        ["class", "value1"],
        ["function", "value2"],
        ["return", "value3"],
        ["if", "value4"],
        ["else", "value5"],
        ["for", "value6"],
        ["while", "value7"],
        ["do", "value8"],
        ["switch", "value9"],
        ["case", "value10"],
        ["break", "value11"],
        ["continue", "value12"],
        ["try", "value13"],
        ["catch", "value14"],
        ["finally", "value15"],
        ["throw", "value16"],
        ["new", "value17"],
        ["delete", "value18"],
        ["typeof", "value19"],
        ["void", "value20"]
    ]);
    return { classVal: obj["class"], funcVal: obj["function"], returnVal: obj["return"] };
}

export function fromEntriesProtoKey() {
    const obj = Object.fromEntries([["__proto__", { malicious: true }]]);
    return { protoVal: (obj.__proto__ !== undefined),
        isObjectProto: Object.getPrototypeOf(obj) === Object.prototype };
}

export function fromEntriesConstructorKey() {
    const obj = Object.fromEntries([["constructor", "custom"]]);
    return { val: obj.constructor, type: typeof obj.constructor };
}

export function fromEntriesHasOwnPropertyKey() {
    const obj = Object.fromEntries([["hasOwnProperty", "custom"]]);
    return { val: obj.hasOwnProperty,
        hasOwn: Object.prototype.hasOwnProperty.call(obj, "hasOwnProperty") };
}

export function fromEntriesToStringKey() {
    const obj = Object.fromEntries([["toString", "custom"]]);
    return { val: obj.toString,
        stillWorks: Object.prototype.toString.call(obj) === "[object Object]" };
}

export function fromEntriesSameKeyOverride() {
    const obj = Object.fromEntries([
        ["key", "first"],
        ["key", "second"],
        ["key", "third"]
    ]);
    return { val: obj["key"], keyCount: Object.keys(obj).length };
}

export function fromEntriesDifferentTypesSameStringKey() {
    const obj = Object.fromEntries([
        [1, "number"],
        ["1", "string"],
        [true, "boolean"]
    ]);
    return { val: obj["1"], hasKey: "1" in obj };
}

export function fromEntriesSymbolKeyDoesNotOverrideStringKey() {
    const sym = Symbol("key");
    const obj = Object.fromEntries([
        ["key", "string-value"],
        [sym, "symbol-value"]
    ]);
    return { strVal: obj["key"], symVal: obj[sym] };
}

export function fromEntriesMaxValue() {
    const obj = Object.fromEntries([["max", Number.MAX_VALUE]]);
    return { val: obj["max"] };
}

export function fromEntriesMinValue() {
    const obj = Object.fromEntries([["min", Number.MIN_VALUE]]);
    return { val: obj["min"] };
}

export function fromEntriesLongStringKey() {
    const longKey = "a".repeat(1000);
    const obj = Object.fromEntries([[longKey, "value"]]);
    return { val: obj[longKey], keyLen: Object.keys(obj)[0].length };
}

export function fromEntriesLongStringValue() {
    const longValue = "x".repeat(1000);
    const obj = Object.fromEntries([["key", longValue]]);
    return { valLen: obj["key"].length };
}

export function fromEntriesNaNKey() {
    const obj = Object.fromEntries([[NaN, "nan-value"]]);
    return { val: obj["NaN"] };
}

export function fromEntriesInfinityKey() {
    const obj = Object.fromEntries([
        [Infinity, "positive"],
        [-Infinity, "negative"]
    ]);
    return { pos: obj["Infinity"], neg: obj["-Infinity"] };
}

export function fromEntriesNegativeZeroKey() {
    const obj = Object.fromEntries([[0, "zero"], [-0, "neg-zero"]]);
    return { val: obj["0"] };
}

export function fromEntriesUndefinedElement() {
    const obj = Object.fromEntries([["key", undefined]]);
    return { val: obj["key"], hasKey: "key" in obj };
}

export function fromEntriesNullElement() {
    const obj = Object.fromEntries([["key", null]]);
    return { val: obj["key"], hasKey: "key" in obj };
}

export function fromEntriesSingleElementEntry() {
    const obj = Object.fromEntries([["only-key"]]);
    return { val: obj["only-key"], hasKey: "only-key" in obj };
}

export function fromEntriesEmptyArrayEntry() {
    const obj = Object.fromEntries([[]]);
    return { hasUndefined: obj["undefined"] === undefined, hasKey: "undefined" in obj };
}

export function fromEntriesDeepNestedValue() {
    const deepValue = {
        level1: {
            level2: {
                level3: {
                    level4: {
                        level5: {
                            value: "deep"
                        }
                    }
                }
            }
        }
    };
    const obj = Object.fromEntries([["deep", deepValue]]);
    return { value: obj["deep"].level1.level2.level3.level4.level5.value };
}


export function fromEntriesNonIterable() {
    try {
        const obj = Object.fromEntries(123);
        return false;
    } catch (e) {
        return e.name=== "TypeError";
    }
}

export function fromEntriesNullThrows() {
    try {
        const obj = Object.fromEntries(null);
        return false;
    } catch (e) {
        return e.name=== "TypeError";
    }
}

export function fromEntriesUndefinedThrows() {
    try {
        const obj = Object.fromEntries(undefined);
        return false;
    } catch (e) {
        return e.name=== "TypeError";
    }
}

export function fromEntriesPlainObjectThrows() {
    try {
        const obj = Object.fromEntries({ a: 1, b: 2 });
        return false;
    } catch (e) {
        return e.name=== "TypeError";
    }
}

export function fromEntriesBooleanThrows() {
    try {
        const obj = Object.fromEntries(true);
        return false;
    } catch (e) {
        return e.name=== "TypeError";
    }
}

export function fromEntriesNoArgThrows() {
    try {
        const obj = Object.fromEntries();
        return false;
    } catch (e) {
        return e.name=== "TypeError";
    }
}

export function fromEntriesNonObjectEntriesThrows() {
    try {
        const obj = Object.fromEntries([123, "string", true]);
        return false;
    } catch (e) {
        return e.name=== "TypeError";
    }
}

export function fromEntriesNullEntryThrows() {
    try {
        const obj = Object.fromEntries([null]);
        return false;
    } catch (e) {
        return e.name=== "TypeError";
    }
}

export function fromEntriesUndefinedEntryThrows() {
    try {
        const obj = Object.fromEntries([undefined]);
        return false;
    } catch (e) {
        return e.name=== "TypeError";
    }
}

export function fromEntriesOnlyKeyEntry() {
    const obj = Object.fromEntries([["key"]]);
    return { val: obj["key"], hasKey: "key" in obj };
}

export function fromEntriesArrayLikeEntry() {
    try {
        const obj = Object.fromEntries([{ 0: "key", 1: "value", length: 2 }]);
        return { val: obj["key"] };
    } catch (e) {
        return { hasError: e.name=== "TypeError" };
    }
}

export function fromEntriesObjectAsKey() {
    const keyObj = { a: 1 };
    const obj = Object.fromEntries([[keyObj, "value"]]);
    return { val: obj["[object Object]"] };
}


export function fromEntriesFunctionAsKeyType() {
    function myFunc() {}
    const obj = Object.fromEntries([[myFunc, "value"]]);
    const keys = Object.keys(obj);
    return { hasKey: keys.length > 0, val: obj[keys[0]] };
}

function createThrowingIterator() {
    let count = 0;
    function next() {
        count++;
        if (count === 1) {
            return { value: ["ok", 1], done: false };
        }
        throw new Error("Iterator error");
    }
    return { next };
}

export function fromEntriesIteratorThrowsError() {
    const errorIterable = {
        [Symbol.iterator]() {
            return createThrowingIterator();
        }
    };
    try {
        const obj = Object.fromEntries(errorIterable);
        return { hasError: false, value: obj };
    } catch (e) {
        return { hasError: true, isTypeError: e.name=== "TypeError" };
    }
}

function createInvalidValueIterator() {
    let count = 0;
    function next() {
        count++;
        if (count < 3) {
            return { value: count, done: false };
        }
        return { done: true };
    }
    return { next };
}

export function fromEntriesIteratorReturnsInvalidValue() {
    const invalidIterable = {
        [Symbol.iterator]() {
            return createInvalidValueIterator();
        }
    };
    try {
        const obj = Object.fromEntries(invalidIterable);
        return { hasError: false, value: obj };
    } catch (e) {
        return { hasError: e.name=== "TypeError" };
    }
}

export function fromEntriesIteratorNoNextMethod() {
    const invalidIterable = {
        [Symbol.iterator]() {
            return {};
        }
    };
    try {
        const obj = Object.fromEntries(invalidIterable);
        return { hasError: false };
    } catch (e) {
        return { hasError: e.name=== "TypeError" };
    }
}

export function fromEntriesCallApplyThis() {
    const customObj = { fromEntries: Object.fromEntries };
    const entries = [["a", 1]];
    const obj1 = Object.fromEntries.call(customObj, entries);
    const obj2 = Object.fromEntries.apply(customObj, [entries]);
    return { obj1A: obj1["a"], obj2A: obj2["a"] };
}

export function fromEntriesBindThis() {
    const boundFromEntries = Object.fromEntries.bind({ custom: true });
    const obj = boundFromEntries([["key", "value"]]);
    return { val: obj["key"], custom: obj["custom"] };
}

export function fromEntriesAsConstructorThrows() {
    try {
        const obj = new Object.fromEntries([["a", 1]]);
        return { hasError: false, value: obj };
    } catch (e) {
        return { hasError: e.name=== "TypeError" };
    }
}

export function fromEntriesCircularRefValue() {
    const circular = { a: 1 };
    circular.self = circular;
    const obj = Object.fromEntries([["circular", circular]]);
    return { isCircular: obj["circular"].self === obj["circular"], val: obj["circular"].a };
}

export function fromEntriesProxyIterable() {
    const iterable = [["a", 1], ["b", 2]];
    const proxyIterable = new Proxy(iterable, {
        get(target, prop) {
            return target[prop];
        }
    });
    const obj = Object.fromEntries(proxyIterable);
    return { a: obj["a"], b: obj["b"] };
}

export function fromEntriesRevokedProxyThrows() {
    const { proxy, revoke } = Proxy.revocable([["a", 1]], {});
    revoke();
    try {
        const obj = Object.fromEntries(proxy);
        return { hasError: false };
    } catch (e) {
        return { hasError: e.name=== "TypeError" };
    }
}


export function fromEntriesProtoKeyProtoChain() {
    const obj = Object.fromEntries([
        ["__proto__", { injected: true }],
        ["a", 1]
    ]);
    return { a: obj["a"], protoPresent: obj.__proto__ !== undefined,
        isObjectProto: Object.getPrototypeOf(obj) === Object.prototype };
}

export function fromEntriesInheritedObjectValue() {
    const parent = { inherited: "value" };
    const child = Object.create(parent);
    child.own = "own-value";
    const obj = Object.fromEntries([["child", child]]);
    return { own: obj["child"].own, inherited: obj["child"].inherited };
}

export function fromEntriesDefaultDescriptor() {
    const obj = Object.fromEntries([["key", "value"]]);
    const descriptor = Object.getOwnPropertyDescriptor(obj, "key");
    return { value: descriptor.value, writable: descriptor.writable,
        enumerable: descriptor.enumerable, configurable: descriptor.configurable };
}

export function fromEntriesModifyDescriptorAfterCreation() {
    const obj = Object.fromEntries([["key", "value"]]);
    Object.defineProperty(obj, "key", {
        writable: false,
        enumerable: false
    });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "key");
    return { writable: descriptor.writable, enumerable: descriptor.enumerable,
        value: descriptor.value };
}

export function fromEntriesSymbolKeyEnumerable() {
    const sym = Symbol("key");
    const obj = Object.fromEntries([[sym, "value"], ["normal", "normal-value"]]);
    return { symEnum: Object.prototype.propertyIsEnumerable.call(obj, sym),
        normalEnum: Object.prototype.propertyIsEnumerable.call(obj, "normal") };
}

export function fromEntriesFreezeAfterCreation() {
    const obj = Object.fromEntries([["a", 1], ["b", 2]]);
    Object.freeze(obj);
    let assignError = false;
    try {
        obj.a = 3;
    } catch (e) {
        assignError = true;
    }
    return { a: obj["a"], isFrozen: Object.isFrozen(obj), assignError: assignError };
}

export function fromEntriesSealAfterCreation() {
    const obj = Object.fromEntries([["a", 1], ["b", 2]]);
    Object.seal(obj);
    let addError = false;
    try {
        obj.c = 3;
    } catch (e) {
        addError = true;
    }
    return { c: obj["c"], isSealed: Object.isSealed(obj), addError: addError };
}

export function fromEntriesPreventExtensionsAfterCreation() {
    const obj = Object.fromEntries([["a", 1]]);
    Object.preventExtensions(obj);
    let addError = false;
    try {
        obj.b = 2;
    } catch (e) {
        addError = true;
    }
    return { b: obj["b"], isExtensible: Object.isExtensible(obj), addError: addError };
}

export function fromEntriesReferenceTypeValue() {
    const original = { a: 1 };
    const obj = Object.fromEntries([["ref", original]]);
    obj.ref.a = 2;
    return { originalChanged: original.a, refVal: obj["ref"].a };
}

export function fromEntriesArrayRefValue() {
    const arr = [1, 2, 3];
    const obj = Object.fromEntries([["arr", arr]]);
    obj.arr.push(4);
    return { arrLen: arr.length, refLen: obj["arr"].length };
}

export function fromEntriesClassInstanceProp() {
    class MyClass {
        constructor(entries) {
            Object.assign(this, Object.fromEntries(entries));
        }
    }
    const instance = new MyClass([["prop", 1], ["method", function() { return "hello"; }]]);
    return { prop: instance.prop, methodResult: instance.method() };
}

export function fromEntriesSpreadComparison() {
    const entries = [["a", 1], ["b", 2]];
    const obj1 = Object.fromEntries(entries);
    const obj2 = { ...Object.fromEntries(entries) };
    obj2.c = 3;
    return { obj1A: obj1["a"], obj2A: obj2["a"], obj1HasC: "c" in obj1 };
}

export function fromEntriesJSONSerialization() {
    const obj = Object.fromEntries([
        ["name", "张三"],
        ["age", 25],
        ["skills", ["JS", "TS"]]
    ]);
    const json = JSON.stringify(obj);
    const parsed = JSON.parse(json);
    return { name: parsed.name, age: parsed.age, skillsLen: parsed.skills.length };
}

export function fromEntriesSymbolKeyNotInJSON() {
    const sym = Symbol("key");
    const obj = Object.fromEntries([[sym, "symbol-value"], ["normal", "normal-value"]]);
    const json = JSON.stringify(obj);
    return { hasNormal: json.includes("normal"), hasSymbol: json.includes("symbol") };
}

export function fromEntriesUndefinedValueNotInJSON() {
    const obj = Object.fromEntries([
        ["a", 1],
        ["b", undefined],
        ["c", null]
    ]);
    const json = JSON.stringify(obj);
    return { hasA: json.includes('"a"'), hasB: json.includes('"b"'), hasC: json.includes('"c"') };
}

export function fromEntriesKeyIterationOrder() {
    const obj = Object.fromEntries([
        ["2", "second"],
        ["1", "first"],
        ["a", "letter"],
        ["b", "letter2"]
    ]);
    const keys = Object.keys(obj);
    return { keys: keys, has1: keys.includes("1"), has2: keys.includes("2"),
        hasA: keys.includes("a"), hasB: keys.includes("b") };
}

export function fromEntriesForInOrder() {
    const obj = Object.fromEntries([
        ["100", "num100"],
        ["50", "num50"],
        ["a", "letterA"],
        ["z", "letterZ"]
    ]);
    const keys = [];
    for (const key in obj) {
        keys.push(key);
    }
    return { keyCount: keys.length, has50: keys.includes("50"),
        has100: keys.includes("100"), hasA: keys.includes("a") };
}

export function fromEntriesLargeDataMemory() {
    const largeEntries = Array.from({ length: 10000 }, (_, i) => ["key" + i, "value" + i]);
    const obj = Object.fromEntries(largeEntries);
    return { keyCount: Object.keys(obj).length, key5000: obj["key5000"] };
}

export function fromEntriesReleaseReferenceMemory() {
    let obj = Object.fromEntries(Array.from({ length: 1000 }, (_, i) => ["key" + i, i]));
    const hadKeys = Object.keys(obj).length;
    obj = null;
    return { hadKeys: hadKeys, released: obj === null };
}

export function fromEntriesVsAssign() {
    const entries = [["a", 1], ["b", 2]];
    const obj1 = Object.fromEntries(entries);
    const obj2 = Object.assign({}, { a: 1, b: 2 });
    return { obj1A: obj1["a"], obj2A: obj2["a"], obj1B: obj1["b"], obj2B: obj2["b"] };
}

export function fromEntriesVsNewObject() {
    const entries = [["a", 1], ["b", 2]];
    const obj1 = Object.fromEntries(entries);
    const obj2 = new Object();
    obj2.a = 1;
    obj2.b = 2;
    return { obj1Cons: obj1.constructor === Object, obj2Cons: obj2.constructor === Object,
        obj1A: obj1["a"], obj2A: obj2["a"] };
}

export function fromEntriesVsJSONParse() {
    const entries = [["a", 1], ["b", "text"]];
    const obj1 = Object.fromEntries(entries);
    const obj2 = JSON.parse('{"a":1,"b":"text"}');
    const sym = Symbol("s");
    const obj3 = Object.fromEntries([[sym, "val"]]);
    return { obj1A: obj1["a"], obj2A: obj2["a"], obj3SymVal: obj3[sym] };
}


export function fromEntriesFullRoundTrip() {
    const original = { a: 1, b: "text", c: true };
    const entries = Object.entries(original);
    const restored = Object.fromEntries(entries);
    return { a: restored.a, b: restored.b, c: restored.c,
        equals: JSON.stringify(original) === JSON.stringify(restored) };
}

export function fromEntriesFilterAndRebuild() {
    const obj = { a: 1, b: 2, c: 3, d: 4 };
    const filtered = Object.fromEntries(
        Object.entries(obj).filter(([key, val]) => val > 2)
    );
    return { c: filtered["c"], d: filtered["d"], hasA: "a" in filtered, hasB: "b" in filtered };
}

export function fromEntriesMapValuesAndRebuild() {
    const obj = { a: 1, b: 2, c: 3 };
    const mapped = Object.fromEntries(
        Object.entries(obj).map(([key, val]) => [key, val * 2])
    );
    return { a: mapped["a"], b: mapped["b"], c: mapped["c"] };
}

export function fromEntriesMapKeysAndRebuild() {
    const obj = { oldKey1: "v1", oldKey2: "v2" };
    const renamed = Object.fromEntries(
        Object.entries(obj).map(([key, val]) => [key.replace("old", "new"), val])
    );
    return { newKey1: renamed["newKey1"], newKey2: renamed["newKey2"] };
}

export function fromEntriesSortAndRebuild() {
    const obj = { z: 1, a: 2, m: 3 };
    const sorted = Object.fromEntries(
        Object.entries(obj).sort(([a], [b]) => a.localeCompare(b))
    );
    const keys = Object.keys(sorted);
    return { keys: keys, firstIsA: keys[0] === "a", firstIsM: keys[1] === "m", firstIsZ: keys[2] === "z" };
}

export function fromEntriesFromKeysAndValues() {
    const obj = { a: 1, b: 2, c: 3 };
    const keys = Object.keys(obj);
    const values = Object.values(obj);
    const entries = keys.map((k, i) => [k, values[i]]);
    const restored = Object.fromEntries(entries);
    return { a: restored["a"], b: restored["b"], c: restored["c"] };
}

export function fromEntriesModifiedValuesRebuild() {
    const obj = { a: 1, b: 2, c: 3 };
    const keys = Object.keys(obj);
    const newValues = Object.values(obj).map(v => v + 10);
    const newObj = Object.fromEntries(keys.map((k, i) => [k, newValues[i]]));
    return { a: newObj["a"], b: newObj["b"], c: newObj["c"] };
}

export function fromEntriesMapToObject() {
    const map = new Map([
        ["key1", "value1"],
        ["key2", { nested: true }]
    ]);
    const obj = Object.fromEntries(map);
    return { key1: obj["key1"], key2Type: typeof obj["key2"] };
}

export function fromEntriesObjectToMap() {
    const obj = { a: 1, b: 2, c: 3 };
    const map = new Map(Object.entries(obj));
    const restored = Object.fromEntries(map);
    return { a: restored["a"], b: restored["b"], c: restored["c"] };
}

export function fromEntriesMapFilterAndConvert() {
    const map = new Map([["a", 1], ["b", 2], ["c", 3]]);
    const filteredEntries = Array.from(map.entries()).filter(([k, v]) => v > 1);
    const obj = Object.fromEntries(filteredEntries);
    return { b: obj["b"], c: obj["c"], hasA: "a" in obj };
}

export function fromEntriesSetToObject() {
    const set = new Set(["apple", "banana", "cherry"]);
    const obj = Object.fromEntries(Array.from(set, v => [v, v]));
    return { apple: obj["apple"], banana: obj["banana"], cherry: obj["cherry"] };
}

export function fromEntriesSetDedupAndConvert() {
    try {
        const duplicateEntries = [["a", 1], ["a", 2], ["b", 3]];
        const uniqueSet = new Set(duplicateEntries);
        const obj = Object.fromEntries(uniqueSet);
        return { b: obj["b"], hasA: "a" in obj };
    } catch(e) {
        return {hasException: true};
    }
}

export function fromEntriesArrayFromEntries() {
    const arr = ["zero", "one", "two"];
    const entries = Array.from(arr.entries());
    const obj = Object.fromEntries(entries);
    return { k0: obj["0"], k1: obj["1"], k2: obj["2"] };
}

export function fromEntriesArrayFromMapped() {
    const values = [10, 20, 30];
    const obj = Object.fromEntries(
        Array.from(values, (v, i) => ["value" + i, v])
    );
    return { v0: obj["value0"], v1: obj["value1"], v2: obj["value2"] };
}

export function fromEntriesThenAssign() {
    const obj1 = Object.fromEntries([["a", 1], ["b", 2]]);
    const obj2 = { c: 3, d: 4 };
    const merged = Object.assign({}, obj1, obj2);
    return { a: merged["a"], b: merged["b"], c: merged["c"], d: merged["d"] };
}

export function fromEntriesAssignThenFromEntries() {
    const source1 = { a: 1 };
    const source2 = { b: 2 };
    const merged = Object.assign({}, source1, source2);
    const entries = Object.entries(merged);
    const restored = Object.fromEntries(entries);
    return { a: restored["a"], b: restored["b"] };
}

export function fromEntriesThenDefineProp() {
    const obj = Object.fromEntries([["a", 1]]);
    Object.defineProperty(obj, "b", {
        get() { return this.a * 2; },
        enumerable: true
    });
    return { b: obj["b"] };
}

export function fromEntriesNonEnumerableProp() {
    const obj = { a: 1 };
    Object.defineProperty(obj, "b", { value: 2, enumerable: false });
    const entries = Object.entries(obj);
    const restored = Object.fromEntries(entries);
    return { a: restored["a"], b: restored["b"] };
}

export function fromEntriesFrozenEntries() {
    const obj = Object.freeze({ a: 1, b: 2 });
    const entries = Object.entries(obj);
    const restored = Object.fromEntries(entries);
    return { a: restored["a"], b: restored["b"], isFrozen: Object.isFrozen(restored) };
}

export function fromEntriesSealedEntries() {
    const obj = Object.seal({ a: 1, b: 2 });
    const entries = Object.entries(obj);
    const restored = Object.fromEntries(entries);
    return { a: restored["a"], b: restored["b"], isSealed: Object.isSealed(restored) };
}

export function fromEntriesJSONRoundTrip() {
    const obj = Object.fromEntries([
        ["name", "test"],
        ["count", 42],
        ["tags", ["a", "b"]]
    ]);
    const json = JSON.stringify(obj);
    const parsed = JSON.parse(json);
    const entries = Object.entries(parsed);
    const restored = Object.fromEntries(entries);
    return { name: restored["name"], count: restored["count"], tagsLen: restored["tags"].length };
}

export function fromEntriesJSONParseThenRebuild() {
    const json = '{"x":1,"y":2,"z":3}';
    const parsed = JSON.parse(json);
    const entries = Object.entries(parsed);
    const newObj = Object.fromEntries(
        entries.map(([k, v]) => [k.toUpperCase(), v * 10])
    );
    return { X: newObj["X"], Y: newObj["Y"], Z: newObj["Z"] };
}

export function fromEntriesWithMap() {
    const obj = { a: 1, b: 2, c: 3 };
    const newObj = Object.fromEntries(
        Object.entries(obj).map(([k, v]) => [k + "_new", v.toString()])
    );
    return { aNew: newObj["a_new"], bNew: newObj["b_new"], cNew: newObj["c_new"] };
}

export function fromEntriesWithFilter() {
    const obj = { a: 1, b: "text", c: true, d: null };
    const filtered = Object.fromEntries(
        Object.entries(obj).filter(([k, v]) => typeof v === "number")
    );
    return { a: filtered["a"], hasB: "b" in filtered, hasC: "c" in filtered, hasD: "d" in filtered };
}

export function fromEntriesWithReduce() {
    const obj = { a: 10, b: 20, c: 30 };
    const total = Object.entries(obj).reduce((sum, [k, v]) => sum + v, 0);
    const newObj = Object.fromEntries([
        ["total", total],
        ...Object.entries(obj)
    ]);
    return { total: newObj["total"], a: newObj["a"], b: newObj["b"], c: newObj["c"] };
}

export function fromEntriesWithForEach() {
    const entries = [["a", 1], ["b", 2], ["c", 3]];
    const newEntries = [];
    entries.forEach(([k, v]) => {
        newEntries.push([k, v + 100]);
    });
    const obj = Object.fromEntries(newEntries);
    return { a: obj["a"], b: obj["b"], c: obj["c"] };
}

export function fromEntriesWithSort() {
    const obj = { z: 1, a: 2, m: 3, b: 4 };
    const sorted = Object.fromEntries(
        Object.entries(obj).sort(([, a], [, b]) => a - b)
    );
    const keys = Object.keys(sorted);
    return { z: sorted["z"], a: sorted["a"], m: sorted["m"], b: sorted["b"],
        firstIsZ: keys[0] === "z", secondIsA: keys[1] === "a" };
}

export function fromEntriesWithProto() {
    const proto = { inheritedMethod() { return "from proto"; } };
    const entries = [["ownProp", "own-value"]];
    const obj = Object.assign(Object.create(proto), Object.fromEntries(entries));
    return { ownProp: obj["ownProp"], inherited: obj.inheritedMethod() };
}

export function fromEntriesWithNullProto() {
    const entries = [["a", 1], ["b", 2]];
    const obj = Object.assign(Object.create(null), Object.fromEntries(entries));
    return { a: obj["a"], b: obj["b"], hasToString: obj.toString === undefined };
}

export function fromEntriesAllPropertyNames() {
    const sym1 = Symbol("s1");
    const sym2 = Symbol("s2");
    const obj = { [sym1]: 1, [sym2]: 2, normal: 3 };
    const stringEntries = Object.entries(obj);
    const symbolEntries = Object.getOwnPropertySymbols(obj).map(s => [s, obj[s]]);
    const allEntries = [...stringEntries, ...symbolEntries];
    const restored = Object.fromEntries(allEntries);
    return { normal: restored.normal, sym1: restored[sym1], sym2: restored[sym2] };
}

export function fromEntriesOwnPropertyNames() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    obj.own = 2;
    const ownNames = Object.getOwnPropertyNames(obj);
    const entries = ownNames.map(k => [k, obj[k]]);
    const newObj = Object.fromEntries(entries);
    return { own: newObj["own"], inherited: newObj["inherited"] };
}
