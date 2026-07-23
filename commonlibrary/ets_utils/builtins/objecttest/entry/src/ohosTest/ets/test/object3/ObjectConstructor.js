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

export function ObjectConstructorTest001() {
    const obj = Object();
    return [obj, typeof obj, obj.constructor === Object];
}

export function ObjectConstructorTest002() {
    const obj = new Object();
    return [obj, typeof obj, obj.constructor === Object];
}

export function ObjectConstructorTest003() {
    const obj1 = Object(undefined);
    const obj2 = new Object(undefined);
    return [obj1, obj2, Object.keys(obj1).length === 0];
}

export function ObjectConstructorTest004() {
    let undef;
    const obj = new Object(undef);
    return [obj, Object.keys(obj).length === 0];
}

export function ObjectConstructorTest005() {
    const obj1 = Object(null);
    const obj2 = new Object(null);
    return [obj1, obj2, typeof obj1 === 'object'];
}

export function ObjectConstructorTest006() {
    const obj1 = Object(null);
    const obj2 = new Object();
    return [JSON.stringify(obj1) === JSON.stringify(obj2), Object.getPrototypeOf(obj1) === Object.prototype]
}

export function ObjectConstructorTest007() {
    const numObj = Object(42);
    return [typeof numObj, numObj instanceof Number, numObj.valueOf(), numObj.toString()]
}

export function ObjectConstructorTest008() {
    const zeroObj = Object(0);
    const negZeroObj = Object(-0);
    const nanObj = Object(NaN);
    const infObj = Object(Infinity);
    const negInfObj = Object(-Infinity);

    let x = typeof zeroObj;
    let y = zeroObj.valueOf();
    let z = negZeroObj.valueOf();
    let a = Object.is(nanObj.valueOf(), NaN);
    let b = infObj.valueOf();
    let c = negInfObj.valueOf();
    return [x, y, z, a, b, c]
}

export function ObjectConstructorTest009() {
    const maxObj = Object(Number.MAX_VALUE);
    const minObj = Object(Number.MIN_VALUE);
    const epsilonObj = Object(Number.EPSILON);
    const maxSafeObj = Object(Number.MAX_SAFE_INTEGER);
    const minSafeObj = Object(Number.MIN_SAFE_INTEGER);

    let a = maxObj.valueOf() === Number.MAX_VALUE;
    let b = minObj.valueOf() === Number.MIN_VALUE;
    let c = epsilonObj.valueOf() === Number.EPSILON;
    return [a, b, c];
}

export function ObjectConstructorTest010() {
    const hexObj = Object(0x10);
    const octObj = Object(0o10);
    const sciObj = Object(1e3);

    let a = hexObj.valueOf();
    let b = octObj.valueOf();
    let c = sciObj.valueOf();
    return [a, b, c];
}

export function ObjectConstructorTest011() {
    const strObj = Object("hello");

    let a = typeof strObj;
    let b = strObj instanceof String;
    let c = strObj.valueOf();
    let d = strObj.length;
    return [a, b, c, d];
}

export function ObjectConstructorTest012() {
    const specialObj = Object("!\\#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
    const escapeObj = Object("\\n\\t\\r\\b\\f\\v\\\\");
    const unicodeObj = Object("👆👿👀💯🎅");

    let a = specialObj.length > 0;
    let b = escapeObj.length > 0;
    let c = unicodeObj.length;
    return [a, b, c];
}

export function ObjectConstructorTest013() {
    const emptyStrObj = Object("");

    let a = typeof emptyStrObj;
    let b = emptyStrObj.valueOf();
    let c = emptyStrObj.length;
    return [a, b, c];
}

export function ObjectConstructorTest015() {
    const trueObj = Object(true);
    const falseObj = Object(false);

    let a = typeof trueObj;
    let b = trueObj instanceof Boolean;
    let c = trueObj.valueOf();
    let d = falseObj.valueOf();
    return [a, b, c, d];
}

export function ObjectConstructorTest016() {
    const zeroBoolObj = Object(0);
    const nanBoolObj = Object(NaN);
    const emptyStrBoolObj = Object("");
    const nullBoolObj = Object(null);
    const undefBoolObj = Object(undefined);

    let a = typeof zeroBoolObj;
    let b = zeroBoolObj instanceof Number;
    let c = typeof nullBoolObj;
    let d = nullBoolObj instanceof Object;
    return [a, b, c, d];
}

export function ObjectConstructorTest017() {
    const bigIntObj = Object(9007199254740991n);

    let a = typeof bigIntObj;
    let b = bigIntObj instanceof BigInt;
    let c = bigIntObj.valueOf().toString();
    return [a, b, c];
}

export function ObjectConstructorTest018() {
    const bigInt64Obj = Object(BigInt("9223372036854775807"));
    const bigUint64Obj = Object(BigInt("18446744073709551615"));
    const negBigIntObj = Object(BigInt("-9223372036854775808"));

    let a = bigInt64Obj.valueOf().toString();
    let b = bigUint64Obj.valueOf().toString();
    let c = negBigIntObj.valueOf().toString();
    return [a, b, c];
}

export function ObjectConstructorTest019() {
    const sym = Symbol("test");
    const symObj = Object(sym);

    let a = typeof symObj;
    let b = symObj.valueOf().toString();
    let c = symObj.valueOf() === sym;
    let d = typeof symObj.valueOf().toString();
    return [a, b, c, d];
}

export function ObjectConstructorTest020() {
    const symWithDesc = Symbol("mySymbol");
    const symObjWithDesc = Object(symWithDesc);

    let a = symWithDesc.description;
    let b = symObjWithDesc.valueOf().description;
    return [a, b];
}

export function ObjectConstructorTest021() {
    const symKey = Symbol("key");
    const obj = { [symKey]: "value", a: 1 };
    const wrappedObj = Object(obj);

    let a = wrappedObj[symKey];
    let b = wrappedObj.a;
    return [a, b];
}

export function ObjectConstructorTest022() {
    const originalObj = { a: 1, b: "test", c: [1, 2, 3] };
    const returnedObj = Object(originalObj);

    let a = returnedObj === originalObj;
    let b = returnedObj.a;
    let c = returnedObj.b;
    return [a, b, c];
}

export function ObjectConstructorTest023() {
    const nestedObj = { a: 1, b: { c: 2, d: { e: 3 } } };
    const returnedNested = Object(nestedObj);

    let a = returnedNested === nestedObj;
    let b = returnedNested.b.c;
    let c = returnedNested.b.d.e;
    return [a, b, c];
}

export function ObjectConstructorTest024() {
    const emptyObj = {};
    const returnedEmpty = Object(emptyObj);

    let a = returnedEmpty === emptyObj;
    let b = Object.keys(returnedEmpty).length;
    return [a, b];
}

export function ObjectConstructorTest025() {
    const arr = [1, 2, 3, 4, 5];
    const returnedArr = Object(arr);

    let a = returnedArr === arr;
    let b = Array.isArray(returnedArr);
    let c = returnedArr.length;
    return [a, b, c];
}

export function ObjectConstructorTest026() {
    const specialArr = [NaN, Infinity, undefined, null, ""];
    const returnedSpecial = Object(specialArr);

    let a = returnedSpecial === specialArr;
    let b = returnedSpecial.length;
    let c = Number.isNaN(returnedSpecial[0]);
    return [a, b, c];
}

export function ObjectConstructorTest027() {
    const sparseArr = [];
    sparseArr[100] = "end";
    const returnedSparse = Object(sparseArr);

    let a = returnedSparse === sparseArr;
    let b = returnedSparse.length;
    let c = 0 in returnedSparse;
    let d = 100 in returnedSparse;
    return [a, b, c, d];
}

export function ObjectConstructorTest028() {
    function testFunc() { return 42; }
    const returnedFunc = Object(testFunc);

    let a = returnedFunc === testFunc;
    let b = typeof returnedFunc;
    let c = returnedFunc();
    return [a, b, c];
}

export function ObjectConstructorTest029() {
    const arrowFunc = () => "arrow";
    const returnedArrow = Object(arrowFunc);

    let a = returnedArrow === arrowFunc;
    let b = typeof returnedArrow;
    let c = returnedArrow();
    return [a, b, c];
}

export function ObjectConstructorTest030() {
    async function asyncFunc() { return "async"; }
    const returnedAsync = Object(asyncFunc);

    let a = returnedAsync === asyncFunc;
    let b = returnedAsync.constructor.name;
    return [a, b];
}

export function ObjectConstructorTest031() {
    const date = new Date();
    const returnedDate = Object(date);

    let a = returnedDate === date;
    let b = returnedDate instanceof Date;
    let c = typeof returnedDate;
    return [a, b, c];
}

export function ObjectConstructorTest032() {
    const specificDate = new Date("2024-01-01");
    const returnedSpecific = Object(specificDate);

    let a = returnedSpecific === specificDate;
    let b = returnedSpecific.getFullYear();
    return [a, b];
}

export function ObjectConstructorTest033() {
    const regex = /abc/gi;
    const returnedRegex = Object(regex);

    let a = returnedRegex === regex;
    let b = returnedRegex instanceof RegExp;
    let c = returnedRegex.test("ABC");
    return [a, b, c];
}

export function ObjectConstructorTest034() {
    const regexWithFlags = /test/gim;
    const returned = Object(regexWithFlags);

    let a = returned === regexWithFlags;
    let b = returned.flags;
    let c = returned.source;
    return [a, b, c];
}

export function ObjectConstructorTest035() {
    const error = new Error("test error");
    const typeError = new TypeError("type error");
    const rangeError = new RangeError("range error");

    const returnedError = Object(error);
    const returnedTypeError = Object(typeError);

    let a = returnedError === error;
    let b = returnedTypeError === typeError;
    let c = returnedError.message;
    return [a, b, c];
}

export function ObjectConstructorTest036() {
    const int8 = new Int8Array([127, -128, 0]);
    const returnedInt8 = Object(int8);

    let a = returnedInt8 === int8;
    let b = returnedInt8 instanceof Int8Array;
    let c = returnedInt8[0];
    let d = returnedInt8[1];
    return [a, b, c, d];
}

export function ObjectConstructorTest037() {
    const uint8 = new Uint8Array([255, 0, 128]);
    const returnedUint8 = Object(uint8);

    let a = returnedUint8 === uint8;
    let b = returnedUint8.length;
    let c = returnedUint8[0];
    return [a, b, c];
}

export function ObjectConstructorTest038() {
    const float32 = new Float32Array([1.5, -2.5, NaN, Infinity]);
    const returnedFloat32 = Object(float32);

    let a = returnedFloat32 === float32;
    let b = returnedFloat32.length;
    let c = Number.isNaN(returnedFloat32[2]);
    return [a, b, c];
}

export function ObjectConstructorTest039() {
    const map = new Map([['key1', 'value1'], ['key2', { a: 1 }]]);
    const returnedMap = Object(map);

    let a = returnedMap === map;
    let b = returnedMap.size;
    let c = returnedMap.get('key1');
    return [a, b, c];
}

export function ObjectConstructorTest040() {
    const set = new Set([1, 2, 3, 2, 1]);
    const returnedSet = Object(set);

    let a = returnedSet === set;
    let b = returnedSet.size;
    let c = returnedSet.has(1);
    return [a, b, c];
}

export function ObjectConstructorTest041() {
    const buffer = new ArrayBuffer(16);
    const returnedBuffer = Object(buffer);

    let a = returnedBuffer === buffer;
    let b = returnedBuffer.byteLength;
    return [a, b];
}

export function ObjectConstructorTest042() {
    const dv = new DataView(new ArrayBuffer(16));
    const returnedDv = Object(dv);

    let a = returnedDv === dv;
    let b = returnedDv.byteLength;
    return [a, b];
}

export function ObjectConstructorTest043() {
    const promise = new Promise((resolve) => setTimeout(() => resolve('done'), 100));
    const returnedPromise = Object(promise);

    let a = returnedPromise === promise;
    let b = returnedPromise instanceof Promise;
    return [a, b];
}

export function ObjectConstructorTest044() {
    const frozenObj = Object.freeze({ a: 1, b: 2 });
    const returnedFrozen = Object(frozenObj);

    let a = returnedFrozen === frozenObj;
    let b = Object.isFrozen(returnedFrozen);
    let c = returnedFrozen.a;
    return [a, b, c];
}

export function ObjectConstructorTest045() {
    const frozen = Object.freeze({ x: 10 });
    const wrapped = Object(frozen);

    try {
        wrapped.x = 20;
        wrapped.y = 30;
    } catch (err) {
        let a = err.name;
        return a;
    }
}

export function ObjectConstructorTest046() {
    const sealedObj = Object.seal({ a: 1, b: 2 });
    const returnedSealed = Object(sealedObj);

    let a = returnedSealed === sealedObj;
    let b = Object.isSealed(returnedSealed);
    return [a, b];
}

export function ObjectConstructorTest047() {
    const sealed = Object.seal({ a: 1 });
    const wrapped = Object(sealed);

    try {
        wrapped.a = 10;
        wrapped.b = 20;
        delete wrapped.a;
    } catch (err) {
        let a = err.name;
        return a;
    }
}

export function ObjectConstructorTest048() {
    const nonExtensible = Object.preventExtensions({ a: 1 });
    const returnedNonExt = Object(nonExtensible);

    let a = returnedNonExt === nonExtensible;
    let b = Object.isExtensible(returnedNonExt);
    return [a, b];
}

export function ObjectConstructorTest049() {
    const nonExt = Object.preventExtensions({ x: 1 });
    const wrapped = Object(nonExt);

    try {
        wrapped.x = 10;
        wrapped.y = 20;
        delete wrapped.x;
    } catch (err) {
        let a = err.name;
        return a;
    }
}

export function ObjectConstructorTest050() {
    const objWithGetter = {
        _value: 10,
        get value() { return this._value; }
    };
    const returned = Object(objWithGetter);

    let a = returned === objWithGetter;
    let b = returned.value;
    return [a, b];
}

export function ObjectConstructorTest051() {
    const objWithSetter = {
        _value: 0,
        set value(v) { this._value = v; },
        get value() { return this._value; }
    };
    const returned = Object(objWithSetter);

    returned.value = 100;

    let a = returned.value;
    let b = returned._value;
    return [a, b];
}

export function ObjectConstructorTest052() {
    const proto = { inherited: "value" };
    const objWithProto = Object.create(proto);
    objWithProto.own = "property";

    const returned = Object(objWithProto);

    let a = returned === objWithProto;
    let b = returned.inherited;
    let c = Object.getPrototypeOf(returned) === proto;
    return [a, b, c];
}

export function ObjectConstructorTest053() {
    const grandProto = { grand: 1 };
    const parentProto = Object.create(grandProto);
    parentProto.parent = 2;
    const child = Object.create(parentProto);
    child.own = 3;

    const returned = Object(child);

    let a = returned.grand;
    let b = returned.parent;
    let c = returned.own;
    return [a, b, c];
}

export function ObjectConstructorTest054() {
    class MyClass {
        constructor(value) {
            this.value = value;
        }
        getValue() {
            return this.value;
        }
    }

    const instance = new MyClass(42);
    const returned = Object(instance);

    let a = returned === instance;
    let b = returned.getValue();
    let c = returned instanceof MyClass;
    return [a, b, c];
}

export function ObjectConstructorTest055() {
    class Parent {
        parentMethod() { return "parent"; }
    }
    class Child extends Parent {
        childMethod() { return "child"; }
    }

    const childInstance = new Child();
    const returned = Object(childInstance);

    let a = returned === childInstance;
    let b = returned.parentMethod();
    let c = returned.childMethod();
    return [a, b, c];
}

export function ObjectConstructorTest056() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'hidden', {
        value: 2,
        enumerable: false
    });

    const returned = Object(obj);

    let a = returned.a;
    let b = returned.hidden;
    let c = Object.keys(returned);
    return [a, b, c];
}

export function ObjectConstructorTest057() {
    const symKey = Symbol("key");
    const objWithSym = { [symKey]: "symbolValue", a: 1 };

    const returned = Object(objWithSym);

    let a = returned[symKey];
    let b = JSON.stringify(Object.getOwnPropertySymbols(returned));
    return [a, b];
}

export function ObjectConstructorTest058() {
    const objWithUndef = { a: undefined, b: 1 };
    const objWithNull = { a: null, b: 2 };

    const returnedUndef = Object(objWithUndef);
    const returnedNull = Object(objWithNull);

    let a = 'a' in returnedUndef;
    let b = returnedUndef.a;
    let c = returnedNull.a;
    return [a, b, c];
}

export function ObjectConstructorTest059() {
    const objWithNaN = { a: NaN, b: Infinity, c: -Infinity };

    const returned = Object(objWithNaN);

    let a = Number.isNaN(returned.a);
    let b = returned.b;
    let c = returned.c;
    return [a, b, c];
}

export function ObjectConstructorTest061() {
    const withNew = new Object(null);
    const withoutNew = Object(null);

    let a = typeof withNew;
    let b = typeof withoutNew;
    let c = Object.keys(withNew).length;
    let d = Object.keys(withoutNew).length;
    let e = Object.getPrototypeOf(withNew) === Object.prototype;
    let f = Object.getPrototypeOf(withoutNew) === Object.prototype;
    return [a, b, c, d, e, f];
}

export function ObjectConstructorTest062() {
    const withNew = new Object(undefined);
    const withoutNew = Object(undefined);

    let a = typeof withNew;
    let b = typeof withoutNew;
    let c = withNew.constructor === Object;
    let d = withoutNew.constructor === Object;
    return [a, b, c, d];
}

export function ObjectConstructorTest063() {
    const withNew = new Object(42);
    const withoutNew = Object(42);

    let a = typeof withNew;
    let b = typeof withoutNew;
    let c = withNew instanceof Number;
    let d = withoutNew instanceof Number;
    let e = withNew.valueOf();
    let f = withoutNew.valueOf();
    return [a, b, c, d, e, f];
}

export function ObjectConstructorTest064() {
    const withNew = new Object("test");
    const withoutNew = Object("test");

    let a = typeof withNew;
    let b = typeof withoutNew;
    let c = withNew.length;
    let d = withoutNew.length;
    return [a, b, c, d];
}

export function ObjectConstructorTest065() {
    const withNew = new Object(true);
    const withoutNew = Object(true);

    let a = typeof withNew;
    let b = typeof withoutNew;
    let c = withNew.valueOf();
    let d = withoutNew.valueOf();
    return [a, b, c, d];
}

export function ObjectConstructorTest066() {
    const original = { a: 1, b: 2 };
    const withNew = new Object(original);
    const withoutNew = Object(original);

    let a = withNew === original;
    let b = withoutNew === original;
    let c = withNew === withoutNew;
    return [a, b, c];
}

export function ObjectConstructorTest067() {
    const arr = [1, 2, 3];
    const withNew = new Object(arr);
    const withoutNew = Object(arr);

    let a = withNew === arr;
    let b = withoutNew === arr;
    let c = Array.isArray(withNew);
    let d = Array.isArray(withoutNew);
    return [a, b, c, d];
}

export function ObjectConstructorTest068() {
    const sym = Symbol("test");
    const withNew = new Object(sym);
    const withoutNew = Object(sym);

    let a = typeof withNew;
    let b = typeof withoutNew;
    let c = withNew.valueOf() === sym;
    let d = withoutNew.valueOf() === sym;
    let e = withNew === withoutNew;
    return [a, b, c, d, e];
}

export function ObjectConstructorTest069() {
    const big = BigInt(42);
    const withNew = new Object(big);
    const withoutNew = Object(big);

    let a = typeof withNew;
    let b = typeof withoutNew;
    let c = withNew.valueOf().toString();
    let d = withoutNew.valueOf().toString();
    return [a, b, c, d];
}

export function ObjectConstructorTest070() {
    const withNew = new Object();
    const withoutNew = Object();

    let a = typeof withNew;
    let b = typeof withoutNew;
    let c = Object.keys(withNew).length;
    let d = Object.keys(withoutNew).length;
    return [a, b, c, d];
}

export function ObjectConstructorTest071() {
    class MyObject extends Object {
        constructor(value) {
            super(value);
        }
    }

    const instance = new MyObject({ a: 1 });

    let a = instance instanceof MyObject;
    let b = instance instanceof Object;
    let c = instance.a;
    return [a, b, c];
}

export function ObjectConstructorTest072() {
    class MyObject extends Object {
        constructor(value) {
            super(value);
        }
    }

    const numInstance = new MyObject(42);

    let a = typeof numInstance;
    let b = numInstance instanceof MyObject;
    let c = numInstance.valueOf().toString();
    return [a, b, c];
}

export function ObjectConstructorTest073() {
    class MyObject extends Object {
        constructor(value) {
            super(value);
        }
    }

    const instance = new MyObject(42);

    let a = typeof instance;
    let b = instance instanceof Number;
    let c = instance instanceof MyObject;
    return [a, b, c];
}

export function ObjectConstructorTest074() {
    class MyObject extends Object {
        constructor() {
            super();
        }
    }

    const instance = new MyObject();
    return [JSON.stringify(instance), JSON.stringify(typeof instance), JSON.stringify(instance instanceof MyObject)];
}

export function ObjectConstructorTest075() {
    const proto = { inherited: "value" };
    Object.defineProperty(proto, 'hidden', {
        value: 'hiddenValue',
        enumerable: false
    });

    const obj = Object.create(proto);
    obj.own = "ownProp";

    const returned = Object(obj);

    let a = returned.inherited;
    let b = returned.hidden;
    let c = 'own' in returned;
    return [a, b, c];
}

export function ObjectConstructorTest076() {
    const proto = {
        greet() { return "Hello"; },
        count: 0
    };

    const obj = Object.create(proto);
    obj.name = "World";

    const returned = Object(obj);

    let a = returned.greet();
    let b = returned.hasOwnProperty('name');
    let c = returned.hasOwnProperty('greet');
    return [a, b, c];
}

export function ObjectConstructorTest077() {
    const obj = { a: 1 };
    const returned = Object(obj);

    let a = returned.__proto__ === Object.prototype;
    let b = Object.getPrototypeOf(returned) === Object.prototype;
    return [a, b];
}

export function ObjectConstructorTest078() {
    const obj = { a: 1 };
    const newProto = { b: 2 };
    const returned = Object(obj);

    returned.__proto__ = newProto;

    let a = returned.__proto__ === newProto;
    let b = returned.b;
    let c = Object.getPrototypeOf(returned) === newProto;
    return [a, b, c];
}

export function ObjectConstructorTest079() {
    const obj = Object(null);

    let a = obj.constructor === Object;
    let b = obj.constructor.name;

    const numObj = Object(42);

    let c = numObj.constructor === Number;
    let d = numObj.constructor.name;
    return [a, b, c, d];
}

export function ObjectConstructorTest081() {
    const obj = Object({ a: 1 });

    const numObj = Object(42);

    let a = obj.toString();
    let b = obj.hasOwnProperty('toString');
    let c = numObj.toString();
    return [a, b, c];

}

export function ObjectConstructorTest082() {
    const obj = Object({ a: 1 });
    const returnedObj = obj.valueOf();

    let a = returnedObj === obj;

    const numObj = Object(42);

    let b = numObj.valueOf();
    return [a, b];
}

export function ObjectConstructorTest083() {
    const proto = { inherited: "value" };
    const obj = Object.create(proto);
    obj.own = "ownValue";

    const returned = Object(obj);

    let a = returned.hasOwnProperty('own');
    let b = returned.hasOwnProperty('inherited');
    return [a, b];
}

export function ObjectConstructorTest084() {
    const proto = { a: 1 };
    const obj = Object.create(proto);

    let a = proto.isPrototypeOf(obj);
    let b = Object.prototype.isPrototypeOf(obj);
    return [a, b];
}

export function ObjectConstructorTest085() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });

    const returned = Object(obj);

    let a = returned.propertyIsEnumerable('a');
    let b = returned.propertyIsEnumerable('b');
    return [a, b];
}

export function ObjectConstructorTest086() {
    let a = typeof Object(null);
    let b = typeof Object(undefined);
    let c = typeof Object(42);
    let d = typeof Object("test");
    let e = typeof Object(true);
    let f = typeof Object(Symbol("s"));
    let g = typeof Object(BigInt(1));
    let h = typeof Object({ a: 1 });
    let i = typeof Object([1, 2]);
    return [a, b, c, d, e, f, g, h, i];
}

export function ObjectConstructorTest087() {
    let a = typeof 42;
    let b = typeof Object(42);

    let c = typeof "test";
    let d = typeof Object("test");

    let e = typeof true;
    let f = typeof Object(true);
    return [a, b, c, d, e, f];
}

export function ObjectConstructorTest088() {
    const numObj = Object(42);

    let a = numObj instanceof Number;
    let b = numObj instanceof Object;
    let c = numObj instanceof String;
    return [a, b, c];
}

export function ObjectConstructorTest089() {
    const strObj = Object("test");

    let a = strObj instanceof String;
    let b = strObj instanceof Object;
    let c = strObj instanceof Number;
    return [a, b, c];
}

export function ObjectConstructorTest090() {
    const boolObj = Object(true);

    let a = boolObj instanceof Boolean;
    let b = boolObj instanceof Object;
    return [a, b];
}

export function ObjectConstructorTest091() {
    const obj = Object({ a: 1 });

    let a = obj instanceof Object;
    let b = obj instanceof Number;
    let c = obj instanceof Array;
    return [a, b, c];
}

export function ObjectConstructorTest092() {
    const arr = Object([1, 2, 3]);

    let a = arr instanceof Array;
    let b = arr instanceof Object;
    let c = arr instanceof Number;
    return [a, b, c];
}

export function ObjectConstructorTest093() {
    let a = Object(42).constructor === Number;
    let b = Object("test").constructor === String;
    let c = Object(true).constructor === Boolean;
    let d = Object(null).constructor === Object;
    let e = Object([1, 2]).constructor === Array;
    return [a, b, c, d, e];
}

export function ObjectConstructorTest094() {
    let a = Object(42).constructor.name;
    let b = Object("test").constructor.name;
    let c = Object(true).constructor.name;
    let d = Object(null).constructor.name;
    let e = Object([1, 2]).constructor.name;
    let f = Object(new Map()).constructor.name;
    return [a, b, c, d, e, f];
}

export function ObjectConstructorTest095() {
    const objectToString = Object.prototype.toString;

    let a = objectToString.call(Object(42));
    let b = objectToString.call(Object("test"));
    let c = objectToString.call(Object(true));
    let d = objectToString.call(Object(null));
    let e = objectToString.call(Object([1, 2]));
    let f = objectToString.call(Object(new Map()));
    let g = objectToString.call(Object(new Set()));
    return [a, b, c, d, e, f, g];
}

export function ObjectConstructorTest096() {
    const objectToString = Object.prototype.toString;

    let a = objectToString.call(Object(new Date()));
    let b = objectToString.call(Object(/test/));
    let c = objectToString.call(Object(new Error()));
    let d = objectToString.call(Object(new Promise(r => r())));
    let e = objectToString.call(Object(Symbol("s")));
    let f = objectToString.call(Object(BigInt(1)));
    return [a, b, c, d, e, f];
}

export function ObjectConstructorTest097() {
    const arr = [1, 2, 3];
    const wrapped = Object(arr);

    let a = Array.isArray(wrapped);
    let b = Array.isArray(Object(42));
    let c = Array.isArray(Object(null));
    return [a, b, c];
}

export function ObjectConstructorTest098() {
    const sym = Symbol("test");
    const symObj = Object(sym);

    let a = typeof symObj.valueOf();
    let b = symObj.valueOf() === sym;
    let c = Object.prototype.toString.call(symObj);
    return [a, b, c];
}

export function ObjectConstructorTest099() {
    const big = BigInt(42);
    const bigObj = Object(big);

    let a = typeof bigObj.valueOf();
    let b = bigObj.valueOf() === big;
    let c = Object.prototype.toString.call(bigObj);
    return [a, b, c];
}