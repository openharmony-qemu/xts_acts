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

export function ObjectIsExtensibleTest002() {
    let deep = {};
    let current = deep;
    for (let i = 0; i < 100; i++) {
        current.nested = {};
        current = current.nested;
    }
    let a = Object.is(deep, deep);
    let b = Object.is(deep.nested, deep.nested);
    return [a, b];
}

export function ObjectIsExtensibleTest003() {
    let a = Object.is(123, 123);
    let b = Object.is(123, Number("123"));
    let c = Object.is(123, parseInt("123"));

    let d = Object.is("hello", "hello");
    let e = Object.is("hello", String("hello"));
    let f = Object.is("hello", new String("hello").valueOf());

    let g = Object.is(true, true);
    let h = Object.is(true, Boolean(1));
    let i = Object.is(true, !!1);

    let j = Object.is([1, 2], [1, 2]);
    let k = Object.is([1, 2], [1, 2].slice());
    return [a, b, c, d, e, f, g, h, i, j, k];
}

export function ObjectIsExtensibleTest004() {
    let a = typeof Object.is(1, 1);
    let b = typeof Object.is(1, 2);
    let c = typeof Object.is(NaN, NaN);
    let d = typeof Object.is(0, -0);
    let e = typeof Object.is();
    let f = typeof Object.is(null, undefined);
    return [a, b, c, d, e, f];
}

export function ObjectIsExtensibleTest005() {
    let a = Object.is(1, 1) === true;
    let b = Object.is(1, 2) === false;
    let c = Object.is(1, 1) !== 1;
    let d = Object.is(1, 1) !== "true";
    let e = Object.is(0, 0) !== 0;
    let f = Object.is(null, null) !== null;
    return [a, b, c, d, e, f];
}

export function ObjectIsExtensibleTest006() {
    const obj = {a: 1, b: 2};
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest007() {
    const empty = {};
    let res = Object.isExtensible(empty);
    return res;
}

export function ObjectIsExtensibleTest008() {
    const arr = [1, 2, 3];
    let res = Object.isExtensible(arr);
    return res;
}

export function ObjectIsExtensibleTest009() {
    function func() {}
    let res = Object.isExtensible(func);
    return res;
}

export function ObjectIsExtensibleTest010() {
    const date = new Date();
    let res = Object.isExtensible(date);
    return res;
}

export function ObjectIsExtensibleTest011() {
    const regex = /abc/gi;
    let res = Object.isExtensible(regex);
    return res;
}

export function ObjectIsExtensibleTest012() {
    const map = new Map([['key1', 'value1'], ['key2', 'value2']]);
    let res = Object.isExtensible(map);
    return res;
}

export function ObjectIsExtensibleTest013() {
    const set = new Set([1, 2, 3]);
    let res = Object.isExtensible(set);
    return res;
}

export function ObjectIsExtensibleTest014() {
    const weakMap = new WeakMap();
    let res = Object.isExtensible(weakMap);
    return res;
}

export function ObjectIsExtensibleTest015() {
    const weakSet = new WeakSet();
    let res = Object.isExtensible(weakSet);
    return res;
}

export function ObjectIsExtensibleTest016() {
    const error = new Error('test error');
    let res = Object.isExtensible(error);
    return res;
}

export function ObjectIsExtensibleTest017() {
    const promise = new Promise((resolve) => resolve('done'));
    let res = Object.isExtensible(promise);
    return res;
}

export function ObjectIsExtensibleTest018() {
    const buffer = new ArrayBuffer(16);
    let res = Object.isExtensible(buffer);
    return res;
}

export function ObjectIsExtensibleTest019() {
    const int8Array = new Int8Array([1, 2, 3]);
    let res1 = Object.isExtensible(int8Array);

    const uint8Array = new Uint8Array([1, 2, 3]);
    let res2 = Object.isExtensible(uint8Array);

    const int16Array = new Int16Array([1, 2, 3]);
    let res3 = Object.isExtensible(int16Array);

    const uint16Array = new Uint16Array([1, 2, 3]);
    let res4 = Object.isExtensible(uint16Array);

    const int32Array = new Int32Array([1, 2, 3]);
    let res5 = Object.isExtensible(int32Array);

    const uint32Array = new Uint32Array([1, 2, 3]);
    let res6 = Object.isExtensible(uint32Array);

    const float32Array = new Float32Array([1.5, 2.5, 3.5]);
    let res7 = Object.isExtensible(float32Array);

    const float64Array = new Float64Array([1.5, 2.5, 3.5]);
    let res8 = Object.isExtensible(float64Array);

    const bigInt64Array = new BigInt64Array([1n, 2n, 3n]);
    let res9 = Object.isExtensible(bigInt64Array);

    const bigUint64Array = new BigUint64Array([1n, 2n, 3n]);
    let res10 = Object.isExtensible(bigUint64Array);

    return [res1, res2, res3, res4, res5, res6, res7, res8, res9, res10];
}

export function ObjectIsExtensibleTest020() {
    const buffer = new ArrayBuffer(16);
    const dataView = new DataView(buffer);
    let res = Object.isExtensible(dataView);
    return res;
}

export function ObjectIsExtensibleTest021() {
    const nestedObj = {a: 1, b: {c: 2, d: {e: 3}}};
    let res1 = Object.isExtensible(nestedObj);
    let res2 = Object.isExtensible(nestedObj.b);
    let res3 = Object.isExtensible(nestedObj.b.d);
    return [res1, res2, res3];
}

export function ObjectIsExtensibleTest022() {
    const sym = Symbol("key");
    const obj = {[sym]: "value", a: 1};
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest023() {
    const obj = {a: 1, b: function() {}};
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest025() {
    let res1 = Object.isExtensible("hello");
    let res2 = Object.isExtensible("");
    let res3 = Object.isExtensible("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
    let res4 = Object.isExtensible("👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴");
    return [res1, res2, res3, res4];
}

export function ObjectIsExtensibleTest026() {
    let res1 = Object.isExtensible(0);
    let res2 = Object.isExtensible(1);
    let res3 = Object.isExtensible(-0);
    let res4 = Object.isExtensible(NaN);
    let res5 = Object.isExtensible(Infinity);
    let res6 = Object.isExtensible(-Infinity);
    let res7 = Object.isExtensible(123.456);
    let res8 = Object.isExtensible(Number.MAX_VALUE);
    let res9 = Object.isExtensible(Number.MIN_VALUE);
    let res10 = Object.isExtensible(Number.MAX_SAFE_INTEGER);
    let res11 = Object.isExtensible(0x0102);
    let res12 = Object.isExtensible(1e3);
    return [res1, res2, res3, res4, res5, res6, res7, res8, res9, res10, res11, res12];
}

export function ObjectIsExtensibleTest027() {
    let res1 = Object.isExtensible(true);
    let res2 = Object.isExtensible(false);
    return [res1, res2];
}

export function ObjectIsExtensibleTest028() {
    let res1 = Object.isExtensible(123n);
    let res2 = Object.isExtensible(BigInt(9007199254740991));
    return [res1, res2];
}

export function ObjectIsExtensibleTest029() {
    let res1 = Object.isExtensible(Symbol("test"));
    let res2 = Object.isExtensible(Symbol.iterator);
    return [res1, res2];
}

export function ObjectIsExtensibleTest030() {
    let res = Object.isExtensible(undefined);
    return res;
}

export function ObjectIsExtensibleTest031() {
    let res = Object.isExtensible(null);
    return res;
}

export function ObjectIsExtensibleTest032() {
    const obj = {};
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest033() {
    const obj = {a: 1, b: 2, c: 3};
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest034() {
    const obj = new Object();
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest035() {
    const obj = Object.create({});
    let res1 = Object.isExtensible(obj);

    const objWithProto = Object.create({parentProp: 1});
    let res2 = Object.isExtensible(objWithProto);
    return [res1, res2];
}

export function ObjectIsExtensibleTest036() {
    const obj = {};
    obj.newProp = "value";
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest037() {
    const obj = {a: 1, b: 2};
    delete obj.a;
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest038() {
    const obj = {a: 1, b: 2};
    obj.a = 100;
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest039() {
    const obj = {a: 1, b: 2};
    let res1 = Object.isExtensible(obj);
    Object.preventExtensions(obj);
    let res2 = Object.isExtensible(obj);
    return [res1, res2];
}

export function ObjectIsExtensibleTest040() {
    const empty = {};
    Object.preventExtensions(empty);
    let res = Object.isExtensible(empty);
    return res;
}

export function ObjectIsExtensibleTest041() {
    const nestedObj = {a: 1, b: {c: 2}};
    Object.preventExtensions(nestedObj);
    let res1 = Object.isExtensible(nestedObj);
    let res2 = Object.isExtensible(nestedObj.b);
    return [res1, res2];
}

export function ObjectIsExtensibleTest042() {
    const obj = {a: 1, b: 2};
    Object.seal(obj);
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest043() {
    const obj = {a: 1, b: 2};
    Object.freeze(obj);
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest044() {
    const obj = {a: 1, b: 2};
    Reflect.preventExtensions(obj);
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest045() {
    const obj = {a: 1, b: 2};
    Object.preventExtensions(obj);
    Object.preventExtensions(obj);
    Object.preventExtensions(obj);
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest046() {
    const obj = {a: 1, b: 2};
    Object.seal(obj);
    Object.preventExtensions(obj);
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest047() {
    const obj = {a: 1, b: 2};
    Object.freeze(obj);
    Object.preventExtensions(obj);
    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest048() {
    const proto = {a: 1};
    Object.preventExtensions(proto);
    const child = Object.create(proto);
    let res1 = Object.isExtensible(proto);
    let res2 = Object.isExtensible(child);
    return [res1, res2];
}

export function ObjectIsExtensibleTest049() {
    const obj = {a: 1, b: 2};
    let res1 = Object.isExtensible(obj);

    const result = Object.preventExtensions(obj);
    let res2 = Object.isExtensible(obj);
    let res3 = result === obj;
    return [res1, res2, res3];
}

export function ObjectIsExtensibleTest051() {
    const obj = {a: 1, b: 2};
    Object.preventExtensions(obj);
    obj.a = 100;
    let res1 = obj.a;
    let res2 = Object.isExtensible(obj);
    return [res1, res2];
}

export function ObjectIsExtensibleTest052() {
    const obj = {a: 1, b: 2};
    Object.preventExtensions(obj);
    delete obj.a;
    let res1 = obj.a;
    let res2 = Object.isExtensible(obj);
    return [res1, res2];
}

export function ObjectIsExtensibleTest053() {
    const obj = {a: 1};
    Object.preventExtensions(obj);
    let isTypeError = false;
    try {
        Object.defineProperty(obj, 'b', {value: 2, writable: true});
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError;
}

export function ObjectIsExtensibleTest054() {
    const obj = {a: 1};
    Object.preventExtensions(obj);
    Object.defineProperty(obj, 'a', {value: 100, writable: false});
    let res = obj.a;
    return res;
}

export function ObjectIsExtensibleTest055() {
    const obj = {a: 1};
    Object.preventExtensions(obj);

    Object.defineProperties(obj, {
        a: {value: 100, writable: true}
    });
    let res1 = obj.a;

    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            b: {value: 2, writable: true}
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return [res1, isTypeError];
}

export function ObjectIsExtensibleTest056() {
    const obj = {a: 1, b: 2};
    let res1 = Object.isExtensible(obj);
    Object.seal(obj);
    let res2 = Object.isExtensible(obj);
    let res3 = Object.isSealed(obj);
    return [res1, res2, res3];
}

export function ObjectIsExtensibleTest057() {
    const obj = {a: 1, b: 2};
    let res1 = Object.isExtensible(obj);
    Object.freeze(obj);
    let res2 = Object.isExtensible(obj);
    let res3 = Object.isFrozen(obj);
    return [res1, res2, res3];
}

export function ObjectIsExtensibleTest058() {
    const obj1 = {a: 1, b: 2};
    Object.preventExtensions(obj1);
    let res1 = Object.isExtensible(obj1);
    let res2 = Object.isSealed(obj1);

    const obj2 = {a: 1, b: 2};
    Object.seal(obj2);
    let res3 = Object.isExtensible(obj2);
    let res4 = Object.isSealed(obj2);
    return [res1, res2, res3, res4];
}

export function ObjectIsExtensibleTest060() {
    const obj = {a: 1, b: 2};

    let res1 = Object.isExtensible(obj);
    let res2 = Object.isSealed(obj);
    let res3 = Object.isFrozen(obj);

    Object.preventExtensions(obj);
    let res4 = Object.isExtensible(obj);
    let res5 = Object.isSealed(obj);
    let res6 = Object.isFrozen(obj);

    Object.seal(obj);
    let res7 = Object.isExtensible(obj);
    let res8 = Object.isSealed(obj);
    let res9 = Object.isFrozen(obj);

    Object.freeze(obj);
    let res10 = Object.isExtensible(obj);
    let res11 = Object.isSealed(obj);
    let res12 = Object.isFrozen(obj);

    return [res1, res2, res3, res4, res5, res6, res7, res8, res9, res10, res11, res12];
}

export function ObjectIsExtensibleTest061() {
    const obj = {a: 1};
    let res1 = Object.isExtensible(obj);
    let res2 = Reflect.isExtensible(obj);

    Object.preventExtensions(obj);
    let res3 = Object.isExtensible(obj);
    let res4 = Reflect.isExtensible(obj);
    return [res1, res2, res3, res4];
}

export function ObjectIsExtensibleTest062() {
    const obj = {a: 1, b: 2};
    let res1 = Object.isExtensible(obj);

    const result = Reflect.preventExtensions(obj);
    let res2 = result;
    let res3 = Object.isExtensible(obj);
    return [res1, res2, res3];
}

export function ObjectIsExtensibleTest063() {
    const obj1 = {a: 1};
    const result1 = Reflect.preventExtensions(obj1);
    let res1 = result1;
    let res2 = Object.isExtensible(obj1);

    const result2 = Reflect.preventExtensions(obj1);
    let res3 = result2;
    return [res1, res2, res3];
}

export function ObjectIsExtensibleTest064() {
    const obj = {a: 1};
    Object.preventExtensions(obj);

    const result1 = Reflect.defineProperty(obj, 'b', {value: 2, writable: true});
    const result2 = Reflect.defineProperty(obj, 'a', {value: 100, writable: false});
    let res3 = obj.a;
    return [result1, result2, res3];
}

export function ObjectIsExtensibleTest065() {
    const obj = {a: 1};
    Object.preventExtensions(obj);

    const result1 = Reflect.set(obj, 'a', 100);
    let res2 = obj.a;
    const result3 = Reflect.set(obj, 'b', 2);
    let res4 = obj.b;
    return [result1, res2, result3, res4];
}

export function ObjectIsExtensibleTest066() {
    const proto = {protoProp: 1};
    Object.preventExtensions(proto);

    const child = Object.create(proto);
    child.childProp = 2;

    let res1 = Object.isExtensible(proto);
    let res2 = Object.isExtensible(child);
    return [res1, res2];
}

export function ObjectIsExtensibleTest067() {
    const proto = {protoProp: 1};
    const child = Object.create(proto);
    child.childProp = 2;

    Object.preventExtensions(child);

    let res1 = Object.isExtensible(child);
    let res2 = Object.isExtensible(proto);
    return [res1, res2];
}

export function ObjectIsExtensibleTest068() {
    const proto = {protoProp: 1};
    Object.preventExtensions(proto);

    const child = Object.create(proto);
    let res1 = Object.isExtensible(child);
    child.newProp = "value";
    let res2 = child.newProp;
    return [res1, res2];
}

export function ObjectIsExtensibleTest069() {
    const grandProto = {grandProp: 1};
    const proto = Object.create(grandProto);
    proto.protoProp = 2;
    const child = Object.create(proto);
    child.childProp = 3;

    Object.preventExtensions(proto);

    let res1 = Object.isExtensible(grandProto);
    let res2 = Object.isExtensible(proto);
    let res3 = Object.isExtensible(child);
    return [res1, res2, res3];
}

export function ObjectIsExtensibleTest070() {
    const proto = {protoProp: 1};
    Object.preventExtensions(proto);

    const child = Object.create(proto);
    child.childProp = 2;

    const retrievedProto = Object.getPrototypeOf(child);
    let res1 = Object.isExtensible(retrievedProto);
    let res2 = Object.isExtensible(child);
    return [res1, res2];
}

export function ObjectIsExtensibleTest071() {
    const proto = {protoProp: 1};
    Object.preventExtensions(proto);

    const child = {childProp: 2};
    Object.setPrototypeOf(child, proto);

    let res1 = Object.isExtensible(proto);
    let res2 = Object.isExtensible(child);
    return [res1, res2];
}

export function ObjectIsExtensibleTest072() {
    function Constructor() {
        this.instanceProp = 1;
    }
    Constructor.prototype.protoMethod = function() { return 2; };

    const instance = new Constructor();

    let res1 = Object.isExtensible(Constructor.prototype);
    let res2 = Object.isExtensible(instance);

    Object.preventExtensions(Constructor.prototype);
    let res3 = Object.isExtensible(Constructor.prototype);
    let res4 = Object.isExtensible(instance);
    return [res1, res2, res3, res4];
}

export function ObjectIsExtensibleTest073() {
    class Parent {
        constructor() {
            this.parentProp = 1;
        }
        parentMethod() { return 2; }
    }

    class Child extends Parent {
        constructor() {
            super();
            this.childProp = 3;
        }
        childMethod() { return 4; }
    }

    const child = new Child();

    let res1 = Object.isExtensible(Parent.prototype);
    let res2 = Object.isExtensible(Child.prototype);
    let res3 = Object.isExtensible(child);

    Object.preventExtensions(Parent.prototype);
    let res4 = Object.isExtensible(Parent.prototype);
    let res5 = Object.isExtensible(Child.prototype);
    let res6 = Object.isExtensible(child);
    return [res1, res2, res3, res4, res5, res6];
}

export function ObjectIsExtensibleTest074() {
    const obj = Object.create(null);
    obj.prop = 1;

    let res1 = Object.isExtensible(obj);

    Object.preventExtensions(obj);
    let res2 = Object.isExtensible(obj);
    return [res1, res2];
}

export function ObjectIsExtensibleTest076() {
    let res1 = Object.isExtensible(Object);
    let res2 = Object.isExtensible(Array);
    let res3 = Object.isExtensible(Function);
    let res4 = Object.isExtensible(Number);
    let res5 = Object.isExtensible(String);
    let res6 = Object.isExtensible(Boolean);
    let res7 = Object.isExtensible(Symbol);
    let res8 = Object.isExtensible(BigInt);
    let res9 = Object.isExtensible(Date);
    let res10 = Object.isExtensible(RegExp);
    let res11 = Object.isExtensible(Error);
    let res12 = Object.isExtensible(Map);
    let res13 = Object.isExtensible(Set);
    let res14 = Object.isExtensible(WeakMap);
    let res15 = Object.isExtensible(WeakSet);
    let res16 = Object.isExtensible(Promise);
    let res17 = Object.isExtensible(ArrayBuffer);
    return [res1, res2, res3, res4, res5, res6, res7, res8, res9, res10, res11, res12, res13, res14, res15, res16, res17];
}

export function ObjectIsExtensibleTest077() {
    let res = Object.isExtensible(globalThis);
    return res;
}

export function ObjectIsExtensibleTest078() {
    let res = Object.isExtensible(Math);
    return res;
}

export function ObjectIsExtensibleTest079() {
    let res = Object.isExtensible(JSON);
    return res;
}

export function ObjectIsExtensibleTest080() {
    let res = Object.isExtensible(Reflect);
    return res;
}

export function ObjectIsExtensibleTest081() {
    let res = Object.isExtensible(Atomics);
    return res;
}

export function ObjectIsExtensibleTest082() {
    const target = {a: 1};
    let isExtensibleCalled = false;
    let preventExtensionsCalled = false;
    const handler = {
        isExtensible: function(target) {
            isExtensibleCalled = true;
            return Reflect.isExtensible(target);
        },
        preventExtensions: function(target) {
            preventExtensionsCalled = true;
            return Reflect.preventExtensions(target);
        }
    };

    const proxy = new Proxy(target, handler);
    let res1 = Object.isExtensible(proxy);
    Object.preventExtensions(proxy);
    let res2 = Object.isExtensible(proxy);
    return [isExtensibleCalled, preventExtensionsCalled, res1, res2];
}

export function ObjectIsExtensibleTest084() {
    const target = {a: 1};
    let preventExtensionsCalled = false;

    const handler = {
        preventExtensions: function(target) {
            preventExtensionsCalled = true;
            return Reflect.preventExtensions(target);
        }
    };

    const proxy = new Proxy(target, handler);
    let res1 = Object.isExtensible(proxy);
    Object.preventExtensions(proxy);
    let res2 = Object.isExtensible(proxy);
    return [res1, preventExtensionsCalled, res2];
}

export function ObjectIsExtensibleTest085() {
    const target = {a: 1};
    const handler = {
        isExtensible: function(target) {
            return true;
        }
    };

    Object.preventExtensions(target);
    const proxy = new Proxy(target, handler);

    let isTypeError = false;
    try {
        Object.isExtensible(proxy);
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError;
}

export function ObjectIsExtensibleTest086() {
    const noProto = Object.create(null);
    noProto.prop = 1;

    let res1 = Object.isExtensible(noProto);

    Object.preventExtensions(noProto);
    let res2 = Object.isExtensible(noProto);
    return [res1, res2];
}

export function ObjectIsExtensibleTest087() {
    let res1, res2;
    function testArguments() {
        res1 = Object.isExtensible(arguments);
        Object.preventExtensions(arguments);
        res2 = Object.isExtensible(arguments);
    }
    testArguments(1, 2, 3);
    return [res1, res2];
}

export function ObjectIsExtensibleTest088() {
    const obj = Object.create(Object.prototype, {
        property1: {
            value: 1,
            writable: true,
            enumerable: true,
            configurable: true
        },
        property2: {
            value: 2,
            writable: false,
            enumerable: false,
            configurable: false
        }
    });

    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest089() {
    const obj = {};
    Object.defineProperty(obj, 'nonEnumerable', {
        value: 1,
        enumerable: false,
        configurable: true,
        writable: true
    });

    let res1 = Object.isExtensible(obj);

    Object.preventExtensions(obj);
    let res2 = Object.isExtensible(obj);
    return [res1, res2];
}

export function ObjectIsExtensibleTest090() {
    const obj = {};
    Object.defineProperty(obj, 'nonConfigurable', {
        value: 1,
        configurable: false
    });

    let res1 = Object.isExtensible(obj);

    Object.preventExtensions(obj);
    let res2 = Object.isExtensible(obj);
    return [res1, res2];
}

export function ObjectIsExtensibleTest091() {
    const obj = {
        get prop() { return this._prop; },
        set prop(value) { this._prop = value; }
    };
    obj._prop = 1;

    let res1 = Object.isExtensible(obj);

    Object.preventExtensions(obj);
    let res2 = Object.isExtensible(obj);
    return [res1, res2];
}

export function ObjectIsExtensibleTest092() {
    const sym = Symbol('key');
    const obj = {
        [sym]: 'symbol value',
        normalProp: 'normal value'
    };

    let res1 = Object.isExtensible(obj);

    Object.preventExtensions(obj);
    let res2 = Object.isExtensible(obj);
    return [res1, res2];
}

export function ObjectIsExtensibleTest093() {
    const obj = {a: 1};
    obj.self = obj;

    let res1 = Object.isExtensible(obj);

    Object.preventExtensions(obj);
    let res2 = Object.isExtensible(obj);
    return [res1, res2];
}

export function ObjectIsExtensibleTest094() {
    const obj = {};
    Object.defineProperty(obj, 'accessor', {
        get: function() { return this._value; },
        set: function(value) { this._value = value; },
        enumerable: true,
        configurable: true
    });

    let res = Object.isExtensible(obj);
    return res;
}

export function ObjectIsExtensibleTest095() {
    let res1 = Object.isExtensible(1);
    let res2 = Object.isExtensible("string");
    let res3 = Object.isExtensible(true);
    let res4 = Object.isExtensible(null);
    let res5 = Object.isExtensible(undefined);
    let res6 = Object.isExtensible(123n);
    let res7 = Object.isExtensible(Symbol("test"));
    return [res1, res2, res3, res4, res5, res6, res7];
}

export function ObjectIsExtensibleTest096() {
    let res1 = Object.isExtensible(1);
    let res2 = Object.isExtensible(new Number(1));
    let res3 = Object.isExtensible(new String("string"));
    let res4 = Object.isExtensible(new Boolean(true));
    return [res1, res2, res3, res4];
}

export function ObjectIsExtensibleTest097() {
    const num = 1;
    const result = Object.preventExtensions(num);
    let res1 = result;
    let res2 = Object.isExtensible(num);
    return [res1, res2];
}

export function ObjectIsExtensibleTest098() {
    const obj = {a: 1};
    let res1 = Object.isExtensible(obj);
    let res2 = Object.isExtensible(obj);
    let res3 = Object.isExtensible(obj);

    Object.preventExtensions(obj);
    let res4 = Object.isExtensible(obj);
    let res5 = Object.isExtensible(obj);
    return [res1, res2, res3, res4, res5];
}

export function ObjectIsExtensibleTest099() {
    const obj = {a: 1};

    obj.b = 2;
    let res1 = Object.isExtensible(obj);

    Object.preventExtensions(obj);
    let res2 = Object.isExtensible(obj);

    delete obj.a;
    let res3 = Object.isExtensible(obj);
    return [res1, res2, res3];
}

