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

export function ObjectIsSealedTest001() {
    const obj = {};
    const typeResult = typeof Object.isSealed(obj);
    const sealedResult = Object.isSealed(obj);
    return [typeResult, sealedResult];
}

export function ObjectIsSealedTest002() {
    const empty = {};
    return Object.isSealed(empty);
}

export function ObjectIsSealedTest003() {
    const empty = {};
    Object.seal(empty);
    return Object.isSealed(empty);
}

export function ObjectIsSealedTest004() {
    const obj = { a: 1, b: 2 };
    return Object.isSealed(obj);
}

export function ObjectIsSealedTest005() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    return Object.isSealed(obj);
}

export function ObjectIsSealedTest006() {
    const obj = { a: { b: 1 } };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    const third = Object.isSealed(obj.a);
    return [first, second, third];
}

export function ObjectIsSealedTest007() {
    const obj = { a: { b: { c: { d: 1 } } } };
    Object.seal(obj);
    const first = Object.isSealed(obj);
    const second = Object.isSealed(obj.a);
    const third = Object.isSealed(obj.a.b);
    return [first, second, third];
}

export function ObjectIsSealedTest008() {
    const sym = Symbol('key');
    const obj = { [sym]: 'value' };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest009() {
    const sym = Symbol('key');
    const obj = { a: 1, [sym]: 'value', b: 2 };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest010() {
    const obj = { a: undefined, b: 1 };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest011() {
    const obj = { a: null, b: 1 };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest012() {
    const obj = { a: NaN, b: 1 };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest013() {
    const obj = { a: 1, b: -Infinity };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest014() {
    const obj = { a: 1, method: function() { return this.a; } };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest015() {
    const obj = { a: 1, method: () => 'arrow' };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest016() {
    const obj = { arr: [1, 2, 3] };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    const third = Object.isSealed(obj.arr);
    return [first, second, third];
}

export function ObjectIsSealedTest017() {
    const map = new Map([['key1', 'value1'], ['key2', 'value2']]);
    const obj = { map: map };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest018() {
    const set = new Set([1, 2, 3, 2, 1]);
    const obj = { set: set };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest019() {
    const obj = { date: new Date() };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest020() {
    const obj = { regex: /abc/gi, flags: /def/m };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest021() {
    const obj = { buffer: new Uint8Array([72, 101, 108, 108, 111]) };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest022() {
    const obj = { buffer: new ArrayBuffer(16) };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest023() {
    const obj = { view: new DataView(new ArrayBuffer(16)) };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest024() {
    const obj = { promise: new Promise((resolve) => setTimeout(() => resolve('done'), 100)) };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest025() {
    const sealed = { a: 1 };
    Object.seal(sealed);
    const first = Object.isSealed(sealed);
    const second = Object.isExtensible(sealed);
    return [first, second];
}

export function ObjectIsSealedTest026() {
    const obj = { a: 1 };
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    const first = desc.configurable;
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest027() {
    const obj = { a: 1 };
    Object.seal(obj);
    obj.a = 2;
    const first = obj.a;
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest028() {
    const obj = { a: 1 };
    Object.seal(obj);

    const first = obj.b;
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest029() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);

    const first = obj.a;
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest030() {
    const obj = { a: 1 };
    Object.seal(obj);
    let errorResult = false;
    try {
        Object.defineProperty(obj, 'a', { enumerable: false });
    } catch (e) {
        errorResult = e instanceof TypeError;
    }
    const sealedResult = Object.isSealed(obj);
    return [errorResult, sealedResult];
}

export function ObjectIsSealedTest031() {
    const obj = { a: 1 };
    const descBefore = Object.getOwnPropertyDescriptor(obj, 'a');
    const first = descBefore.configurable;
    const second = descBefore.writable;
    const third = Object.isSealed(obj);
    return [first, second, third];
}

export function ObjectIsSealedTest032() {
    const obj = { a: 1 };
    Object.seal(obj);
    const descAfter = Object.getOwnPropertyDescriptor(obj, 'a');
    const first = descAfter.configurable;
    const second = descAfter.writable;
    const third = Object.isSealed(obj);
    return [first, second, third];
}

export function ObjectIsSealedTest033() {
    const obj = { a: 1, b: 2 };
    Object.defineProperty(obj, 'a', { configurable: false });
    return Object.isSealed(obj);
}

export function ObjectIsSealedTest034() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'a', { configurable: false });
    const first = Object.isSealed(obj);
    Object.preventExtensions(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest035() {
    const obj = {
        get prop() { return 0; }
    };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest036() {
    let value = 0;
    const obj = {
        set prop(v) { value = v; }
    };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest037() {
    const obj = {
        get prop() { return this._prop; },
        set prop(v) { this._prop = v; }
    };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest038() {
    const obj = {};
    Object.defineProperty(obj, 'a', {
        value: 1,
        writable: false,
        configurable: true
    });
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);

    const third = obj.a;
    return [first, second, third];
}

export function ObjectIsSealedTest039() {
    const obj = { a: 1 };
    Object.seal(obj);
    Object.defineProperty(obj, 'a', { writable: false });

    const first = obj.a;
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest040() {
    const empty = {};
    Object.preventExtensions(empty);
    return Object.isSealed(empty);
}

export function ObjectIsSealedTest041() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    return Object.isSealed(obj);
}

export function ObjectIsSealedTest042() {
    const sealed = {};
    Object.seal(sealed);
    const first = Object.isExtensible(sealed);
    const second = Object.isSealed(sealed);
    return [first, second];
}

export function ObjectIsSealedTest043() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    const first = Object.isExtensible(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest044() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    Object.defineProperty(obj, 'a', { configurable: false });
    Object.defineProperty(obj, 'b', { configurable: false });
    return Object.isSealed(obj);
}

export function ObjectIsSealedTest045() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    Object.defineProperty(obj, 'a', { configurable: false });
    return Object.isSealed(obj);
}

export function ObjectIsSealedTest046() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);

    const first = obj.b;
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest047() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    delete obj.a;
    const first = obj.a;
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest048() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    obj.a = 2;
    const first = obj.a;
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest049() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    Object.defineProperty(obj, 'a', { writable: false });

    const first = obj.a;
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest050() {
    const frozen = { a: 1 };
    Object.freeze(frozen);
    const first = Object.isFrozen(frozen);
    const second = Object.isSealed(frozen);
    return [first, second];
}

export function ObjectIsSealedTest051() {
    const sealed = { a: 1 };
    Object.seal(sealed);
    const first = Object.isSealed(sealed);
    const second = Object.isFrozen(sealed);
    return [first, second];
}

export function ObjectIsSealedTest052() {
    const obj = { a: 1 };
    Object.freeze(obj);

    const first = obj.a;
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest053() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    const first = desc.writable;
    const second = desc.configurable;
    const third = Object.isSealed(obj);
    return [first, second, third];
}

export function ObjectIsSealedTest054() {
    const obj = {
        get prop() { return 0; }
    };
    Object.freeze(obj);
    const first = Object.isFrozen(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest055() {
    const obj = {
        get p() { return 0; }
    };
    Object.seal(obj);
    const first = Object.isSealed(obj);
    const second = Object.isFrozen(obj);
    return [first, second];
}

export function ObjectIsSealedTest056() {
    const empty = {};
    Object.freeze(empty);
    const first = Object.isFrozen(empty);
    const second = Object.isSealed(empty);
    const third = Object.isExtensible(empty);
    return [first, second, third];
}

export function ObjectIsSealedTest057() {
    const empty = {};
    Object.seal(empty);
    const first = Object.isSealed(empty);
    const second = Object.isFrozen(empty);
    const third = Object.isExtensible(empty);
    return [first, second, third];
}

export function ObjectIsSealedTest058() {
    const s2 = Object.seal({ p: 3 });
    const first = Object.isSealed(s2);
    const second = Object.isFrozen(s2);
    s2.p = 4;
    const third = s2.p;
    return [first, second, third];
}

export function ObjectIsSealedTest059() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'a', { writable: false });
    Object.seal(obj);
    const first = Object.isSealed(obj);
    const second = Object.isFrozen(obj);
    return [first, second];
}

export function ObjectIsSealedTest060() {
    return Object.isSealed(undefined);
}

export function ObjectIsSealedTest061() {
    return Object.isSealed(null);
}

export function ObjectIsSealedTest062() {
    const r1 = Object.isSealed(1);
    const r2 = Object.isSealed(0);
    const r3 = Object.isSealed(-0);
    const r4 = Object.isSealed(NaN);
    const r5 = Object.isSealed(Infinity);
    const r6 = Object.isSealed(-Infinity);
    return [r1, r2, r3, r4, r5, r6];
}

export function ObjectIsSealedTest063() {
    const r1 = Object.isSealed('');
    const r2 = Object.isSealed('abc');
    const r3 = Object.isSealed('Hello World');
    return [r1, r2, r3];
}

export function ObjectIsSealedTest064() {
    const r1 = Object.isSealed(true);
    const r2 = Object.isSealed(false);
    return [r1, r2];
}

export function ObjectIsSealedTest065() {
    const sym = Symbol('test');
    return Object.isSealed(sym);
}

export function ObjectIsSealedTest066() {
    const r1 = Object.isSealed(BigInt(123));
    const r2 = Object.isSealed(9007199254740991n);
    return [r1, r2];
}

export function ObjectIsSealedTest067() {
    const obj = { a: 1, b: 'test' };
    return Object.isSealed(obj);
}

export function ObjectIsSealedTest068() {
    const arr = [1, 2, 3];
    const first = Object.isSealed(arr);
    Object.seal(arr);
    const second = Object.isSealed(arr);
    return [first, second];
}

export function ObjectIsSealedTest069() {
    function fn() {}
    const first = Object.isSealed(fn);
    Object.seal(fn);
    const second = Object.isSealed(fn);
    return [first, second];
}

export function ObjectIsSealedTest070() {
    const date = new Date();
    const first = Object.isSealed(date);
    Object.seal(date);
    const second = Object.isSealed(date);
    return [first, second];
}

export function ObjectIsSealedTest071() {
    const regex = /abc/gi;
    const first = Object.isSealed(regex);
    Object.seal(regex);
    const second = Object.isSealed(regex);
    return [first, second];
}

export function ObjectIsSealedTest072() {
    const map = new Map([['a', 1], ['b', 2]]);
    const first = Object.isSealed(map);
    Object.seal(map);
    const second = Object.isSealed(map);
    return [first, second];
}

export function ObjectIsSealedTest073() {
    const set = new Set([1, 2, 3]);
    const first = Object.isSealed(set);
    Object.seal(set);
    const second = Object.isSealed(set);
    return [first, second];
}

export function ObjectIsSealedTest074() {
    const weakMap = new WeakMap();
    const first = Object.isSealed(weakMap);
    Object.seal(weakMap);
    const second = Object.isSealed(weakMap);
    return [first, second];
}

export function ObjectIsSealedTest075() {
    const weakSet = new WeakSet();
    const first = Object.isSealed(weakSet);
    Object.seal(weakSet);
    const second = Object.isSealed(weakSet);
    return [first, second];
}

export function ObjectIsSealedTest076() {
    const buffer = new ArrayBuffer(16);
    const first = Object.isSealed(buffer);
    Object.seal(buffer);
    const second = Object.isSealed(buffer);
    return [first, second];
}

export function ObjectIsSealedTest077() {
    const view = new DataView(new ArrayBuffer(16));
    const first = Object.isSealed(view);
    Object.seal(view);
    const second = Object.isSealed(view);
    return [first, second];
}

export function ObjectIsSealedTest078() {
    const promise = new Promise((resolve, reject) => {});
    const first = Object.isSealed(promise);
    Object.seal(promise);
    const second = Object.isSealed(promise);
    return [first, second];
}

export function ObjectIsSealedTest079() {
    const err = new Error('test error');
    const first = Object.isSealed(err);
    Object.seal(err);
    const second = Object.isSealed(err);
    return [first, second];
}

export function ObjectIsSealedTest080() {
    const arr = new Int8Array([1, 2, 3]);
    const first = Object.isSealed(arr);

    const second = Object.isSealed(arr);
    return [first, second];
}

export function ObjectIsSealedTest081() {
    const arr = new Uint8Array([1, 2, 3]);
    const first = Object.isSealed(arr);

    const second = Object.isSealed(arr);
    return [first, second];
}

export function ObjectIsSealedTest082() {
    const arr = new Uint8ClampedArray([1, 2, 3]);
    const first = Object.isSealed(arr);

    const second = Object.isSealed(arr);
    return [first, second];
}

export function ObjectIsSealedTest083() {
    const arr = new Int16Array([1, 2, 3]);
    const first = Object.isSealed(arr);

    const second = Object.isSealed(arr);
    return [first, second];
}

export function ObjectIsSealedTest084() {
    const arr = new Uint16Array([1, 2, 3]);
    const first = Object.isSealed(arr);

    const second = Object.isSealed(arr);
    return [first, second];
}

export function ObjectIsSealedTest085() {
    const arr = new Int32Array([1, 2, 3]);
    const first = Object.isSealed(arr);

    const second = Object.isSealed(arr);
    return [first, second];
}

export function ObjectIsSealedTest086() {
    const arr = new Uint32Array([1, 2, 3]);
    const first = Object.isSealed(arr);

    const second = Object.isSealed(arr);
    return [first, second];
}

export function ObjectIsSealedTest087() {
    const arr = new Float32Array([1.1, 2.2, 3.3]);
    const first = Object.isSealed(arr);

    const second = Object.isSealed(arr);
    return [first, second];
}

export function ObjectIsSealedTest088() {
    const arr = new Float64Array([1.1, 2.2, 3.3]);
    const first = Object.isSealed(arr);

    const second = Object.isSealed(arr);
    return [first, second];
}

export function ObjectIsSealedTest089() {
    const arr = new BigInt64Array([1n, 2n, 3n]);
    const first = Object.isSealed(arr);

    const second = Object.isSealed(arr);
    return [first, second];
}

export function ObjectIsSealedTest090() {
    const arr = new BigUint64Array([1n, 2n, 3n]);
    const first = Object.isSealed(arr);

    const second = Object.isSealed(arr);
    return [first, second];
}

export function ObjectIsSealedTest091() {
    const numObj = new Number(123);
    const strObj = new String('abc');
    const boolObj = new Boolean(true);
    const r1 = Object.isSealed(numObj);
    const r2 = Object.isSealed(strObj);
    const r3 = Object.isSealed(boolObj);
    Object.seal(numObj);
    const r4 = Object.isSealed(numObj);
    return [r1, r2, r3, r4];
}

export function ObjectIsSealedTest092() {
    const r1 = Object.isSealed(Object.prototype);
    const r2 = Object.isSealed(Array.prototype);
    Object.seal(Object.prototype);
    const r3 = Object.isSealed(Object.prototype);
    return [r1, r2, r3];
}

export function ObjectIsSealedTest093() {
    const empty = {};
    const first = Object.isSealed(empty);
    Object.seal(empty);
    const second = Object.isSealed(empty);
    return [first, second];
}

export function ObjectIsSealedTest094() {
    const noProto = Object.create(null);
    const first = Object.isSealed(noProto);
    Object.seal(noProto);
    const second = Object.isSealed(noProto);
    return [first, second];
}

export function ObjectIsSealedTest095() {
    const withProto = Object.create({});
    const first = Object.isSealed(withProto);
    Object.seal(withProto);
    const second = Object.isSealed(withProto);
    return [first, second];
}

export function ObjectIsSealedTest098() {
    const obj = { 0: 'zero', 1: 'one', 2: 'two' };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealedTest099() {
    const obj = { '!': 'exclamation', '@': 'at', '#': 'hash' };
    const first = Object.isSealed(obj);
    Object.seal(obj);
    const second = Object.isSealed(obj);
    return [first, second];
}
