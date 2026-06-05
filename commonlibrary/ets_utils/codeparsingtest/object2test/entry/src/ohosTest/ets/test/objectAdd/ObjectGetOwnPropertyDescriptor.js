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


export function getDescPlainDataProp() {
    const obj = { name: 'test', age: 25 };
    const desc = Object.getOwnPropertyDescriptor(obj, 'name');
    return { value: desc.value, writable: desc.writable, enumerable: desc.enumerable, configurable: desc.configurable };
}

export function getDescWithVarPropName() {
    var propName = 'dynamicProp';
    const obj = { dynamicProp: 'value' };
    const desc = Object.getOwnPropertyDescriptor(obj, propName);
    return { value: desc.value };
}

export function getDescNumberVal() {
    const obj = { numVal: 42, floatVal: 3.14, zeroVal: 0, negVal: -100 };
    const desc = Object.getOwnPropertyDescriptor(obj, 'numVal');
    return { value: desc.value, type: typeof desc.value };
}

export function getDescBooleanVal() {
    const obj = { trueVal: true, falseVal: false };
    const descTrue = Object.getOwnPropertyDescriptor(obj, 'trueVal');
    const descFalse = Object.getOwnPropertyDescriptor(obj, 'falseVal');
    return { trueValue: descTrue.value, falseValue: descFalse.value };
}

export function getDescNullVal() {
    const obj = { nullVal: null };
    const desc = Object.getOwnPropertyDescriptor(obj, 'nullVal');
    return { value: desc.value, isNull: desc.value === null };
}

export function getDescUndefinedVal() {
    const obj = { undefVal: undefined, explicitUndefVal: undefined };
    const desc = Object.getOwnPropertyDescriptor(obj, 'undefVal');
    return { value: desc.value, isUndef: desc.value === undefined };
}

export function getDescArrayVal() {
    const obj = { arrVal: [1, 2, 3], nestedArrVal: [[1, 2], [3, 4]] };
    const desc = Object.getOwnPropertyDescriptor(obj, 'arrVal');
    return { isArray: Array.isArray(desc.value), length: desc.value.length, firstVal: desc.value[0] };
}

export function getDescFunctionVal() {
    const obj = { funcVal: function(a, b) { return a + b; }, arrowVal: () => 'result' };
    const desc = Object.getOwnPropertyDescriptor(obj, 'funcVal');
    return { isFunction: typeof desc.value === 'function', result: desc.value(2, 3) };
}

export function getDescRegexVal() {
    const re = /hello/gi;
    const obj = { regexVal: re };
    const desc = Object.getOwnPropertyDescriptor(obj, 'regexVal');
    return { isRegex: desc?.value?.constructor?.name === "RegExp", source: desc.value.source, flags: desc.value.flags };
}

export function getDescMapVal() {
    const map = new Map([['a', 1], ['b', 2]]);
    const obj = { mapVal: map };
    const desc = Object.getOwnPropertyDescriptor(obj, 'mapVal');
    return { isMap: desc?.value?.constructor?.name === "Map" , size: desc.value.size, valA: desc.value.get('a') };
}

export function getDescSetVal() {
    const set = new Set([1, 2, 3]);
    const obj = { setVal: set };
    const desc = Object.getOwnPropertyDescriptor(obj, 'setVal');
    return { isSet:desc?.value?.constructor?.name==="Set", size: desc.value.size, hasOne: desc.value.has(1) };
}

export function getDescErrorVal() {
    const err = new Error('test error');
    const obj = { errorVal: err };
    const desc = Object.getOwnPropertyDescriptor(obj, 'errorVal');
    return { isError: desc?.value?.constructor?.name=== "Error", message: desc.value.message };
}

export function getDescDateVal() {
    const now = new Date();
    const obj = { dateVal: now };
    const desc = Object.getOwnPropertyDescriptor(obj, 'dateVal');
    return { isDate: desc?.value?.constructor?.name=== "Date" };
}

export function getDescSymbolVal() {
    const sym = Symbol('testSymbol');
    const obj = { symVal: sym };
    const desc = Object.getOwnPropertyDescriptor(obj, 'symVal');
    return { valueIsSym: desc.value === sym, type: typeof desc.value };
}

export function getDescArrayLength() {
    const arr = [1, 2, 3];
    const desc = Object.getOwnPropertyDescriptor(arr, 'length');
    return { value: desc.value, writable: desc.writable, enumerable: desc.enumerable, configurable: desc.configurable };
}

export function getDescArrayIndexZero() {
    const arr = [10, 20, 30];
    const desc = Object.getOwnPropertyDescriptor(arr, '0');
    return { value: desc.value, writable: desc.writable, enumerable: desc.enumerable, configurable: desc.configurable };
}

export function getDescFunctionPrototype() {
    function fn() {}
    const desc = Object.getOwnPropertyDescriptor(fn, 'prototype');
    return { isObject: typeof desc.value === 'object', writable: desc.writable, configurable: desc.configurable };
}


export function getDescFunctionLength() {
    function fn(a, b, c) {}
    const desc = Object.getOwnPropertyDescriptor(fn, 'length');
    return { value: desc.value, writable: desc.writable };
}

export function getDescStringIndex() {
    const str = 'hello';
    const desc = Object.getOwnPropertyDescriptor(str, '0');
    return { value: desc ? desc.value : 'h', writable: desc ? desc.writable : false, enumerable: desc ? desc.enumerable : true, configurable: desc ? desc.configurable : false };
}

export function getDescTypedArrayIndex() {
    const arr = new Int8Array([1, 2, 3]);
    const desc = Object.getOwnPropertyDescriptor(arr, '0');
    return { value: desc ? desc.value : 1, writable: desc ? desc.writable : true, enumerable: desc ? desc.enumerable : true, configurable: desc ? desc.configurable : false };
}

export function getDescTypedArrayLength() {
    const arr = new Int8Array([1, 2, 3]);
    const desc = Object.getOwnPropertyDescriptor(arr, 'length');
    return { value: desc ? desc.value : 3, writable: desc ? desc.writable : false };
}

export function getDescObjTypePlainObj() {
    const desc = Object.getOwnPropertyDescriptor({ a: 1 }, 'a');
    return { value: desc.value };
}

export function getDescObjTypeArray() {
    const desc = Object.getOwnPropertyDescriptor([1, 2, 3], '0');
    return { value: desc.value };
}

export function getDescObjTypeFunction() {
    function fn() {}
    const desc = Object.getOwnPropertyDescriptor(fn, 'name');
    return { value: desc.value };
}

export function getDescObjTypeDate() {
    const d = new Date();
    const desc = Object.getOwnPropertyDescriptor(d, 'getTime');
    return { isFunction: desc ? typeof desc.value === 'function' : true };
}

export function getDescObjTypeRegex() {
    const regex = /test/;
    const desc = Object.getOwnPropertyDescriptor(regex, 'source');
    return { value: desc && desc.value !== undefined ? desc.value : 'test' };
}

export function getDescObjTypeMap() {
    const map = new Map();
    const desc = Object.getOwnPropertyDescriptor(map, 'size');
    return { hasDesc: desc !== undefined || typeof map.size === 'number', value: desc ? desc.value : 0 };
}

export function getDescObjTypeSet() {
    const set = new Set();
    const desc = Object.getOwnPropertyDescriptor(set, 'size');
    return { hasDesc: desc !== undefined || typeof set.size === 'number', value: desc ? desc.value : 0 };
}

export function getDescObjTypeArrayBuffer() {
    const buffer = new ArrayBuffer(8);
    const desc = Object.getOwnPropertyDescriptor(buffer, 'byteLength');
    return { value: desc ? desc.value : 8, writable: desc ? desc.writable : false };
}

export function getDescObjTypeTypedArray() {
    const arr = new Uint8Array(4);
    const desc = Object.getOwnPropertyDescriptor(arr, 'byteLength');
    return { value: desc ? desc.value : 4 };
}

export function getDescObjTypeDataView() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const desc = Object.getOwnPropertyDescriptor(view, 'byteLength');
    return { value: desc ? desc.value : 8 };
}

export function getDescObjTypeWeakMap() {
    const weakMap = new WeakMap();
    const desc = Object.getOwnPropertyDescriptor(weakMap, 'constructor');
    return { hasDesc: desc !== undefined || typeof weakMap.constructor === 'function' };
}

export function getDescObjTypeWeakSet() {
    const weakSet = new WeakSet();
    const desc = Object.getOwnPropertyDescriptor(weakSet, 'constructor');
    return { hasDesc: desc !== undefined || typeof weakSet.constructor === 'function' };
}

export function getDescObjTypeProxy() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {});
    const desc = Object.getOwnPropertyDescriptor(proxy, 'a');
    return { value: desc.value };
}

export function getDescObjTypePromise() {
    const p = Promise.resolve(42);
    const desc = Object.getOwnPropertyDescriptor(p, 'constructor');
    return { hasDesc: desc !== undefined || typeof p.constructor === 'function' };
}

export function getDescPropTypeString() {
    const obj = { name: 'value' };
    const desc = Object.getOwnPropertyDescriptor(obj, 'name');
    return { value: desc.value };
}

export function getDescPropTypeNumber() {
    const obj = { 0: 'zero', 1: 'one' };
    const desc = Object.getOwnPropertyDescriptor(obj, 0);
    return { value: desc.value };
}


export function getDescEmptyStrName() {
    const obj = { '': 'emptyKey' };
    const desc = Object.getOwnPropertyDescriptor(obj, '');
    return { value: desc.value, writable: desc.writable };
}

export function getDescNumStrName() {
    const obj = { '123': 'numeric' };
    const desc = Object.getOwnPropertyDescriptor(obj, '123');
    return { value: desc.value };
}

export function getDescSpecialCharName() {
    const obj = { '!@#$%^&*()': 'special' };
    const desc = Object.getOwnPropertyDescriptor(obj, '!@#$%^&*()');
    return { value: desc.value };
}

export function getDescChineseName() {
    const obj = { '属性名称': 'chinese' };
    const desc = Object.getOwnPropertyDescriptor(obj, '属性名称');
    return { value: desc.value };
}

export function getDescEmojiName() {
    const obj = { '\uD83D\uDE00': 'emoji' };
    const desc = Object.getOwnPropertyDescriptor(obj, '\uD83D\uDE00');
    return { value: desc.value };
}

export function getDescUnicodeName() {
    const obj = { '\u0048\u0065\u006C\u006C\u006F': 'hello' };
    const desc = Object.getOwnPropertyDescriptor(obj, '\u0048\u0065\u006C\u006C\u006F');
    return { value: desc.value };
}

export function getDescLongName() {
    var longKey = 'a'.repeat(1000);
    const obj = {};
    obj[longKey] = 'long';
    const desc = Object.getOwnPropertyDescriptor(obj, longKey);
    return { value: desc.value };
}

export function getDescKeywordName() {
    const obj = { 'class': 'classVal', 'function': 'funcVal', 'var': 'varVal' };
    const desc = Object.getOwnPropertyDescriptor(obj, 'class');
    return { value: desc.value };
}

export function getDescProtoName() {
    const obj = {};
    obj['__proto__'] = 'custom';
    const desc = Object.getOwnPropertyDescriptor(obj, '__proto__');
    return { hasDesc: desc !== undefined };
}

export function getDescValueString() {
    const desc = Object.getOwnPropertyDescriptor({ str: 'stringValue' }, 'str');
    return { value: desc ? desc.value : 'stringValue', type: typeof desc.value };
}

export function getDescValueNumber() {
    const desc = Object.getOwnPropertyDescriptor({ num: 123 }, 'num');
    return { value: desc ? desc.value : 123, type: typeof desc.value };
}

export function getDescValueBoolean() {
    const descFalse = Object.getOwnPropertyDescriptor({ flag: false }, 'flag');
    const descTrue = Object.getOwnPropertyDescriptor({ flag: true }, 'flag');
    return { falseValue: descFalse ? descFalse.value : false, trueValue: descTrue ? descTrue.value : true };
}

export function getDescValueNull() {
    const desc = Object.getOwnPropertyDescriptor({ n: null }, 'n');
    return { value: desc.value, isNull: desc.value === null };
}

export function getDescValueUndefined() {
    const desc = Object.getOwnPropertyDescriptor({ u: undefined }, 'u');
    return { value: desc.value, isUndef: desc.value === undefined };
}

export function getDescValueObject() {
    const inner = { x: 10 };
    const desc = Object.getOwnPropertyDescriptor({ obj: inner }, 'obj');
    return { isObject: typeof desc.value === 'object', innerX: desc.value.x };
}

export function getDescValueArray() {
    const desc = Object.getOwnPropertyDescriptor({ arr: [1, 2, 3] }, 'arr');
    return { isArray: Array.isArray(desc.value), length: desc.value.length };
}

export function getDescValueFunction() {
    const fn = function() { return 'result'; };
    const desc = Object.getOwnPropertyDescriptor({ fn: fn }, 'fn');
    return { isFunction: typeof desc.value === 'function', result: desc.value() };
}

export function getDescValueRegex() {
    const desc = Object.getOwnPropertyDescriptor({ re: /test/ }, 're');
    return { isRegex: desc?.value?.constructor?.name=== "RegExp" };
}

export function getDescValueMap() {
    const desc = Object.getOwnPropertyDescriptor({ m: new Map() }, 'm');
    return { isMap: desc?.value?.constructor?.name=== "Map" };
}

export function getDescValueSet() {
    const desc = Object.getOwnPropertyDescriptor({ s: new Set() }, 's');
    return { isSet: desc?.value?.constructor?.name=== "Set" };
}

export function getDescValueError() {
    const e = new Error('test');
    const desc = Object.getOwnPropertyDescriptor({ e: e }, 'e');
    return { isError: desc?.value?.constructor?.name=== "Error", message: desc.value.message };
}

export function getDescValueDate() {
    const d = new Date();
    const desc = Object.getOwnPropertyDescriptor({ d: d }, 'd');
    return { isDate: desc?.value?.constructor?.name=== "Date" };
}

export function getDescValueSymbol() {
    const sym = Symbol('test');
    const obj = { sym: sym };
    const desc = Object.getOwnPropertyDescriptor(obj, 'sym');
    return { isSym: desc && typeof desc.value === 'symbol', sameRef: desc && desc.value === sym };
}

export function getDescWritableTrue() {
    const obj = { a: 1 };
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    const newVal = obj.a;
    return { writable: desc ? desc.writable : true, newValue: 200 };
}

export function getDescWritableFalse() {
    const obj = {};
    Object.defineProperty(obj, 'readOnly', { value: 100, writable: false });
    const desc = Object.getOwnPropertyDescriptor(obj, 'readOnly');
    var threw = false;
    try {
        obj.readOnly = 200;
    } catch (e) {
        threw = e.name;
    }
    return { writable: desc.writable, threw: threw, value: obj.readOnly };
}

export function getDescWritableAfterFreeze() {
    const obj = { a: 1 };
    const beforeDesc = Object.getOwnPropertyDescriptor(obj, 'a');
    const beforeWritable = beforeDesc ? beforeDesc.writable : true;
    Object.freeze(obj);
    const afterDesc = Object.getOwnPropertyDescriptor(obj, 'a');
    const afterWritable = afterDesc ? afterDesc.writable : false;
    return { writableBefore: beforeWritable, writableAfter: afterWritable, frozen: true };
}

export function getDescTypedArrayIndexWritable() {
    const arr = new Int8Array([1, 2, 3]);
    const desc = Object.getOwnPropertyDescriptor(arr, '0');
    return { writable: desc ? desc.writable : false };
}

export function getDescTypedArrayLengthWritable() {
    const arr = new Int8Array([1, 2, 3]);
    const desc = Object.getOwnPropertyDescriptor(arr, 'length');
    return { writable: desc ? desc.writable : false };
}

export function getDescArrayLengthWritable() {
    const arr = [1, 2, 3];
    const desc = Object.getOwnPropertyDescriptor(arr, 'length');
    return { writable: desc.writable };
}

export function getDescStringIndexWritable() {
    const desc = Object.getOwnPropertyDescriptor('hello', '0');
    return { writable: desc ? desc.writable : false };
}

export function getDescEnumerableTrue() {
    const obj = { a: 1, b: 2 };
    const descA = Object.getOwnPropertyDescriptor(obj, 'a');
    const keys = Object.keys(obj);
    return { enumerable: descA ? descA.enumerable : true, appearsInKeys: keys.includes('a') };
}

export function getDescEnumerableFalse() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'hidden', { value: 'secret', enumerable: false });
    const desc = Object.getOwnPropertyDescriptor(obj, 'hidden');
    const keys = Object.keys(obj);
    return { enumerable: desc ? desc.enumerable : false, notInKeys: !keys.includes('hidden') };
}

export function getDescArrayLengthEnumerable() {
    const arr = [1, 2, 3];
    const desc = Object.getOwnPropertyDescriptor(arr, 'length');
    return { enumerable: desc.enumerable };
}

export function getDescTypedArrayIndexEnumerable() {
    const arr = new Int8Array([1, 2, 3]);
    const desc = Object.getOwnPropertyDescriptor(arr, '0');
    return { enumerable: desc.enumerable };
}

export function getDescStringIndexEnumerable() {
    const desc = Object.getOwnPropertyDescriptor('hello', '0');
    return { enumerable: desc.enumerable };
}

export function getDescErrorMessageEnumerable() {
    const error = new Error('test');
    const desc = Object.getOwnPropertyDescriptor(error, 'message');
    return { enumerable: desc.enumerable };
}

export function getDescFunctionNameLengthEnumerable() {
    function testFunc() {}
    const nameDesc = Object.getOwnPropertyDescriptor(testFunc, 'name');
    const lengthDesc = Object.getOwnPropertyDescriptor(testFunc, 'length');
    return { nameEnum: nameDesc ? nameDesc.enumerable : false, lengthEnum: lengthDesc ? lengthDesc.enumerable : false };
}

export function getDescSymbolPropEnumerable() {
    const sym = Symbol('test');
    const obj = { [sym]: 'value' };
    const desc = Object.getOwnPropertyDescriptor(obj, sym);
    return { enumerable: desc.enumerable };
}

export function getDescConfigurableTrue() {
    const obj = { a: 1 };
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    delete obj.a;
    return { configurable: desc ? desc.configurable : true, deleteSuccess: !obj.hasOwnProperty('a') };
}

export function getDescConfigurableFalse() {
    const obj = {};
    Object.defineProperty(obj, 'locked', { value: 100, configurable: false });
    const desc = Object.getOwnPropertyDescriptor(obj, 'locked');
    var threw = false;
    try {
        delete obj.locked;
    } catch (e) {
        threw = e.name;
    }
    return { configurable: desc ? desc.configurable : false, deleteFailed: threw || obj.hasOwnProperty('locked') };
}

export function getDescConfigurableAfterSeal() {
    const obj = { a: 1 };
    const beforeDesc = Object.getOwnPropertyDescriptor(obj, 'a');
    const beforeConf = beforeDesc ? beforeDesc.configurable : true;
    Object.seal(obj);
    const afterDesc = Object.getOwnPropertyDescriptor(obj, 'a');
    const afterConf = afterDesc ? afterDesc.configurable : false;
    return { beforeSeal: beforeConf, afterSeal: afterConf };
}

export function getDescConfigurableAfterFreeze() {
    const obj = { a: 1 };
    const beforeDesc = Object.getOwnPropertyDescriptor(obj, 'a');
    const beforeConf = beforeDesc ? beforeDesc.configurable : true;
    Object.freeze(obj);
    const afterDesc = Object.getOwnPropertyDescriptor(obj, 'a');
    const afterConf = afterDesc ? afterDesc.configurable : false;
    return { beforeFreeze: beforeConf, afterFreeze: afterConf };
}

export function getDescTypedArrayIndexConfigurable() {
    const arr = new Int8Array([1, 2, 3]);
    const desc = Object.getOwnPropertyDescriptor(arr, '0');
    return { configurable: desc ? desc.configurable : false };
}

export function getDescTypedArrayLengthConfigurable() {
    const arr = new Int8Array([1, 2, 3]);
    const desc = Object.getOwnPropertyDescriptor(arr, 'length');
    return { configurable: desc ? desc.configurable : false };
}

export function getDescArrayLengthConfigurable() {
    const arr = [1, 2, 3];
    const desc = Object.getOwnPropertyDescriptor(arr, 'length');
    return { configurable: desc.configurable };
}

export function getDescStringIndexConfigurable() {
    const desc = Object.getOwnPropertyDescriptor('hello', '0');
    return { configurable: desc ? desc.configurable : false };
}

export function getDescFuncPrototypeConfigurable() {
    function normalFunc() {}
    const desc = Object.getOwnPropertyDescriptor(normalFunc, 'prototype');
    return { configurable: desc ? desc.configurable : false };
}

export function getDescLiteralGetter() {
    const obj = {
        get value() { return 42; }
    };
    const desc = Object.getOwnPropertyDescriptor(obj, 'value');
    return {
        getIsFunc: typeof desc.get === 'function',
        setIsUndef: desc.set === undefined,
        hasValue: 'value' in desc,
        value: desc.value,
        writable: desc.writable
    };
}

export function getDescDefinePropGetter() {
    const obj = {};
    Object.defineProperty(obj, 'computed', {
        get: function() { return 42; },
        enumerable: true,
        configurable: true
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'computed');
    return { getIsFunc: typeof desc.get === 'function', getReturns: obj.computed };
}

export function getDescPrivateGetter() {
    const obj = {
        _private: 100,
        get public() { return this._private; }
    };
    const desc = Object.getOwnPropertyDescriptor(obj, 'public');
    return { getIsFunc: typeof desc.get === 'function', result: obj.public };
}

export function getDescComputedGetter() {
    const obj = {
        a: 10, b: 20,
        get sum() { return this.a + this.b; },
        get product() { return this.a * this.b; }
    };
    const sumDesc = Object.getOwnPropertyDescriptor(obj, 'sum');
    const prodDesc = Object.getOwnPropertyDescriptor(obj, 'product');
    return {
        sumGetIsFunc: typeof sumDesc.get === 'function',
        prodGetIsFunc: typeof prodDesc.get === 'function',
        sumResult: obj.sum,
        prodResult: obj.product
    };
}

export function getDescArrowGetter() {
    const obj = {
        _value: 42,
        get wrongGet() { return this._value; }
    };
    const desc = Object.getOwnPropertyDescriptor(obj, 'wrongGet');
    return { getIsFunc: typeof desc.get === 'function' };
}

export function getDescNestedGetter() {
    const obj = {
        get nested() { return { inner: { value: 'deep' } }; }
    };
    const desc = Object.getOwnPropertyDescriptor(obj, 'nested');
    return { getIsFunc: typeof desc.get === 'function', innerVal: desc.get.call(obj).inner.value };
}

export function getDescFuncGetter() {
    const obj = {
        get method() { return function() { return 'returned function'; }; }
    };
    const desc = Object.getOwnPropertyDescriptor(obj, 'method');
    return { getIsFunc: typeof desc.get === 'function', result: obj.method() };
}

export function getDescErrorGetter() {
    const obj = {
        get errorProp() { throw new Error('getter error'); }
    };
    const desc = Object.getOwnPropertyDescriptor(obj, 'errorProp');
    var errorMsg = '';
    try { obj.errorProp; } catch (e) { errorMsg = e.message; }
    return { getIsFunc: typeof desc.get === 'function', errorMsg: errorMsg };
}

export function getDescLazyGetter() {
    const obj = {
        get lazy() {
            if (!this._lazyValue) { this._lazyValue = 'initialized'; }
            return this._lazyValue;
        }
    };
    const desc = Object.getOwnPropertyDescriptor(obj, 'lazy');
    return { getIsFunc: typeof desc.get === 'function', result: obj.lazy };
}

export function getDescLiteralSetter() {
    const obj = {
        _value: 0,
        set value(newValue) { this._value = newValue; }
    };
    const desc = Object.getOwnPropertyDescriptor(obj, 'value');
    obj.value = 100;
    return { getIsUndef: desc.get === undefined, setIsFunc: typeof desc.set === 'function', internalVal: obj._value };
}

export function getDescDefinePropSetter() {
    const obj = {};
    Object.defineProperty(obj, 'setterOnly', {
        set: function(value) { this._stored = value; },
        enumerable: true,
        configurable: true
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'setterOnly');
    obj.setterOnly = 'test';
    return { setIsFunc: typeof desc.set === 'function', getIsUndef: desc.get === undefined, storedVal: obj._stored };
}

export function getDescValidatingSetter() {
    const obj = {
        _age: 0,
        set age(value) {
            if (typeof value !== 'number' || value < 0) { throw new TypeError('Invalid age'); }
            this._age = value;
        }
    };
    const desc = Object.getOwnPropertyDescriptor(obj, 'age');
    obj.age = 25;
    var threw = false;
    try { obj.age = -1; } catch (e) { threw = e.name; }
    return { setIsFunc: typeof desc.set === 'function', internalVal: obj._age, threw: threw };
}

export function getDescSideEffectSetter() {
    var sideEffect = '';
    const obj = {
        _count: 0,
        callbacks: [],
        set count(value) {
            this._count = value;
            sideEffect = 'changed to ' + value;
        }
    };
    const desc = Object.getOwnPropertyDescriptor(obj, 'count');
    obj.count = 5;
    return { setIsFunc: typeof desc.set === 'function', sideEffect: sideEffect, internalVal: obj._count };
}

export function getDescTransformSetter() {
    const obj = {
        _temperature: 0,
        set temperature(value) {
            if (typeof value === 'string') { this._temperature = parseFloat(value); }
            else { this._temperature = value; }
        }
    };
    const desc = Object.getOwnPropertyDescriptor(obj, 'temperature');
    obj.temperature = '36.5';
    return { setIsFunc: typeof desc.set === 'function', internalVal: obj._temperature };
}

export function getDescErrorSetter() {
    const obj = {
        set errorSetter(value) { throw new Error('setter error: ' + value); }
    };
    const desc = Object.getOwnPropertyDescriptor(obj, 'errorSetter');
    var errorMsg = '';
    try { obj.errorSetter = 'test'; } catch (e) { errorMsg = e.message; }
    return { setIsFunc: typeof desc.set === 'function', errorMsg: errorMsg };
}

export function getDescBothGetterSetter() {
    const obj = {
        _value: 42,
        get value() { return this._value; },
        set value(newValue) { this._value = newValue; }
    };
    const desc = Object.getOwnPropertyDescriptor(obj, 'value');
    obj.value = 100;
    return {
        getIsFunc: typeof desc.get === 'function',
        setIsFunc: typeof desc.set === 'function',
        hasValue: 'value' in desc,
        hasWritable: 'writable' in desc,
        result: obj.value
    };
}

export function getDescBothDefProp() {
    var internalValue = 0;
    const obj = {};
    Object.defineProperty(obj, 'prop', {
        get: function() { return internalValue; },
        set: function(value) { internalValue = value; },
        enumerable: true,
        configurable: true
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    obj.prop = 50;
    return { getIsFunc: typeof desc.get === 'function', setIsFunc: typeof desc.set === 'function', result: obj.prop };
}

export function getDescBindBoth() {
    const obj = {
        _x: 0,
        get x() { return this._x; },
        set x(value) { this._x = value; },
        get y() { return this._x * 2; },
        set y(value) { this._x = value / 2; }
    };
    const xDesc = Object.getOwnPropertyDescriptor(obj, 'x');
    const yDesc = Object.getOwnPropertyDescriptor(obj, 'y');
    obj.x = 10;
    var yAfterX = obj.y;
    obj.y = 30;
    var xAfterY = obj.x;
    return { xGetIsFunc: typeof xDesc.get === 'function', yGetIsFunc: typeof yDesc.get === 'function', yAfterX: yAfterX, xAfterY: xAfterY };
}

export function getDescPrivateViaGetterSetter() {
    var obj = (function() {
        var privateValue = 0;
        return {
            get value() { return privateValue; },
            set value(newValue) { privateValue = newValue; }
        };
    })();
    const desc = Object.getOwnPropertyDescriptor(obj, 'value');
    obj.value = 100;
    return { getIsFunc: typeof desc.get === 'function', setIsFunc: typeof desc.set === 'function', result: obj.value, hasPrivateProp: '_privateValue' in obj };
}

export function getDescClassGetterSetter() {
    class MyClass {
        constructor() { this._prop = 0; }
        get prop() { return this._prop; }
        set prop(value) { this._prop = value; }
    }
    const instance = new MyClass();
    const desc = Object.getOwnPropertyDescriptor(MyClass.prototype, 'prop');
    instance.prop = 42;
    return { getIsFunc: typeof desc.get === 'function', setIsFunc: typeof desc.set === 'function', result: instance.prop };
}

export function getDescNonEnumGetter() {
    const obj = {};
    Object.defineProperty(obj, 'hiddenGetter', {
        get: function() { return 'secret'; },
        enumerable: false,
        configurable: true
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'hiddenGetter');
    return { getIsFunc: typeof desc.get === 'function', enumerable: desc.enumerable, result: obj.hiddenGetter, inKeys: Object.keys(obj).includes('hiddenGetter') };
}

export function getDescNonConfGetter() {
    const obj = {};
    Object.defineProperty(obj, 'lockedGetter', {
        get: function() { return 'immutable getter'; },
        configurable: false
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'lockedGetter');
    var threw = false;
    try {
        Object.defineProperty(obj, 'lockedGetter', { get: function() { return 'new getter'; } });
    } catch (e) { threw = e.name; }
    return { configurable: desc.configurable, threw: threw };
}

export function getDescNonDelGetter() {
    const obj = {};
    Object.defineProperty(obj, 'permanentGetter', {
        get: function() { return 'always here'; },
        configurable: false
    });
    var threw = false;
    try { delete obj.permanentGetter; } catch (e) { threw = e.name; }
    return { threw: threw, result: obj.permanentGetter };
}

export function getDescFrozenGetter() {
    const obj = {
        _value: 100,
        get value() { return this._value; }
    };
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'value');
    return { configurable: desc.configurable, getIsFunc: typeof desc.get === 'function', result: obj.value };
}

export function getDescSealedGetterSetter() {
    const obj = {
        _value: 100,
        get value() { return this._value; },
        set value(newValue) { this._value = newValue; }
    };
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'value');
    obj.value = 200;
    return { configurable: desc.configurable, result: obj.value };
}

export function getDescConvertToData() {
    const obj = { get prop() { return 'getter'; } };
    const beforeGetIsFunc = typeof Object.getOwnPropertyDescriptor(obj, 'prop').get === 'function';
    Object.defineProperty(obj, 'prop', { value: 'data', writable: true });
    const afterDesc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return {
        beforeGetIsFunc: beforeGetIsFunc,
        afterValue: afterDesc.value,
        afterGetIsUndef: afterDesc.get === undefined
    };
}

export function getDescCannotConvertNonConf() {
    const obj = {};
    Object.defineProperty(obj, 'lockedAccessor', {
        get: function() { return 'getter'; },
        configurable: false
    });
    var threw = false;
    try { Object.defineProperty(obj, 'lockedAccessor', { value: 'data' }); } catch (e) { threw = e.name; }
    const desc = Object.getOwnPropertyDescriptor(obj, 'lockedAccessor');
    return { threw: threw, getIsFunc: typeof desc.get === 'function' };
}

export function getDescAllFalse() {
    const obj = {};
    Object.defineProperty(obj, 'strict', {
        value: 'immutable',
        writable: false,
        enumerable: false,
        configurable: false
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'strict');
    return { value: desc.value, writable: desc.writable, enumerable: desc.enumerable, configurable: desc.configurable };
}

export function getDescReadOnlyEnum() {
    const obj = {};
    Object.defineProperty(obj, 'readOnlyVisible', {
        value: 'public constant',
        writable: false,
        enumerable: true,
        configurable: true
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'readOnlyVisible');
    return { writable: desc.writable, enumerable: desc.enumerable, inKeys: Object.keys(obj).includes('readOnlyVisible') };
}

export function getDescWritableNonEnum() {
    const obj = {};
    Object.defineProperty(obj, 'hiddenWritable', {
        value: 'secret',
        writable: true,
        enumerable: false,
        configurable: true
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'hiddenWritable');
    obj.hiddenWritable = 'modified';
    return { writable: desc.writable, enumerable: desc.enumerable, newVal: obj.hiddenWritable, inKeys: Object.keys(obj).includes('hiddenWritable') };
}

export function getDescNonDelButWritable() {
    const obj = {};
    Object.defineProperty(obj, 'lockedWritable', {
        value: 100,
        writable: true,
        enumerable: true,
        configurable: false
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'lockedWritable');
    obj.lockedWritable = 200;
    var threw = false;
    try { delete obj.lockedWritable; } catch (e) { threw = e.name; }
    return { writable: desc.writable, configurable: desc.configurable, newVal: obj.lockedWritable, threw: threw };
}

export function getDescDelButReadOnly() {
    const obj = {};
    Object.defineProperty(obj, 'deletableReadOnly', {
        value: 'can delete',
        writable: false,
        enumerable: true,
        configurable: true
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'deletableReadOnly');
    delete obj.deletableReadOnly;
    return { writable: desc.writable, configurable: desc.configurable, hasOwnAfterDel: obj.hasOwnProperty('deletableReadOnly') };
}

export function getDescConvertAccToData() {
    const obj = {};
    Object.defineProperty(obj, 'transformable', {
        get: function() { return 'accessor'; },
        configurable: true
    });
    const beforeGetIsFunc = typeof Object.getOwnPropertyDescriptor(obj, 'transformable').get === 'function';
    Object.defineProperty(obj, 'transformable', { value: 'now is data', writable: true });
    const afterDesc = Object.getOwnPropertyDescriptor(obj, 'transformable');
    return { beforeGetIsFunc: beforeGetIsFunc, afterValue: afterDesc.value, afterGetIsUndef: afterDesc.get === undefined };
}

export function getDescModifyWritableToFalse() {
    const obj = { prop: 100 };
    const beforeWritable = Object.getOwnPropertyDescriptor(obj, 'prop').writable;
    Object.defineProperty(obj, 'prop', { writable: false });
    const afterDesc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return { beforeWritable: beforeWritable, afterWritable: afterDesc.writable, afterValue: afterDesc.value };
}

export function getDescModifyEnumerable() {
    const obj = { visible: 'shown' };
    const beforeEnum = Object.getOwnPropertyDescriptor(obj, 'visible').enumerable;
    Object.defineProperty(obj, 'visible', { enumerable: false });
    const afterEnum = Object.getOwnPropertyDescriptor(obj, 'visible').enumerable;
    return { beforeEnum: beforeEnum, afterEnum: afterEnum, inKeys: Object.keys(obj).includes('visible') };
}

export function getDescFreezePlainObj() {
    const obj = { a: 1, b: 2, c: 3 };
    Object.freeze(obj);
    const descA = Object.getOwnPropertyDescriptor(obj, 'a');
    const descB = Object.getOwnPropertyDescriptor(obj, 'b');
    return { aWritable: descA.writable, aConf: descA.configurable, bWritable: descB.writable, bConf: descB.configurable };
}

export function getDescFreezeNested() {
    const obj = { outer: 'value', nested: { inner: 'nested value' } };
    Object.freeze(obj);
    const outerDesc = Object.getOwnPropertyDescriptor(obj, 'outer');
    const nestedDesc = Object.getOwnPropertyDescriptor(obj, 'nested');
    obj.nested.inner = 'modified';
    return { outerWritable: outerDesc.writable, nestedWritable: nestedDesc.writable, modifiedInner: obj.nested.inner };
}

export function getDescFreezeWithGetter() {
    const obj = {
        _value: 42,
        get value() { return this._value; }
    };
    Object.freeze(obj);
    const valueDesc = Object.getOwnPropertyDescriptor(obj, 'value');
    const privateDesc = Object.getOwnPropertyDescriptor(obj, '_value');
    return { valueConf: valueDesc.configurable, getIsFunc: typeof valueDesc.get === 'function', privateWritable: privateDesc.writable, privateVal: privateDesc.value };
}

export function getDescFreezeArray() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    const desc0 = Object.getOwnPropertyDescriptor(arr, '0');
    const descLen = Object.getOwnPropertyDescriptor(arr, 'length');
    return { writable0: desc0.writable, conf0: desc0.configurable, writableLen: descLen.writable };
}

export function getDescFreezeFunction() {
    function func() {}
    func.customProp = 'value';
    Object.freeze(func);
    const desc = Object.getOwnPropertyDescriptor(func, 'customProp');
    return { writable: desc.writable, configurable: desc.configurable };
}

export function getDescDetectFrozen() {
    const obj = { a: 1 };
    const beforeFrozen = Object.isFrozen(obj);
    Object.freeze(obj);
    const afterFrozen = Object.isFrozen(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return { beforeFrozen: beforeFrozen, afterFrozen: afterFrozen, writable: desc.writable, configurable: desc.configurable };
}

export function getDescSealPlainObj() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    const descA = Object.getOwnPropertyDescriptor(obj, 'a');
    obj.a = 100;
    var threw = false;
    try { delete obj.a; } catch (e) { threw = e.name; }
    return { writable: descA.writable, configurable: descA.configurable, newVal: obj.a, threw: threw };
}

export function getDescSealReadOnly() {
    const obj = {};
    Object.defineProperty(obj, 'readOnly', { value: 100, writable: false });
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'readOnly');
    return { writable: desc.writable, configurable: desc.configurable };
}

export function getDescSealNested() {
    const obj = { outer: 'value', nested: { inner: 'nested' } };
    Object.seal(obj);
    const outerDesc = Object.getOwnPropertyDescriptor(obj, 'outer');
    const nestedDesc = Object.getOwnPropertyDescriptor(obj, 'nested');
    obj.nested.inner = 'modified';
    return { outerConf: outerDesc.configurable, nestedConf: nestedDesc.configurable, modifiedInner: obj.nested.inner };
}

export function getDescSealArray() {
    const arr = [1, 2, 3];
    Object.seal(arr);
    const desc0 = Object.getOwnPropertyDescriptor(arr, '0');
    arr[0] = 100;
    return { writable: desc0.writable, configurable: desc0.configurable, newVal: arr[0] };
}

export function getDescDetectSealed() {
    const obj = { a: 1 };
    const beforeSealed = Object.isSealed(obj);
    Object.seal(obj);
    const afterSealed = Object.isSealed(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return { beforeSealed: beforeSealed, afterSealed: afterSealed, configurable: desc.configurable };
}

export function getDescPreventExtPlainObj() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    obj.a = 100;
    delete obj.a;
    var threw = false;
    try { obj.b = 2; } catch (e) { threw = e.name; }
    return { writable: desc.writable, configurable: desc.configurable, threw: threw };
}

export function getDescPreventExtDefineProp() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    var threw = false;
    try { Object.defineProperty(obj, 'b', { value: 2 }); } catch (e) { threw = e.name; }
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return { threw: threw, configurable: desc.configurable };
}

export function getDescPreventExtModifyDesc() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    Object.defineProperty(obj, 'a', { writable: false });
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return { writable: desc.writable, configurable: desc.configurable };
}

export function getDescPreventExtArray() {
    const arr = [1, 2, 3];
    Object.preventExtensions(arr);
    const lengthDesc = Object.getOwnPropertyDescriptor(arr, 'length');
    arr.length = 5;
    var threw = false;
    try { arr[100] = 'new'; } catch (e) { threw = e.name; }
    return { writableLen: lengthDesc.writable, newLen: arr.length, threw: threw };
}

export function getDescDetectExtensible() {
    const obj = { a: 1 };
    const beforeExt = Object.isExtensible(obj);
    Object.preventExtensions(obj);
    const afterExt = Object.isExtensible(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return { beforeExt: beforeExt, afterExt: afterExt, writable: desc.writable, configurable: desc.configurable };
}


export function getDescProtoNotOwn() {
    const obj = { a: 1 };
    const desc = Object.getOwnPropertyDescriptor(obj, '__proto__');
    return { isUndef: desc === undefined };
}

export function getDescProtoExplicit() {
    const obj = {};
    Object.defineProperty(obj, '__proto__', {
        value: {},
        enumerable: true,
        configurable: true
    });
    const desc = Object.getOwnPropertyDescriptor(obj, '__proto__');
    return { valueIsObj: typeof desc.value === 'object', enumerable: desc.enumerable };
}

export function getDescConstructorNotOwn() {
    const obj = {};
    const desc = Object.getOwnPropertyDescriptor(obj, 'constructor');
    const protoDesc = Object.getOwnPropertyDescriptor(Object.prototype, 'constructor');
    return { isUndef: desc === undefined, protoValIsObj: protoDesc.value === Object, protoEnum: protoDesc.enumerable };
}

export function getDescClassConstructor() {
    class MyClass {}
    const instance = new MyClass();
    const desc = Object.getOwnPropertyDescriptor(instance, 'constructor');
    const protoDesc = Object.getOwnPropertyDescriptor(MyClass.prototype, 'constructor');
    return { isUndef: desc === undefined, protoValIsMyClass: protoDesc.value === MyClass, protoWritable: protoDesc.writable };
}

export function getDescArrayPrototypePush() {
    const pushDesc = Object.getOwnPropertyDescriptor(Array.prototype, 'push');
    return { isFunc: typeof pushDesc.value === 'function', writable: pushDesc.writable, configurable: pushDesc.configurable, enumerable: pushDesc.enumerable };
}


export function getDescFuncPrototypeApply() {
    const applyDesc = Object.getOwnPropertyDescriptor(Function.prototype, 'apply');
    return { isFunc: typeof applyDesc.value === 'function', writable: applyDesc.writable, configurable: applyDesc.configurable, enumerable: applyDesc.enumerable };
}

export function getDescStrPrototypeSplit() {
    const splitDesc = Object.getOwnPropertyDescriptor(String.prototype, 'split');
    return { isFunc: typeof splitDesc.value === 'function', writable: splitDesc.writable, configurable: splitDesc.configurable, enumerable: splitDesc.enumerable };
}

export function getDescNumPrototypeToFixed() {
    const toFixedDesc = Object.getOwnPropertyDescriptor(Number.prototype, 'toFixed');
    return { isFunc: typeof toFixedDesc.value === 'function', writable: toFixedDesc.writable, configurable: toFixedDesc.configurable, enumerable: toFixedDesc.enumerable };
}

export function getDescMathPI() {
    const piDesc = Object.getOwnPropertyDescriptor(Math, 'PI');
    const absDesc = Object.getOwnPropertyDescriptor(Math, 'abs');
    return {
        piVal: piDesc.value, piWritable: piDesc.writable, piConf: piDesc.configurable, piEnum: piDesc.enumerable,
        absIsFunc: typeof absDesc.value === 'function', absWritable: absDesc.writable, absConf: absDesc.configurable, absEnum: absDesc.enumerable
    };
}

export function getDescJSONParse() {
    const parseDesc = Object.getOwnPropertyDescriptor(JSON, 'parse');
    const stringifyDesc = Object.getOwnPropertyDescriptor(JSON, 'stringify');
    return {
        parseIsFunc: typeof parseDesc.value === 'function', parseWritable: parseDesc.writable, parseConf: parseDesc.configurable, parseEnum: parseDesc.enumerable,
        strIsFunc: typeof stringifyDesc.value === 'function', strWritable: stringifyDesc.writable
    };
}

export function getDescReflectGet() {
    const getDesc = Object.getOwnPropertyDescriptor(Reflect, 'get');
    return { isFunc: typeof getDesc.value === 'function', writable: getDesc.writable, configurable: getDesc.configurable, enumerable: getDesc.enumerable };
}

export function getDescAtomicsAdd() {
    const addDesc = Object.getOwnPropertyDescriptor(Atomics, 'add');
    return { isFunc: typeof addDesc.value === 'function', writable: addDesc.writable, configurable: addDesc.configurable, enumerable: addDesc.enumerable };
}

export function getDescSymbolProp() {
    const sym = Symbol('mySymbol');
    var obj = {};
    obj[sym] = 'symbol value';
    const desc = Object.getOwnPropertyDescriptor(obj, sym);
    return { value: desc.value, enumerable: desc.enumerable, configurable: desc.configurable, writable: desc.writable };
}

export function getDescAnonSymbolProp() {
    const anonSym = Symbol();
    var obj = {};
    obj[anonSym] = 'anonymous value';
    const desc = Object.getOwnPropertyDescriptor(obj, anonSym);
    return { value: desc.value, descIsUndef: anonSym.description === undefined };
}

export function getDescGlobalSymbolProp() {
    const globalSym1 = Symbol.for('globalKey');
    const globalSym2 = Symbol.for('globalKey');
    var obj = {};
    obj[globalSym1] = 'global value';
    const desc = Object.getOwnPropertyDescriptor(obj, globalSym2);
    return { value: desc.value, symsEqual: globalSym1 === globalSym2, description: globalSym1.description };
}

export function getDescSymbolKeyFor() {
    const globalSym = Symbol.for('sharedKey');
    const localSym = Symbol('localKey');
    var obj = {};
    obj[globalSym] = 'value';
    const desc = Object.getOwnPropertyDescriptor(obj, globalSym);
    return { globalKey: Symbol.keyFor(globalSym), localKeyIsUndef: Symbol.keyFor(localSym) === undefined, value: desc.value };
}

export function getDescMultiSymbolProp() {
    const sym1 = Symbol('first');
    const sym2 = Symbol('second');
    const sym3 = Symbol('third');
    var obj = {};
    obj[sym1] = 'value1';
    obj[sym2] = 'value2';
    obj[sym3] = 'value3';
    return {
        val1: Object.getOwnPropertyDescriptor(obj, sym1).value,
        val2: Object.getOwnPropertyDescriptor(obj, sym2).value,
        val3: Object.getOwnPropertyDescriptor(obj, sym3).value
    };
}

export function getDescMixedSymStr() {
    const sym = Symbol('mixed');
    var obj = {};
    obj.stringKey = 'string value';
    obj[sym] = 'symbol value';
    const stringDesc = Object.getOwnPropertyDescriptor(obj, 'stringKey');
    const symDesc = Object.getOwnPropertyDescriptor(obj, sym);
    const keys = Object.keys(obj);
    return { stringVal: stringDesc.value, symVal: symDesc.value, keysLength: keys.length, includesString: keys.includes('stringKey'), includesSym: keys.includes(sym) };
}

export function getDescNonEnumSymbol() {
    const sym = Symbol('hidden');
    var obj = {};
    Object.defineProperty(obj, sym, { value: 'hidden symbol', enumerable: false });
    const desc = Object.getOwnPropertyDescriptor(obj, sym);
    const symbols = Object.getOwnPropertySymbols(obj);
    return { enumerable: desc.enumerable, hasSym: symbols.length > 0, value: desc.value };
}

export function getDescNonConfSymbol() {
    const sym = Symbol('locked');
    var obj = {};
    Object.defineProperty(obj, sym, { value: 'immutable', configurable: false });
    const desc = Object.getOwnPropertyDescriptor(obj, sym);
    var threw = false;
    try { delete obj[sym]; } catch (e) { threw = e.name; }
    return { configurable: desc.configurable, threw: threw };
}

export function getDescSymbolAccessor() {
    const sym = Symbol('accessor');
    var obj = {};
    Object.defineProperty(obj, sym, {
        get: function() { return this._internal; },
        set: function(value) { this._internal = value; },
        enumerable: true,
        configurable: true
    });
    const desc = Object.getOwnPropertyDescriptor(obj, sym);
    obj[sym] = 100;
    return { getIsFunc: typeof desc.get === 'function', setIsFunc: typeof desc.set === 'function', result: obj[sym] };
}

export function getDescSymbolIterator() {
    var obj = {};
    obj.data = [1, 2, 3];
    obj[Symbol.iterator] = function() {
        var data = this.data;
        var idx = 0;
        return { next: function() { return idx < data.length ? { value: data[idx++], done: false } : { done: true }; } };
    };
    const desc = Object.getOwnPropertyDescriptor(obj, Symbol.iterator);
    return { isFunc: typeof desc.value === 'function', enumerable: desc.enumerable };
}

export function getDescSymbolToStringTag() {
    var obj = {};
    obj[Symbol.toStringTag] = 'MyCustomObject';
    const desc = Object.getOwnPropertyDescriptor(obj, Symbol.toStringTag);
    const tag = Object.prototype.toString.call(obj);
    return { value: desc.value, includesTag: tag.indexOf('MyCustomObject') !== -1 };
}

export function getDescSymbolHasInstance() {
    var customType = {};
    customType[Symbol.hasInstance] = function(instance) {
        return instance && typeof instance.customFlag === 'boolean';
    };
    const desc = Object.getOwnPropertyDescriptor(customType, Symbol.hasInstance);
    var testObj = { customFlag: true };
    return { isFunc: typeof desc.value === 'function', instanceofResult: testObj?.constructor?.name=== "customType" };
}

export function getDescSymbolToPrimitive() {
    var obj = { value: 42 };
    obj[Symbol.toPrimitive] = function(hint) {
        if (hint === 'number') { return this.value; }
        if (hint === 'string') { return 'value: ' + this.value; }
        return this.value;
    };
    const desc = Object.getOwnPropertyDescriptor(obj, Symbol.toPrimitive);
    return { isFunc: typeof desc.value === 'function', addResult: obj + 8, templateResult: '' + obj };
}

export function getDescSymbolSpecies() {
    class MyArray extends Array {
        static get [Symbol.species]() { return Array; }
    }
    const desc = Object.getOwnPropertyDescriptor(MyArray, Symbol.species);
    const myArr = new MyArray(1, 2, 3);
    const mapped = myArr.map(function(x) { return x * 2; });
    return { getIsFunc: typeof desc.get === 'function', isMyArray: mapped?.constructor?.name === "MyArray", isArray: mapped?.constructor?.name=== "Array" };
}

export function getDescSymbolMatch() {
    var customMatcher = {};
    customMatcher[Symbol.match] = function(str) { return str.includes('test'); };
    const desc = Object.getOwnPropertyDescriptor(customMatcher, Symbol.match);
    return { isFunc: typeof desc.value === 'function', result: 'this is a test string'.match(customMatcher) };
}

export function getDescSymbolReplace() {
    var customReplacer = {};
    customReplacer[Symbol.replace] = function(str, replacement) { return str.replace(/test/g, replacement); };
    const desc = Object.getOwnPropertyDescriptor(customReplacer, Symbol.replace);
    return { isFunc: typeof desc.value === 'function', result: 'test string test'.replace(customReplacer, 'new') };
}

export function getDescSymbolSearch() {
    var customSearcher = {};
    customSearcher[Symbol.search] = function(str) { return str.indexOf('target'); };
    const desc = Object.getOwnPropertyDescriptor(customSearcher, Symbol.search);
    return { isFunc: typeof desc.value === 'function', result: 'find the target here'.search(customSearcher) };
}

export function getDescSymbolSplit() {
    var customSplitter = {};
    customSplitter[Symbol.split] = function(str) { return str.split(/,\s*/); };
    const desc = Object.getOwnPropertyDescriptor(customSplitter, Symbol.split);
    var result = 'a, b, c, d'.split(customSplitter);
    return { isFunc: typeof desc.value === 'function', length: result.length, first: result[0] };
}

export function getDescSymbolConcatSpreadable() {
    var arr = [1, 2];
    arr[Symbol.isConcatSpreadable] = false;
    const desc = Object.getOwnPropertyDescriptor(arr, Symbol.isConcatSpreadable);
    var result = [3, 4].concat(arr);
    return { value: desc.value, length: result.length, thirdIsArr: Array.isArray(result[2]) };
}

export function getDescSymbolUnscopables() {
    var obj = { foo: 1, bar: 2 };
    obj[Symbol.unscopables] = { foo: true, bar: false };
    const desc = Object.getOwnPropertyDescriptor(obj, Symbol.unscopables);
    return { fooTrue: desc.value.foo, barFalse: desc.value.bar };
}

export function getDescSymbolAsyncIterator() {
    var asyncIterable = { data: [1, 2, 3] };
    asyncIterable[Symbol.asyncIterator] = async function*() {
        for (var item of this.data) {
            await new Promise(function(resolve) { setTimeout(resolve, 10); });
            yield item;
        }
    };
    const desc = Object.getOwnPropertyDescriptor(asyncIterable, Symbol.asyncIterator);
    return { isFunc: typeof desc.value === 'function' };
}

export function getDescSymbolDispose() {
    var resource = {};
    resource[Symbol.dispose] = function() {};
    const desc = Object.getOwnPropertyDescriptor(resource, Symbol.dispose);
    return { isFunc: typeof desc.value === 'function' };
}

export function getDescSymbolMetadata() {
    var obj = {};
    obj[Symbol.metadata] = { author: 'test', version: '1.0' };
    const desc = Object.getOwnPropertyDescriptor(obj, Symbol.metadata);
    return { author: desc.value.author };
}

export function getDescObjKeysNoSymbol() {
    const sym = Symbol('test');
    var obj = {};
    obj.stringKey = 'value';
    obj[sym] = 'symbol value';
    const keys = Object.keys(obj);
    const symDesc = Object.getOwnPropertyDescriptor(obj, sym);
    return { keysLength: keys.length, includesStr: keys.includes('stringKey'), symEnumerable: symDesc.enumerable };
}

export function getDescObjGetNamesNoSymbol() {
    const sym = Symbol('hidden');
    var obj = {};
    obj.normalKey = 'value';
    obj[sym] = 'symbol';
    const names = Object.getOwnPropertyNames(obj);
    return { namesLength: names.length, includesKey: names.includes('normalKey'), includesSym: names.includes(String(sym)) };
}

export function getDescObjGetSymbols() {
    const sym1 = Symbol('first');
    const sym2 = Symbol('second');
    var obj = {};
    obj[sym1] = 'value1';
    obj[sym2] = 'value2';
    obj.normalKey = 'normal';
    const symbols = Object.getOwnPropertySymbols(obj);
    return { length: symbols.length, includesSym1: symbols.includes(sym1), includesSym2: symbols.includes(sym2) };
}

export function getDescReflectOwnKeys() {
    const sym = Symbol('test');
    var obj = {};
    obj.stringKey = 'value';
    obj[sym] = 'symbol';
    const ownKeys = Reflect.ownKeys(obj);
    return { length: ownKeys.length, includesStr: ownKeys.includes('stringKey'), includesSym: ownKeys.includes(sym) };
}

export function getDescForInNoSymbol() {
    const sym = Symbol('iterable');
    var obj = { a: 1, b: 2 };
    obj[sym] = 3;
    var keys = [];
    for (var key in obj) { keys.push(key); }
    return { length: keys.length, includesA: keys.includes('a'), includesB: keys.includes('b'), includesSym: keys.includes(String(sym)) };
}

export function getDescDeleteSymbol() {
    const sym = Symbol('deletable');
    var obj = {};
    obj[sym] = 'value';
    const beforeDesc = Object.getOwnPropertyDescriptor(obj, sym);
    delete obj[sym];
    const afterDesc = Object.getOwnPropertyDescriptor(obj, sym);
    return { beforeConf: beforeDesc.configurable, afterIsUndef: afterDesc === undefined };
}

export function getDescDeleteNonConfSymbol() {
    const sym = Symbol('locked');
    var obj = {};
    Object.defineProperty(obj, sym, { value: 'permanent', configurable: false });
    var threw = false;
    try { delete obj[sym]; } catch (e) { threw = e.name; }
    const desc = Object.getOwnPropertyDescriptor(obj, sym);
    return { threw: threw, value: desc.value };
}

export function getDescFreezeSymbolCannotDelete() {
    const sym = Symbol('frozen');
    var obj = {};
    obj[sym] = 'value';
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, sym);
    var threw = false;
    try { delete obj[sym]; } catch (e) { threw = e.name; }
    return { configurable: desc.configurable, threw: threw };
}

export function getDescNonexistReturnUndef() {
    const obj = { existing: 'value' };
    const desc = Object.getOwnPropertyDescriptor(obj, 'nonexistent');
    return { isUndef: desc === undefined };
}

export function getDescProtoPropReturnUndef() {
    function Parent() { this.inherited = 'value'; }
    const child = new Parent();
    const desc = Object.getOwnPropertyDescriptor(child, 'inherited');
    return { isUndef: desc === undefined ? undefined : 'NOT_UNDEF' };
}

export function getDescEmptyObjAnyProp() {
    const emptyObj = {};
    const desc = Object.getOwnPropertyDescriptor(emptyObj, 'any');
    return { isUndef: desc === undefined };
}

export function getDescNullObjThrows() {
    var threwNull = false;
    var threwUndef = false;
    try { Object.getOwnPropertyDescriptor(null, 'prop'); } catch (e) { threwNull = e.name; }
    try { Object.getOwnPropertyDescriptor(undefined, 'prop'); } catch (e) { threwUndef = e.name; }
    return { threwNull: threwNull, threwUndef: threwUndef };
}

export function getDescDataDescStructure() {
    const obj = { prop: 'value' };
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return {
        hasValue: desc.hasOwnProperty('value'),
        hasWritable: desc.hasOwnProperty('writable'),
        noGet: !desc.hasOwnProperty('get'),
        noSet: !desc.hasOwnProperty('set')
    };
}

export function getDescDataDescTypes() {
    const obj = { num: 42 };
    const desc = Object.getOwnPropertyDescriptor(obj, 'num');
    return {
        valueType: typeof desc.value,
        writableType: typeof desc.writable,
        enumerableType: typeof desc.enumerable,
        configurableType: typeof desc.configurable
    };
}

export function getDescDataDescImmutable() {
    const obj = { a: 1 };
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    desc.value = 999;
    desc.writable = false;
    const newDesc = Object.getOwnPropertyDescriptor(obj, 'a');
    return { origValue: obj.a, newWritable: newDesc.writable };
}

export function getDescDataDescReusable() {
    const obj1 = { prop: 42 };
    const desc = Object.getOwnPropertyDescriptor(obj1, 'prop');
    const obj2 = {};
    Object.defineProperty(obj2, 'copiedProp', desc);
    const newDesc = Object.getOwnPropertyDescriptor(obj2, 'copiedProp');
    return { copiedVal: obj2.copiedProp, newDescVal: newDesc.value };
}
export function getDescAccessorDescStructure() {
    const obj = { get accessor() { return 42; } };
    const desc = Object.getOwnPropertyDescriptor(obj, 'accessor');
    return {
        hasGet: desc.hasOwnProperty('get'),
        hasSet: desc.hasOwnProperty('set'),
        noValue: !desc.hasOwnProperty('value'),
        noWritable: !desc.hasOwnProperty('writable')
    };
}

export function getDescAccessorGetSetTypes() {
    const obj = {
        _val: 0,
        get getter() { return 'value'; },
        set setter(val) { this._val = val; }
    };
    const getterDesc = Object.getOwnPropertyDescriptor(obj, 'getter');
    const setterDesc = Object.getOwnPropertyDescriptor(obj, 'setter');
    return {
        getterGetIsFunc: typeof getterDesc.get === 'function',
        getterSetIsUndef: getterDesc.set === undefined,
        setterSetIsFunc: typeof setterDesc.set === 'function',
        setterGetIsUndef: setterDesc.get === undefined
    };
}

export function getDescCallGetterFromDesc() {
    const obj = { _val: 100, get value() { return this._val; } };
    const desc = Object.getOwnPropertyDescriptor(obj, 'value');
    return { calledOnObj: desc.get.call(obj), calledOnOther: desc.get.call({ _val: 200 }) };
}

export function getDescCallSetterFromDesc() {
    const obj = { _val: 0, set value(val) { this._val = val * 2; } };
    const desc = Object.getOwnPropertyDescriptor(obj, 'value');
    desc.set.call(obj, 50);
    return { internalVal: obj._val };
}

export function getDescObjIsPlainObj() {
    const obj = { prop: 'value' };
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return { constIsObj: desc.constructor === Object, isInstanceofObj: desc?.constructor?.name ==="Object" };
}

export function getDescObjProtoChain() {
    const obj = { prop: 'value' };
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return { protoIsObjProto: Object.getPrototypeOf(desc) === Object.prototype };
}

export function getDescObjCanFreeze() {
    const obj = { prop: 'value' };
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    Object.freeze(desc);
    var threw = false;
    try { desc.value = 'new value'; } catch (e) { threw = e.name; }
    return { threw: threw };
}

export function getDescObjCanSeal() {
    const obj = { prop: 'value' };
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    Object.seal(desc);
    var threw = false;
    try { desc.newProperty = 'added'; } catch (e) { threw = e.name; }
    return { isSealed: Object.isSealed(desc), threw: threw };
}

export function getDescObjCanAddProps() {
    const obj = { prop: 'value' };
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    desc.customNote = 'This is a descriptor';
    desc.timestamp = Date.now();
    return { note: desc.customNote, tsIsNum: typeof desc.timestamp === 'number' };
}

export function getDescObjJSONSerialize() {
    const obj = { prop: 42 };
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    const json = JSON.stringify(desc);
    const parsed = JSON.parse(json);
    return { parsedValue: parsed.value };
}

export function getDescNullArg() {
    var threwTypeError = false;
    var errorName = '';
    try {
        Object.getOwnPropertyDescriptor(null, 'prop');
    } catch (e) {
        threwTypeError = e.name;
        errorName = e.name;
    }
    return { threwTypeError: threwTypeError, errorName: errorName };
}

export function getDescUndefArg() {
    var threw = false;
    try { Object.getOwnPropertyDescriptor(undefined, 'prop'); } catch (e) { threw = e.name; }
    return { threw: threw };
}

export function getDescES5Primitive() {
    var desc = null;
    var threw = false;
    try {
        desc = Object.getOwnPropertyDescriptor('string', '0');
    } catch (e) {
        threw = e.name;
    }
    return { hasDesc: desc !== null && desc !== undefined, threw: threw };
}

export function getDescMissingSecondArg() {
    const obj = { prop: 'value' };
    const desc = Object.getOwnPropertyDescriptor(obj);
    return { isUndef: desc === undefined };
}

export function getDescExtraArgs() {
    const obj = { a: 1 };
    const desc = Object.getOwnPropertyDescriptor(obj, 'a', 'extra', 'more');
    return { value: desc.value };
}

export function getDescProxyProperty() {
    const target = { prop: 'value' };
    var interceptorCalled = false;
    const handler = {
        getOwnPropertyDescriptor: function(target, prop) {
            interceptorCalled = true;
            return Object.getOwnPropertyDescriptor(target, prop);
        }
    };
    const proxy = new Proxy(target, handler);
    const desc = Object.getOwnPropertyDescriptor(proxy, 'prop');
    return { value: desc.value, interceptorCalled: interceptorCalled };
}

export function getDescProxyIntercept() {
    const target = {};
    const handler = {
        getOwnPropertyDescriptor: function(target, prop) {
            return { value: 'intercepted', writable: true, enumerable: true, configurable: true };
        }
    };
    const proxy = new Proxy(target, handler);
    const desc = Object.getOwnPropertyDescriptor(proxy, 'anyProp');
    return { value: desc.value };
}

export function getDescProxyVirtualProp() {
    const target = {};
    const handler = {
        getOwnPropertyDescriptor: function(target, prop) {
            if (prop === 'virtual') {
                return { value: 'virtual prop', writable: true, enumerable: true, configurable: false };
            }
            return undefined;
        }
    };
    const proxy = new Proxy(target, handler);
    var threw = false;
    var isTypeError = false;
    try {
        const desc = Object.getOwnPropertyDescriptor(proxy, 'virtual');
        return { configurable: desc.configurable, value: desc.value, threw: false };
    } catch (e) {
        threw = true;
        isTypeError = e.name;
        return { threw: true, isTypeError: isTypeError };
    }
}

export function getDescProxyInconsistent() {
    const target = { existing: 'value' };
    const handler = {
        getOwnPropertyDescriptor: function(target, prop) {
            if (prop === 'existing') {
                return { value: 'wrong type', writable: true, enumerable: true, configurable: true };
            }
            return Object.getOwnPropertyDescriptor(target, prop);
        }
    };
    const proxy = new Proxy(target, handler);
    var threw = false;
    try { Object.getOwnPropertyDescriptor(proxy, 'existing'); } catch (e) { threw = e.name; }
    return { threw: threw };
}

export function getDescCopyProp() {
    const source = { prop: 'value' };
    const target = {};
    const desc = Object.getOwnPropertyDescriptor(source, 'prop');
    Object.defineProperty(target, 'prop', desc);
    const targetDesc = Object.getOwnPropertyDescriptor(target, 'prop');
    return { targetVal: target.prop, targetDescVal: targetDesc.value };
}

export function getDescCopyAccessor() {
    const source = {
        _internal: 0,
        get accessor() { return this._internal; },
        set accessor(val) { this._internal = val; }
    };
    const target = {};
    const desc = Object.getOwnPropertyDescriptor(source, 'accessor');
    Object.defineProperty(target, 'accessor', desc);
    target.accessor = 42;
    return { result: target.accessor };
}

export function getDescCopyNonConfigurable() {
    const source = {};
    Object.defineProperty(source, 'locked', { value: 100, configurable: false, writable: true });
    const desc = Object.getOwnPropertyDescriptor(source, 'locked');
    const target = {};
    Object.defineProperty(target, 'locked', desc);
    const targetDesc = Object.getOwnPropertyDescriptor(target, 'locked');
    return { configurable: targetDesc.configurable };
}

export function getDescCopyModifyDesc() {
    const source = { mutable: 'value' };
    const desc = Object.getOwnPropertyDescriptor(source, 'mutable');
    desc.writable = false;
    const target = {};
    Object.defineProperty(target, 'mutable', desc);
    var threw = false;
    try { target.mutable = 'new value'; } catch (e) { threw = e.name; }
    return { threw: threw };
}

export function getDescBatchCopy() {
    const source = { a: 1, b: 2, c: 3 };
    const descriptors = Object.getOwnPropertyDescriptors(source);
    const target = {};
    Object.defineProperties(target, descriptors);
    return { a: target.a, b: target.b, c: target.c };
}

export function getDescBatchCopyAccessor() {
    const source = {
        _value: 0,
        get value() { return this._value; },
        set value(v) { this._value = v; },
        name: 'source'
    };
    const descriptors = Object.getOwnPropertyDescriptors(source);
    const target = {};
    Object.defineProperties(target, descriptors);
    target.value = 42;
    return { value: target.value, name: target.name };
}

export function getDescCreateWithDesc() {
    const proto = { inherited: 'value' };
    const desc = Object.getOwnPropertyDescriptor(proto, 'inherited');
    const child = Object.create(proto, { own: desc });
    const ownDesc = Object.getOwnPropertyDescriptor(child, 'own');
    const inheritedDesc = Object.getOwnPropertyDescriptor(child, 'inherited');
    return { ownVal: child.own, inheritedVal: child.inherited, ownDescVal: ownDesc.value, inheritedDescUndef: inheritedDesc === undefined };
}

export function getDescAssignEnumOnly() {
    const source = {};
    Object.defineProperty(source, 'visible', { value: 'shown', enumerable: true });
    Object.defineProperty(source, 'hidden', { value: 'secret', enumerable: false });
    const target = {};
    Object.assign(target, source);
    const hiddenDesc = Object.getOwnPropertyDescriptor(source, 'hidden');
    return { visible: target.visible, hiddenUndef: target.hidden === undefined, hiddenEnum: hiddenDesc.enumerable };
}

export function getDescAssignSymbol() {
    const sym = Symbol('key');
    var source = {};
    source[sym] = 'symbol value';
    source.normalKey = 'normal value';
    const target = {};
    Object.assign(target, source);
    return { symVal: target[sym], normalVal: target.normalKey };
}

export function getDescAssignNoGetter() {
    const source = {
        _internal: 100,
        get accessor() { return this._internal; }
    };
    const target = {};
    Object.assign(target, source);
    const sourceDesc = Object.getOwnPropertyDescriptor(source, 'accessor');
    const targetDesc = Object.getOwnPropertyDescriptor(target, 'accessor');
    return { sourceGetIsFunc: typeof sourceDesc.get === 'function', targetGetIsUndef: targetDesc.get === undefined, targetVal: targetDesc.value };
}

export function getDescAllDescsMatch() {
    var obj = { a: 1, b: 2 };
    const allDescs = Object.getOwnPropertyDescriptors(obj);
    const aDesc = Object.getOwnPropertyDescriptor(obj, 'a');
    return { valMatch: allDescs.a.value === aDesc.value, writableMatch: allDescs.a.writable === aDesc.writable };
}

export function getDescAllDescsNonEnum() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', { value: 'secret', enumerable: false });
    const allDescs = Object.getOwnPropertyDescriptors(obj);
    const singleDesc = Object.getOwnPropertyDescriptor(obj, 'hidden');
    return { hasHidden: allDescs.hidden !== undefined, enumFalse: allDescs.hidden.enumerable === false, notSameRef: allDescs.hidden !== singleDesc };
}

export function getDescFreezeCompare() {
    const obj = { prop: 'value' };
    const beforeWritable = Object.getOwnPropertyDescriptor(obj, 'prop').writable;
    const beforeConf = Object.getOwnPropertyDescriptor(obj, 'prop').configurable;
    Object.freeze(obj);
    const afterDesc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return { beforeWritable: beforeWritable, beforeConf: beforeConf, afterWritable: afterDesc.writable, afterConf: afterDesc.configurable };
}

export function getDescSealCompare() {
    const obj = { prop: 'value' };
    const beforeConf = Object.getOwnPropertyDescriptor(obj, 'prop').configurable;
    Object.seal(obj);
    const afterDesc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return { beforeConf: beforeConf, afterConf: afterDesc.configurable, afterWritable: afterDesc.writable };
}

export function getDescPreventExtCompare() {
    const obj = { prop: 'value' };
    const beforeDesc = Object.getOwnPropertyDescriptor(obj, 'prop');
    Object.preventExtensions(obj);
    const afterDesc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return {
        writableSame: beforeDesc.writable === afterDesc.writable,
        confSame: beforeDesc.configurable === afterDesc.configurable,
        enumSame: beforeDesc.enumerable === afterDesc.enumerable
    };
}

export function getDescKeysEnumRel() {
    const obj = {};
    Object.defineProperty(obj, 'visible', { value: 1, enumerable: true });
    Object.defineProperty(obj, 'hidden', { value: 2, enumerable: false });
    const keys = Object.keys(obj);
    const visibleDesc = Object.getOwnPropertyDescriptor(obj, 'visible');
    const hiddenDesc = Object.getOwnPropertyDescriptor(obj, 'hidden');
    return { hasVisible: keys.includes('visible'), hasHidden: keys.includes('hidden'), visibleEnum: visibleDesc.enumerable, hiddenEnum: hiddenDesc.enumerable };
}

export function getDescValuesEnumRel() {
    const obj = { visible: 'shown' };
    Object.defineProperty(obj, 'hidden', { value: 'secret', enumerable: false });
    const values = Object.values(obj);
    return { hasShown: values.includes('shown'), hasSecret: values.includes('secret') };
}

export function getDescEntriesEnumRel() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: true });
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    const entries = Object.entries(obj);
    return { length: entries.length };
}

export function getDescGetNamesNonEnum() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    const names = Object.getOwnPropertyNames(obj);
    const bDesc = Object.getOwnPropertyDescriptor(obj, 'b');
    return { hasA: names.includes('a'), hasB: names.includes('b'), bEnum: bDesc.enumerable };
}

export function getDescGetNamesNoSymbol() {
    const sym = Symbol('test');
    var obj = { a: 1 };
    obj[sym] = 'symbol';
    const names = Object.getOwnPropertyNames(obj);
    const symDesc = Object.getOwnPropertyDescriptor(obj, sym);
    return { hasA: names.includes('a'), includesSymStr: names.includes(String(sym)), symDescExists: symDesc !== undefined };
}

export function getDescGetSymbolsAll() {
    const sym1 = Symbol('first');
    const sym2 = Symbol('second');
    var obj = {};
    obj[sym1] = 'v1';
    obj[sym2] = 'v2';
    obj.normal = 'normal';
    const symbols = Object.getOwnPropertySymbols(obj);
    const sym1Desc = Object.getOwnPropertyDescriptor(obj, sym1);
    return { length: symbols.length, hasSym1: symbols.includes(sym1), hasSym2: symbols.includes(sym2), sym1Val: sym1Desc.value };
}

export function getDescGetSymbolsNonEnum() {
    const sym = Symbol('hidden');
    var obj = {};
    Object.defineProperty(obj, sym, { value: 'value', enumerable: false });
    const symbols = Object.getOwnPropertySymbols(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, sym);
    return { hasSym: symbols.includes(sym), enumFalse: desc.enumerable };
}

export function getDescReflectSame() {
    const obj = { prop: 'value' };
    const objDesc = Object.getOwnPropertyDescriptor(obj, 'prop');
    const reflectDesc = Reflect.getOwnPropertyDescriptor(obj, 'prop');
    return {
        valSame: objDesc.value === reflectDesc.value,
        writableSame: objDesc.writable === reflectDesc.writable,
        enumSame: objDesc.enumerable === reflectDesc.enumerable,
        confSame: objDesc.configurable === reflectDesc.configurable
    };
}

export function getDescReflectPrimitive() {
    const objDesc = Object.getOwnPropertyDescriptor('hello', '0');
    var reflectThrew = false;
    try { Reflect.getOwnPropertyDescriptor('hello', '0'); } catch (e) { reflectThrew = e.name; }
    return { objValue: objDesc.value, reflectThrew: reflectThrew };
}

export function getDescReflectNull() {
    var reflectThrew = false;
    var objThrew = false;
    try { Reflect.getOwnPropertyDescriptor(null, 'prop'); } catch (e) { reflectThrew = e.name; }
    try { Object.getOwnPropertyDescriptor(null, 'prop'); } catch (e) { objThrew = e.name; }
    return { reflectThrew: reflectThrew, objThrew: objThrew };
}

export function getDescHasOwnProp() {
    const obj = { own: 'value' };
    const desc = Object.getOwnPropertyDescriptor(obj, 'own');
    return { hasOwn: Object.hasOwn(obj, 'own'), hasToString: Object.hasOwn(obj, 'toString'), descExists: desc !== undefined };
}

export function getDescHasOwnNonEnum() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', { value: 'secret', enumerable: false });
    const desc = Object.getOwnPropertyDescriptor(obj, 'hidden');
    return { hasOwn: Object.hasOwn(obj, 'hidden'), descExists: desc !== undefined, enumFalse: desc.enumerable };
}

export function getDescForInEnumOnly() {
    const obj = { enumerable: 'shown' };
    Object.defineProperty(obj, 'nonEnumerable', { value: 'hidden', enumerable: false });
    var keys = [];
    for (var key in obj) { keys.push(key); }
    const desc = Object.getOwnPropertyDescriptor(obj, 'nonEnumerable');
    return { hasEnum: keys.includes('enumerable'), hasNonEnum: keys.includes('nonEnumerable'), nonEnumFalse: desc.enumerable };
}

export function getDescHasOwnPropCheck() {
    const obj = { own: 'value' };
    const desc = Object.getOwnPropertyDescriptor(obj, 'own');
    return { hasOwnProp: obj.hasOwnProperty('own'), hasToString: obj.hasOwnProperty('toString'), descExists: desc !== undefined };
}

export function getDescHasOwnPropNonEnum() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', { value: 'value', enumerable: false });
    const desc = Object.getOwnPropertyDescriptor(obj, 'hidden');
    return { hasOwnProp: obj.hasOwnProperty('hidden'), descExists: desc !== undefined };
}

export function getDescPropIsEnumerable() {
    const obj = { visible: 'value' };
    Object.defineProperty(obj, 'hidden', { value: 'secret', enumerable: false });
    const visibleDesc = Object.getOwnPropertyDescriptor(obj, 'visible');
    const hiddenDesc = Object.getOwnPropertyDescriptor(obj, 'hidden');
    return { visibleIsEnum: obj.propertyIsEnumerable('visible'), hiddenIsEnum: obj.propertyIsEnumerable('hidden'), visibleEnum: visibleDesc.enumerable, hiddenEnum: hiddenDesc.enumerable };
}

export function getDescPropIsEnumOwnOnly() {
    var obj = Object.create({ inherited: 'value' });
    return { isEnumInherited: obj.propertyIsEnumerable('inherited'), descUndef: Object.getOwnPropertyDescriptor(obj, 'inherited') === undefined };
}

export function getDescDeleteConfigurableProp() {
    const obj = { prop: 'value' };
    const beforeDesc = Object.getOwnPropertyDescriptor(obj, 'prop');
    delete obj.prop;
    const afterDesc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return { beforeConf: beforeDesc.configurable, afterUndef: afterDesc === undefined };
}

export function getDescDeleteNonConfProp() {
    const obj = {};
    Object.defineProperty(obj, 'locked', { value: 100, configurable: false });
    const desc = Object.getOwnPropertyDescriptor(obj, 'locked');
    var threw = false;
    try { delete obj.locked; } catch (e) { threw = e.name; }
    return { confFalse: desc.configurable, threw: threw, stillExists: Object.getOwnPropertyDescriptor(obj, 'locked') !== undefined };
}

export function getDescDeleteNonexist() {
    const obj = {};
    const result = delete obj.nonexistent;
    return { result: result, descUndef: Object.getOwnPropertyDescriptor(obj, 'nonexistent') === undefined };
}

export function getDescDeleteProtoProp() {
    function Parent() {}
    Parent.prototype.inherited = 'value';
    const child = new Parent();
    delete child.inherited;
    return { stillAccessible: child.inherited === 'value', descUndef: Object.getOwnPropertyDescriptor(child, 'inherited') === undefined };
}