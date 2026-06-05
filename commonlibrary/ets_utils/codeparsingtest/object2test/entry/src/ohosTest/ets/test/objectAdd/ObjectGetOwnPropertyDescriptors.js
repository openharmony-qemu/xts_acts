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
