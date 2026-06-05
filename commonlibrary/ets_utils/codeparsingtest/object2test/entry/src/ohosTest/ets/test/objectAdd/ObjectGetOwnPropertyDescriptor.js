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
