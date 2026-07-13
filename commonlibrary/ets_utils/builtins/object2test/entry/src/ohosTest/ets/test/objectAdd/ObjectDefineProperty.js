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


export function defPropOnPlainObj() {
    const obj = {};
    const result = Object.defineProperty(obj, 'prop', { value: 1 });
    return { result: result === obj, value: obj.prop };
}

export function defPropOnExistingObj() {
    const obj = { existing: 'value' };
    Object.defineProperty(obj, 'newProp', { value: 2 });
    return { newProp: obj.newProp, existing: obj.existing };
}

export function defPropOnArray() {
    const arr = [1, 2, 3];
    Object.defineProperty(arr, 'customProp', { value: 'test', enumerable: true });
    return { customProp: arr.customProp, length: arr.length };
}

export function defPropOnFunction() {
    function fn() {}
    Object.defineProperty(fn, 'prop', { value: 1 });
    return fn.prop;
}

export function defPropOnDate() {
    const date = new Date();
    Object.defineProperty(date, 'customProp', { value: 'test' });
    return date.customProp;
}

export function defPropOnRegExp() {
    const regex = /test/gi;
    Object.defineProperty(regex, 'customProp', { value: 1 });
    return regex.customProp;
}

export function defPropOnMap() {
    const map = new Map([['key', 'value']]);
    Object.defineProperty(map, 'customProp', { value: 'test' });
    return { customProp: map.customProp, mapVal: map.get('key') };
}

export function defPropOnSet() {
    const set = new Set([1, 2, 3]);
    Object.defineProperty(set, 'customProp', { value: 'test' });
    return { customProp: set.customProp, hasVal: set.has(1) };
}

export function defPropOnArrayBuffer() {
    const buffer = new ArrayBuffer(16);
    Object.defineProperty(buffer, 'customProp', { value: 1 });
    return { customProp: buffer.customProp, byteLen: buffer.byteLength };
}

export function defPropOnTypedArray() {
    const typedArr = new Uint8Array([1, 2, 3]);
    Object.defineProperty(typedArr, 'customProp', { value: 'test' });
    return { customProp: typedArr.customProp, firstVal: typedArr[0] };
}

export function defPropOnDataView() {
    const dv = new DataView(new ArrayBuffer(16));
    Object.defineProperty(dv, 'customProp', { value: 1 });
    return dv.customProp;
}

export function defPropOnPromise() {
    const promise = Promise.resolve(42);
    Object.defineProperty(promise, 'customProp', { value: 'test' });
    return promise.customProp;
}

export function defPropOnWeakMap() {
    const wm = new WeakMap();
    Object.defineProperty(wm, 'customProp', { value: 'test' });
    return wm.customProp;
}

export function defPropOnWeakSet() {
    const ws = new WeakSet();
    Object.defineProperty(ws, 'customProp', { value: 'test' });
    return ws.customProp;
}

export function defPropOnProxy() {
    const target = {};
    const proxy = new Proxy(target, {});
    Object.defineProperty(proxy, 'prop', { value: 1 });
    return proxy.prop;
}

export function defPropOnFrozen() {
    const obj = Object.freeze({});
    try {
        Object.defineProperty(obj, 'prop', { value: 1 });
        return false;
    } catch (e) {
        return e.name ;
    }
}

export function defPropOnSealed() {
    const obj = Object.seal({});
    try {
        Object.defineProperty(obj, 'newProp', { value: 1 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropOnNonExtensible() {
    const obj = Object.preventExtensions({});
    try {
        Object.defineProperty(obj, 'newProp', { value: 1 });
        return false;
    } catch (e) {
        return e.name;
    }
}


export function defPropWithEmptyStrKey() {
    const obj = {};
    Object.defineProperty(obj, '', { value: 'empty' });
    return obj[''];
}

export function defPropWithNumStrKey() {
    const obj = {};
    Object.defineProperty(obj, '0', { value: 'zero' });
    return obj['0'];
}

export function defPropWithSpecialCharKey() {
    const obj = {};
    Object.defineProperty(obj, '!@#$%', { value: 'special' });
    return obj['!@#$%'];
}

export function defPropWithChineseKey() {
    const obj = {};
    Object.defineProperty(obj, '属性', { value: '中文值' });
    return obj['属性'];
}

export function defPropWithEmojiKey() {
    const obj = {};
    Object.defineProperty(obj, '😊', { value: 'emoji' });
    return obj['😊'];
}

export function defPropWithUnicodeKey() {
    const obj = {};
    Object.defineProperty(obj, '中文', { value: 'unicode' });
    return obj['中文'];
}

export function defPropWithSymbolKey() {
    const sym = Symbol('key');
    const obj = {};
    Object.defineProperty(obj, sym, { value: 'symbol value' });
    return { exists: obj[sym] === 'symbol value', symPresent: true };
}

export function defPropWithSymbolForKey() {
    const sym = Symbol.for('globalKey');
    const obj = {};
    Object.defineProperty(obj, sym, { value: 'global symbol value' });
    return obj[Symbol.for('globalKey')];
}

export function defPropWithLongKey() {
    const longKey = 'a'.repeat(10000);
    const obj = {};
    Object.defineProperty(obj, longKey, { value: 'long value' });
    return obj[longKey];
}

export function defPropWithKeywordKeys() {
    const obj = {};
    Object.defineProperty(obj, 'class', { value: 'keyword' });
    Object.defineProperty(obj, 'function', { value: 'keyword' });
    return { classVal: obj['class'], funcVal: obj['function'] };
}

export function defPropWithReservedKeys() {
    const obj = {};
    Object.defineProperty(obj, 'implements', { value: 'reserved' });
    Object.defineProperty(obj, 'interface', { value: 'reserved' });
    return { implVal: obj['implements'], ifaceVal: obj['interface'] };
}

export function defPropWithProtoKey() {
    const obj = {};
    Object.defineProperty(obj, '__proto__', { value: 'proto value' });
    return obj['__proto__'];
}

export function defPropWithConstructorKey() {
    const obj = {};
    Object.defineProperty(obj, 'constructor', { value: 'custom constructor' });
    return obj.constructor;
}


export function defPropWithEmptyDesc() {
    const obj = {};
    Object.defineProperty(obj, 'prop', {});
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return {
        value: obj.prop,
        writable: desc.writable,
        enumerable: desc.enumerable,
        configurable: desc.configurable
    };
}

export function defPropWithNullDesc() {
    const obj = {};
    try {
        Object.defineProperty(obj, 'prop', null);
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropWithUndefinedDesc() {
    const obj = {};
    try {
        Object.defineProperty(obj, 'prop', undefined);
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropWithNumberDesc() {
    const obj = {};
    try {
        Object.defineProperty(obj, 'prop', 123);
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropWithStringDesc() {
    const obj = {};
    try {
        Object.defineProperty(obj, 'prop', 'descriptor');
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropWithArrayDesc() {
    const obj = {};
    Object.defineProperty(obj, 'prop', ['value', 'not valid']);
    return obj.prop;
}

export function defPropWithExtraProps() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, extraProp: 'ignored', anotherExtra: 123 });
    return obj.prop;
}

export function defPropWithFuncDesc() {
    const obj = {};
    function desc() {}
    desc.value = 1;
    Object.defineProperty(obj, 'prop', desc);
    return obj.prop;
}

export function defPropWithInheritedDesc() {
    const obj = {};
    const proto = { value: 1 };
    const descriptor = Object.create(proto);
    Object.defineProperty(obj, 'prop', descriptor);
    return obj.prop;
}

export function defPropWithFrozenDesc() {
    const obj = {};
    const descriptor = Object.freeze({ value: 1 });
    Object.defineProperty(obj, 'prop', descriptor);
    return obj.prop;
}


export function defPropReturnsObject() {
    const obj = {};
    const result = Object.defineProperty(obj, 'prop', { value: 1 });
    return result === obj;
}

export function defPropChainCall() {
    const obj = {};
    Object.defineProperty(
        Object.defineProperty(obj, 'a', { value: 1, configurable: true }),
        'b', { value: 2, configurable: true }
    );
    return { a: obj.a, b: obj.b };
}

export function defPropMultipleSame() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, configurable: true });
    const result = Object.defineProperty(obj, 'prop', { value: 2, configurable: true });
    return { returnsObj: result === obj, value: obj.prop };
}


export function defPropBasicTypes() {
    const obj = {};
    Object.defineProperty(obj, 'num', { value: 42 });
    Object.defineProperty(obj, 'str', { value: 'hello' });
    Object.defineProperty(obj, 'bool', { value: true });
    Object.defineProperty(obj, 'nullVal', { value: null });
    Object.defineProperty(obj, 'undefVal', { value: undefined });
    return {
        num: obj.num, str: obj.str, bool: obj.bool,
        nullVal: obj.nullVal, undef: obj.undefVal
    };
}

export function defPropNumberBoundary() {
    const obj = {};
    Object.defineProperty(obj, 'zero', { value: 0 });
    Object.defineProperty(obj, 'negZero', { value: -0 });
    Object.defineProperty(obj, 'infinity', { value: Infinity });
    Object.defineProperty(obj, 'nan', { value: NaN });
    Object.defineProperty(obj, 'maxVal', { value: Number.MAX_VALUE });
    return {
        isZero: Object.is(obj.zero, 0),
        isNegZero: Object.is(obj.negZero, -0),
        isInf: obj.infinity === Infinity,
        isNaN: Object.is(obj.nan, NaN),
        isMax: obj.maxVal === Number.MAX_VALUE
    };
}

export function defPropBigIntValue() {
    const obj = {};
    Object.defineProperty(obj, 'bigint', { value: 9007199254740991n });
    Object.defineProperty(obj, 'bigNeg', { value: -123456789n });
    return { bigint: obj.bigint, type: typeof obj.bigint };
}

export function defPropSymbolValue() {
    const sym = Symbol('test');
    const obj = {};
    Object.defineProperty(obj, 'symbolVal', { value: sym });
    return { equals: obj.symbolVal === sym, type: typeof obj.symbolVal };
}

export function defPropObjectValue() {
    const innerObj = { a: 1, b: 2 };
    const innerArr = [1, 2, 3];
    function innerFunc() { return 42; }
    const obj = {};
    Object.defineProperty(obj, 'objVal', { value: innerObj });
    Object.defineProperty(obj, 'arrVal', { value: innerArr });
    Object.defineProperty(obj, 'funcVal', { value: innerFunc });
    return { aVal: obj.objVal.a, arrVal: obj.arrVal[0], funcVal: obj.funcVal() };
}

export function defPropSpecialObjValue() {
    const obj = {};
    Object.defineProperty(obj, 'dateVal', { value: new Date('2024-01-01') });
    Object.defineProperty(obj, 'regexVal', { value: /test/gi });
    Object.defineProperty(obj, 'mapVal', { value: new Map([['a', 1]]) });
    return {
        isDate: obj.dateVal?.constructor?.name=== "Date",
        regexTest: obj.regexVal.test('TEST'),
        mapGet: obj.mapVal.get('a')
    };
}

export function defPropCircularValue() {
    const obj = {};
    const circular = { name: 'circular' };
    circular.self = circular;
    Object.defineProperty(obj, 'circular', { value: circular });
    return obj.circular === obj.circular.self;
}

export function defPropExplicitUndef() {
    const obj = {};
    Object.defineProperty(obj, 'explicitUndef', { value: undefined });
    return { hasProp: 'explicitUndef' in obj, value: obj.explicitUndef };
}

export function defPropNoValueDefault() {
    const obj = {};
    Object.defineProperty(obj, 'noValue', { writable: true });
    const desc = Object.getOwnPropertyDescriptor(obj, 'noValue');
    return { value: desc.value, hasValueKey: 'value' in desc };
}


export function defPropWritableTrue() {
    const obj = {};
    Object.defineProperty(obj, 'writableProp', { value: 1, writable: true });
    obj.writableProp = 2;
    return obj.writableProp;
}

export function defPropWritableFalse() {
    const obj = {};
    Object.defineProperty(obj, 'readonlyProp', { value: 1, writable: false });
    try { obj.readonlyProp = 2; } catch (e) {}
    return obj.readonlyProp;
}

export function defPropWritableFalseStrict() {
    const obj = {};
    Object.defineProperty(obj, 'readonlyProp', { value: 1, writable: false });
    try {
        obj.readonlyProp = 2;
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropDefaultWritable() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1 });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return desc.writable;
}

export function defPropObjImmutable() {
    const obj = {};
    const innerObj = { a: 1 };
    Object.defineProperty(obj, 'objProp', { value: innerObj, writable: false });
    obj.objProp.a = 2;
    try { obj.objProp = {}; } catch (e) {}
    return { innerModified: obj.objProp.a, stillSame: obj.objProp === innerObj };
}

export function defPropArrImmutable() {
    const obj = {};
    const arr = [1, 2, 3];
    Object.defineProperty(obj, 'arrProp', { value: arr, writable: false });
    obj.arrProp.push(4);
    try { obj.arrProp = []; } catch (e) {}
    return { length: obj.arrProp.length, unchanged: obj.arrProp === arr };
}

export function defPropModifyViaDefineProp() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: false, configurable: true });
    Object.defineProperty(obj, 'prop', { value: 2 });
    return obj.prop;
}

export function defPropWritableToFalse() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: true, configurable: true });
    obj.prop = 2;
    Object.defineProperty(obj, 'prop', { writable: false });
    try {
        obj.prop = 3;
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropReadonlyViaDefineProp() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: false, configurable: true });
    Object.defineProperty(obj, 'prop', { value: 2 });
    return obj.prop;
}


export function defPropValueAndWritable() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: true });
    obj.prop = 2;
    return obj.prop;
}

export function defPropOnlyValue() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1 });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return desc.writable;
}

export function defPropOnlyWritable() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { writable: true });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    obj.prop = 1;
    return { value: desc.value, writable: desc.writable, newVal: obj.prop };
}

export function defPropMultiCombo() {
    const obj = {};
    Object.defineProperty(obj, 'readonly', { value: 1, writable: false });
    Object.defineProperty(obj, 'writable', { value: 2, writable: true });
    Object.defineProperty(obj, 'default', { value: 3 });
    obj.writable = 20;
    return { readonly: obj.readonly, writable: obj.writable, defaultVal: obj.default };
}


export function defPropBasicGetter() {
    let val = 42;
    const obj = {};
    Object.defineProperty(obj, 'prop', { get() { return val; } });
    return obj.prop;
}

export function defPropFixedGetter() {
    const obj = {};
    Object.defineProperty(obj, 'alwaysSame', { get() { return 'fixed value'; } });
    return obj.alwaysSame;
}

export function defPropComputedGetter() {
    let counter = 0;
    const obj = {};
    Object.defineProperty(obj, 'count', { get() { return ++counter; } });
    const v1 = obj.count;
    const v2 = obj.count;
    const v3 = obj.count;
    return { v1: v1, v2: v2, v3: v3 };
}

export function defPropThisGetter() {
    const obj = { _value: 10 };
    Object.defineProperty(obj, 'value', { get() { return this._value * 2; } });
    return obj.value;
}

export function defPropClosureGetter() {
    let secret = 'hidden';
    const obj = {};
    Object.defineProperty(obj, 'secret', { get() { return secret; } });
    const v1 = obj.secret;
    secret = 'changed';
    const v2 = obj.secret;
    return { v1: v1, v2: v2 };
}

export function defPropUndefGetter() {
    const obj = {};
    Object.defineProperty(obj, 'undef', { get() { return undefined; } });
    return { value: obj.undef, hasProp: 'undef' in obj };
}

export function defPropNullGetter() {
    const obj = {};
    Object.defineProperty(obj, 'nullVal', { get() { return null; } });
    return obj.nullVal;
}

export function defPropErrorGetter() {
    const obj = {};
    Object.defineProperty(obj, 'errorProp', { get() { throw new Error('Getter error'); } });
    try {
        const v = obj.errorProp;
        return null;
    } catch (e) {
        return e.message;
    }
}

export function defPropFuncGetter() {
    const obj = {};
    Object.defineProperty(obj, 'method', { get() { return function() { return 42; }; } });
    return obj.method();
}

export function defPropSymbolGetter() {
    const sym = Symbol('unique');
    const obj = {};
    Object.defineProperty(obj, 'symProp', { get() { return sym; } });
    return obj.symProp === sym;
}

export function defPropBigIntGetter() {
    const obj = {};
    Object.defineProperty(obj, 'bigProp', { get() { return 9007199254740991n; } });
    return obj.bigProp;
}

export function defPropArrayGetter() {
    const obj = {};
    Object.defineProperty(obj, 'arrProp', { get() { return [1, 2, 3]; } });
    return { first: obj.arrProp[0], len: obj.arrProp.length };
}

export function defPropNonFuncGetter() {
    const obj = {};
    try {
        Object.defineProperty(obj, 'prop', { get: 'not a function' });
        return false;
    } catch (e) {
        return e.name;
    }
}


export function defPropBasicSetter() {
    let val;
    const obj = {};
    Object.defineProperty(obj, 'prop', { set(v) { val = v; } });
    obj.prop = 42;
    return val;
}

export function defPropClosureSetter() {
    let val;
    const obj = {};
    Object.defineProperty(obj, 'value', { set(v) { val = v; }, get() { return val; } });
    obj.value = 100;
    return obj.value;
}

export function defPropThisSetter() {
    const obj = {};
    Object.defineProperty(obj, 'value', { set(v) { this._value = v; }, get() { return this._value; } });
    obj.value = 42;
    return { value: obj.value, internal: obj._value };
}

export function defPropTypeConvertSetter() {
    let converted;
    const obj = {};
    Object.defineProperty(obj, 'num', { set(v) { converted = Number(v); }, get() { return converted; } });
    obj.num = '42';
    return obj.num;
}

export function defPropValidateSetter() {
    let age;
    const obj = {};
    Object.defineProperty(obj, 'age', {
        set(v) { if (v < 0) throw new Error('Age cannot be negative'); age = v; },
        get() { return age; }
    });
    obj.age = 25;
    let errorMsg = null;
    try { obj.age = -1; } catch (e) { errorMsg = e.message; }
    return { value: obj.age, errorMsg: errorMsg };
}

export function defPropThrowSetter() {
    const obj = {};
    Object.defineProperty(obj, 'readOnly', { set(v) { throw new Error('This property is read-only'); } });
    try {
        obj.readOnly = 42;
        return null;
    } catch (e) {
        return e.message;
    }
}

export function defPropIgnoreSetter() {
    let val = 0;
    const obj = {};
    Object.defineProperty(obj, 'positiveOnly', { set(v) { if (v > 0) val = v; }, get() { return val; } });
    obj.positiveOnly = 5;
    obj.positiveOnly = -1;
    return obj.positiveOnly;
}

export function defPropWriteOnly() {
    let val;
    const obj = {};
    Object.defineProperty(obj, 'writeOnly', { set(v) { val = v; } });
    obj.writeOnly = 42;
    return { getResult: obj.writeOnly, stored: val };
}

export function defPropNonFuncSetter() {
    const obj = {};
    try {
        Object.defineProperty(obj, 'prop', { set: 'not a function' });
        return false;
    } catch (e) {
        return e.name;
    }
}


export function defPropFullAccessor() {
    let val = 0;
    const obj = {};
    Object.defineProperty(obj, 'value', { get() { return val; }, set(v) { val = v; } });
    obj.value = 42;
    return obj.value;
}

export function defPropThisAccessor() {
    const obj = { _name: 'default' };
    Object.defineProperty(obj, 'name', {
        get() { return this._name.toUpperCase(); },
        set(v) { this._name = v.toLowerCase(); }
    });
    obj.name = 'HELLO';
    return { name: obj.name, internal: obj._name };
}

export function defPropReadonlyAccessor() {
    const obj = {};
    let id = 12345;
    Object.defineProperty(obj, 'id', { get() { return id; } });
    try {
        obj.id = 'new id';
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropWriteOnlyAccessor() {
    let pwd;
    const obj = {};
    Object.defineProperty(obj, 'password', { set(v) { pwd = v; } });
    obj.password = 'secret123';
    return { getResult: obj.password, stored: pwd };
}

export function defPropMixedDescError() {
    const obj = {};
    try {
        Object.defineProperty(obj, 'prop', { value: 1, get() { return 2; } });
        return false;
    } catch (e) {
        return e.name;
    }
}


export function defPropConfigurableTrue() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, configurable: true });
    Object.defineProperty(obj, 'prop', { value: 2 });
    return obj.prop;
}

export function defPropConfigurableFalse() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, configurable: false });
    try {
        Object.defineProperty(obj, 'prop', { value: 2 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropDefaultConfigurable() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1 });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return desc.configurable;
}

export function defPropDeleteConfigurable() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, configurable: true });
    delete obj.prop;
    return 'prop' in obj;
}

export function defPropDeleteNonConfigurable() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, configurable: false });
    try {
        delete obj.prop;
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropWritableTrueNonConfig() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: true, configurable: false });
    obj.prop = 2;
    return obj.prop;
}

export function defPropWritableToFalseNonConfig() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: true, configurable: false });
    Object.defineProperty(obj, 'prop', { writable: false });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return { writable: desc.writable, configurable: desc.configurable };
}

export function defPropFullyLocked() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: false, configurable: false });
    try {
        Object.defineProperty(obj, 'prop', { value: 2 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropSameValueNonConfig() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: false, configurable: false });
    Object.defineProperty(obj, 'prop', { value: 1 });
    return obj.prop;
}

export function defPropTypeSwitch() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, configurable: true });
    Object.defineProperty(obj, 'prop', { get() { return 2; } });
    Object.defineProperty(obj, 'prop', { value: 3, configurable: true });
    return obj.prop;
}


export function defPropEnumerableTrue() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, enumerable: true });
    return Object.keys(obj).includes('prop');
}

export function defPropEnumerableFalse() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, enumerable: false });
    return { inKeys: Object.keys(obj).includes('prop'), value: obj.prop };
}

export function defPropDefaultEnumerable() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1 });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return desc.enumerable;
}

export function defPropMixedEnumerable() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: true });
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    Object.defineProperty(obj, 'c', { value: 3, enumerable: true });
    const keys = Object.keys(obj);
    return { hasA: keys.includes('a'), hasB: keys.includes('b'), hasC: keys.includes('c') };
}

export function defPropHiddenAccessible() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', { value: 'secret', enumerable: false });
    return { value: obj.hidden, inObj: 'hidden' in obj, hasOwn: obj.hasOwnProperty('hidden') };
}

export function defPropOwnNamesIncludes() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: true });
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    const names = Object.getOwnPropertyNames(obj);
    return { hasA: names.includes('a'), hasB: names.includes('b') };
}

export function defPropModifyEnumerable() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, enumerable: false, configurable: true });
    Object.defineProperty(obj, 'prop', { enumerable: true });
    return Object.keys(obj).includes('prop');
}

export function defPropEnumerableAccessor() {
    const obj = {};
    Object.defineProperty(obj, 'getter', { get() { return 42; }, enumerable: true });
    Object.defineProperty(obj, 'hiddenGetter', { get() { return 'hidden'; }, enumerable: false });
    const keys = Object.keys(obj);
    return { hasGetter: keys.includes('getter'), hasHidden: keys.includes('hiddenGetter') };
}


export function defPropDefaultAll() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1 });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return { writable: desc.writable, enumerable: desc.enumerable, configurable: desc.configurable };
}


export function defPropModifyExisting() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: true, configurable: true });
    Object.defineProperty(obj, 'prop', { value: 2 });
    return obj.prop;
}

export function defPropModifyWritable() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: true, configurable: true });
    Object.defineProperty(obj, 'prop', { writable: false });
    try { obj.prop = 2; } catch (e) {}
    return obj.prop;
}

export function defPropModifyConfigFromTrue() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, configurable: true });
    Object.defineProperty(obj, 'prop', { configurable: false });
    try {
        Object.defineProperty(obj, 'prop', { value: 2 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropPartialModify() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: true, enumerable: true, configurable: true });
    Object.defineProperty(obj, 'prop', { value: 2 });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return { value: desc.value, writable: desc.writable, enumerable: desc.enumerable, configurable: desc.configurable };
}

export function defPropModifyAssignCreated() {
    const obj = {};
    obj.prop = 1;
    Object.defineProperty(obj, 'prop', { enumerable: false });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return desc.enumerable;
}

export function defPropDataToAccessor() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, configurable: true });
    Object.defineProperty(obj, 'prop', { get() { return 2; }, set(v) {} });
    return obj.prop;
}

export function defPropAccessorToData() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { get() { return 1; }, configurable: true });
    Object.defineProperty(obj, 'prop', { value: 2 });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return { value: obj.prop, get: desc.get, set: desc.set };
}

export function defPropSwitchTypeNonConfig() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, configurable: false });
    try {
        Object.defineProperty(obj, 'prop', { get() { return 2; } });
        return false;
    } catch (e) {
        return e.name;
    }
}


export function defPropProtoAccessor() {
    function Parent() {}
    Object.defineProperty(Parent.prototype, 'x', { get() { return 'inherited'; } });
    const instance = new Parent();
    return instance.x;
}

export function defPropProtoSharedAccessor() {
    function C() {}
    let shared;
    Object.defineProperty(C.prototype, 'x', { get() { return shared; }, set(v) { shared = v; } });
    const a = new C();
    const b = new C();
    a.x = 1;
    return b.x;
}

export function defPropProtoThisAccessor() {
    function C() {}
    Object.defineProperty(C.prototype, 'x', { get() { return this._x; }, set(v) { this._x = v; } });
    const a = new C();
    const b = new C();
    a.x = 1;
    b.x = 2;
    return { aVal: a.x, bVal: b.x };
}

export function defPropProtoData() {
    function C() {}
    Object.defineProperty(C.prototype, 'y', { value: 10, writable: true });
    const inst = new C();
    return inst.y;
}

export function defPropProtoDataWritable() {
    function C() {}
    Object.defineProperty(C.prototype, 'y', { value: 10, writable: true });
    const inst = new C();
    inst.y = 20;
    return { val: inst.y, hasOwn: inst.hasOwnProperty('y') };
}

export function defPropProtoReadonly() {
    const proto = {};
    Object.defineProperty(proto, 'x', { value: 1, writable: false });
    const child = Object.create(proto);
    try { child.x = 2; } catch (e) {}
    return { val: child.x, hasOwn: child.hasOwnProperty('x') };
}

export function defPropProtoConfigOverride() {
    const proto = {};
    Object.defineProperty(proto, 'x', { value: 1, configurable: false });
    const child = Object.create(proto);
    Object.defineProperty(child, 'x', { value: 2 });
    return { val: child.x, hasOwn: child.hasOwnProperty('x') };
}

export function defPropProtoChainForIn() {
    const proto = {};
    Object.defineProperty(proto, 'x', { value: 1, enumerable: true });
    const child = Object.create(proto);
    Object.defineProperty(child, 'y', { value: 2, enumerable: true });
    const keys = [];
    for (let key in child) { keys.push(key); }
    return { hasY: keys.includes('y'), hasX: keys.includes('x'), count: keys.length };
}

export function defPropObjCreateNull() {
    const obj = Object.create(null);
    Object.defineProperty(obj, 'prop', { value: 1 });
    return { val: obj.prop, proto: Object.getPrototypeOf(obj) };
}

export function defPropObjCreateSecondArg() {
    const obj = Object.create({}, {
        prop: { value: 42, writable: true, enumerable: true, configurable: true }
    });
    return obj.prop;
}


export function defPropValueGetMixed() {
    const obj = {};
    try {
        Object.defineProperty(obj, 'prop', { value: 1, get() { return 2; } });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropValueSetMixed() {
    const obj = {};
    try {
        Object.defineProperty(obj, 'prop', { value: 1, set(v) {} });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropWritableGetMixed() {
    const obj = {};
    try {
        Object.defineProperty(obj, 'prop', { writable: true, get() { return 1; } });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropWritableSetMixed() {
    const obj = {};
    try {
        Object.defineProperty(obj, 'prop', { writable: true, set(v) {} });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropTargetNull() {
    try {
        Object.defineProperty(null, 'prop', { value: 1 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropTargetUndefined() {
    try {
        Object.defineProperty(undefined, 'prop', { value: 1 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropTargetNumber() {
    try {
        Object.defineProperty(42, 'prop', { value: 1 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropTargetString() {
    try {
        Object.defineProperty('string', 'prop', { value: 1 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropTargetBoolean() {
    try {
        Object.defineProperty(true, 'prop', { value: 1 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropTargetSymbol() {
    try {
        Object.defineProperty(Symbol('test'), 'prop', { value: 1 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropTargetBigInt() {
    try {
        Object.defineProperty(123n, 'prop', { value: 1 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropModifyNonConfigValue() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: false, configurable: false });
    try {
        Object.defineProperty(obj, 'prop', { value: 2 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropModifyNonConfigEnum() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, enumerable: false, configurable: false });
    try {
        Object.defineProperty(obj, 'prop', { enumerable: true });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropModifyNonConfigConfig() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, configurable: false });
    try {
        Object.defineProperty(obj, 'prop', { configurable: true });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropModifyNonConfigGetter() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { get() { return 1; }, configurable: false });
    try {
        Object.defineProperty(obj, 'prop', { get() { return 2; } });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropModifyNonConfigSetter() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { set(v) {}, configurable: false });
    try {
        Object.defineProperty(obj, 'prop', { set(v) {} });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropSwitchAccessorToDataNonConfig() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { get() { return 1; }, configurable: false });
    try {
        Object.defineProperty(obj, 'prop', { value: 2 });
        return false;
    } catch (e) {
        return e.name;
    }
}



export function defPropAddOnPrevented() {
    const obj = Object.preventExtensions({});
    try {
        Object.defineProperty(obj, 'newProp', { value: 1 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropAddOnSealed() {
    const obj = Object.seal({});
    try {
        Object.defineProperty(obj, 'newProp', { value: 1 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropAddOnFrozen() {
    const obj = Object.freeze({});
    try {
        Object.defineProperty(obj, 'newProp', { value: 1 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropModifyOnFrozen() {
    const obj = { prop: 1 };
    Object.freeze(obj);
    try {
        Object.defineProperty(obj, 'prop', { value: 2 });
        return false;
    } catch (e) {
        return e.name;
    }
}

export function defPropModifyCharOnSealed() {
    const obj = { prop: 1 };
    Object.seal(obj);
    try {
        Object.defineProperty(obj, 'prop', { enumerable: false });
        return false;
    } catch (e) {
        return e.name;
    }
}


export function defPropFreezeEffect() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: true, configurable: true });
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return { writable: desc.writable, configurable: desc.configurable };
}

export function defPropFreezeAccessor() {
    let val = 1;
    const obj = {};
    Object.defineProperty(obj, 'prop', { get() { return val; }, set(v) { val = v; } });
    Object.freeze(obj);
    const getVal = obj.prop;
    let threwTypeError = false;
    try { obj.prop = 2; } catch (e) { threwTypeError = e.name; }
    return { getVal: getVal, threwTypeError: threwTypeError };
}

export function defPropSealEffect() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: true, configurable: true });
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return desc.configurable;
}

export function defPropPreventModify() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, configurable: true });
    Object.preventExtensions(obj);
    Object.defineProperty(obj, 'prop', { value: 2 });
    return obj.prop;
}

export function defPropDefineProperties() {
    const obj = {};
    Object.defineProperties(obj, {
        prop1: { value: 1, writable: true },
        prop2: { value: 2, enumerable: true },
        accessor: { get() { return 3; } }
    });
    return { prop1: obj.prop1, prop2: obj.prop2, accessor: obj.accessor };
}

export function defPropGetOwnPropDesc() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: true, enumerable: true, configurable: true });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return { value: desc.value, writable: desc.writable, enumerable: desc.enumerable, configurable: desc.configurable };
}


export function defPropNestedObj() {
    const obj = { inner: {} };
    Object.defineProperty(obj.inner, 'prop', { value: 'nested value' });
    return obj.inner.prop;
}

export function defPropObjWithSymbol() {
    const sym = Symbol('existing');
    const obj = { [sym]: 'symbol value' };
    Object.defineProperty(obj, 'newProp', { value: 'new value' });
    return { newProp: obj.newProp, symVal: obj[sym] };
}

export function defPropObjWithFunc() {
    const obj = { method: function() { return 1; } };
    Object.defineProperty(obj, 'prop', { value: 2 });
    return { methodResult: obj.method(), propVal: obj.prop };
}

export function defPropLargeObj() {
    const obj = {};
    for (let i = 0; i < 50; i++) {
        Object.defineProperty(obj, 'prop' + i, { value: i });
    }
    Object.defineProperty(obj, 'newProp', { value: 'new' });
    return { newProp: obj.newProp, prop25: obj['prop25'] };
}

export function defPropUndefNullNaNInf() {
    const obj = { a: undefined, b: 1 };
    Object.defineProperty(obj, 'c', { value: undefined });
    const obj2 = { a: null };
    Object.defineProperty(obj2, 'c', { value: null });
    const obj3 = { a: NaN };
    Object.defineProperty(obj3, 'c', { value: NaN });
    const obj4 = { a: Infinity };
    Object.defineProperty(obj4, 'c', { value: Infinity });
    return {
        undef: obj.c, undefIn: 'c' in obj,
        nullVal: obj2.c,
        nanVal: Object.is(obj3.c, NaN),
        infVal: obj4.c
    };
}

export function defPropLongStringValue() {
    const longStr = 'a'.repeat(1000000);
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: longStr });
    return obj.prop === longStr;
}

export function defPropDeepNested() {
    const deep = { a: { b: { c: { d: { e: { f: 'deep' } } } } } };
    const obj = {};
    Object.defineProperty(obj, 'nested', { value: deep });
    return obj.nested.a.b.c.d.e.f;
}

export function defPropOverrideToString() {
    const obj = {};
    Object.defineProperty(obj, 'toString', { value: function() { return 'custom toString'; }, configurable: true });
    return obj.toString();
}

export function defPropDeleteRedefine() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, configurable: true });
    delete obj.prop;
    Object.defineProperty(obj, 'prop', { value: 2 });
    return obj.prop;
}

export function defPropSealedWritable() {
    const obj = {};
    Object.defineProperty(obj, 'writable', { value: 1, writable: true });
    Object.defineProperty(obj, 'readonly', { value: 2, writable: false });
    Object.seal(obj);
    obj.writable = 10;
    try { obj.readonly = 20; } catch (e) {}
    return { writable: obj.writable, readonly: obj.readonly };
}

export function defPropPropertyIsEnumerable() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: true });
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    return { aEnum: obj.propertyIsEnumerable('a'), bEnum: obj.propertyIsEnumerable('b') };
}

export function defPropSymbolKeysNotInKeys() {
    const obj = {};
    const sym = Symbol('key');
    Object.defineProperty(obj, sym, { value: 1, enumerable: true });
    Object.defineProperty(obj, 'a', { value: 2, enumerable: true });
    return { aInKeys: Object.keys(obj).includes('a'), symInSyms: Object.getOwnPropertySymbols(obj).includes(sym) };
}

export function defPropJSONStringifyEnum() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: true });
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    return JSON.stringify(obj);
}

export function defPropObjectAssignEnum() {
    const source = {};
    Object.defineProperty(source, 'a', { value: 1, enumerable: true });
    Object.defineProperty(source, 'b', { value: 2, enumerable: false });
    const target = {};
    Object.assign(target, source);
    return { a: target.a, b: target.b };
}

export function defPropCircularRef() {
    const obj = {};
    const circular = { name: 'circular' };
    circular.self = circular;
    Object.defineProperty(obj, 'circular', { value: circular });
    return { equals: obj.circular === obj.circular.self, nestedName: obj.circular.self.self.self.name };
}

export function defPropTypedArraySpecial() {
    const obj = {};
    Object.defineProperty(obj, 'float32', { value: new Float32Array([Infinity, -Infinity, NaN]) });
    Object.defineProperty(obj, 'int8', { value: new Int8Array([Infinity, -Infinity, NaN]) });
    Object.defineProperty(obj, 'uint8c', { value: new Uint8ClampedArray([Infinity, -Infinity, NaN]) });
    return { float32: obj.float32[0], int8: obj.int8[0], uint8c: obj.uint8c[0] };
}


export function defPropReflectBasic() {
    const obj = {};
    const result = Reflect.defineProperty(obj, 'prop', { value: 1, writable: true });
    return result;
}

export function defPropReflectFail() {
    const obj = Object.freeze({});
    const result = Reflect.defineProperty(obj, 'prop', { value: 1 });
    return result;
}

export function defPropReflectFreeze() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1, writable: true });
    Object.freeze(obj);
    const result = Reflect.defineProperty(obj, 'prop', { value: 2 });
    return result;
}


export function defPropProxyIntercept() {
    const target = {};
    let interceptedKey = '';
    const handler = {
        defineProperty(t, key, desc) {
            interceptedKey = String(key);
            return Reflect.defineProperty(t, key, desc);
        }
    };
    const proxy = new Proxy(target, handler);
    Object.defineProperty(proxy, 'prop', { value: 1 });
    return { prop: proxy.prop, intercepted: interceptedKey };
}
