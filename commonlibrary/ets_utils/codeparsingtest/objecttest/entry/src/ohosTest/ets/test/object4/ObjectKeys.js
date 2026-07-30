/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
'use strict'

export function ObjectKeysTest002() {
    function checkExtensibility(obj) {
        return Object.isExtensible(obj);
    }

    const obj = {a: 1};
    let a1 = Object.isExtensible(obj);
    let b1 = checkExtensibility(obj);
    let a = Object.isExtensible(obj);
    let b = checkExtensibility(obj);

    Object.preventExtensions(obj);
    let c1 = Object.isExtensible(obj);
    let d1 = checkExtensibility(obj);
    let c = Object.isExtensible(obj);
    let d = checkExtensibility(obj);
    return [a1, b1, a, b, c1, d1, c, d];
}

export function ObjectKeysTest003() {
    const obj1 = {a: 1};
    const obj2 = obj1;
    const obj3 = obj1;

    let a = Object.isExtensible(obj1);
    let b = Object.isExtensible(obj2);
    let c = Object.isExtensible(obj3);

    Object.preventExtensions(obj1);

    let d = Object.isExtensible(obj1);
    let e = Object.isExtensible(obj2);
    let f = Object.isExtensible(obj3);
    return [a, b, c, d, e, f];
}

export function ObjectKeysTest004() {
    const source = {a: 1, b: 2};
    const {a, b} = source;

    let a1 = Object.isExtensible(a);
    let b1 = Object.isExtensible(b);

    const {c, ...rest} = {a: 1, b: 2, d: 3};
    let c1 = Object.isExtensible(rest);
    return [a1, b1, c1];
}

export function ObjectKeysTest005() {
    const obj1 = {a: 1};
    Object.preventExtensions(obj1);

    const obj2 = {...obj1, b: 2};
    let a = Object.isExtensible(obj1);
    let b = Object.isExtensible(obj2);
    return [a, b];
}

export function ObjectKeysTest006() {
    const source1 = {a: 1};
    Object.preventExtensions(source1);

    const target = {};
    const result = Object.assign(target, source1, {b: 2});

    let a = Object.isExtensible(source1);
    let b = Object.isExtensible(target);
    let c = Object.isExtensible(result);
    return [a, b, c];
}

export function ObjectKeysTest007() {
    const jsonString = '{"a":1,"b":2}';
    const obj = JSON.parse(jsonString);

    let a = Object.isExtensible(obj);

    Object.preventExtensions(obj);
    let b = Object.isExtensible(obj);
    return [a, b];
}

export function ObjectKeysTest008() {
    const entries = [['a', 1], ['b', 2], ['c', 3]];
    const obj = Object.fromEntries(entries);

    let a = Object.isExtensible(obj);

    Object.preventExtensions(obj);
    let b = Object.isExtensible(obj);
    return [a, b];
}

export function ObjectKeysTest009() {
    const obj = {
        zero: 0,
        negativeZero: -0,
        nan: NaN,
        infinity: Infinity,
        negativeInfinity: -Infinity,
        max: Number.MAX_VALUE,
        min: Number.MIN_VALUE,
        epsilon: Number.EPSILON,
        maxSafe: Number.MAX_SAFE_INTEGER
    };

    let a = Object.isExtensible(obj);
    return a;
}

export function ObjectKeysTest010() {
    const obj = {
        empty: "",
        whitespace: "   ",
        specialChars: "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~",
        emoji: "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴",
        unicode: "\ud83d\udc46",
        escapeChars: "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0"
    };

    let a = Object.isExtensible(obj);
    return a;
}

export function ObjectKeysTest011() {
    const obj = {a: 1, b: 2};
    Object.preventExtensions(obj);

    delete obj.a;
    let a = Object.isExtensible(obj);
    let b = obj.a;

    Object.defineProperty(obj, 'b', {configurable: false, value: 2});
    let errorType;
    try {
        delete obj.b;
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return [a, b, errorType];
}

export function ObjectKeysTest012() {
    const obj = {a: 1};
    Object.preventExtensions(obj);

    const sym = Symbol('newSymbol');
    let errorType;
    try {
        Object.defineProperty(obj, sym, {value: 'symbolValue'});
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectKeysTest013() {
    const obj = {a: 1};
    const result1 = Object.isExtensible(obj);
    let a = typeof result1;
    let b = result1 === true;

    Object.preventExtensions(obj);
    const result2 = Object.isExtensible(obj);
    let c = typeof result2;
    let d = result2 === false;
    return [a, b, c, d];
}

export function ObjectKeysTest014() {
    const obj = {a: 1};

    let a1 = Object.isExtensible(obj);
    let b1 = Object.isFrozen(obj);

    Object.preventExtensions(obj);
    let a2 = Object.isExtensible(obj);
    let b2 = Object.isFrozen(obj);

    delete obj.a;
    let a3 = Object.isExtensible(obj);
    let b3 = Object.isFrozen(obj);

    const obj2 = {a: 1};
    Object.freeze(obj2);
    let a4 = Object.isExtensible(obj2);
    let b4 = Object.isFrozen(obj2);
    return [a1, b1, a2, b2, a3, b3, a4, b4];
}

export function ObjectKeysTest015() {
    const obj = {a: 1};

    let a1 = Object.isExtensible(obj);
    let b1 = Object.isSealed(obj);

    Object.preventExtensions(obj);
    let a2 = Object.isExtensible(obj);
    let b2 = Object.isSealed(obj);

    Object.seal(obj);
    let a3 = Object.isExtensible(obj);
    let b3 = Object.isSealed(obj);
    return [a1, b1, a2, b2, a3, b3];
}

export function ObjectKeysTest016() {
    const obj = { a: 1, b: 2, c: 3 };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest017() {
    const obj = {};
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest018() {
    const obj = { key: 'value' };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest019() {
    const arr = ['a', 'b', 'c'];
    let a = Object.keys(arr);
    return a;
}

export function ObjectKeysTest020() {
    const arr = [];
    let a = Object.keys(arr);
    return a;
}

export function ObjectKeysTest021() {
    const arr = [1, , , 4];
    arr[10] = 5;
    let a = Object.keys(arr);
    return a;
}

export function ObjectKeysTest022() {
    const arr = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
    let a = Object.keys(arr).length;
    return a;
}

export function ObjectKeysTest023() {
    const obj = { 0: 'a', 1: 'b', 2: 'c', length: 3 };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest024() {
    const obj = { 100: 'a', 2: 'b', 7: 'c' };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest025() {
    let a = Object.keys('foo');
    let b = Object.keys('');
    let c = Object.keys('Hello World');
    return [a, b, c];
}

export function ObjectKeysTest026() {
    const specialStr = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
    let a = Object.keys(specialStr).length;
    return a;
}

export function ObjectKeysTest027() {
    let a = Object.keys('👆👿👀');
    let b = Object.keys('🤼‍♂️');
    return [a, b];
}

export function ObjectKeysTest028() {
    let a = Object.keys(100);
    let b = Object.keys(0);
    let c = Object.keys(-0);
    let d = Object.keys(NaN);
    let e = Object.keys(Infinity);
    let f = Object.keys(-Infinity);
    return [a, b, c, d, e, f];
}

export function ObjectKeysTest029() {
    let a = Object.keys(Number.MAX_VALUE);
    let b = Object.keys(Number.MIN_VALUE);
    let c = Object.keys(Number.MAX_SAFE_INTEGER);
    let d = Object.keys(Number.EPSILON);
    return [a, b, c, d];
}

export function ObjectKeysTest030() {
    let a = Object.keys(true);
    let b = Object.keys(false);
    return [a, b];
}

export function ObjectKeysTest031() {
    let errorType;
    try {
        Object.keys(undefined);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectKeysTest032() {
    let errorType;
    try {
        Object.keys(null);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectKeysTest033() {
    const arr = new Int8Array([1, 2, 3, -128, 127]);
    let a = Object.keys(arr);
    return a;
}

export function ObjectKeysTest034() {
    const arr = new Uint8Array([0, 255, 128]);
    let a = Object.keys(arr);
    return a;
}

export function ObjectKeysTest035() {
    const arr = new Float32Array([1.5, NaN, Infinity, -Infinity]);
    let a = Object.keys(arr);
    return a;
}

export function ObjectKeysTest036() {
    const arr = new BigInt64Array([0n, 9223372036854775807n, -9223372036854775808n]);
    let a = Object.keys(arr);
    return a;
}

export function ObjectKeysTest037() {
    let a = Object.keys(new Int8Array(0));
    let b = Object.keys(new Float64Array(0));
    return [a, b];
}

export function ObjectKeysTest038() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: false });
    Object.defineProperty(obj, 'b', { value: 2, enumerable: true });
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest039() {
    const obj = { a: 1, b: 2 };
    Object.defineProperty(obj, 'c', { value: 3, enumerable: false });
    Object.defineProperty(obj, 'd', { value: 4, enumerable: true });
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest040() {
    const obj = Object.create({}, {
        getFoo: {
            value() { return this.foo; },
            enumerable: false
        },
        getBar: {
            get() { return this.bar; },
            enumerable: true
        }
    });
    obj.foo = 1;
    obj.bar = 2;
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest041() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    obj.own = 2;
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest042() {
    const grandProto = { grand: 1 };
    const parentProto = Object.create(grandProto);
    parentProto.parent = 2;
    const obj = Object.create(parentProto);
    obj.own = 3;
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest043() {
    const obj = Object.create({ __proto__: { injected: 1 } });
    obj.own = 2;
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest044() {
    const obj = Object.freeze({ a: 1, b: 2 });
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest045() {
    const obj = Object.seal({ a: 1, b: 2 });
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest046() {
    const obj = Object.preventExtensions({ a: 1, b: 2 });
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest047() {
    const obj = { a: 1, b: 2, c: 3 };
    delete obj.b;
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest048() {
    const obj = { a: 1 };
    delete obj.b;
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest050() {
    const obj = { 'name': 'test', 'age': 18, 'gender': 'male' };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest051() {
    const obj = { '3': 'c', '1': 'a', '2': 'b' };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest052() {
    const sym = Symbol('key');
    const obj = { [sym]: 'symValue', a: 1, b: 2 };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest053() {
    const obj = { a: 1, [Symbol('s')]: 2, b: 3, [Symbol('t')]: 4 };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest054() {
    const obj = { 10: 'a', 2: 'b', 100: 'c', 1: 'd' };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest055() {
    const obj = {};
    obj.c = 1;
    obj.a = 2;
    obj.b = 3;
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest056() {
    const obj = { b: 1, 2: 'two', a: 3, 1: 'one', c: 4 };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest057() {
    const obj = { '-1': 'a', '0': 'b', '1': 'c' };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest058() {
    const obj = { '1.5': 'a', '1': 'b', '2': 'c' };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest059() {
    const obj = { 'hello world': 1, 'foo bar': 2 };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest060() {
    const obj = { '!@#$%^&*()': 1, '中文键': 2, '日本語': 3 };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest061() {
    const obj = { '': 'empty', 'a': 1 };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest063() {
    const date = new Date();
    date.customProp = 'test';
    let a = Object.keys(date);
    return a;
}

export function ObjectKeysTest064() {
    const regex = /abc/gi;
    regex.customProp = 'test';
    let a = Object.keys(regex);
    return a;
}

export function ObjectKeysTest065() {
    const err = new Error('test');
    err.customProp = 'value';
    let a = Object.keys(err);
    return a;
}

export function ObjectKeysTest066() {
    const map = new Map([['key1', 'value1'], ['key2', 'value2']]);
    let a = Object.keys(map);
    return a;
}

export function ObjectKeysTest067() {
    const set = new Set([1, 2, 3]);
    let a = Object.keys(set);
    return a;
}

export function ObjectKeysTest068() {
    let a = Object.keys(new WeakMap());
    let b = Object.keys(new WeakSet());
    return [a, b];
}

export function ObjectKeysTest069() {
    const obj = {
        map: new Map([['key1', 'value1'], ['key2', { a: 1 }]]),
        name: 'test'
    };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest070() {
    const obj = {
        set: new Set([1, 2, 3, 2, 1]),
        id: 100
    };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest071() {
    const obj = {
        promise: new Promise((resolve) => setTimeout(() => resolve('done'), 100)),
        status: 'pending'
    };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest072() {
    const obj = { buffer: new ArrayBuffer(16), size: 16 };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest073() {
    const obj = { view: new DataView(new ArrayBuffer(16)), offset: 0 };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest074() {
    const obj = { buffer: new Uint8Array([72, 101, 108, 108, 111]), encoding: 'utf-8' };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest075() {
    function testFunc() {}
    testFunc.customProp = 'value';
    let a = Object.keys(testFunc);
    return a;
}

export function ObjectKeysTest076() {
    const obj = {
        a: 1,
        method: () => {},
        name: 'test'
    };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest077() {
    class MyClass {
        constructor() {
            this.a = 1;
            this.b = 2;
        }
    }
    const instance = new MyClass();
    let a = Object.keys(instance);
    return a;
}

export function ObjectKeysTest078() {
    const obj = { a: undefined, b: 1 };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest079() {
    const obj = { a: null, b: 1 };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest080() {
    const obj = { a: NaN, b: 1 };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest081() {
    const obj = { a: Infinity, b: -Infinity };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest082() {
    const obj = { regex: /abc/gi, flags: /def/m };
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest085() {
    let errorType;
    try {
        Object.keys();
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectKeysTest087() {
    let obj = { a: 1 };
    let current = obj;
    for (let i = 0; i < 100; i++) {
        current.nested = { value: i };
        current = current.nested;
    }
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest088() {
    let a = Object.keys({});
    let b = Object.keys(Object.create(null));
    return [a, b];
}

export function ObjectKeysTest089() {
    const obj = Object.create(null);
    obj.a = 1;
    obj.b = 2;
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest090() {
    const obj = { a: 1 };
    obj.b = 2;
    obj.c = 3;
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest091() {
    const obj = { a: 1, b: 2 };
    Object.defineProperty(obj, 'a', { enumerable: false });
    let a = Object.keys(obj);
    Object.defineProperty(obj, 'a', { enumerable: true });
    let b = Object.keys(obj);
    return [a, b];
}

export function ObjectKeysTest092() {
    const obj = Object.create({ proto: 'value' }, {
        a: { value: 1, enumerable: true },
        b: { value: 2, enumerable: true }
    });
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest093() {
    const obj = Object.assign({}, { a: 1 }, { b: 2 }, { c: 3 });
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest094() {
    const obj = Object.fromEntries([['a', 1], ['b', 2], ['c', 3]]);
    let a = Object.keys(obj);
    return a;
}

export function ObjectKeysTest095() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    obj.own = 2;

    const keysResult = Object.keys(obj);
    const forInResult = [];
    for (const key in obj) {
        forInResult.push(key);
    }
    return [keysResult, forInResult];
}

export function ObjectKeysTest096() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });

    const keysResult = Object.keys(obj);
    const forInResult = [];
    for (const key in obj) {
        forInResult.push(key);
    }
    return [keysResult, forInResult];
}

export function ObjectKeysTest097() {
    const obj = { a: 1, b: 2, c: 3 };
    const keys = Object.keys(obj);
    const values = Object.values(obj);

    const result = [];
    keys.forEach((key, index) => {
        result.push([key, values[index]]);
    });
    return result;
}

export function ObjectKeysTest098() {
    const obj = { 3: 'c', 1: 'a', 2: 'b', name: 'test' };
    const keys = Object.keys(obj);
    const values = Object.values(obj);
    return [keys, values];
}

export function ObjectKeysTest099() {
    const obj = { a: 1, b: 2 };
    const keys = Object.keys(obj);
    const entries = Object.entries(obj);
    const entriesMap = entries.map(e => e[0]);
    return [keys, entries, entriesMap];
}
