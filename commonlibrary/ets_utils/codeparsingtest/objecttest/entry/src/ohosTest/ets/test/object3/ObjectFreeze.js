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

export function ObjectFreezeTest001() {
    const obj = {};
    const frozen = Object.freeze(obj);
    let a = Object.isFrozen(obj);
    let b = frozen === obj;
    return [a, b];
}

export function ObjectFreezeTest002() {
    const obj = { prop: 42 };
    Object.freeze(obj);

    return obj.prop;
}

export function ObjectFreezeTest003() {
    const obj = { a: 1, b: 'test', c: true };

    obj.a = 100;
    obj.b = 'modified';
    obj.c = false;
    return obj;
}

export function ObjectFreezeTest004() {
    const obj = {
        outer: {
            inner: 'value'
        }
    };
    Object.freeze(obj);
    obj.outer.inner = 'modified';
    return obj.outer.inner;
}

export function ObjectFreezeTest005() {
    const obj = { x: 1 };
    const beforeFreeze = Object.isFrozen(obj);
    Object.freeze(obj);
    const afterFreeze = Object.isFrozen(obj);
    return [beforeFreeze, afterFreeze];
}

export function ObjectFreezeTest006() {
    const obj = { prop: 42 };
    Object.freeze(obj);
    const descriptor = Object.getOwnPropertyDescriptor(obj, 'prop');
    return [descriptor.writable, descriptor.configurable];
}

export function ObjectFreezeTest007() {
    const obj = { a: 1 };
    Object.freeze(obj);
    return Object.isExtensible(obj);
}

export function ObjectFreezeTest008() {
    const obj = { prop: 42 };
    Object.freeze(obj);
    let errorType;
    try {
        obj.prop = 33;
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest009() {
    const obj = { prop: 42 };
    Object.freeze(obj);
    let errorType;
    try {
        obj.newProp = 'new';
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest010() {
    const obj = { prop: 42 };
    Object.freeze(obj);
    let errorType;
    try {
        delete obj.prop;
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest014() {
    let result, errorType;
    try {
        result = Object.freeze(undefined);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType ? [errorType] : [result];
}

export function ObjectFreezeTest015() {
    let result, errorType;
    try {
        result = Object.freeze(null);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType ? [errorType] : [result];
}

export function ObjectFreezeTest016() {
    const result = Object.freeze(42);
    return [result, typeof result];
}

export function ObjectFreezeTest017() {
    const result = Object.freeze('hello');
    return [result, typeof result];
}

export function ObjectFreezeTest018() {
    const result1 = Object.freeze(true);
    const result2 = Object.freeze(false);
    return [result1, result2];
}

export function ObjectFreezeTest019() {
    const sym = Symbol('test');
    const result = Object.freeze(sym);
    return [JSON.stringify(result), result === sym];
}

export function ObjectFreezeTest020() {
    const bigInt = BigInt(9007199254740991);
    const result = Object.freeze(bigInt);
    return result;
}

export function ObjectFreezeTest021() {
    const obj = { a: 1, b: 'test', c: [1, 2, 3] };
    Object.freeze(obj);
    return Object.isFrozen(obj);
}

export function ObjectFreezeTest022() {
    const arr = [1, 2, 3];
    Object.freeze(arr);

    return [Object.isFrozen(arr), arr[0]];
}

export function ObjectFreezeTest023() {
    function foo() { return 'test'; }
    Object.freeze(foo);

    return [Object.isFrozen(foo), foo.newProp];
}

export function ObjectFreezeTest024() {
    const date = new Date('2024-01-01');
    Object.freeze(date);
    return Object.isFrozen(date);
}

export function ObjectFreezeTest025() {
    const regex = /abc/gi;
    Object.freeze(regex);
    return Object.isFrozen(regex);
}

export function ObjectFreezeTest026() {
    const map = new Map([['key1', 'value1'], ['key2', { a: 1 }]]);
    Object.freeze(map);
    return Object.isFrozen(map);
}

export function ObjectFreezeTest027() {
    const set = new Set([1, 2, 3, 2, 1]);
    Object.freeze(set);
    return Object.isFrozen(set);
}

export function ObjectFreezeTest028() {
    const promise = new Promise((resolve) => setTimeout(() => resolve('done'), 100));
    Object.freeze(promise);
    return Object.isFrozen(promise);
}

export function ObjectFreezeTest029() {
    const obj = { prop: 42 };
    Object.freeze(obj);
    let errorType;
    try {
        obj.prop = 100;
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return [errorType, obj.prop];
}

export function ObjectFreezeTest030() {
    const obj = {
        zero: 0,
        nan: NaN,
        infinity: Infinity,
        max: Number.MAX_VALUE,
        min: Number.MIN_VALUE
    };

    obj.zero = 1;
    obj.nan = 'not nan';
    obj.infinity = 0;
    return [obj.zero, obj.nan, obj.infinity, obj.max, obj.min];
}

export function ObjectFreezeTest031() {
    const obj = {
        empty: '',
        normal: 'hello',
        special: '!@#$%^&*()',
        emoji: '👆👿👀💯',
        unicode: '\ud83d\udc46'
    };

    obj.empty = 'not empty';
    obj.normal = 'world';
    return [obj.empty, obj.normal, obj.special, obj.emoji, obj.unicode];
}

export function ObjectFreezeTest032() {
    const obj = { a: true, b: false };

    obj.a = false;
    obj.b = true;
    return [obj.a, obj.b];
}

export function ObjectFreezeTest033() {
    const obj = {
        nested: { a: 1 },
        arr: [1, 2, 3]
    };

    obj.nested = { b: 2 };
    obj.arr = [4, 5, 6];
    return [obj.nested, obj.arr];
}

export function ObjectFreezeTest034() {
    const obj = {
        nullProp: null,
        undefinedProp: undefined
    };

    obj.nullProp = 'not null';
    obj.undefinedProp = 'not undefined';
    return [obj.nullProp, obj.undefinedProp];
}

export function ObjectFreezeTest035() {
    let value = 42;
    const obj = {
        get prop() { return value; },
        set prop(v) { value = v; }
    };
    Object.freeze(obj);
    const beforeChange = obj.prop;
    value = 100;
    const afterChange = obj.prop;
    return [beforeChange, afterChange];
}

export function ObjectFreezeTest036() {
    let value = 42;
    const obj = {
        get prop() { return value; },
        set prop(v) { value = v; }
    };
    Object.freeze(obj);
    obj.prop = 100;
    return [value, obj.prop];
}

export function ObjectFreezeTest037() {
    const obj = {
        get value() { return 'getter value'; }
    };
    Object.freeze(obj);
    return obj.value;
}

export function ObjectFreezeTest038() {
    let internal = 'initial';
    const obj = {
        set value(v) { internal = v; }
    };
    Object.freeze(obj);
    obj.value = 'modified';
    return internal;
}

export function ObjectFreezeTest039() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let errorType;
    try {
        obj.b = 2;
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return [errorType, obj.b];
}

export function ObjectFreezeTest040() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let errorType;
    try {
        Object.defineProperty(obj, 'b', {
            get() { return 2; }
        });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest041() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const sym = Symbol('new');
    let errorType;
    try {
        obj[sym] = 'symbol value';
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest042() {
    const obj = { a: 1, b: 2 };
    Object.freeze(obj);
    let errorType;
    try {
        delete obj.a;
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return [errorType, obj.a];
}

export function ObjectFreezeTest043() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let errorType;
    try {
        delete obj.notExist;
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest044() {
    const sym = Symbol('key');
    const obj = { [sym]: 'value', a: 1 };
    Object.freeze(obj);
    let errorType;
    try {
        delete obj[sym];
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return [errorType, obj[sym]];
}

export function ObjectFreezeTest045() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return desc.writable;
}

export function ObjectFreezeTest046() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: true, configurable: true });
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return desc.writable;
}

export function ObjectFreezeTest047() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: false, configurable: true });
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return desc.writable;
}

export function ObjectFreezeTest048() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return desc.configurable;
}

export function ObjectFreezeTest049() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: true, configurable: true });
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return desc.configurable;
}

export function ObjectFreezeTest050() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: true, configurable: false });
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return desc.configurable;
}

export function ObjectFreezeTest051() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return desc.enumerable;
}

export function ObjectFreezeTest052() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: false });
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return desc.enumerable;
}

export function ObjectFreezeTest053() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let errorType;
    try {
        Object.defineProperty(obj, 'a', { enumerable: false });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest054() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let errorType;
    try {
        Object.defineProperty(obj, 'a', { value: 2 });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest055() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let errorType;
    try {
        Object.defineProperty(obj, 'a', { writable: true });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest056() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let errorType;
    try {
        Object.defineProperty(obj, 'b', { value: 2 });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest057() {
    const obj = { a: 1, b: 2 };
    Object.freeze(obj);
    let errorType;
    try {
        Object.defineProperties(obj, {
            a: { value: 10 },
            b: { value: 20 }
        });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest058() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return [desc.value, desc.writable, desc.configurable, desc.enumerable];
}

export function ObjectFreezeTest059() {
    const obj = {
        get a() { return 1; }
    };
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return [
        desc.configurable,
        desc.enumerable,
        typeof desc.get,
        desc.set
    ];
}

export function ObjectFreezeTest060() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let errorType;
    try {
        Object.setPrototypeOf(obj, { b: 2 });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest061() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let errorType;
    try {
        obj.__proto__ = { b: 2 };
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest062() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    obj.own = 2;

    obj.inherited = 100;
    return [obj.inherited, proto.inherited];
}

export function ObjectFreezeTest063() {
    const proto = { inherited: 'proto value' };
    const obj = Object.create(proto);
    obj.own = 'own value';
    Object.freeze(obj);
    return [obj.inherited, obj.own];
}

export function ObjectFreezeTest064() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    Object.freeze(proto);
    return [Object.isFrozen(proto), Object.isFrozen(obj)];
}

export function ObjectFreezeTest065() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    obj.own = 2;
    Object.freeze(proto);
    Object.freeze(obj);
    return [Object.isFrozen(proto), Object.isFrozen(obj)];
}

export function ObjectFreezeTest066() {
    const proto = { a: 1 };
    const obj = Object.create(proto, {
        b: { value: 2, writable: true, configurable: true }
    });
    Object.freeze(obj);
    return [Object.isFrozen(obj), obj.a, obj.b];
}

export function ObjectFreezeTest067() {
    const obj = Object.create(null);
    Object.freeze(obj);
    return [Object.isFrozen(obj), Object.getPrototypeOf(obj)];
}

export function ObjectFreezeTest068() {
    const obj = Object.create(null, {
        prop: { value: 42, writable: true, configurable: true }
    });
    Object.freeze(obj);
    return [Object.isFrozen(obj), obj.prop];
}

export function ObjectFreezeTest069() {
    const arr = [];
    Object.freeze(arr);
    return [Object.isFrozen(arr), arr.length];
}

export function ObjectFreezeTest070() {
    const arr = [1];
    Object.freeze(arr);

    return arr[0];
}

export function ObjectFreezeTest072() {
    const arr = [72, 101, 108, 108, 111, 0, 0, 0, 0];
    Object.freeze(arr);
    return [arr.length, Object.isFrozen(arr)];
}

export function ObjectFreezeTest073() {
    const arr = ['!', '@', '#', '$', '%', '&', '*', '(', ')'];
    Object.freeze(arr);
    return arr[0];
}

export function ObjectFreezeTest074() {
    const arr = ['\ud83d\udc46', '\ud83d\udc7f', '\ud83d\udc40'];
    Object.freeze(arr);
    return [arr.length, Object.isFrozen(arr)];
}

export function ObjectFreezeTest075() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    let errorType;
    try {
        arr[1] = 20;
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return [errorType, arr[1]];
}

export function ObjectFreezeTest076() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    let errorType;
    try {
        arr.push(4);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return [errorType, arr.length];
}

export function ObjectFreezeTest077() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    let errorType;
    try {
        arr.pop();
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return [errorType, arr.length];
}

export function ObjectFreezeTest078() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    let errorType;
    try {
        arr.length = 0;
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return [errorType, arr.length];
}

export function ObjectFreezeTest079() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    let errorType;
    try {
        arr.splice(1, 1);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return [errorType, arr];
}

export function ObjectFreezeTest080() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    let errorType1, errorType2;
    try {
        arr.shift();
    } catch (e) {
        errorType1 = e instanceof TypeError;
    }
    try {
        arr.unshift(0);
    } catch (e) {
        errorType2 = e instanceof TypeError;
    }
    return [errorType1, errorType2, arr];
}

export function ObjectFreezeTest081() {
    const arr = [72, 101, NaN, Infinity, 108];
    Object.freeze(arr);
    return [String(arr[2]), String(Object.isFrozen(arr))];
}

export function ObjectFreezeTest082() {
    const arr = [1, null, undefined, 'test'];
    Object.freeze(arr);
    return [arr[1], arr[2]];
}

export function ObjectFreezeTest083() {
    const arr = [{ a: 1 }, { b: 2 }];
    Object.freeze(arr);

    arr[0].a = 100;
    return arr[0];
}

export function ObjectFreezeTest084() {
    const arr = [[1, 2], [3, 4]];
    Object.freeze(arr);

    arr[0][0] = 100;
    return arr;
}

export function ObjectFreezeTest085() {
    const arr = [function() { return 1; }, function() { return 2; }];
    Object.freeze(arr);

    return arr[0]();
}

export function ObjectFreezeTest086() {
    const arr = [1, , , 4];
    Object.freeze(arr);
    return [arr.length, arr[1], Object.isFrozen(arr)];
}

export function ObjectFreezeTest087() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    let sum = 0;
    arr.forEach(item => sum += item);
    return sum;
}

export function ObjectFreezeTest088() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    const mapped = arr.map(x => x * 2);
    return [mapped, arr];
}

export function ObjectFreezeTest089() {
    const arr = [1, 2, 3, 4, 5];
    Object.freeze(arr);
    const filtered = arr.filter(x => x > 2);
    return [filtered, arr];
}

export function ObjectFreezeTest090() {
    const arr = [1, 2, 3, 4, 5];
    Object.freeze(arr);
    const sliced = arr.slice(1, 3);
    return [sliced, arr];
}

export function ObjectFreezeTest091() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    return [arr.indexOf(2), arr.includes(3)];
}

export function ObjectFreezeTest092() {
    const typedArr = new Uint8Array(0);
    Object.freeze(typedArr);
    return [Object.isFrozen(typedArr), typedArr.length];
}

export function ObjectFreezeTest093() {
    let errorType, errorMessage;
    try {
        const typedArr = new Uint8Array(1);
        Object.freeze(typedArr);
    } catch (e) {
        errorType = e instanceof TypeError;
        errorMessage = e.message;
    }
    return errorType;
}

export function ObjectFreezeTest094() {
    let errorType;
    try {
        const typedArr = new Int8Array([-128, 127]);
        Object.freeze(typedArr);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest095() {
    let errorType;
    try {
        const typedArr = new Uint16Array([0, 65535]);
        Object.freeze(typedArr);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest096() {
    let errorType;
    try {
        const typedArr = new Int32Array([-2147483648, 2147483647]);
        Object.freeze(typedArr);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest097() {
    let errorType;
    try {
        const typedArr = new Float32Array([-3.4028234663852886e38, 3.4028234663852886e38]);
        Object.freeze(typedArr);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest098() {
    let errorType;
    try {
        const typedArr = new Float64Array([-1.7976931348623157e308, 1.7976931348623157e308]);
        Object.freeze(typedArr);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreezeTest099() {
    let errorType;
    try {
        const typedArr = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
        Object.freeze(typedArr);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}
