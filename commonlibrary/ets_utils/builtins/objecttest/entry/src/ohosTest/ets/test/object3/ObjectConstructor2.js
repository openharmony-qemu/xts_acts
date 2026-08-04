
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

export function ObjectConstructor2Test001() {
    const maxObj = Object(Number.MAX_VALUE);

    let a = maxObj.valueOf();
    let b = typeof maxObj;
    return [a, b];
}

export function ObjectConstructor2Test002() {
    const minObj = Object(Number.MIN_VALUE);

    let a = minObj.valueOf();
    let b = minObj.valueOf() > 0;
    return [a, b];
}

export function ObjectConstructor2Test003() {
    const maxSafeObj = Object(Number.MAX_SAFE_INTEGER);
    let a = maxSafeObj.valueOf();
    let b = Number.isSafeInteger(maxSafeObj.valueOf());
    return [a, b];
}

export function ObjectConstructor2Test004() {
    const minSafeObj = Object(Number.MIN_SAFE_INTEGER);
    let a = minSafeObj.valueOf();
    let b = Number.isSafeInteger(minSafeObj.valueOf());
    return [a, b];
}

export function ObjectConstructor2Test005() {
    const unsafe1 = Object(9007199254740992);
    const unsafe2 = Object(-9007199254740992);
    let a = Number.isSafeInteger(unsafe1.valueOf());
    let b = Number.isSafeInteger(unsafe2.valueOf());
    return [a, b];
}

export function ObjectConstructor2Test006() {
    const maxBigInt64 = Object(BigInt("9223372036854775807"));
    const minBigInt64 = Object(BigInt("-9223372036854775808"));
    const overflowBigInt64 = Object(BigInt("9223372036854775808"));
    let a = maxBigInt64.valueOf().toString();
    let b = minBigInt64.valueOf().toString();
    let c = overflowBigInt64.valueOf().toString();
    return [a, b, c];
}

export function ObjectConstructor2Test007() {
    const maxBigUint64 = Object(BigInt("18446744073709551615"));
    const overflowBigUint64 = Object(BigInt("18446744073709551616"));
    let a = maxBigUint64.valueOf().toString();
    let b = overflowBigUint64.valueOf().toString();
    return [a, b];
}

export function ObjectConstructor2Test008() {
    const emptyStrObj = Object("");
    let a = emptyStrObj.length;
    let b = emptyStrObj.valueOf();
    return [a, b];
}

export function ObjectConstructor2Test009() {
    const singleCharObj = Object("a");
    let a = singleCharObj.length;
    let b = singleCharObj.valueOf();
    return [a, b];
}

export function ObjectConstructor2Test011() {
    const illegalUnicode = Object("\udc04");
    const surrogatePair = Object("\ud83d\udc46");
    let a = illegalUnicode.length;
    let b = surrogatePair.length;
    return [a, b];
}

export function ObjectConstructor2Test012() {
    const int8Max = new Int8Array([127]);
    const int8Min = new Int8Array([-128]);
    const int8Overflow = new Int8Array([128]);

    const wrappedMax = Object(int8Max);
    const wrappedMin = Object(int8Min);
    const wrappedOverflow = Object(int8Overflow);

    let a = wrappedMax[0];
    let b = wrappedMin[0];
    let c = wrappedOverflow[0];
    return [a, b, c];
}

export function ObjectConstructor2Test013() {
    const uint8Max = new Uint8Array([255]);
    const uint8Overflow = new Uint8Array([256]);
    const uint8Neg = new Uint8Array([-1]);

    const wrappedMax = Object(uint8Max);
    const wrappedOverflow = Object(uint8Overflow);
    const wrappedNeg = Object(uint8Neg);

    let a = wrappedMax[0];
    let b = wrappedOverflow[0];
    let c = wrappedNeg[0];
    return [a, b, c];
}

export function ObjectConstructor2Test014() {
    const float32 = new Float32Array([Infinity, -Infinity, NaN]);
    const wrapped = Object(float32);

    let a = wrapped[0];
    let b = wrapped[1];
    let c = Number.isNaN(wrapped[2]);
    return [a, b, c];
}

export function ObjectConstructor2Test015() {
    const obj = Object({ a: 1, b: 2 });
    delete obj.a;

    let a = obj.a;
    let b = 'a' in obj;
    let c = obj.b;
    return [a, b, c];
}

export function ObjectConstructor2Test016() {
    const arr = Object([1, 2, 3]);
    delete arr[1];

    let a = arr.length;
    let b = arr[1];
    let c = 1 in arr;
    return [a, b, c];
}

export function ObjectConstructor2Test017() {
    const obj = Object({});
    Object.defineProperty(obj, 'a', { value: 1, configurable: false });
    let errorType = false;
    let propValue;

    try {
        delete obj.a;
    } catch (e) {
        errorType = e instanceof TypeError;
    }

    propValue = obj.a;
    return [errorType, propValue];
}

export function ObjectConstructor2Test018() {
    const obj = Object({ a: 1 });
    const result = delete obj.b;

    let a = result;
    let b = obj.a;
    return [a, b];
}

export function ObjectConstructor2Test019() {
    const obj1 = Object(null, "extra");
    const obj2 = Object(42, "extra1", "extra2");

    let a = typeof obj1;
    let b = typeof obj2;
    let c = obj2.valueOf();
    return [a, b, c];
}

export function ObjectConstructor2Test020() {
    const circular = { a: 1 };
    circular.self = circular;

    const wrapped = Object(circular);

    let a = wrapped === circular;
    let b = wrapped.self === wrapped;
    let c = wrapped.a;
    return [a, b, c];
}

export function ObjectConstructor2Test021() {
    const obj1 = { name: "obj1" };
    const obj2 = { name: "obj2" };
    obj1.ref = obj2;
    obj2.ref = obj1;

    const wrapped1 = Object(obj1);
    const wrapped2 = Object(obj2);

    let a = wrapped1 === obj1;
    let b = wrapped2 === obj2;
    let c = wrapped1.ref === wrapped2;
    return [a, b, c];
}

export function ObjectConstructor2Test022() {
    const obj = Object({ a: 1, b: 2, c: 3 });
    const keys = Object.keys(obj);

    let a = keys;
    let b = keys.length;
    return [a, b];
}

export function ObjectConstructor2Test023() {
    const obj = Object({ a: 1, b: "test", c: true });
    const values = Object.values(obj);

    let a = values;
    let b = values.length;
    return [a, b];
}

export function ObjectConstructor2Test024() {
    const obj = Object({ a: 1, b: 2 });
    const entries = Object.entries(obj);

    let a = entries;
    let b = entries.length;
    return [a, b];
}

export function ObjectConstructor2Test025() {
    const target = Object({ a: 1 });
    const source = { b: 2, c: 3 };
    const result = Object.assign(target, source);

    let a = result === target;
    let b = result.a;
    let c = result.b;
    let d = result.c;
    return [a, b, c, d];
}

export function ObjectConstructor2Test026() {
    const proto = { inherited: "value" };
    const createdObj = Object.create(proto);
    createdObj.own = "property";

    const wrapped = Object(createdObj);

    let a = wrapped === createdObj;
    let b = wrapped.inherited;
    let c = Object.getPrototypeOf(wrapped) === proto;
    return [a, b, c];
}

export function ObjectConstructor2Test027() {
    const obj = Object({});
    Object.defineProperty(obj, 'prop', {
        value: 42,
        writable: false,
        enumerable: true,
        configurable: false
    });
    let errorType = false;
    let propValue = obj.prop;

    try {
        obj.prop = 100;
    } catch (e) {
        errorType = e instanceof TypeError;
    }

    return [propValue, errorType];
}

export function ObjectConstructor2Test028() {
    const obj = Object({});
    Object.defineProperties(obj, {
        a: { value: 1, enumerable: true },
        b: { value: 2, enumerable: false }
    });

    let a = obj.a;
    let b = obj.b;
    let c = Object.keys(obj);
    return [a, b, c];
}

export function ObjectConstructor2Test029() {
    const obj = Object({ a: 1 });
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');

    let a = desc.value;
    let b = desc.writable;
    let c = desc.enumerable;
    let d = desc.configurable;
    return [a, b, c, d];
}

export function ObjectConstructor2Test030() {
    const obj = Object({ a: 1 });
    Object.defineProperty(obj, 'hidden', { value: 2, enumerable: false });

    const names = Object.getOwnPropertyNames(obj);

    let a = names;
    let b = names.length;
    return [a, b];
}

export function ObjectConstructor2Test031() {
    const sym1 = Symbol("s1");
    const sym2 = Symbol("s2");
    const obj = Object({ [sym1]: 1, [sym2]: 2, a: 3 });

    const symbols = Object.getOwnPropertySymbols(obj);

    let a = symbols.length;
    let b = obj[symbols[0]];
    let c = obj[symbols[1]];
    return [a, b, c];
}

export function ObjectConstructor2Test032() {
    const obj = Object(null);
    const proto = Object.getPrototypeOf(obj);

    let a = proto === Object.prototype;

    const customProto = { custom: true };
    const customObj = Object.create(customProto);
    const wrappedCustom = Object(customObj);
    let b = Object.getPrototypeOf(wrappedCustom) === customProto;

    return [a, b];
}

export function ObjectConstructor2Test033() {
    const obj = Object({ a: 1 });
    const newProto = { b: 2 };

    Object.setPrototypeOf(obj, newProto);

    let a = obj.b;
    let b = Object.getPrototypeOf(obj) === newProto;
    return [a, b];
}

export function ObjectConstructor2Test034() {
    const obj = Object({ a: 1, b: 2 });
    Object.freeze(obj);
    let errorType = false;
    let isFrozen = Object.isFrozen(obj);

    try {
        obj.c = 3;
    } catch (e) {
        errorType = e instanceof TypeError;
    }

    return [isFrozen, errorType];
}

export function ObjectConstructor2Test035() {
    const obj = Object({ a: 1, b: 2 });
    Object.seal(obj);

    let isSealed = Object.isSealed(obj);
    obj.a = 10;
    let aValue = obj.a;
    let deleteError = false;

    try {
        delete obj.a;
    } catch (e) {
        deleteError = e instanceof TypeError;
    }

    return [isSealed, aValue, deleteError];
}

export function ObjectConstructor2Test036() {
    const obj = Object({ a: 1 });
    Object.preventExtensions(obj);

    let isExtensible = Object.isExtensible(obj);
    obj.a = 10;
    let aValue = obj.a;
    let addError = false;

    try {
        obj.b = 2;
    } catch (e) {
        addError = e instanceof TypeError;
    }

    return [isExtensible, aValue, addError];
}

export function ObjectConstructor2Test037() {
    const entries = [['a', 1], ['b', 2], ['c', 3]];
    const obj = Object.fromEntries(entries);
    const wrapped = Object(obj);

    let a = wrapped === obj;
    let b = wrapped.a;
    let c = wrapped.b;
    return [a, b, c];
}

export function ObjectConstructor2Test038() {
    const proto = { inherited: "value" };
    const obj = Object.create(proto);
    obj.own = "property";

    const wrapped = Object(obj);

    let a = Object.hasOwn(wrapped, 'own');
    let b = Object.hasOwn(wrapped, 'inherited');
    return [a, b];
}

export function ObjectConstructor2Test039() {
    const obj1 = Object(NaN);
    const obj2 = Object(NaN);

    let a = Object.is(obj1.valueOf(), obj2.valueOf());
    let b = obj1 === obj2;

    const sameObj = { a: 1 };
    const wrapped1 = Object(sameObj);
    const wrapped2 = Object(sameObj);
    let c = Object.is(wrapped1, wrapped2);

    return [a, b, c];
}

export function ObjectConstructor2Test040() {
    const obj = Object({ a: 1, b: "test" });
    const json = JSON.stringify(obj);

    let a = json;
    let b = JSON.parse(json).a;
    return [a, b];
}

export function ObjectConstructor2Test041() {
    const parsed = JSON.parse('{"a":1,"b":2}');
    const wrapped = Object(parsed);

    let a = wrapped === parsed;
    let b = wrapped.a;
    let c = wrapped.b;
    return [a, b, c];
}

export function ObjectConstructor2Test042() {
    const circular = { a: 1 };
    circular.self = circular;
    const wrapped = Object(circular);
    let errorType = false;

    try {
        JSON.stringify(wrapped);
    } catch (e) {
        errorType = e instanceof TypeError;
    }

    return [errorType];
}

export function ObjectConstructor2Test043() {
    const arr = Object([1, 2, 3]);
    arr.customProp = "value";

    let a = arr.length;
    let b = arr.customProp;
    let c = Object.keys(arr);
    return [a, b, c];
}

export function ObjectConstructor2Test044() {
    const arr = [1, 2, 3];
    const wrapped = Object(arr);

    let a = Array.isArray(wrapped);
    let b = wrapped.push(4);
    let c = wrapped.length;
    return [a, b, c];
}

export function ObjectConstructor2Test045() {
    const obj = Object({ a: 1, b: 2, c: 3 });
    const keys = [];

    for (const key in obj) {
        keys.push(key);
    }

    return [keys];
}

export function ObjectConstructor2Test046() {
    const arr = Object([1, 2, 3]);
    const values = [];

    for (const value of arr) {
        values.push(value);
    }

    return [values];
}

export function ObjectConstructor2Test047() {
    const sym = Symbol("test");

    const symObj = Object(sym);
    let a = typeof symObj;
    let b = symObj.valueOf() === sym;
    let errorType = false;

    try {
        new Symbol(sym);
    } catch (e) {
        errorType = e instanceof TypeError;
    }

    return [a, b, errorType];
}

export function ObjectConstructor2Test048() {
    const sym = Symbol("test");
    const symObj = Object(sym);

    let a = typeof symObj;
    let b = typeof symObj.valueOf();
    let c = Object.prototype.toString.call(symObj);
    let d = symObj.constructor === Symbol;
    return [a, b, c, d];
}

export function ObjectConstructor2Test049() {
    const sym = Symbol("myDescription");
    const symObj = Object(sym);

    let a = sym.description;
    let b = symObj.valueOf().description;
    return [a, b];
}

export function ObjectConstructor2Test050() {
    const globalSym = Symbol.for("globalKey");
    const symObj = Object(globalSym);

    let a = symObj.valueOf() === Symbol.for("globalKey");
    let b = Symbol.keyFor(symObj.valueOf());
    return [a, b];
}

export function ObjectConstructor2Test051() {
    const symKey = Symbol("key");
    const obj = { [symKey]: "value", normalKey: "normal" };
    const wrapped = Object(obj);

    let a = wrapped[symKey];
    let b = wrapped.normalKey;
    let c = Object.getOwnPropertySymbols(wrapped);
    return [a, b, c.length];
}

export function ObjectConstructor2Test052() {
    const sym = Symbol("test");
    const symObj = Object(sym);

    symObj.customProp = "value";
    let a = symObj.customProp;
    let b = symObj.valueOf() === sym;
    let c;

    try {
        sym.customProp = "value";
    } catch (err) {
        c = undefined;
    }
    return [a, b, c];
}

export function ObjectConstructor2Test053() {
    const sym = Symbol("test");
    const symObj1 = Object(sym);
    const symObj2 = Object(sym);

    let a = symObj1 === symObj2;
    let b = symObj1.valueOf() === symObj2.valueOf();
    return [a, b];
}

export function ObjectConstructor2Test054() {
    const sym = Symbol("test");
    const symObj = Object(sym);
    const unwrapped = symObj.valueOf();

    let a = typeof unwrapped;
    let b = unwrapped === sym;
    return [a, b];
}

export function ObjectConstructor2Test055() {
    const big = BigInt(42);

    const bigObj = Object(big);
    let a = typeof bigObj;
    let b = bigObj.valueOf().toString();
    let errorType = false;

    try {
        new BigInt(big);
    } catch (e) {
        errorType = e instanceof TypeError;
    }

    return [a, b, errorType];
}

export function ObjectConstructor2Test056() {
    const big = BigInt(42);
    const bigObj = Object(big);

    let a = typeof bigObj;
    let b = typeof bigObj.valueOf();
    let c = Object.prototype.toString.call(bigObj);
    let d = bigObj.constructor === BigInt;
    return [a, b, c, d];
}

export function ObjectConstructor2Test057() {
    const big1 = Object(BigInt(10));
    const big2 = Object(BigInt(5));

    const sum = big1.valueOf() + big2.valueOf();
    const product = big1.valueOf() * big2.valueOf();
    return [sum.toString(), product.toString()];
}

export function ObjectConstructor2Test058() {
    const bigObj = Object(BigInt(10));
    const numObj = Object(5);
    let errorType = false;
    let converted;

    try {
        bigObj.valueOf() + numObj.valueOf();
    } catch (e) {
        errorType = e instanceof TypeError;
    }

    converted = Number(bigObj.valueOf()) + numObj.valueOf();
    return [errorType, converted];
}

export function ObjectConstructor2Test059() {
    const bigObj = Object(BigInt(12345));

    let a = bigObj.toString();
    let b = bigObj.valueOf().toString();
    let c = String(bigObj.valueOf());
    return [a, b, c];
}

export function ObjectConstructor2Test060() {
    const big = BigInt(42);
    const bigObj = Object(big);

    bigObj.customProp = "value";
    bigObj.metadata = { created: Date.now() };
    let a = bigObj.customProp;
    let b = typeof bigObj.metadata.created === 'number';
    let c = bigObj.valueOf().toString();
    return [a, b, c];
}

export function ObjectConstructor2Test061() {
    const big = BigInt(42);
    const bigObj1 = Object(big);
    const bigObj2 = Object(big);

    let a = bigObj1 === bigObj2;
    let b = bigObj1.valueOf() === bigObj2.valueOf();
    let c = bigObj1.valueOf() === big;
    return [a, b, c];
}

export function ObjectConstructor2Test062() {
    const big = BigInt(42);
    const bigObj = Object(big);
    const unwrapped = bigObj.valueOf();

    let a = typeof unwrapped;
    let b = unwrapped === big;
    return [a, b];
}

export function ObjectConstructor2Test063() {
    const symKey = Symbol("bigKey");
    const obj = {
        [symKey]: BigInt(100),
        normalNumber: 42,
        normalBigInt: BigInt(200)
    };

    const wrapped = Object(obj);

    let a = wrapped[symKey];
    let b = typeof wrapped[symKey];
    let c = wrapped.normalNumber;
    let d = wrapped.normalBigInt;
    return [a.toString(), b, c.toString(), d.toString()];
}

export function ObjectConstructor2Test064() {
    const sym = Symbol("test");
    const big = BigInt(999);

    const obj = Object({
        symValue: sym,
        bigValue: big,
        mixed: { sym, big }
    });

    let a = obj.symValue === sym;
    let b = obj.bigValue === big;
    let c = typeof obj.symValue;
    let d = typeof obj.bigValue;
    return [a, b, c, d];
}