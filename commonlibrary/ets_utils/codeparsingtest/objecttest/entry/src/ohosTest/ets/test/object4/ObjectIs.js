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

export function ObjectIsTest001() {
    let a = Object.is(25, 25);        
    let b = Object.is(0, 0);          
    let c = Object.is(-100, -100);    
    let d = Object.is(3.14, 3.14);    
    return [a, b, c, d];
}

export function ObjectIsTest002() {
    let a = Object.is("foo", "foo");  
    let b = Object.is("", "");        
    let c = Object.is("hello world", "hello world"); 
    return [a, b, c];
}

export function ObjectIsTest003() {
    let a = Object.is(true, true);
    let b = Object.is(false, false);
    return [a, b];
}

export function ObjectIsTest004() {
    let a = Object.is(null, null);
    let b = Object.is(undefined, undefined);
    let c = Object.is(null, undefined);
    return [a, b, c];
}

export function ObjectIsTest005() {
    let a = Object.is(25, 26);
    let b = Object.is(0, 1);
    let c = Object.is(-100, 100);
    return [a, b, c];
}

export function ObjectIsTest006() {
    let a = Object.is("foo", "bar");
    let b = Object.is("a", "A");
    let c = Object.is("hello", "Hello");
    return [a, b, c];
}

export function ObjectIsTest007() {
    let a = Object.is(true, false);
    let b = Object.is(false, true);
    return [a, b];
}

export function ObjectIsTest008() {
    let a = typeof Object.is(1, 1);
    let b = typeof Object.is(1, 2);
    return [a, b];
}

export function ObjectIsTest009() {
    let a = Object.is(1, 1) === true;
    let b = Object.is(1, 2) === false;
    let c = Object.is(NaN, NaN) === true;
    return [a, b, c];
}

export function ObjectIsTest010() {
    let a = Object.is(0, -0);
    let b = Object.is(+0, -0);
    let c = Object.is(-0, 0);
    let d = Object.is(-0, +0);
    return [a, b, c, d];
}

export function ObjectIsTest011() {
    let a = Object.is(0, 0);
    let b = Object.is(+0, +0);
    let c = Object.is(0, +0);
    return [a, b, c];
}

export function ObjectIsTest012() {
    let a = Object.is(-0, -0);
    return a;
}

export function ObjectIsTest013() {
    let a = Object.is(1/Infinity, 0);
    let b = Object.is(-1/Infinity, -0);
    let c = Object.is(0 * -1, -0);
    let d = Object.is(-0 * -1, 0);
    return [a, b, c, d];
}

export function ObjectIsTest014() {
    let a = Object.is(NaN, NaN);
    let b = Object.is(Number.NaN, NaN);
    return [a, b];
}

export function ObjectIsTest015() {
    let a = Object.is(NaN, 0/0);
    let b = Object.is(NaN, 0/0);
    let c = Object.is(NaN, Infinity/Infinity);
    let d = Object.is(NaN, Math.sqrt(-1));
    let e = Object.is(NaN, parseInt("abc"));
    let f = Object.is(NaN, Number("abc"));
    return [a, b, c, d, e, f];
}

export function ObjectIsTest016() {
    let a = Object.is(NaN, 0);
    let b = Object.is(NaN, undefined);
    let c = Object.is(NaN, null);
    let d = Object.is(NaN, "NaN");
    let e = Object.is(NaN, {});
    return [a, b, c, d, e];
}

export function ObjectIsTest017() {
    let a = Object.is(Number.NaN, NaN);
    let b = Object.is(0/0, NaN);
    let c = Object.is(parseInt("abc"), NaN);
    let d = Object.is(Math.sqrt(-1), NaN);
    return [a, b, c, d];
}

export function ObjectIsTest018() {
    let a = Object.is(Infinity, Infinity);
    let b = Object.is(Number.POSITIVE_INFINITY, Infinity);
    let c = Object.is(1/0, Infinity);
    let d = Object.is(Infinity, Number.MAX_VALUE * 2);
    return [a, b, c, d];
}

export function ObjectIsTest019() {
    let a = Object.is(-Infinity, -Infinity);
    let b = Object.is(Number.NEGATIVE_INFINITY, -Infinity);
    let c = Object.is(-1/0, -Infinity);
    return [a, b, c];
}

export function ObjectIsTest020() {
    let a = Object.is(Infinity, -Infinity);
    let b = Object.is(Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY);
    return [a, b];
}

export function ObjectIsTest021() {
    let a = Object.is("hello", new String("hello"));
    let b = Object.is("test", String("test"));
    let c = Object.is("abc", Object("abc"));
    return [a, b, c];
}

export function ObjectIsTest022() {
    let a = Object.is(123, new Number(123));
    let b = Object.is(42, Number(42));
    let c = Object.is(0, Object(0));
    return [a, b, c];
}

export function ObjectIsTest023() {
    let a = Object.is(true, new Boolean(true));
    let b = Object.is(false, new Boolean(false));
    let c = Object.is(true, Boolean(1));
    return [a, b, c];
}

export function ObjectIsTest024() {
    let a = Object.is(1, "1");
    let b = Object.is(0, "0");
    let c = Object.is(123, "123");
    let d = Object.is(0, "");
    return [a, b, c, d];
}

export function ObjectIsTest025() {
    let a = Object.is(1, true);
    let b = Object.is(0, false);
    let c = Object.is(1, true);
    return [a, b, c];
}

export function ObjectIsTest026() {
    let a = Object.is("true", true);
    let b = Object.is("false", false);
    let c = Object.is("", false);
    return [a, b, c];
}

export function ObjectIsTest027() {
    let a = Object.is(null, undefined);
    let b = Object.is(undefined, null);
    return [a, b];
}

export function ObjectIsTest028() {
    let a = Object.is(null, 0);
    let b = Object.is(0, null);
    return [a, b];
}

export function ObjectIsTest029() {
    let a = Object.is(undefined, NaN);
    let b = Object.is(NaN, undefined);
    return [a, b];
}

export function ObjectIsTest030() {
    const sym = Symbol("foo");
    let a = Object.is(sym, sym);
    return a;
}

export function ObjectIsTest031() {
    let a = Object.is(Symbol("foo"), Symbol("foo"));
    let b = Object.is(Symbol(), Symbol());
    return [a, b];
}

export function ObjectIsTest032() {
    let a = Object.is(Symbol.for("foo"), Symbol.for("foo"));
    let b = Object.is(Symbol.for("a"), Symbol.for("a"));
    let c = Object.is(Symbol.for("a"), Symbol.for("b"));
    return [a, b, c];
}

export function ObjectIsTest033() {
    let a = Object.is(1n, 1n);
    let b = Object.is(BigInt(123), BigInt(123));
    let c = Object.is(9007199254740991n, 9007199254740991n);
    return [a, b, c];
}

export function ObjectIsTest034() {
    let a = Object.is(1n, 2n);
    let b = Object.is(0n, 1n);
    let c = Object.is(-1n, 1n);
    return [a, b, c];
}

export function ObjectIsTest035() {
    let a = Object.is(1n, 1);
    let b = Object.is(0n, 0);
    let c = Object.is(BigInt(1), 1);
    return [a, b, c];
}

export function ObjectIsTest036() {
    const obj = { a: 1 };
    let a = Object.is(obj, obj);
    const sameObj = obj;
    let b = Object.is(obj, sameObj);
    return [a, b];
}

export function ObjectIsTest037() {
    let a = Object.is({ a: 1 }, { a: 1 });
    let b = Object.is({}, {});
    let c = Object.is({ x: 1, y: 2 }, { x: 1, y: 2 });
    return [a, b, c];
}

export function ObjectIsTest038() {
    let a = Object.is({}, {});
    const empty1 = {};
    const empty2 = {};
    let b = Object.is(empty1, empty2);
    let c = Object.is(empty1, empty1);
    return [a, b, c];
}

export function ObjectIsTest039() {
    const arr = [1, 2, 3];
    let a = Object.is(arr, arr);
    const sameArr = arr;
    let b = Object.is(arr, sameArr);
    return [a, b];
}

export function ObjectIsTest040() {
    let a = Object.is([1, 2], [1, 2]);
    let b = Object.is([], []);
    let c = Object.is([1], [1]);
    return [a, b, c];
}

export function ObjectIsTest041() {
    const nested = [[1, 2], [3, 4]];
    let a = Object.is(nested, nested);
    let b = Object.is(nested[0], nested[0]);
    let c = Object.is([[1]], [[1]]);
    return [a, b, c];
}

export function ObjectIsTest042() {
    function foo() {}
    let a = Object.is(foo, foo);
    const bar = foo;
    let b = Object.is(foo, bar);
    return [a, b];
}

export function ObjectIsTest043() {
    let a = Object.is(function() {}, function() {});
    let b = Object.is(() => {}, () => {});
    const fn1 = () => {};
    const fn2 = () => {};
    let c = Object.is(fn1, fn2);
    return [a, b, c];
}

export function ObjectIsTest044() {
    const fn1 = function() { return 1; };
    const fn2 = function() { return 1; };
    let a = Object.is(fn1, fn2);
    return a;
}

export function ObjectIsTest045() {
    const date = new Date();
    let a = Object.is(date, date);
    let b = Object.is(new Date(), new Date());
    let c = Object.is(new Date(0), new Date(0));
    return [a, b, c];
}

export function ObjectIsTest046() {
    const regex = /abc/g;
    let a = Object.is(regex, regex);
    let b = Object.is(/abc/g, /abc/g);
    let c = Object.is(new RegExp("abc"), new RegExp("abc"));
    return [a, b, c];
}

export function ObjectIsTest047() {
    const map = new Map([["a", 1]]);
    let a = Object.is(map, map);
    let b = Object.is(new Map(), new Map());
    let c = Object.is(new Map([["a", 1]]), new Map([["a", 1]]));
    return [a, b, c];
}

export function ObjectIsTest048() {
    const set = new Set([1, 2, 3]);
    let a = Object.is(set, set);
    let b = Object.is(new Set(), new Set());
    let c = Object.is(new Set([1, 2]), new Set([1, 2]));
    return [a, b, c];
}

export function ObjectIsTest049() {
    const buffer = new ArrayBuffer(16);
    let a = Object.is(buffer, buffer);
    let b = Object.is(new ArrayBuffer(16), new ArrayBuffer(16));
    const typed = new Uint8Array([1, 2, 3]);
    let c = Object.is(typed, typed);
    let d = Object.is(new Uint8Array([1, 2]), new Uint8Array([1, 2]));
    return [a, b, c, d];
}

export function ObjectIsTest050() {
    const promise = Promise.resolve(1);
    let a = Object.is(promise, promise);
    let b = Object.is(Promise.resolve(1), Promise.resolve(1));
    return [a, b];
}

export function ObjectIsTest052() {
    let a = Object.is(Object, Object);
    let b = Object.is(Array, Array);
    let c = Object.is(Function, Function);
    let d = Object.is(Date, Date);
    return [a, b, c, d];
}

export function ObjectIsTest053() {
    let a = Object.is(Object.prototype, Object.prototype);
    let b = Object.is(Array.prototype, Array.prototype);
    let c = Object.is(Function.prototype, Function.prototype);
    return [a, b, c];
}

export function ObjectIsTest054() {
    let a = Object.is("", "");
    let b = Object.is("", " ");
    let c = Object.is("", null);
    let d = Object.is("", undefined);
    return [a, b, c, d];
}

export function ObjectIsTest055() {
    let a = Object.is("!", "!");
    let b = Object.is("@", "@");
    let c = Object.is("#", "#");
    let d = Object.is("$", "$");
    let e = Object.is("\n", "\n");
    let f = Object.is("\t", "\t");
    let g = Object.is("\r", "\r");
    return [a, b, c, d, e, f, g];
}

export function ObjectIsTest056() {
    let a = Object.is("\\", "\\");
    let b = Object.is("\"", "\"");
    let c = Object.is("\'", "\'");
    let d = Object.is("\0", "\0");
    return [a, b, c, d];
}

export function ObjectIsTest057() {
    let a = Object.is("你好", "你好");
    let b = Object.is("🔥", "🔥");
    let c = Object.is("👨‍👩‍👧‍👦", "👨‍👩‍👧‍👦");
    let d = Object.is("\u{1F600}", "\u{1F600}");
    let e = Object.is("\uD83D\uDE00", "😀");
    return [a, b, c, d, e];
}

export function ObjectIsTest059() {
    const name = "world";
    let a = Object.is(`hello ${name}`, `hello world`);
    let b = Object.is(`test`, "test");
    return [a, b];
}

export function ObjectIsTest060() {
    let a = Object.is(Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER);
    let b = Object.is(Number.MIN_SAFE_INTEGER, Number.MIN_SAFE_INTEGER);
    let c = Object.is(9007199254740991, 9007199254740991);
    let d = Object.is(-9007199254740991, -9007199254740991);
    return [a, b, c, d];
}

export function ObjectIsTest061() {
    let a = Object.is(0.1, 0.1);
    let b = Object.is(3.14159, 3.14159);
    let c = Object.is(-1.5, -1.5);
    let d = Object.is(Number.EPSILON, Number.EPSILON);
    return [a, b, c, d];
}

export function ObjectIsTest062() {
    let a = Object.is(Number.MAX_VALUE, Number.MAX_VALUE);
    let b = Object.is(Number.MIN_VALUE, Number.MIN_VALUE);
    let c = Object.is(-Number.MAX_VALUE, -Number.MAX_VALUE);
    return [a, b, c];
}

export function ObjectIsTest063() {
    let a = Object.is(0xFF, 255);
    let b = Object.is(0o77, 63);
    let c = Object.is(0b1111, 15);
    let d = Object.is(0xFF, 0xFF);
    return [a, b, c, d];
}

export function ObjectIsTest064() {
    let a = Object.is(1e3, 1000);
    let b = Object.is(2.5e-2, 0.025);
    let c = Object.is(1.79e308, 1.79e308);
    return [a, b, c];
}

export function ObjectIsTest065() {
    let a = Object.is(true, true);
    let b = Object.is(true, 1);
    let c = Object.is(true, "true");
    let d = Object.is(true, !false);
    return [a, b, c, d];
}

export function ObjectIsTest066() {
    let a = Object.is(false, false);
    let b = Object.is(false, 0);
    let c = Object.is(false, "");
    let d = Object.is(false, !true);
    return [a, b, c, d];
}

export function ObjectIsTest067() {
    let a = Object.is(undefined, undefined);
    let b = Object.is(void 0, undefined);
    let uninit;
    let c = Object.is(uninit, undefined);
    return [a, b, c];
}

export function ObjectIsTest068() {
    let a = Object.is(null, null);
    let b = Object.is(null, undefined);
    let c = Object.is(null, 0);
    let d = Object.is(null, "");
    return [a, b, c, d];
}

export function ObjectIsTest069() {
    let a = Object.is(new Int8Array([127])[0], 127);
    let b = Object.is(new Int8Array([-128])[0], -128);
    let c = Object.is(new Int8Array([128])[0], -128);
    let d = Object.is(new Int8Array([-129])[0], 127);
    return [a, b, c, d];
}

export function ObjectIsTest070() {
    let a = Object.is(new Uint8Array([0])[0], 0);
    let b = Object.is(new Uint8Array([255])[0], 255);
    let c = Object.is(new Uint8Array([256])[0], 0);
    let d = Object.is(new Uint8Array([-1])[0], 255);
    return [a, b, c, d];
}

export function ObjectIsTest071() {
    let a = Object.is(new Int16Array([32767])[0], 32767);
    let b = Object.is(new Int16Array([-32768])[0], -32768);
    return [a, b];
}

export function ObjectIsTest072() {
    let a = Object.is(new Uint16Array([0])[0], 0);
    let b = Object.is(new Uint16Array([65535])[0], 65535);
    return [a, b];
}

export function ObjectIsTest073() {
    let a = Object.is(new Int32Array([2147483647])[0], 2147483647);
    let b = Object.is(new Int32Array([-2147483648])[0], -2147483648);
    return [a, b];
}

export function ObjectIsTest074() {
    let a = Object.is(new Float32Array([3.14])[0], 3.140000104904175);
    let b = Object.is(new Float64Array([3.14])[0], 3.14);
    let c = Object.is(new Float32Array([Infinity])[0], Infinity);
    let d = Object.is(new Float32Array([NaN])[0], NaN);
    return [a, b, c, d];
}

export function ObjectIsTest075() {
    let a = Object.is(new BigInt64Array([9223372036854775807n])[0], 9223372036854775807n);
    let b = Object.is(new BigInt64Array([-9223372036854775808n])[0], -9223372036854775808n);
    return [a, b];
}

export function ObjectIsTest076() {
    let a = Object.is(new BigUint64Array([0n])[0], 0n);
    let b = Object.is(new BigUint64Array([18446744073709551615n])[0], 18446744073709551615n);
    return [a, b];
}

export function ObjectIsTest077() {
    const frozen = Object.freeze({ a: 1 });
    let a = Object.is(frozen, frozen);
    let b = Object.is(Object.freeze({ a: 1 }), Object.freeze({ a: 1 }));
    return [a, b];
}

export function ObjectIsTest078() {
    const sealed = Object.seal({ a: 1 });
    let a = Object.is(sealed, sealed);
    let b = Object.is(Object.seal({ a: 1 }), Object.seal({ a: 1 }));
    return [a, b];
}

export function ObjectIsTest079() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    let a = Object.is(obj, obj);
    return a;
}

export function ObjectIsTest080() {
    const obj = {
        get value() { return 1; },
        set value(v) {}
    };
    let a = Object.is(obj, obj);
    return a;
}

export function ObjectIsTest081() {
    const proto = { a: 1 };
    const obj1 = Object.create(proto);
    const obj2 = Object.create(proto);
    let a = Object.is(obj1, obj1);
    let b = Object.is(obj1, obj2);
    let c = Object.is(Object.create(null), Object.create(null));
    return [a, b, c];
}

export function ObjectIsTest082() {
    const obj = {};
    let a = Object.is(Object.getPrototypeOf(obj), Object.prototype);
    let b = Object.is(Object.getPrototypeOf([]), Array.prototype);
    return [a, b];
}

export function ObjectIsTest083() {
    const obj = {};
    obj.self = obj;
    let a = Object.is(obj, obj);
    let b = Object.is(obj.self, obj);
    let c = Object.is(obj.self, obj.self);
    return [a, b, c];
}

export function ObjectIsTest084() {
    const aObj = {};
    const bObj = {};
    aObj.ref = bObj;
    bObj.ref = aObj;
    let a = Object.is(aObj, aObj);
    let b = Object.is(bObj, bObj);
    let c = Object.is(aObj.ref, bObj);
    let d = Object.is(bObj.ref, aObj);
    return [a, b, c, d];
}

export function ObjectIsTest085() {
    let a = Object.is(0, -0);
    let b = (0 === -0);
    let c = Object.is(+0, -0);
    let d = (+0 === -0);
    return [a, b, c, d];
}

export function ObjectIsTest086() {
    let a = Object.is(NaN, NaN);
    let b = (NaN === NaN);
    let c = Object.is(NaN, 0/0);
    let d = (NaN === 0/0);
    return [a, b, c, d];
}

export function ObjectIsTest087() {
    let a = Object.is(1, 1) === (1 === 1);
    let b = Object.is("a", "a") === ("a" === "a");
    let c = Object.is(true, true) === (true === true);
    let d = Object.is(null, null) === (null === null);
    let e = Object.is(undefined, undefined) === (undefined === undefined);
    const obj = {};
    let f = Object.is(obj, obj) === (obj === obj);
    let g = Object.is(1, "1") === (1 === "1");
    let h = Object.is({}, {}) === ({} === {});
    return [a, b, c, d, e, f, g, h];
}

export function ObjectIsTest088() {
    let a = Object.is(1, "1");
    let b = (1 == "1");
    let c = Object.is(null, undefined);
    let d = (null == undefined);
    let e = Object.is(true, 1);
    let f = (true == 1);
    let g = Object.is(false, 0);
    let h = (false == 0);
    let i = Object.is(true, "1");
    let j = (true == "1");
    let k = Object.is(false, "0");
    let l = (false == "0");
    let m = Object.is("", 0);
    let n = ("" == 0);
    return [a, b, c, d, e, f, g, h, i, j, k, l, m, n];
}

export function ObjectIsTest089() {
    let a = Object.is(NaN, NaN);
    let b = (NaN == NaN);
    let c = Object.is(0, -0);
    let d = (0 == -0);
    return [a, b, c, d];
}

export function ObjectIsTest090() {
    let a = 1 == '1';
    let b = 1 === '1';
    let c = Object.is(1, '1');
    let d = 0 == false;
    let e = 0 === false;
    let f = Object.is(0, false);
    let g = null == undefined;
    let h = null === undefined;
    let i = Object.is(null, undefined);
    let j = NaN == NaN;
    let k = NaN === NaN;
    let l = Object.is(NaN, NaN);
    let m = 0 == -0;
    let n = 0 === -0;
    let o = Object.is(0, -0);
    return [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o];
}

export function ObjectIsTest091() {
    let a = Object.is();
    let b = Object.is() === false;
    return [a, b];
}

export function ObjectIsTest092() {
    let a = Object.is(undefined);
    let b = Object.is(1);
    let c = Object.is(null);
    let d = Object.is("test");
    let e = Object.is({});
    return [a, b, c, d, e];
}

export function ObjectIsTest093() {
    let a = Object.is(1, 1);
    let b = Object.is("a", "a");
    let c = Object.is(null, null);
    return [a, b, c];
}

export function ObjectIsTest094() {
    let a = Object.is(1, 1, 2);
    let b = Object.is(1, 2, 1);
    let c = Object.is(1, 1, 1, 1, 1);
    return [a, b, c];
}

export function ObjectIsTest095() {
    let a = Object.is(undefined, null);
    let b = Object.is(undefined, 0);
    let c = Object.is(undefined, "");
    let d = Object.is(undefined, false);
    let e = Object.is(undefined, 1n);
    let f = Object.is(undefined, Symbol());
    let g = Object.is(null, undefined);
    let h = Object.is(null, 0);
    let i = Object.is(null, "");
    let j = Object.is(null, false);
    let k = Object.is(0, "0");
    let l = Object.is(0, false);
    let m = Object.is(0, null);
    let n = Object.is(0, undefined);
    let o = Object.is("", 0);
    let p = Object.is("", false);
    let q = Object.is("", null);
    let r = Object.is(true, 1);
    let s = Object.is(false, 0);
    let t = Object.is(true, "true");
    let u = Object.is(1n, 1);
    let v = Object.is(0n, 0);
    let w = Object.is(1n, "1");
    let x = Object.is(Symbol(), Symbol());
    let y = Object.is(Symbol("a"), Symbol("a"));
    return [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y];
}

export function ObjectIsTest096() {
    let a = Object.is("str", new String("str"));
    let b = Object.is(123, new Number(123));
    let c = Object.is(true, new Boolean(true));
    let d = Object.is(1, [1]);
    let e = Object.is("a", ["a"]);
    let f = Object.is("a", { valueOf: () => "a" });
    let g = Object.is(1, { valueOf: () => 1 });
    return [a, b, c, d, e, f, g];
}

export function ObjectIsTest097() {
    let a = Object.is(NaN, NaN);
    let b = Object.is(NaN, undefined);
    let c = Object.is(NaN, null);
    let d = Object.is(NaN, 0);
    let e = Object.is(NaN, "");
    let f = Object.is(NaN, false);
    let g = Object.is(NaN, {});
    let h = Object.is(NaN, []);
    let i = Object.is(NaN, [NaN]);
    let j = Object.is(NaN, { valueOf: () => NaN });
    return [a, b, c, d, e, f, g, h, i, j];
}

export function ObjectIsTest098() {
    let a = Object.is(0, 0);
    let b = Object.is(0, -0);
    let c = Object.is(-0, -0);
    let d = Object.is(0, "0");
    let e = Object.is(0, false);
    let f = Object.is(0, null);
    let g = Object.is(0, undefined);
    let h = Object.is(0, []);
    let i = Object.is(0, [0]);
    return [a, b, c, d, e, f, g, h, i];
}

export function ObjectIsTest099() {
    let a = Object.is(Infinity, Infinity);
    let b = Object.is(Infinity, -Infinity);
    let c = Object.is(Infinity, Number.POSITIVE_INFINITY);
    let d = Object.is(Infinity, 1/0);
    let e = Object.is(Infinity, "Infinity");
    let f = Object.is(Infinity, null);
    let g = Object.is(Infinity, undefined);
    return [a, b, c, d, e, f, g];
}
