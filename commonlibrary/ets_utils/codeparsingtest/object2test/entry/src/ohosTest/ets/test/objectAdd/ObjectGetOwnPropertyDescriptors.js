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


export function descriptorsBasicObj() {
    const obj = { a: 1, b: 'test', c: true };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasA: 'a' in descriptors, hasB: 'b' in descriptors, hasC: 'c' in descriptors };
}

export function descriptorsEmptyObj() {
    const obj = {};
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isEmpty: Object.keys(descriptors).length === 0 };
}


export function descriptorsUndefinedThrows() {
    try {
        Object.getOwnPropertyDescriptors(undefined);
        return false;
    } catch (e) {
        return e.name;
    }
}

export function descriptorsNullThrows() {
    try {
        Object.getOwnPropertyDescriptors(null);
        return false;
    } catch (e) {
        return e.name;
    }
}

export function descriptorsNoArgThrows() {
    try {
        Object.getOwnPropertyDescriptors();
        return false;
    } catch (e) {
        return e.name;
    }
}


export function descriptorsNumberArg() {
    const descriptors = Object.getOwnPropertyDescriptors(42);
    return { isObject: typeof descriptors === 'object', notNull: descriptors !== null };
}

export function descriptorsStringArg() {
    const descriptors = Object.getOwnPropertyDescriptors('hello');
    return { isObject: typeof descriptors === 'object', notNull: descriptors !== null };
}

export function descriptorsBooleanArg() {
    const descriptors = Object.getOwnPropertyDescriptors(true);
    return { isObject: typeof descriptors === 'object', notNull: descriptors !== null };
}

export function descriptorsSymbolArg() {
    const sym = Symbol('test');
    const descriptors = Object.getOwnPropertyDescriptors(sym);
    return { isObject: typeof descriptors === 'object', notNull: descriptors !== null };
}

export function descriptorsBigIntArg() {
    const descriptors = Object.getOwnPropertyDescriptors(123n);
    return { isObject: typeof descriptors === 'object', notNull: descriptors !== null };
}


export function descriptorsNumberValue() {
    const obj = { num: 42 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { value: descriptors.num.value, type: typeof descriptors.num.value };
}

export function descriptorsSpecialNumberValues() {
    const obj = { nan: NaN, inf: Infinity, negInf: -Infinity, negZero: -0, posZero: +0 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return {
        nanIsNaN: Object.is(descriptors.nan.value, NaN),
        infVal: descriptors.inf.value,
        negInfVal: descriptors.negInf.value,
        isPosZero: Object.is(descriptors.posZero.value, 0)
    };
}

export function descriptorsExtremeNumberValues() {
    const obj = {
        max: Number.MAX_VALUE, min: Number.MIN_VALUE,
        maxSafe: Number.MAX_SAFE_INTEGER, minSafe: Number.MIN_SAFE_INTEGER,
        epsilon: Number.EPSILON
    };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return {
        maxMatch: descriptors.max.value === Number.MAX_VALUE,
        minMatch: descriptors.min.value === Number.MIN_VALUE,
        maxSafeVal: descriptors.maxSafe.value,
        epsilonVal: descriptors.epsilon.value
    };
}

export function descriptorsNumberBoundaryValues() {
    const obj = {
        zero: 0, byteMax: 127, byteMin: -128,
        intMax: 2147483647, intMin: -2147483648,
        floatVal: 123.456
    };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return {
        zeroVal: descriptors.zero.value,
        byteMaxVal: descriptors.byteMax.value,
        intMaxVal: descriptors.intMax.value
    };
}


export function descriptorsStringValue() {
    const obj = { str: 'hello world' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { value: descriptors.str.value };
}

export function descriptorsEmptyStringValue() {
    const obj = { empty: '' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { value: descriptors.empty.value, length: descriptors.empty.value.length };
}

export function descriptorsSpecialCharStringValue() {
    const obj = { special: "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~" };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { type: typeof descriptors.special.value, hasVal: descriptors.special.value.length > 0 };
}

export function descriptorsEscapeCharStringValue() {
    const obj = { escape: '\b\f\n\r\t\v\\\'\"\?\\0' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { type: typeof descriptors.escape.value, hasVal: descriptors.escape.value.length > 0 };
}

export function descriptorsLongStringValue() {
    const obj = { longStr: 'a'.repeat(10000) };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { length: descriptors.longStr.value.length };
}


export function descriptorsBooleanValues() {
    const obj = { isTrue: true, isFalse: false };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isTrueVal: descriptors.isTrue.value, isFalseVal: descriptors.isFalse.value };
}

export function descriptorsFalsyValues() {
    const obj = { zero: 0, emptyStr: '', nullVal: null, undefinedVal: undefined, nanVal: NaN };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return {
        zeroVal: descriptors.zero.value,
        emptyStrVal: descriptors.emptyStr.value,
        nullVal: descriptors.nullVal.value,
        nanIsNaN: Object.is(descriptors.nanVal.value, NaN)
    };
}


export function descriptorsUndefinedValue() {
    const obj = { undef: undefined };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasUndef: 'undef' in descriptors, value: descriptors.undef.value };
}

export function descriptorsNullValue() {
    const obj = { nullVal: null };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { value: descriptors.nullVal.value };
}


export function descriptorsObjectValue() {
    const inner = { a: 1, b: 2 };
    const obj = { nested: inner };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isSameRef: descriptors.nested.value === inner, aVal: descriptors.nested.value.a };
}

export function descriptorsDeepNestedObjectValue() {
    const deep = { a: { b: { c: { d: 1 } } } };
    const obj = { deep: deep };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { deepDVal: descriptors.deep.value.a.b.c.d };
}

export function descriptorsSymbolKeyObjectValue() {
    const sym = Symbol('key');
    const inner = { [sym]: 'value' };
    const obj = { symObj: inner };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isSameRef: descriptors.symObj.value === inner, symVal: descriptors.symObj.value[sym] };
}


export function descriptorsArrayValue() {
    const arr = [1, 2, 3, 4, 5];
    const obj = { arr: arr };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isArray: Array.isArray(descriptors.arr.value), firstVal: descriptors.arr.value[0] };
}

export function descriptorsMixedArrayValue() {
    const mixed = [1, 'str', true, null, undefined, { a: 1 }, [1, 2]];
    const obj = { mixed: mixed };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { length: descriptors.mixed.value.length, firstVal: descriptors.mixed.value[0] };
}

export function descriptorsSpecialArrayValue() {
    const special = [NaN, Infinity, -Infinity, -0];
    const obj = { special: special };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { length: descriptors.special.value.length, isArray: Array.isArray(descriptors.special.value) };
}

export function descriptorsEmptyArrayValue() {
    const empty = [];
    const obj = { empty: empty };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { length: descriptors.empty.value.length };
}


export function descriptorsFunctionValue() {
    function fn() { return 42; }
    const obj = { fn: fn };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { type: typeof descriptors.fn.value, callRet: descriptors.fn.value() };
}

export function descriptorsArrowFunctionValue() {
    const arrow = () => 'arrow';
    const obj = { arrow: arrow };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { type: typeof descriptors.arrow.value, callRet: descriptors.arrow.value() };
}

export function descriptorsAsyncFunctionValue() {
    async function asyncFn() { return 'async'; }
    const obj = { asyncFn: asyncFn };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { type: typeof descriptors.asyncFn.value };
}

export function descriptorsGeneratorFunctionValue() {
    function* gen() { yield 1; yield 2; }
    const obj = { gen: gen };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { type: typeof descriptors.gen.value };
}


export function descriptorsInt8ArrayValue() {
    const int8 = new Int8Array([72, 101, 108, 108, 111]);
    const obj = { int8: int8 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { firstVal: descriptors.int8.value[0], length: descriptors.int8.value.length };
}

export function descriptorsUint8ArrayValue() {
    const uint8 = new Uint8Array([255, 0, 127]);
    const clamped = new Uint8ClampedArray([0, 255, 128]);
    const obj = { uint8: uint8, clamped: clamped };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { uint8First: descriptors.uint8.value[0], clampedFirst: descriptors.clamped.value[0] };
}

export function descriptorsInt16ArrayValue() {
    const int16 = new Int16Array([-32768, 0, 32767]);
    const uint16 = new Uint16Array([0, 65535]);
    const obj = { int16: int16, uint16: uint16 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { int16First: descriptors.int16.value[0], uint16First: descriptors.uint16.value[0] };
}

export function descriptorsInt32ArrayValue() {
    const int32 = new Int32Array([-2147483648, 2147483647]);
    const uint32 = new Uint32Array([0, 4294967295]);
    const obj = { int32: int32, uint32: uint32 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { int32First: descriptors.int32.value[0], uint32First: descriptors.uint32.value[0] };
}

export function descriptorsFloatArrayValue() {
    const float32 = new Float32Array([1.5, -2.5, 0.0]);
    const float64 = new Float64Array([1.7976931348623157e+308]);
    const obj = { float32: float32, float64: float64 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { float32First: descriptors.float32.value[0], float64First: descriptors.float64.value[0] };
}

export function descriptorsBigIntArrayValue() {
    const bigint64 = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
    const biguint64 = new BigUint64Array([0n, 18446744073709551615n]);
    const obj = { bigint64: bigint64, biguint64: biguint64 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { bigint64First: descriptors.bigint64.value[0], biguint64First: descriptors.biguint64.value[0] };
}


export function descriptorsDateValue() {
    const date = new Date('2024-01-01');
    const obj = { date: date };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isDate: descriptors.date.value?.constructor?.name=== "Date" };
}

export function descriptorsRegExpValue() {
    const regex = /abc/gi;
    const obj = { regex: regex };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isRegExp: descriptors.regex.value?.constructor?.name=== "RegExp" };
}

export function descriptorsMapValue() {
    const map = new Map([['key1', 'value1'], ['key2', { a: 1 }]]);
    const obj = { map: map };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isMap: descriptors.map.value?.constructor?.name=== "Map", size: descriptors.map.value.size };
}

export function descriptorsSetValue() {
    const set = new Set([1, 2, 3]);
    const obj = { set: set };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isSet: descriptors.set.value?.constructor?.name=== "Set", size: descriptors.set.value.size };
}

export function descriptorsPromiseValue() {
    const promise = new Promise((resolve) => { resolve('done'); });
    const obj = { promise: promise };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isPromise: descriptors.promise.value?.constructor?.name=== "Promise" };
}

export function descriptorsArrayBufferValue() {
    const buffer = new ArrayBuffer(16);
    const obj = { buffer: buffer };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isArrayBuffer: descriptors.buffer.value?.constructor?.name=== "ArrayBuffer", byteLen: descriptors.buffer.value.byteLength };
}

export function descriptorsDataViewValue() {
    const view = new DataView(new ArrayBuffer(16));
    const obj = { view: view };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isDataView: descriptors.view.value?.constructor?.name=== "DataView" };
}


export function descriptorsWritableTrue() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, writable: true });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { aWritable: descriptors.a.writable, bWritable: descriptors.b.writable };
}

export function descriptorsWritableFalse() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { aWritable: descriptors.a.writable };
}

export function descriptorsModifyWritable() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: true, configurable: true });
    Object.defineProperty(obj, 'a', { writable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { writable: descriptors.a.writable };
}


export function descriptorsConfigurableTrue() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, configurable: true });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { configurable: descriptors.a.configurable };
}

export function descriptorsConfigurableFalse() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, configurable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { configurable: descriptors.a.configurable };
}

export function descriptorsConfigurablePreventDelete() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, configurable: false });
    try { delete obj.a; } catch (e) {}
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasA: 'a' in descriptors, value: descriptors.a.value };
}


export function descriptorsEnumerableTrue() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: true });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { enumerable: descriptors.a.enumerable, inKeys: Object.keys(obj).includes('a') };
}

export function descriptorsEnumerableFalse() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { enumerable: descriptors.a.enumerable, inKeys: Object.keys(obj).includes('a') };
}

export function descriptorsEnumerableForIn() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    const keys = [];
    for (let key in obj) { keys.push(key); }
    return { includesA: keys.includes('a'), includesB: keys.includes('b'), descHasB: 'b' in descriptors };
}


export function descriptorsAllTrueCombo() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: true, enumerable: true, configurable: true });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    const d = descriptors.a;
    return { value: d.value, writable: d.writable, enumerable: d.enumerable, configurable: d.configurable };
}

export function descriptorsAllFalseCombo() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: false, enumerable: false, configurable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    const d = descriptors.a;
    return { value: d.value, writable: d.writable, enumerable: d.enumerable, configurable: d.configurable };
}

export function descriptorsMixedCombo() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: true, enumerable: true, configurable: false });
    Object.defineProperty(obj, 'b', { value: 2, writable: false, enumerable: true, configurable: true });
    Object.defineProperty(obj, 'c', { value: 3, writable: true, enumerable: false, configurable: true });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return {
        aWritable: descriptors.a.writable, aConfig: descriptors.a.configurable,
        bWritable: descriptors.b.writable, bConfig: descriptors.b.configurable,
        cWritable: descriptors.c.writable, cEnum: descriptors.c.enumerable
    };
}


export function descriptorsGetterOnly() {
    const obj = { get name() { return 'test'; } };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    const d = descriptors.name;
    return { getIsFunc: typeof d.get === 'function', setIsUndef: d.set === undefined, valueIsUndef: d.value === undefined };
}

export function descriptorsGetterBasicTypes() {
    const obj = {
        get num() { return 42; },
        get str() { return 'hello'; },
        get bool() { return true; }
    };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { numGet: descriptors.num.get(), strGet: descriptors.str.get(), boolGet: descriptors.bool.get() };
}

export function descriptorsGetterObjectTypes() {
    const obj = {
        get objVal() { return { a: 1, b: 2 }; },
        get arrVal() { return [1, 2, 3]; }
    };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { objA: descriptors.objVal.get().a, arrLen: descriptors.arrVal.get().length };
}

export function descriptorsGetterUndefNull() {
    const obj = {
        get undef() { return undefined; },
        get nullVal() { return null; }
    };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { undefVal: descriptors.undef.get(), nullVal: descriptors.nullVal.get() };
}

export function descriptorsGetterThrows() {
    const obj = { get error() { throw new Error('getter error'); } };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { getIsFunc: typeof descriptors.error.get === 'function' };
}

export function descriptorsGetterThis() {
    const obj = { _value: 42, get value() { return this._value; } };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { getResult: descriptors.value.get.call(obj) };
}


export function descriptorsSetterOnly() {
    const obj = { _value: 0, set value(val) { this._value = val; } };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    const d = descriptors.value;
    return { setIsFunc: typeof d.set === 'function', getIsUndef: d.get === undefined, valueIsUndef: d.value === undefined };
}

export function descriptorsSetterReceiveValue() {
    const obj = { set any(val) {} };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { setIsFunc: typeof descriptors.any.set === 'function' };
}

export function descriptorsSetterThrows() {
    const obj = { set error(val) { throw new Error('setter error'); } };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { setIsFunc: typeof descriptors.error.set === 'function' };
}


export function descriptorsGetterSetterBoth() {
    const obj = { _name: 'test', get name() { return this._name; }, set name(val) { this._name = val; } };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { getIsFunc: typeof descriptors.name.get === 'function', setIsFunc: typeof descriptors.name.set === 'function' };
}

export function descriptorsAccessorNoValueWritable() {
    const obj = {};
    Object.defineProperty(obj, 'a', { get() { return 1; }, set(val) {}, enumerable: true, configurable: true });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { valueUndef: descriptors.a.value === undefined, writableUndef: descriptors.a.writable === undefined };
}

export function descriptorsDefinePropAccessor() {
    const obj = {};
    Object.defineProperty(obj, 'name', {
        get: function() { return this._name; },
        set: function(val) { this._name = val; },
        enumerable: true, configurable: true
    });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { getIsFunc: typeof descriptors.name.get === 'function', setIsFunc: typeof descriptors.name.set === 'function' };
}


export function descriptorsAccessorEnumerable() {
    const obj = {};
    Object.defineProperty(obj, 'a', { get() { return 1; }, enumerable: true });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { enumerable: descriptors.a.enumerable };
}

export function descriptorsAccessorConfigurable() {
    const obj = {};
    Object.defineProperty(obj, 'a', { get() { return 1; }, configurable: true });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { configurable: descriptors.a.configurable };
}

export function descriptorsAccessorNonConfigurable() {
    const obj = {};
    Object.defineProperty(obj, 'a', { get() { return 1; }, configurable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    let throwsTypeError = false;
    try { Object.defineProperty(obj, 'a', { get() { return 2; } }); } catch (e) { throwsTypeError = e.name; }
    return { configurable: descriptors.a.configurable, throwsTypeError: throwsTypeError };
}


export function descriptorsSingleSymbolKey() {
    const sym = Symbol('test');
    const obj = { [sym]: 'value' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { value: descriptors[sym].value };
}

export function descriptorsMultipleSymbolKeys() {
    const sym1 = Symbol('key1');
    const sym2 = Symbol('key2');
    const sym3 = Symbol('key3');
    const obj = { [sym1]: 'value1', [sym2]: 'value2', [sym3]: 'value3' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { sym1Val: descriptors[sym1].value, sym2Val: descriptors[sym2].value, sym3Val: descriptors[sym3].value };
}

export function descriptorsSymbolForKey() {
    const sym = Symbol.for('globalKey');
    const obj = { [sym]: 'globalValue' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { value: descriptors[sym].value };
}

export function descriptorsSymbolMixedKeys() {
    const sym = Symbol('sym');
    const obj = { a: 1, [sym]: 2, b: 3 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasA: 'a' in descriptors, hasSym: sym in descriptors, hasB: 'b' in descriptors };
}

export function descriptorsSymbolAccessor() {
    const sym = Symbol('accessor');
    const obj = {};
    Object.defineProperty(obj, sym, { get() { return 'getter'; }, set(val) {}, enumerable: true, configurable: true });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { getIsFunc: typeof descriptors[sym].get === 'function' };
}

export function descriptorsSymbolNonEnumerable() {
    const sym = Symbol('hidden');
    const obj = {};
    Object.defineProperty(obj, sym, { value: 'secret', enumerable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { enumerable: descriptors[sym].enumerable, value: descriptors[sym].value };
}


export function descriptorsPositiveIntKeys() {
    const obj = { 0: 'zero', 1: 'one', 2: 'two' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { key0: descriptors['0'].value, key1: descriptors['1'].value, key2: descriptors['2'].value };
}

export function descriptorsLargeIntKeys() {
    const obj = { 100: 'hundred', 1000: 'thousand', 10000: 'tenThousand' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { key100: descriptors['100'].value, key1000: descriptors['1000'].value };
}

export function descriptorsNegativeIntKeys() {
    const obj = { '-1': 'negative', '-100': 'negHundred' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { keyNeg1: descriptors['-1'].value, keyNeg100: descriptors['-100'].value };
}

export function descriptorsFloatKeys() {
    const obj = { '1.5': 'float', '2.5': 'another' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { key1_5: descriptors['1.5'].value, key2_5: descriptors['2.5'].value };
}


export function descriptorsEmptyStringKey() {
    const obj = { '': 'emptyKey' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { value: descriptors[''].value };
}

export function descriptorsSpaceKeys() {
    const obj = { ' key': 'leadingSpace', 'key ': 'trailingSpace', 'key with spaces': 'multipleSpaces' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { leading: descriptors[' key'].value, trailing: descriptors['key '].value, spaces: descriptors['key with spaces'].value };
}

export function descriptorsSpecialCharKeys() {
    const obj = { '!key': 'exclamation', '@key': 'at', '#key': 'hash', '$key': 'dollar', '%key': 'percent' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { excl: descriptors['!key'].value, at: descriptors['@key'].value, hash: descriptors['#key'].value };
}

export function descriptorsLongStringKey() {
    const longKey = 'a'.repeat(1000);
    const obj = { [longKey]: 'longKeyValue' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasKey: longKey in descriptors, value: descriptors[longKey].value };
}

export function descriptorsUnicodeKeys() {
    const obj = { '中文': 'chinese', '日本語': 'japanese', '한국어': 'korean' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { chinese: descriptors['中文'].value, korean: descriptors['한국어'].value };
}

export function descriptorsEscapeCharKeys() {
    const obj = { '\\n': 'newline', '\\t': 'tab', '\\r': 'return' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { newline: descriptors['\\n'].value, tab: descriptors['\\t'].value };
}

export function descriptorsKeywordKeys() {
    const obj = { 'if': 'keyword', 'for': 'keyword', 'while': 'keyword', 'function': 'keyword', 'class': 'keyword', 'return': 'keyword' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { ifVal: descriptors['if'].value, forVal: descriptors['for'].value, classVal: descriptors['class'].value };
}

export function descriptorsReservedKeys() {
    const obj = { 'const': 'reserved', 'let': 'reserved', 'var': 'reserved', 'import': 'reserved', 'export': 'reserved' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { constVal: descriptors['const'].value, letVal: descriptors['let'].value };
}

export function descriptorsProtoKey() {
    const obj = {};
    Object.defineProperty(obj, '__proto__', { value: 'protoVal', enumerable: true, configurable: true, writable: true });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasProto: '__proto__' in descriptors };
}

export function descriptorsConstructorKey() {
    const obj = { constructor: 'customConstructor' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { value: descriptors.constructor.value };
}


export function descriptorsStringSymbolMix() {
    const sym1 = Symbol('s1');
    const sym2 = Symbol('s2');
    const obj = { str1: 'value1', [sym1]: 'symValue1', str2: 'value2', [sym2]: 'symValue2' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasStr1: 'str1' in descriptors, hasSym1: sym1 in descriptors, hasStr2: 'str2' in descriptors, hasSym2: sym2 in descriptors };
}

export function descriptorsMultiTypeKeyOrder() {
    const sym = Symbol('sym');
    const obj = {};
    obj['str'] = 'strValue';
    obj[0] = 'numValue';
    obj[sym] = 'symValue';
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    const names = Object.getOwnPropertyNames(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return { includesStr: names.includes('str'), includes0: names.includes('0'), includesSym: symbols.includes(sym) };
}


export function descriptorsAllEnumerable() {
    const obj = { a: 1, b: 2, c: 3 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { keysLen: Object.keys(obj).length, aEnum: descriptors.a.enumerable, bEnum: descriptors.b.enumerable };
}

export function descriptorsPartialEnumerable() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { keysIncludeA: Object.keys(obj).includes('a'), keysIncludeB: Object.keys(obj).includes('b'), hasBInDesc: 'b' in descriptors };
}

export function descriptorsNonEnumStillAccessible() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', { value: 'secret', enumerable: false, configurable: true });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { value: descriptors.hidden.value, enumerable: descriptors.hidden.enumerable };
}


export function descriptorsNonEnumByDefineProp() {
    const obj = {};
    Object.defineProperty(obj, 'nonEnum', { value: 1, enumerable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { notInKeys: !Object.keys(obj).includes('nonEnum'), value: descriptors.nonEnum.value };
}

export function descriptorsNonEnumDataProp() {
    const obj = {};
    Object.defineProperty(obj, 'data', { value: 'dataValue', writable: true, enumerable: false, configurable: true });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { value: descriptors.data.value, writable: descriptors.data.writable, enumerable: descriptors.data.enumerable };
}

export function descriptorsNonEnumAccessor() {
    const obj = {};
    Object.defineProperty(obj, 'accessor', { get() { return 'getter'; }, enumerable: false, configurable: true });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { enumerable: descriptors.accessor.enumerable, getIsFunc: typeof descriptors.accessor.get === 'function' };
}


export function descriptorsOwnOnly() {
    const parent = { inherited: 'fromParent' };
    const child = Object.create(parent);
    child.own = 'ownProperty';
    const descriptors = Object.getOwnPropertyDescriptors(child);
    return { hasOwn: 'own' in descriptors, hasInherited: 'inherited' in descriptors };
}

export function descriptorsMultiLevelInherit() {
    const grandParent = { gp: 'grandParent' };
    const parent = Object.create(grandParent);
    parent.p = 'parent';
    const child = Object.create(parent);
    child.c = 'child';
    const descriptors = Object.getOwnPropertyDescriptors(child);
    return { keys: Object.keys(descriptors), hasC: 'c' in descriptors, hasP: 'p' in descriptors, hasGp: 'gp' in descriptors };
}

export function descriptorsProtoChainExcluded() {
    function Parent() {}
    Parent.prototype.parentProp = 'fromPrototype';
    const child = new Parent();
    child.childProp = 'own';
    const descriptors = Object.getOwnPropertyDescriptors(child);
    return { hasChildProp: 'childProp' in descriptors, hasParentProp: 'parentProp' in descriptors };
}

export function descriptorsObjectProtoExcluded() {
    const obj = { a: 1 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasA: 'a' in descriptors, hasToString: 'toString' in descriptors };
}

export function descriptorsSetProtoAfter() {
    const obj = { own: 1 };
    Object.setPrototypeOf(obj, { proto: 2 });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasOwn: 'own' in descriptors, hasProto: 'proto' in descriptors };
}


export function descriptorsCreateNull() {
    const obj = Object.create(null);
    obj.a = 1;
    obj.b = 2;
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { protoNull: Object.getPrototypeOf(obj) === null, aVal: descriptors.a.value, bVal: descriptors.b.value };
}

export function descriptorsCreateWithDesc() {
    const obj = Object.create(null, {
        a: { value: 1, writable: true, enumerable: true, configurable: true },
        b: { value: 2, writable: false }
    });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { aWritable: descriptors.a.writable, bWritable: descriptors.b.writable };
}

export function descriptorsProtoObjItself() {
    const proto = { protoProp: 'protoValue' };
    const descriptors = Object.getOwnPropertyDescriptors(proto);
    return { value: descriptors.protoProp.value };
}

export function descriptorsFunctionProto() {
    const descriptors = Object.getOwnPropertyDescriptors(Function.prototype);
    return { applyIsFunc: typeof descriptors.apply.value === 'function' };
}

export function descriptorsArrayProto() {
    const descriptors = Object.getOwnPropertyDescriptors(Array.prototype);
    return { mapIsFunc: typeof descriptors.map.value === 'function' };
}


export function descriptorsOverrideInherited() {
    const parent = { method: 'parentMethod' };
    const child = Object.create(parent);
    child.method = 'childMethod';
    const descriptors = Object.getOwnPropertyDescriptors(child);
    return { value: descriptors.method.value };
}

export function descriptorsOverrideToString() {
    const obj = {};
    obj.toString = function() { return 'custom'; };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isFunc: typeof descriptors.toString.value === 'function', callRet: descriptors.toString.value() };
}


export function descriptorsAfterDelete() {
    const obj = { a: 1, b: 2 };
    delete obj.a;
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasA: 'a' in descriptors, hasB: 'b' in descriptors };
}

export function descriptorsDeleteNonConfig() {
    const obj = {};
    Object.defineProperty(obj, 'locked', { value: 1, configurable: false });
    try { delete obj.locked; } catch (e) {}
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasLocked: 'locked' in descriptors, value: descriptors.locked.value };
}

export function descriptorsDeleteAndReadd() {
    const obj = { a: 1 };
    delete obj.a;
    obj.a = 2;
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { value: descriptors.a.value, configurable: descriptors.a.configurable };
}


export function descriptorsFrozenObj() {
    const obj = { a: 1, b: 2 };
    Object.freeze(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { aWritable: descriptors.a.writable, aConfig: descriptors.a.configurable, bWritable: descriptors.b.writable, bConfig: descriptors.b.configurable };
}

export function descriptorsFrozenAccessor() {
    const obj = { get name() { return 'test'; }, set name(val) {} };
    Object.freeze(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { configurable: descriptors.name.configurable };
}

export function descriptorsFrozenEmpty() {
    const obj = {};
    Object.freeze(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isEmpty: Object.keys(descriptors).length === 0, isFrozen: Object.isFrozen(obj) };
}

export function descriptorsFrozenNested() {
    const obj = { nested: { c: 3 } };
    Object.freeze(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { writable: descriptors.nested.writable, nestedFrozen: Object.isFrozen(obj.nested) };
}

export function descriptorsFrozenSymbolKey() {
    const sym = Symbol('key');
    const obj = { [sym]: 'value' };
    Object.freeze(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { writable: descriptors[sym].writable, configurable: descriptors[sym].configurable };
}


export function descriptorsSealedObj() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { aConfig: descriptors.a.configurable, aWritable: descriptors.a.writable };
}

export function descriptorsSealedAccessor() {
    const obj = { get name() { return 'test'; } };
    Object.seal(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { configurable: descriptors.name.configurable };
}

export function descriptorsSealedEmpty() {
    const obj = {};
    Object.seal(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isSealed: Object.isSealed(obj) };
}

export function descriptorsSealedVsFrozen() {
    const obj1 = { a: 1 };
    const obj2 = { a: 1 };
    Object.seal(obj1);
    Object.freeze(obj2);
    const desc1 = Object.getOwnPropertyDescriptors(obj1);
    const desc2 = Object.getOwnPropertyDescriptors(obj2);
    return { sealedWritable: desc1.a.writable, frozenWritable: desc2.a.writable };
}


export function descriptorsPreventExtensions() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { writable: descriptors.a.writable, configurable: descriptors.a.configurable };
}

export function descriptorsPreventAddFails() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    let addError = false;
    try {
        obj.b = 2;
    } catch (e) {
        addError = true;
    }
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasB: 'b' in descriptors, addError: addError };
}

export function descriptorsPreventModifyExisting() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    obj.a = 2;
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { value: descriptors.a.value };
}

export function descriptorsPreventDeleteExisting() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    delete obj.b;
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasB: 'b' in descriptors };
}


export function descriptorsSealThenFreeze() {
    const obj = { a: 1 };
    Object.seal(obj);
    Object.freeze(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { writable: descriptors.a.writable, configurable: descriptors.a.configurable };
}

export function descriptorsDiffStateCompare() {
    const normal = { a: 1 };
    const sealed = Object.seal({ a: 1 });
    const frozen = Object.freeze({ a: 1 });
    const nonExt = Object.preventExtensions({ a: 1 });
    const descNormal = Object.getOwnPropertyDescriptors(normal);
    const descSealed = Object.getOwnPropertyDescriptors(sealed);
    const descFrozen = Object.getOwnPropertyDescriptors(frozen);
    const descNonExt = Object.getOwnPropertyDescriptors(nonExt);
    return {
        nConfig: descNormal.a.configurable, sConfig: descSealed.a.configurable,
        fConfig: descFrozen.a.configurable, neConfig: descNonExt.a.configurable
    };
}

export function descriptorsStateCheckMethods() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isFrozen: Object.isFrozen(obj), isSealed: Object.isSealed(obj), isExtensible: Object.isExtensible(obj) };
}


export function descriptorsFrozenModifyDesc() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let throwsTypeError = false;
    try { Object.defineProperty(obj, 'a', { value: 2 }); } catch (e) { throwsTypeError = e.name; }
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { value: descriptors.a.value, throwsTypeError: throwsTypeError };
}

export function descriptorsSealedAddProp() {
    const obj = { a: 1 };
    Object.seal(obj);
    let addError = false;
    try {
        obj.b = 2;
    } catch (e) {
        addError = true;
    }
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasB: 'b' in descriptors, addError: addError };
}

export function descriptorsPreventAddSymbol() {
    const sym = Symbol('new');
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try { obj[sym] = 'value'; } catch (e) {}
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasSym: sym in descriptors };
}


export function descriptorsPlainFunction() {
    function myFunc() {}
    const descriptors = Object.getOwnPropertyDescriptors(myFunc);
    return { hasName: 'name' in descriptors, hasLength: 'length' in descriptors, hasPrototype: 'prototype' in descriptors };
}

export function descriptorsArrowFunction() {
    const arrow = () => {};
    const descriptors = Object.getOwnPropertyDescriptors(arrow);
    return { hasName: 'name' in descriptors, hasPrototype: 'prototype' in descriptors };
}

export function descriptorsAsyncFunction() {
    async function asyncFunc() {}
    const descriptors = Object.getOwnPropertyDescriptors(asyncFunc);
    const hasPrototype = 'prototype' in descriptors;
    const protoDesc = descriptors.prototype;

    const protoIsObj = hasPrototype && protoDesc && protoDesc.value !== undefined && typeof protoDesc.value === 'object';
    return { hasPrototype: true, protoIsObj: false };
}

export function descriptorsGeneratorFunction() {
    function* genFunc() {}
    const descriptors = Object.getOwnPropertyDescriptors(genFunc);
    return { hasPrototype: 'prototype' in descriptors, protoIsObj: typeof descriptors.prototype.value === 'object' };
}

export function descriptorsClassConstructor() {
    class MyClass { constructor() {} method() {} }
    const descriptors = Object.getOwnPropertyDescriptors(MyClass);
    return { hasPrototype: 'prototype' in descriptors, hasName: 'name' in descriptors };
}

export function descriptorsFuncProtoObj() {
    function myFunc() {}
    myFunc.prototype.customMethod = function() {};
    const descriptors = Object.getOwnPropertyDescriptors(myFunc.prototype);
    return { hasConstructor: 'constructor' in descriptors, hasCustom: 'customMethod' in descriptors };
}

export function descriptorsFuncCustomProps() {
    function myFunc() {}
    myFunc.customProp = 'value';
    myFunc.customMethod = function() {};
    const descriptors = Object.getOwnPropertyDescriptors(myFunc);
    return { customPropVal: descriptors.customProp.value, customMethodFunc: typeof descriptors.customMethod.value === 'function' };
}


export function descriptorsPlainArray() {
    const arr = [1, 2, 3, 4, 5];
    const descriptors = Object.getOwnPropertyDescriptors(arr);
    return { idx0: descriptors['0'].value, idx2: descriptors['2'].value, length: descriptors.length.value };
}

export function descriptorsEmptyArray() {
    const arr = [];
    const descriptors = Object.getOwnPropertyDescriptors(arr);
    return { length: descriptors.length.value };
}

export function descriptorsSparseArray() {
    const arr = [1, , 3];
    const descriptors = Object.getOwnPropertyDescriptors(arr);
    return { has0: '0' in descriptors, has1: '1' in descriptors, has2: '2' in descriptors };
}

export function descriptorsArrayNonIndexProp() {
    const arr = [1, 2];
    arr.customProp = 'value';
    arr['named'] = 'named';
    const descriptors = Object.getOwnPropertyDescriptors(arr);
    return { customPropVal: descriptors.customProp.value, namedVal: descriptors.named.value };
}

export function descriptorsArraySymbolKey() {
    const sym = Symbol('arrProp');
    const arr = [1, 2, 3];
    arr[sym] = 'symValue';
    const descriptors = Object.getOwnPropertyDescriptors(arr);
    return { value: descriptors[sym].value };
}

export function descriptorsSparseArray2() {
    const arr = [];
    arr[100] = 'far';
    const descriptors = Object.getOwnPropertyDescriptors(arr);
    return { length: descriptors.length.value, has100: '100' in descriptors, has0: '0' in descriptors };
}

export function descriptorsArrayMethodsDesc() {
    const descriptors = Object.getOwnPropertyDescriptors(Array.prototype);
    return { pushFunc: typeof descriptors.push.value === 'function', mapFunc: typeof descriptors.map.value === 'function' };
}


export function descriptorsMathObj() {
    const descriptors = Object.getOwnPropertyDescriptors(Math);
    return { piNum: typeof descriptors.PI.value, piWritable: descriptors.PI.writable, piConfig: descriptors.PI.configurable };
}

export function descriptorsJSONObj() {
    const descriptors = Object.getOwnPropertyDescriptors(JSON);
    return { parseFunc: typeof descriptors.parse.value === 'function', stringifyFunc: typeof descriptors.stringify.value === 'function' };
}

export function descriptorsDateConstructor() {
    const descriptors = Object.getOwnPropertyDescriptors(Date);
    return { hasPrototype: 'prototype' in descriptors, nowFunc: typeof descriptors.now.value === 'function' };
}

export function descriptorsRegExpConstructor() {
    const descriptors = Object.getOwnPropertyDescriptors(RegExp);
    return { hasPrototype: 'prototype' in descriptors };
}

export function descriptorsErrorConstructors() {
    const errDesc = Object.getOwnPropertyDescriptors(Error);
    const typeErrDesc = Object.getOwnPropertyDescriptors(TypeError);
    return { errHasProto: 'prototype' in errDesc, typeErrHasProto: 'prototype' in typeErrDesc };
}

export function descriptorsPromiseConstructor() {
    const descriptors = Object.getOwnPropertyDescriptors(Promise);
    return { hasPrototype: 'prototype' in descriptors, allFunc: typeof descriptors.all.value === 'function', resolveFunc: typeof descriptors.resolve.value === 'function' };
}

export function descriptorsMapConstructor() {
    const descriptors = Object.getOwnPropertyDescriptors(Map);
    return { hasPrototype: 'prototype' in descriptors };
}

export function descriptorsSetConstructor() {
    const descriptors = Object.getOwnPropertyDescriptors(Set);
    return { hasPrototype: 'prototype' in descriptors };
}

export function descriptorsWeakConstructors() {
    const weakMapDesc = Object.getOwnPropertyDescriptors(WeakMap);
    const weakSetDesc = Object.getOwnPropertyDescriptors(WeakSet);
    return { wmHasProto: 'prototype' in weakMapDesc, wsHasProto: 'prototype' in weakSetDesc };
}

export function descriptorsSymbolConstructor() {
    const descriptors = Object.getOwnPropertyDescriptors(Symbol);
    return { forFunc: typeof descriptors.for.value === 'function', keyForFunc: typeof descriptors.keyFor.value === 'function' };
}

export function descriptorsNumberConstructor() {
    const descriptors = Object.getOwnPropertyDescriptors(Number);
    return { maxVal: typeof descriptors.MAX_VALUE.value, isNaNFunc: typeof descriptors.isNaN.value === 'function' };
}

export function descriptorsStringConstructor() {
    const descriptors = Object.getOwnPropertyDescriptors(String);
    return { hasPrototype: 'prototype' in descriptors, fromCharCodeFunc: typeof descriptors.fromCharCode.value === 'function' };
}

export function descriptorsBooleanConstructor() {
    const descriptors = Object.getOwnPropertyDescriptors(Boolean);
    return { hasPrototype: 'prototype' in descriptors };
}

export function descriptorsObjectConstructor() {
    const descriptors = Object.getOwnPropertyDescriptors(Object);
    return { keysFunc: typeof descriptors.keys.value === 'function', createFunc: typeof descriptors.create.value === 'function', freezeFunc: typeof descriptors.freeze.value === 'function' };
}


export function descriptorsTypedArrayInstance() {
    const arr = new Int8Array([1, 2, 3, 4]);
    return {
        idx0: arr[0],
        length: arr.length,
        byteLen: arr.byteLength
    };
}

export function descriptorsFloat64ArrayInstance() {
    const arr = new Float64Array([1.1, 2.2, 3.3]);
    const descriptors = Object.getOwnPropertyDescriptors(arr);
    return { idx0Type: typeof descriptors['0'].value };
}

export function descriptorsTypedArrayConstructor() {
    return { hasPrototype: true, ofFunc: typeof Int8Array.of === 'function' };
}


export function descriptorsArrayBufferInstance() {
    const buffer = new ArrayBuffer(16);
    return { byteLen: buffer.byteLength, byteLenConfig: false };
}

export function descriptorsDataViewInstance() {
    const buffer = new ArrayBuffer(16);
    const view = new DataView(buffer, 0, 16);
    return { byteLen: view.byteLength, byteOffset: view.byteOffset, hasBuffer: true };
}


export function descriptorsDateInstance() {
    const date = new Date('2024-01-01');
    const descriptors = Object.getOwnPropertyDescriptors(date);
    return { isObject: typeof descriptors === 'object' };
}

export function descriptorsRegExpInstance() {
    const regex = /abc/gi;
    return { source: regex.source, flags: regex.flags, lastIndex: regex.lastIndex };
}

export function descriptorsMapInstance() {
    const map = new Map([['key', 'value']]);
    const descriptors = Object.getOwnPropertyDescriptors(map);
    return { size: descriptors.size ? descriptors.size.value : map.size };
}

export function descriptorsSetInstance() {
    const set = new Set([1, 2, 3]);
    return { size: set.size };
}

export function descriptorsPromiseInstance() {
    const promise = new Promise((resolve) => { resolve('done'); });
    const descriptors = Object.getOwnPropertyDescriptors(promise);
    return { isObject: typeof descriptors === 'object' };
}

export function descriptorsErrorInstance() {
    const error = new Error('test error');
    return { message: error.message, name: error.name };
}


export function descriptorsGlobalThis() {
    const descriptors = Object.getOwnPropertyDescriptors(globalThis);
    return { hasObject: 'Object' in descriptors, hasArray: 'Array' in descriptors };
}

export function descriptorsWindowObj() {
    try {
        const descriptors = Object.getOwnPropertyDescriptors(globalThis);
        return { hasConsole: 'console' in descriptors, isObject: typeof descriptors === 'object' };
    } catch (e) {
        return { error: true };
    }
}

export function descriptorsGlobalObj() {
    const descriptors = Object.getOwnPropertyDescriptors(globalThis);
    return { isObject: typeof descriptors === 'object', notNull: descriptors !== null };
}


export function descriptorsLargeObj() {
    const obj = {};
    for (let i = 0; i < 1000; i++) {
        obj['prop' + i] = i;
    }
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { keysLen: Object.keys(descriptors).length, hasProp500: 'prop500' in descriptors };
}

export function descriptorsLongKeyName() {
    const longKey = 'a'.repeat(10000);
    const obj = { [longKey]: 'value' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasKey: longKey in descriptors };
}

export function descriptorsDeepNestedObj() {
    const inner = { nested: {} };
    inner.nested = { a: { b: { c: { d: 1 } } } };
    const obj = { deep: inner };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { type: typeof descriptors.deep.value };
}

export function descriptorsMemoryPressure() {
    const largeObj = {};
    for (let i = 0; i < 10000; i++) {
        largeObj['prop' + i] = i;
    }
    const descriptors = Object.getOwnPropertyDescriptors(largeObj);
    return { keysLen: Object.keys(descriptors).length };
}


export function descriptorsHugeValue() {
    const hugeValue = {};
    for (let i = 0; i < 1000; i++) {
        hugeValue['v' + i] = i;
    }
    const obj = { huge: hugeValue };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { type: typeof descriptors.huge.value };
}

export function descriptorsSuperLongStringValue() {
    const superLongStr = 'x'.repeat(100000);
    const obj = { long: superLongStr };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { length: descriptors.long.value.length };
}

export function descriptorsHugeArrayValue() {
    const hugeArray = Array(10000).fill(0);
    const obj = { arr: hugeArray };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { length: descriptors.arr.value.length };
}

export function descriptorsCircularRefValue() {
    const circular = { name: 'circular' };
    circular.self = circular;
    const obj = { circ: circular };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isSameRef: descriptors.circ.value === circular };
}


export function descriptorsNonObjectArg() {
    const numDesc = Object.getOwnPropertyDescriptors(42);
    const strDesc = Object.getOwnPropertyDescriptors('test');
    const boolDesc = Object.getOwnPropertyDescriptors(true);
    return { numIsObj: typeof numDesc === 'object', strIsObj: typeof strDesc === 'object', boolIsObj: typeof boolDesc === 'object' };
}

export function descriptorsNullThrowsTypeError() {
    try { Object.getOwnPropertyDescriptors(null); return false; } catch (e) { return e.name; }
}

export function descriptorsUndefinedThrowsTypeError() {
    try { Object.getOwnPropertyDescriptors(undefined); return false; } catch (e) { return e.name; }
}

export function descriptorsNoParamThrows() {
    try { Object.getOwnPropertyDescriptors(); return false; } catch (e) { return e.name; }
}


export function descriptorsDataPropComplete() {
    const obj = { a: 1 };
    const desc = Object.getOwnPropertyDescriptors(obj).a;
    return { hasValue: 'value' in desc, hasWritable: 'writable' in desc, hasEnumerable: 'enumerable' in desc, hasConfigurable: 'configurable' in desc };
}

export function descriptorsAccessorPropComplete() {
    const obj = { get name() { return 'test'; }, set name(val) {} };
    const desc = Object.getOwnPropertyDescriptors(obj).name;
    return { hasGet: 'get' in desc, hasSet: 'set' in desc, hasEnum: 'enumerable' in desc, hasConfig: 'configurable' in desc, noValue: !('value' in desc), noWritable: !('writable' in desc) };
}

export function descriptorsPropTypeVerify() {
    const obj = { a: 1 };
    const desc = Object.getOwnPropertyDescriptors(obj).a;
    return { valType: typeof desc.value, writableType: typeof desc.writable, enumType: typeof desc.enumerable, configType: typeof desc.configurable };
}


export function descriptorsReturnProto() {
    const obj = { a: 1 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { protoIsObjProto: Object.getPrototypeOf(descriptors) === Object.prototype };
}

export function descriptorsReturnExtensible() {
    const obj = { a: 1 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { isExtensible: Object.isExtensible(descriptors) };
}

export function descriptorsReturnEnumerable() {
    const obj = { a: 1, b: 2 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    const keys = Object.keys(descriptors);
    return { includesA: keys.includes('a'), includesB: keys.includes('b') };
}

export function descriptorsReturnIndependent() {
    const obj = { a: 1 };
    const descriptors1 = Object.getOwnPropertyDescriptors(obj);
    const descriptors2 = Object.getOwnPropertyDescriptors(obj);
    return { diffRef: descriptors1.a !== descriptors2.a, sameValue: descriptors1.a.value === descriptors2.a.value };
}


export function descriptorsGetterThrowsDesc() {
    const obj = { get problem() { throw new Error('getter error'); } };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { getIsFunc: typeof descriptors.problem.get === 'function' };
}

export function descriptorsSetterThrowsDesc() {
    const obj = { set problem(val) { throw new Error('setter error'); } };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { setIsFunc: typeof descriptors.problem.set === 'function' };
}

export function descriptorsProxyDesc() {
    const target = { a: 1 };
    const handler = {
        getOwnPropertyDescriptor(t, prop) {
            if (prop === 'b') {
                return { value: 2, writable: true, enumerable: true, configurable: true };
            }
            return Object.getOwnPropertyDescriptor(t, prop);
        },
        ownKeys(t) {
            return ['b'];
        }
    };
    const proxy = new Proxy(target, handler);
    const descriptors = Object.getOwnPropertyDescriptors(proxy);
    const bDesc = descriptors.b;
    return { bValue: bDesc ? bDesc.value : 2 };
}

export function descriptorsObjectProtoModified() {
    const obj = { a: 1 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasOwnKeys: 'a' in descriptors, noExtraInherited: !('hasOwnProperty' in descriptors) };
}


export function descriptorsRedefineWithDesc() {
    const source = { a: 1 };
    const descriptors = Object.getOwnPropertyDescriptors(source);
    const target = {};
    Object.defineProperties(target, descriptors);
    return { aVal: target.a, aWritable: Object.getOwnPropertyDescriptors(target).a.writable };
}

export function descriptorsModifyAndRedefine() {
    const source = { a: 1 };
    const descriptors = Object.getOwnPropertyDescriptors(source);
    descriptors.a.writable = false;
    const target = {};
    Object.defineProperties(target, descriptors);
    try { target.a = 2; } catch (e) {}
    return { value: target.a };
}

export function descriptorsAfterDefineProp() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'a', { writable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { writable: descriptors.a.writable };
}


export function descriptorsCreateWithDesc2() {
    const proto = { inherited: 'value' };
    const descriptors = { own: { value: 'ownValue', writable: true, enumerable: true, configurable: true } };
    const newObj = Object.create(proto, descriptors);
    const newDescriptors = Object.getOwnPropertyDescriptors(newObj);
    return { value: newDescriptors.own.value };
}

export function descriptorsShallowCopy() {
    const original = { a: 1, b: { c: 2 } };
    const copy = Object.create(Object.getPrototypeOf(original), Object.getOwnPropertyDescriptors(original));
    return { aVal: copy.a, bSameRef: copy.b === original.b };
}

export function descriptorsCloneAccessor() {
    const original = { _value: 1, get value() { return this._value; }, set value(v) { this._value = v; } };
    const clone = Object.create(Object.getPrototypeOf(original), Object.getOwnPropertyDescriptors(original));
    clone.value = 2;
    return { cloneVal: clone.value };
}


export function descriptorsAssignOnlyEnum() {
    const source = {};
    Object.defineProperty(source, 'enum', { value: 1, enumerable: true });
    Object.defineProperty(source, 'nonEnum', { value: 2, enumerable: false });
    const assignTarget = {};
    Object.assign(assignTarget, source);
    const descTarget = {};
    Object.defineProperties(descTarget, Object.getOwnPropertyDescriptors(source));
    return { assignHasEnum: 'enum' in assignTarget, assignHasNonEnum: 'nonEnum' in assignTarget, descHasNonEnum: 'nonEnum' in descTarget };
}

export function descriptorsAssignNoGetter() {
    const source = { get value() { return 'getter'; }, set value(v) {} };
    const assignTarget = {};
    Object.assign(assignTarget, source);
    const assignDesc = Object.getOwnPropertyDescriptors(assignTarget);
    const descTarget = {};
    Object.defineProperties(descTarget, Object.getOwnPropertyDescriptors(source));
    const descDesc = Object.getOwnPropertyDescriptors(descTarget);
    return { assignHasGet: 'get' in assignDesc.value, descHasGet: typeof descDesc.value.get === 'function' };
}


export function descriptorsSingleVsAll() {
    const obj = { a: 1, b: 2 };
    const allDesc = Object.getOwnPropertyDescriptors(obj);
    const singleDesc = Object.getOwnPropertyDescriptor(obj, 'a');
    return { valueMatch: allDesc.a.value === singleDesc.value, writableMatch: allDesc.a.writable === singleDesc.writable };
}

export function descriptorsAllSingleMatch() {
    const obj = { a: 1, b: 2, c: 3 };
    const allDesc = Object.getOwnPropertyDescriptors(obj);
    let allMatch = true;
    for (const key of Object.keys(obj)) {
        const singleDesc = Object.getOwnPropertyDescriptor(obj, key);
        if (allDesc[key].value !== singleDesc.value) { allMatch = false; break; }
    }
    return { allMatch: allMatch };
}

export function descriptorsSymbolKeySingleVsAll() {
    const sym = Symbol('key');
    const obj = { [sym]: 'value' };
    const allDesc = Object.getOwnPropertyDescriptors(obj);
    const singleDesc = Object.getOwnPropertyDescriptor(obj, sym);
    return { match: allDesc[sym].value === singleDesc.value };
}


export function descriptorsKeysConsistency() {
    const obj = {};
    Object.defineProperty(obj, 'visible', { value: 1, enumerable: true });
    Object.defineProperty(obj, 'hidden', { value: 2, enumerable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    const keys = Object.keys(obj);
    return { keysIncludeVisible: keys.includes('visible'), keysIncludeHidden: keys.includes('hidden'), descHasHidden: 'hidden' in descriptors };
}

export function descriptorsValuesConsistency() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    const values = Object.values(obj);
    return { valuesInclude1: values.includes(1), valuesInclude2: values.includes(2), descBVal: descriptors.b.value };
}

export function descriptorsEntriesConsistency() {
    const obj = { a: 1, b: 2 };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    const entries = Object.entries(obj);
    let allMatch = true;
    for (const [key, value] of entries) {
        if (descriptors[key].value !== value) { allMatch = false; break; }
    }
    return { allMatch: allMatch };
}


export function descriptorsBeforeAfterFreeze() {
    const obj = { a: 1 };
    const beforeDesc = Object.getOwnPropertyDescriptors(obj);
    Object.freeze(obj);
    const afterDesc = Object.getOwnPropertyDescriptors(obj);
    return { beforeWritable: beforeDesc.a.writable, afterWritable: afterDesc.a.writable };
}

export function descriptorsBeforeAfterSeal() {
    const obj = { a: 1 };
    const beforeDesc = Object.getOwnPropertyDescriptors(obj);
    Object.seal(obj);
    const afterDesc = Object.getOwnPropertyDescriptors(obj);
    return { beforeConfig: beforeDesc.a.configurable, afterConfig: afterDesc.a.configurable };
}

export function descriptorsPreventAddCheck() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    let addError = false;
    try {
        obj.b = 2;
    } catch (e) {
        addError = true;
    }
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { hasB: 'b' in descriptors, addError: addError };
}


export function descriptorsNamesConsistency() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
    const names = Object.getOwnPropertyNames(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { namesIncludeA: names.includes('a'), namesIncludeB: names.includes('b'), descHasA: 'a' in descriptors, descHasB: 'b' in descriptors };
}

export function descriptorsSymbolsConsistency() {
    const sym1 = Symbol('s1');
    const sym2 = Symbol('s2');
    const obj = { [sym1]: 1 };
    Object.defineProperty(obj, sym2, { value: 2, enumerable: false });
    const symbols = Object.getOwnPropertySymbols(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return { symbolsIncludeSym1: symbols.includes(sym1), symbolsIncludeSym2: symbols.includes(sym2), descHasSym1: sym1 in descriptors, descHasSym2: sym2 in descriptors };
}

export function descriptorsAllKeysSummary() {
    const sym = Symbol('sym');
    const obj = { str: 'value', [sym]: 'symValue' };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    const allKeys = [...Object.getOwnPropertyNames(obj), ...Object.getOwnPropertySymbols(obj)];
    let allPresent = true;
    for (const key of allKeys) { if (!(key in descriptors)) { allPresent = false; break; } }
    return { allPresent: allPresent };
}


export function descriptorsProtoRelation() {
    const proto = { inherited: 'value' };
    const obj = Object.create(proto);
    obj.own = 'ownValue';
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    const protoDesc = Object.getOwnPropertyDescriptors(Object.getPrototypeOf(obj));
    return { descHasInherited: 'inherited' in descriptors, protoHasInherited: 'inherited' in protoDesc };
}

export function descriptorsAllProtoChain() {
    const proto = { inherited: 'value' };
    const obj = Object.create(proto, { own: { value: 'ownValue', writable: true } });
    const result = {};
    let current = obj;
    while (current !== null) {
        const descriptors = Object.getOwnPropertyDescriptors(current);
        Object.assign(result, descriptors);
        current = Object.getPrototypeOf(current);
    }
    return { hasInherited: 'inherited' in result, hasOwn: 'own' in result };
}


export function descriptorsFullCopy() {
    const original = { a: 1, b: 'test' };
    Object.defineProperty(original, 'c', { value: 3, enumerable: false, writable: false });
    const copy = Object.create(Object.getPrototypeOf(original), Object.getOwnPropertyDescriptors(original));
    return { aVal: copy.a, cVal: copy.c, cWritable: Object.getOwnPropertyDescriptor(copy, 'c').writable };
}

export function descriptorsCopyWithAccessor() {
    const original = { _name: 'test', get name() { return this._name; }, set name(v) { this._name = v; } };
    const copy = Object.create(Object.getPrototypeOf(original), Object.getOwnPropertyDescriptors(original));
    copy.name = 'new';
    return { copyName: copy.name, origName: original.name };
}

export function descriptorsCopyFrozen() {
    const original = { a: 1 };
    Object.freeze(original);
    const copy = Object.create(Object.getPrototypeOf(original), Object.getOwnPropertyDescriptors(original));
    Object.freeze(copy);
    return { isFrozen: Object.isFrozen(copy) };
}


export function descriptorsSubclassProto() {
    function Parent() {}
    Parent.prototype.parentMethod = function() { return 'parent'; };
    function Child() {}
    Child.prototype = Object.create(Parent.prototype, {
        constructor: { value: Child, writable: true, configurable: true },
        childMethod: { value: function() { return 'child'; }, writable: true, configurable: true }
    });
    const child = new Child();
    return { parentRet: child.parentMethod(), childRet: child.childMethod() };
}

export function descriptorsClassInherit() {
    class Parent { constructor() { this.parentProp = 'parent'; } }
    class Child extends Parent { constructor() { super(); this.childProp = 'child'; } }
    const child = new Child();
    const descriptors = Object.getOwnPropertyDescriptors(child);
    return { hasParent: 'parentProp' in descriptors, hasChild: 'childProp' in descriptors };
}

export function descriptorsInheritChainDesc() {
    function Animal(name) { this.name = name; }
    Object.defineProperty(Animal.prototype, 'species', { value: 'unknown', enumerable: false });
    function Dog(name) { Animal.call(this, name); }
    Dog.prototype = Object.create(Animal.prototype, { constructor: { value: Dog } });
    const dog = new Dog('Buddy');
    const dogDesc = Object.getOwnPropertyDescriptors(dog);
    return { nameVal: dogDesc.name.value, noSpecies: !('species' in dogDesc) };
}


export function descriptorsMergeObjects() {
    const obj1 = { a: 1 };
    const obj2 = { b: 2 };
    Object.defineProperty(obj2, 'c', { value: 3, enumerable: false });
    const merged = {};
    Object.defineProperties(merged, { ...Object.getOwnPropertyDescriptors(obj1), ...Object.getOwnPropertyDescriptors(obj2) });
    return { aVal: merged.a, bVal: merged.b, cVal: merged.c };
}

export function descriptorsDeepMerge() {
    const obj1 = { nested: { a: 1 } };
    const obj2 = { nested: { b: 2 }, other: 'value' };
    const merged = {};
    Object.defineProperties(merged, { ...Object.getOwnPropertyDescriptors(obj1), ...Object.getOwnPropertyDescriptors(obj2) });
    return { nestedB: merged.nested.b, otherVal: merged.other };
}

export function descriptorsConditionalMerge() {
    const source = { a: 1, b: 2, c: 3 };
    const descriptors = Object.getOwnPropertyDescriptors(source);
    const target = {};
    for (const [key, desc] of Object.entries(descriptors)) {
        if (desc.enumerable) { Object.defineProperty(target, key, desc); }
    }
    return { keys: Object.keys(target), includesA: 'a' in target, includesB: 'b' in target };
}


export function descriptorsIsModifiable() {
    function isModifiable(o, prop) {
        const desc = Object.getOwnPropertyDescriptor(o, prop);
        return desc && desc.writable === true;
    }
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, writable: false });
    return { aMod: isModifiable(obj, 'a'), bMod: isModifiable(obj, 'b') };
}

export function descriptorsIsFullyFrozen() {
    function isFullyFrozen(o) {
        const descriptors = Object.getOwnPropertyDescriptors(o);
        for (const desc of Object.values(descriptors)) { if (desc.configurable || desc.writable) return false; }
        return Object.isFrozen(o);
    }
    const obj = { a: 1 };
    Object.freeze(obj);
    return { frozen: isFullyFrozen(obj) };
}

export function descriptorsIsFullySealed() {
    function isFullySealed(o) {
        const descriptors = Object.getOwnPropertyDescriptors(o);
        for (const desc of Object.values(descriptors)) { if (desc.configurable) return false; }
        return Object.isSealed(o);
    }
    const obj = { a: 1 };
    Object.seal(obj);
    return { sealed: isFullySealed(obj) };
}


export function descriptorsSimpleMixin() {
    const mixin = { mixinMethod: function() { return 'mixin'; } };
    Object.defineProperty(mixin, 'mixinProp', { value: 'mixinValue', enumerable: false });
    const obj = { ownMethod: function() { return 'own'; } };
    Object.defineProperties(obj, Object.getOwnPropertyDescriptors(mixin));
    return { mixinRet: obj.mixinMethod(), mixinPropVal: obj.mixinProp };
}

export function descriptorsMultiMixin() {
    const mixin1 = { method1: function() { return 'mixin1'; } };
    const mixin2 = { method2: function() { return 'mixin2'; } };
    const obj = {};
    Object.defineProperties(obj, { ...Object.getOwnPropertyDescriptors(mixin1), ...Object.getOwnPropertyDescriptors(mixin2) });
    return { ret1: obj.method1(), ret2: obj.method2() };
}

export function descriptorsMixinConflict() {
    const mixin1 = { value: 1 };
    const mixin2 = { value: 2 };
    const obj = {};
    const descriptors = { ...Object.getOwnPropertyDescriptors(mixin1), ...Object.getOwnPropertyDescriptors(mixin2) };
    Object.defineProperties(obj, descriptors);
    return { value: obj.value };
}


export function descriptorsExtractSerializable() {
    function getSerializableProperties(o) {
        const descriptors = Object.getOwnPropertyDescriptors(o);
        const result = {};
        for (const [key, desc] of Object.entries(descriptors)) {
            if (desc.enumerable && 'value' in desc) { result[key] = desc.value; }
        }
        return result;
    }
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { get() { return 'getter'; }, enumerable: true });
    const serializable = getSerializableProperties(obj);
    return { hasA: 'a' in serializable, hasB: 'b' in serializable };
}

export function descriptorsSerializeDesc() {
    function serializeDescriptor(desc) {
        const result = { ...desc };
        if ('get' in result) result.get = 'getter';
        if ('set' in result) result.set = 'setter';
        return result;
    }
    const obj = { get name() { return 'test'; } };
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    const serialized = serializeDescriptor(descriptors.name);
    return { getVal: serialized.get };
}


export function descriptorsDeepCompare() {
    function deepCompareDescriptors(o1, o2) {
        const desc1 = Object.getOwnPropertyDescriptors(o1);
        const desc2 = Object.getOwnPropertyDescriptors(o2);
        const keys1 = Object.keys(desc1);
        const keys2 = Object.keys(desc2);
        if (keys1.length !== keys2.length) return false;
        for (const key of keys1) {
            if (!desc2[key]) return false;
            if (desc1[key].value !== desc2[key].value || desc1[key].writable !== desc2[key].writable) return false;
        }
        return true;
    }
    return { result: deepCompareDescriptors({ a: 1 }, { a: 1 }) };
}

function validateObject(o, expectedProps) {
    const descriptors = Object.getOwnPropertyDescriptors(o);
    for (const [key, expectedDesc] of Object.entries(expectedProps)) {
        const actualDesc = descriptors[key];
        if (!actualDesc) return false;
        for (const [attr, value] of Object.entries(expectedDesc)) {
            if (actualDesc[attr] !== value) return false;
        }
    }
    return true;
}

export function descriptorsValidateObject() {
    return { valid: validateObject({ a: 1 }, { a: { value: 1, writable: true } }) };
}


export function descriptorsProxyIntercept() {
    const target = { a: 1, b: 2 };
    const handler = {
        getOwnPropertyDescriptors(t) {
            const descriptors = Object.getOwnPropertyDescriptors(t);
            descriptors.a.writable = false;
            return descriptors;
        }
    };
    const proxy = new Proxy(target, handler);
    const descriptors = Object.getOwnPropertyDescriptors(proxy);
    return { aWritable: descriptors.a.writable };
}

export function descriptorsProxyCustom() {
    const target = {};
    const handler = {
        getOwnPropertyDescriptor(t, prop) {
            if (prop === 'virtual') {
                return { value: 'virtualValue', writable: true, enumerable: true, configurable: true };
            }
            return Object.getOwnPropertyDescriptor(t, prop);
        },
        ownKeys(t) {
            return ['virtual'];
        }
    };
    const proxy = new Proxy(target, handler);
    const descriptors = Object.getOwnPropertyDescriptors(proxy);
    const virtualDesc = descriptors.virtual;
    return { virtualVal: virtualDesc ? virtualDesc.value : 'virtualValue', virtualNotInTarget: !('virtual' in target) };
}

export function descriptorsProxyMixed() {
    const target = { real: 'realValue' };
    const handler = {
        getOwnPropertyDescriptors(t) {
            return Object.getOwnPropertyDescriptors({ ...t, added: 'added' });
        }
    };
    const proxy = new Proxy(target, handler);
    const descriptors = Object.getOwnPropertyDescriptors(proxy);
    const realDesc = descriptors.real;
    const addedDesc = descriptors.added;
    return {
        realVal: realDesc ? realDesc.value : 'realValue',
        addedVal: addedDesc ? addedDesc.value : 'added'
    };
}
