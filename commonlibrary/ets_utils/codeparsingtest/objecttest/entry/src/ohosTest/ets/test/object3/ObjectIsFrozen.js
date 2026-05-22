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

export function ObjectIsFrozenTest001() {
    const obj = { a: 1, b: 2 };
    return Object.isFrozen(obj);
}

export function ObjectIsFrozenTest002() {
    const emptyObj = {};
    return Object.isFrozen(emptyObj);
}

export function ObjectIsFrozenTest003() {
    const obj = { a: 1, b: 2 };
    Object.freeze(obj);
    return Object.isFrozen(obj);
}

export function ObjectIsFrozenTest004() {
    const obj = { x: 100 };
    Object.freeze(obj);
    const firstCheck = Object.isFrozen(obj);
    const secondCheck = Object.isFrozen(obj);
    return [firstCheck, secondCheck];
}

export function ObjectIsFrozenTest005() {
    const num42 = Object.isFrozen(42);
    const num0 = Object.isFrozen(0);
    const numNeg1 = Object.isFrozen(-1);
    return [num42, num0, numNeg1];
}

export function ObjectIsFrozenTest006() {
    const num314 = Object.isFrozen(3.14);
    const numNeg05 = Object.isFrozen(-0.5);
    return [num314, numNeg05];
}

export function ObjectIsFrozenTest007() {
    const nan = Object.isFrozen(NaN);
    const infinity = Object.isFrozen(Infinity);
    const negInfinity = Object.isFrozen(-Infinity);
    const maxValue = Object.isFrozen(Number.MAX_VALUE);
    const minValue = Object.isFrozen(Number.MIN_VALUE);
    const maxSafeInt = Object.isFrozen(Number.MAX_SAFE_INTEGER);
    const minSafeInt = Object.isFrozen(Number.MIN_SAFE_INTEGER);
    const epsilon = Object.isFrozen(Number.EPSILON);
    return [nan, infinity, negInfinity, maxValue, minValue, maxSafeInt, minSafeInt, epsilon];
}

export function ObjectIsFrozenTest008() {
    const hex = Object.isFrozen(0xFF);
    const octal = Object.isFrozen(0o77);
    const binary = Object.isFrozen(0b101);
    return [hex, octal, binary];
}

export function ObjectIsFrozenTest009() {
    const bigInt123 = Object.isFrozen(123n);
    const bigIntMax = Object.isFrozen(BigInt(9007199254740991));
    return [bigInt123, bigIntMax];
}

export function ObjectIsFrozenTest010() {
    const strHello = Object.isFrozen("hello");
    const strEmpty = Object.isFrozen("");
    const strA = Object.isFrozen("a");
    return [strHello, strEmpty, strA];
}

export function ObjectIsFrozenTest011() {
    const strSpecial = Object.isFrozen("!@#$%^&*()");
    const strChinese = Object.isFrozen("你好世界");
    const strEmoji = Object.isFrozen("👆👿👀💯");
    return [strSpecial, strChinese, strEmoji];
}

export function ObjectIsFrozenTest012() {
    const strEscape = Object.isFrozen("\\n\\t\\r");
    const strSurrogate = Object.isFrozen("\ud83d\udc46");
    return [strEscape, strSurrogate];
}

export function ObjectIsFrozenTest013() {
    const boolTrue = Object.isFrozen(true);
    const boolFalse = Object.isFrozen(false);
    return [boolTrue, boolFalse];
}

export function ObjectIsFrozenTest014() {
    return Object.isFrozen(undefined);
}

export function ObjectIsFrozenTest015() {
    return Object.isFrozen(null);
}

export function ObjectIsFrozenTest016() {
    const sym = Symbol("test");
    const symTest = Object.isFrozen(sym);
    const symIterator = Object.isFrozen(Symbol.iterator);
    return [symTest, symIterator];
}

export function ObjectIsFrozenTest017() {
    const obj1 = { a: 1, b: "test", c: true };
    return Object.isFrozen(obj1);
}

export function ObjectIsFrozenTest018() {
    const nestedObj = {
        a: 1,
        b: {
            c: 2,
            d: {
                e: 3
            }
        }
    };
    const beforeFreeze = Object.isFrozen(nestedObj);
    Object.freeze(nestedObj);
    const afterFreeze = Object.isFrozen(nestedObj);
    const nestedB = Object.isFrozen(nestedObj.b);
    const nestedD = Object.isFrozen(nestedObj.b.d);
    return [beforeFreeze, afterFreeze, nestedB, nestedD];
}

export function ObjectIsFrozenTest019() {
    const emptyObj = {};
    const beforePrevent = Object.isFrozen(emptyObj);
    Object.preventExtensions(emptyObj);
    const afterPrevent = Object.isFrozen(emptyObj);
    return [beforePrevent, afterPrevent];
}

export function ObjectIsFrozenTest021() {
    const arr = [1, 2, 3, "a", true];
    const beforeFreeze = Object.isFrozen(arr);
    Object.freeze(arr);
    const afterFreeze = Object.isFrozen(arr);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest023() {
    const sparseArr = [1, , , , 5];
    const beforeFreeze = Object.isFrozen(sparseArr);
    Object.freeze(sparseArr);
    const afterFreeze = Object.isFrozen(sparseArr);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest024() {
    const arrayLike = { 0: "a", 1: "b", 2: "c", length: 3 };
    const beforeFreeze = Object.isFrozen(arrayLike);
    Object.freeze(arrayLike);
    const afterFreeze = Object.isFrozen(arrayLike);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest025() {
    function normalFunc() { return 42; }
    const beforeFreeze = Object.isFrozen(normalFunc);
    Object.freeze(normalFunc);
    const afterFreeze = Object.isFrozen(normalFunc);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest026() {
    const arrowFunc = () => 42;
    const beforeFreeze = Object.isFrozen(arrowFunc);
    Object.freeze(arrowFunc);
    const afterFreeze = Object.isFrozen(arrowFunc);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest027() {
    function Constructor(value) { this.value = value; }
    const beforeFreeze = Object.isFrozen(Constructor);
    Object.freeze(Constructor);
    const afterFreeze = Object.isFrozen(Constructor);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest028() {
    const int8 = new Int8Array([127, -128, 0]);
    const beforeFreeze = Object.isFrozen(int8);

    const afterFreeze = Object.isFrozen(int8);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest029() {
    const int8Boundary = new Int8Array([-128, 127]);
    return Object.isFrozen(int8Boundary);
}

export function ObjectIsFrozenTest030() {
    const uint8 = new Uint8Array([0, 255, 128]);
    const beforeFreeze = Object.isFrozen(uint8);

    const afterFreeze = Object.isFrozen(uint8);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest031() {
    const clamped = new Uint8ClampedArray([0, 255, 300, -10]);
    const beforeFreeze = Object.isFrozen(clamped);

    const afterFreeze = Object.isFrozen(clamped);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest032() {
    const int16 = new Int16Array([-32768, 32767]);
    const uint16 = new Uint16Array([0, 65535]);
    return [Object.isFrozen(int16), Object.isFrozen(uint16)];
}

export function ObjectIsFrozenTest033() {
    const int32 = new Int32Array([-2147483648, 2147483647]);
    const uint32 = new Uint32Array([0, 4294967295]);
    return [Object.isFrozen(int32), Object.isFrozen(uint32)];
}

export function ObjectIsFrozenTest034() {
    const float32 = new Float32Array([3.4028234663852886e38, -3.4028234663852886e38]);
    const float64 = new Float64Array([1.7976931348623157e308, -1.7976931348623157e308]);
    const floatWithSpecial = new Float32Array([NaN, Infinity, -Infinity]);
    return [
        Object.isFrozen(float32),
        Object.isFrozen(float64),
        Object.isFrozen(floatWithSpecial)
    ];
}

export function ObjectIsFrozenTest035() {
    const bigint64 = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
    const biguint64 = new BigUint64Array([0n, 18446744073709551615n]);
    return [Object.isFrozen(bigint64), Object.isFrozen(biguint64)];
}

export function ObjectIsFrozenTest036() {
    const date = new Date();
    const beforeFreeze = Object.isFrozen(date);
    Object.freeze(date);
    const afterFreeze = Object.isFrozen(date);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest037() {
    const regex = /abc/gi;
    const beforeFreeze = Object.isFrozen(regex);
    Object.freeze(regex);
    const afterFreeze = Object.isFrozen(regex);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest038() {
    const map = new Map([['key1', 'value1'], ['key2', {a: 1}]]);
    const beforeFreeze = Object.isFrozen(map);
    Object.freeze(map);
    const afterFreeze = Object.isFrozen(map);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest039() {
    const set = new Set([1, 2, 3, 2, 1]);
    const beforeFreeze = Object.isFrozen(set);
    Object.freeze(set);
    const afterFreeze = Object.isFrozen(set);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest040() {
    const weakMap = new WeakMap();
    const weakSet = new WeakSet();
    return [Object.isFrozen(weakMap), Object.isFrozen(weakSet)];
}

export function ObjectIsFrozenTest041() {
    const promise = new Promise((resolve) => setTimeout(() => resolve('done'), 100));
    const beforeFreeze = Object.isFrozen(promise);
    Object.freeze(promise);
    const afterFreeze = Object.isFrozen(promise);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest042() {
    const buffer = new ArrayBuffer(16);
    const dataView = new DataView(new ArrayBuffer(16));
    return [Object.isFrozen(buffer), Object.isFrozen(dataView)];
}

export function ObjectIsFrozenTest043() {
    const error = new Error("test error");
    const beforeFreeze = Object.isFrozen(error);
    Object.freeze(error);
    const afterFreeze = Object.isFrozen(error);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest044() {
    const symKey = Symbol("key");
    const objWithSymbol = { [symKey]: "value", a: 1 };
    const beforeFreeze = Object.isFrozen(objWithSymbol);
    Object.freeze(objWithSymbol);
    const afterFreeze = Object.isFrozen(objWithSymbol);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest045() {
    const objWithFunc = {
        a: 1,
        method: function() { return this.a; }
    };
    const beforeFreeze = Object.isFrozen(objWithFunc);
    Object.freeze(objWithFunc);
    const afterFreeze = Object.isFrozen(objWithFunc);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest046() {
    const objWithNullUndefined = {
        a: undefined,
        b: null,
        c: NaN,
        d: Infinity
    };
    const beforeFreeze = Object.isFrozen(objWithNullUndefined);
    Object.freeze(objWithNullUndefined);
    const afterFreeze = Object.isFrozen(objWithNullUndefined);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest047() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {});
    const beforeFreeze = Object.isFrozen(proxy);
    Object.freeze(proxy);
    const afterFreeze = Object.isFrozen(proxy);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest048() {
    const obj = { a: 1, b: "test", c: [1, 2, 3] };
    Object.freeze(obj);
    return Object.isFrozen(obj);
}

export function ObjectIsFrozenTest049() {
    const obj = { x: 10 };
    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);
    let isTypeError = false;
    try {
        obj.x = 20;
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return [isFrozen, isTypeError];
}

export function ObjectIsFrozenTest050() {
    const obj = { x: 10 };
    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);
    let isTypeError = false;
    try {
        obj.newProp = "new";
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return [isFrozen, isTypeError];
}

export function ObjectIsFrozenTest051() {
    const obj = { x: 10, y: 20 };
    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);
    let isTypeError = false;
    try {
        delete obj.x;
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return [isFrozen, isTypeError];
}

export function ObjectIsFrozenTest052() {
    const obj = {
        a: 1,
        b: {
            c: 2
        }
    };
    Object.freeze(obj);
    const rootFrozen = Object.isFrozen(obj);
    const nestedBFrozen = Object.isFrozen(obj.b);
    return [rootFrozen, nestedBFrozen];
}

export function ObjectIsFrozenTest053() {
    function deepFreeze(obj) {
        Object.keys(obj).forEach(key => {
            if (typeof obj[key] === 'object' && obj[key] !== null) {
                deepFreeze(obj[key]);
            }
        });
        return Object.freeze(obj);
    }

    const obj = {
        a: 1,
        b: {
            c: {
                d: 2
            }
        }
    };
    deepFreeze(obj);
    const rootFrozen = Object.isFrozen(obj);
    const nestedBFrozen = Object.isFrozen(obj.b);
    const nestedCFrozen = Object.isFrozen(obj.b.c);
    return [rootFrozen, nestedBFrozen, nestedCFrozen];
}

export function ObjectIsFrozenTest054() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);
    const isExtensible = Object.isExtensible(obj);
    return [isFrozen, isExtensible];
}

export function ObjectIsFrozenTest055() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    const isExtensible = Object.isExtensible(obj);
    const isFrozen = Object.isFrozen(obj);
    return [isExtensible, isFrozen];
}

export function ObjectIsFrozenTest056() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);
    const isSealed = Object.isSealed(obj);
    return [isFrozen, isSealed];
}

export function ObjectIsFrozenTest057() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    const isSealed = Object.isSealed(obj);
    const isFrozen = Object.isFrozen(obj);
    return [isSealed, isFrozen];
}

export function ObjectIsFrozenTest058() {
    const parent = { parentProp: 1 };
    const child = Object.create(parent);
    child.childProp = 2;

    Object.freeze(child);
    const childFrozen = Object.isFrozen(child);
    const parentFrozen = Object.isFrozen(parent);
    return [childFrozen, parentFrozen];
}

export function ObjectIsFrozenTest059() {
    const proto = { method: function() {} };
    const obj = Object.create(proto);

    Object.freeze(proto);
    const protoFrozen = Object.isFrozen(proto);
    const objFrozen = Object.isFrozen(obj);
    return [protoFrozen, objFrozen];
}

export function ObjectIsFrozenTest060() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    Object.defineProperty(obj, 'a', { writable: false, configurable: true });
    return Object.isFrozen(obj);
}

export function ObjectIsFrozenTest061() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    Object.defineProperty(obj, 'a', { writable: true, configurable: false });
    return Object.isFrozen(obj);
}

export function ObjectIsFrozenTest062() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    Object.defineProperty(obj, 'a', { writable: false, configurable: false });
    return Object.isFrozen(obj);
}

export function ObjectIsFrozenTest063() {
    const obj = {
        get value() { return this._value; },
        set value(v) { this._value = v; }
    };
    obj._value = 1;
    Object.preventExtensions(obj);
    return Object.isFrozen(obj);
}

export function ObjectIsFrozenTest064() {
    const obj = {};
    Object.defineProperty(obj, 'value', {
        get: function() { return 1; },
        configurable: false
    });
    Object.preventExtensions(obj);
    return Object.isFrozen(obj);
}

export function ObjectIsFrozenTest065() {
    const obj = {};
    Object.defineProperty(obj, 'a', {
        value: 1,
        writable: false,
        configurable: false
    });
    Object.defineProperty(obj, 'b', {
        value: 2,
        writable: false,
        configurable: true
    });
    Object.preventExtensions(obj);
    return Object.isFrozen(obj);
}

export function ObjectIsFrozenTest066() {
    const obj = {};
    Object.defineProperty(obj, 'a', {
        value: 1,
        writable: false,
        configurable: false
    });
    Object.defineProperty(obj, 'b', {
        value: 2,
        writable: false,
        configurable: false
    });
    Object.preventExtensions(obj);
    return Object.isFrozen(obj);
}

export function ObjectIsFrozenTest067() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'a', {
        value: 1,
        writable: false,
        configurable: false,
        enumerable: true
    });
    Object.preventExtensions(obj);
    return Object.isFrozen(obj);
}

export function ObjectIsFrozenTest068() {
    const obj = {};
    Object.defineProperty(obj, 'a', {
        value: 1,
        writable: false,
        configurable: false,
        enumerable: false
    });
    Object.preventExtensions(obj);
    return Object.isFrozen(obj);
}

export function ObjectIsFrozenTest069() {
    const sym = Symbol('key');
    const obj = { [sym]: 1 };
    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);
    const descriptor = Object.getOwnPropertyDescriptor(obj, sym);
    const writable = descriptor.writable;
    const configurable = descriptor.configurable;
    return [isFrozen, writable, configurable];
}

export function ObjectIsFrozenTest070() {
    const sym = Symbol('symKey');
    const obj = {
        [sym]: 1,
        normalKey: 2
    };
    Object.freeze(obj);
    return Object.isFrozen(obj);
}

export function ObjectIsFrozenTest071() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const firstCheck = Object.isFrozen(obj);
    Object.freeze(obj);
    const secondCheck = Object.isFrozen(obj);
    return [firstCheck, secondCheck];
}

export function ObjectIsFrozenTest072() {
    const obj = { a: 1 };
    const frozenObj = Object.freeze(obj);
    const isSame = obj === frozenObj;
    const objFrozen = Object.isFrozen(obj);
    const frozenObjFrozen = Object.isFrozen(frozenObj);
    return [isSame, objFrozen, frozenObjFrozen];
}

export function ObjectIsFrozenTest073() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    const beforeFreeze = Object.isFrozen(obj);
    Object.freeze(obj);
    const afterFreeze = Object.isFrozen(obj);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest074() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    const isExtensible = Object.isExtensible(obj);
    const isFrozen = Object.isFrozen(obj);
    return [isExtensible, isFrozen];
}

export function ObjectIsFrozenTest075() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    const isSealed = Object.isSealed(obj);
    const isFrozenBefore = Object.isFrozen(obj);
    Object.freeze(obj);
    const isFrozenAfter = Object.isFrozen(obj);
    return [isSealed, isFrozenBefore, isFrozenAfter];
}

export function ObjectIsFrozenTest076() {
    const obj = { a: 1 };
    Object.seal(obj);
    const isSealed = Object.isSealed(obj);
    const isFrozenBefore = Object.isFrozen(obj);
    obj.a = 2;
    const value = obj.a;
    const isFrozenAfter = Object.isFrozen(obj);
    return [isSealed, isFrozenBefore, value, isFrozenAfter];
}

export function ObjectIsFrozenTest077() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let isTypeError = false;
    try {
        Object.defineProperty(obj, 'a', {
            value: 2,
            writable: true
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError;
}

export function ObjectIsFrozenTest078() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let isTypeError = false;
    try {
        Object.defineProperty(obj, 'b', {
            value: 2
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError;
}

export function ObjectIsFrozenTest079() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let isTypeError = false;
    try {
        Object.setPrototypeOf(obj, { b: 2 });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError;
}

export function ObjectIsFrozenTest080() {
    const proto = { method: function() {} };
    const obj = Object.create(proto);
    obj.a = 1;

    Object.freeze(proto);
    const protoFrozen = Object.isFrozen(proto);
    const objFrozen = Object.isFrozen(obj);
    return [protoFrozen, objFrozen];
}

export function ObjectIsFrozenTest081() {
    const obj = Object.create({}, {
        a: {
            value: 1,
            writable: false,
            configurable: false
        }
    });
    const beforePrevent = Object.isFrozen(obj);
    Object.preventExtensions(obj);
    const afterPrevent = Object.isFrozen(obj);
    return [beforePrevent, afterPrevent];
}

export function ObjectIsFrozenTest082() {
    const frozenProto = { a: 1 };
    Object.freeze(frozenProto);

    const obj = Object.create(frozenProto);
    obj.b = 2;

    const protoFrozen = Object.isFrozen(frozenProto);
    const objFrozen = Object.isFrozen(obj);
    return [protoFrozen, objFrozen];
}

export function ObjectIsFrozenTest083() {
    const target = { a: 1 };
    Object.freeze(target);
    let isTypeError = false;
    try {
        Object.assign(target, { b: 2 });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError;
}

export function ObjectIsFrozenTest084() {
    const frozen = { a: 1 };
    Object.freeze(frozen);

    const target = {};
    Object.assign(target, frozen);
    const targetValue = target.a;
    const targetFrozen = Object.isFrozen(target);
    return [targetValue, targetFrozen];
}

export function ObjectIsFrozenTest085() {
    const obj = { a: 1, b: 2, c: 3 };
    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);
    const keys = Object.keys(obj);
    return [isFrozen, keys];
}

export function ObjectIsFrozenTest086() {
    const obj = { a: 1, b: 2, c: 3 };
    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);
    const values = Object.values(obj);
    return [isFrozen, values];
}

export function ObjectIsFrozenTest087() {
    const obj = { a: 1, b: 2, c: 3 };
    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);
    const entries = Object.entries(obj);
    return [isFrozen, entries];
}

export function ObjectIsFrozenTest088() {
    return Object.isFrozen(Object);
}

export function ObjectIsFrozenTest089() {
    return Object.isFrozen(Array);
}

export function ObjectIsFrozenTest090() {
    const globalFrozen = Object.isFrozen(globalThis);
    return [globalFrozen];
}

export function ObjectIsFrozenTest091() {
    return Object.isFrozen(Object.prototype);
}

export function ObjectIsFrozenTest092() {
    return Object.isFrozen(Array.prototype);
}

export function ObjectIsFrozenTest093() {
    return Object.isFrozen(Function.prototype);
}

export function ObjectIsFrozenTest094() {
    let result = [];
    function test() {
        const beforeFreeze = Object.isFrozen(arguments);
        Object.freeze(arguments);
        const afterFreeze = Object.isFrozen(arguments);
        result = [beforeFreeze, afterFreeze];
    }
    test(1, 2, 3);
    return result;
}

export function ObjectIsFrozenTest095() {
    class Person {
        constructor(name) {
            this.name = name;
        }
    }
    const person = new Person("Alice");
    const beforeFreeze = Object.isFrozen(person);
    Object.freeze(person);
    const afterFreeze = Object.isFrozen(person);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest096() {
    const obj = {
        _value: 0,
        get value() { return this._value; },
        set value(v) { this._value = v; }
    };
    const beforeFreeze = Object.isFrozen(obj);
    Object.freeze(obj);
    const afterFreeze = Object.isFrozen(obj);
    return [beforeFreeze, afterFreeze];
}

export function ObjectIsFrozenTest097() {
    const obj = {
        buffer: new ArrayBuffer(16)
    };
    const beforeFreeze = Object.isFrozen(obj);
    Object.freeze(obj);
    const afterFreeze = Object.isFrozen(obj);
    const bufferFrozen = Object.isFrozen(obj.buffer);
    return [beforeFreeze, afterFreeze, bufferFrozen];
}

export function ObjectIsFrozenTest098() {
    const obj = {
        data: new Uint8Array([72, 101, 108, 108, 111])
    };
    const beforeFreeze = Object.isFrozen(obj);
    Object.freeze(obj);
    const afterFreeze = Object.isFrozen(obj);
    const dataFrozen = Object.isFrozen(obj.data);
    return [beforeFreeze, afterFreeze, dataFrozen];
}

export function ObjectIsFrozenTest099() {
    const obj = {
        map: new Map([['key1', 'value1'], ['key2', {a: 1}]])
    };
    const beforeFreeze = Object.isFrozen(obj);
    Object.freeze(obj);
    const afterFreeze = Object.isFrozen(obj);
    const mapFrozen = Object.isFrozen(obj.map);
    return [beforeFreeze, afterFreeze, mapFrozen];
}
