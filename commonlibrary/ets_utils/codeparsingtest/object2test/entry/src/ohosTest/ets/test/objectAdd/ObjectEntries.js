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


export function defBasicKeyValue() {
  const obj = { foo: "bar", baz: 42 };
  return Object.entries(obj);
}

export function defArrayLikeObj() {
  const obj = { 0: "a", 1: "b", 2: "c" };
  return Object.entries(obj);
}

export function defNumericKeySort() {
  const anObj = { 100: "a", 2: "b", 7: "c" };
  return Object.entries(anObj);
}


export function defIsArrayResult() {
  const obj = { a: 1, b: 2 };
  return Array.isArray(Object.entries(obj));
}

export function defEachEntryIsArray() {
  const obj = { a: 1, b: 2 };
  const entries = Object.entries(obj);
  return entries.every(entry => Array.isArray(entry));
}

export function defEntryLengthIs2() {
  const obj = { a: 1, b: 2 };
  const entries = Object.entries(obj);
  return entries.every(entry => entry.length === 2);
}

export function defKeyIsString() {
  const obj = { 1: "num", a: "str" };
  const entries = Object.entries(obj);
  return entries.every(entry => typeof entry[0] === 'string');
}


export function defUndefinedParam() {
  try {
    Object.entries(undefined);
    return false;
  } catch (e) {
    return e.name;
  }
}

export function defNullParam() {
  try {
    Object.entries(null);
    return false;
  } catch (e) {
    return e.name;
  }
}

export function defStringParam() {
  return Object.entries("foo");
}

export function defEmptyStringParam() {
  return Object.entries("");
}

export function defNumberParam() {
  return Object.entries(100);
}

export function defBooleanParam() {
  return {
    trueResult: Object.entries(true),
    falseResult: Object.entries(false)
  };
}

export function defSymbolParam() {
  return Object.entries(Symbol('test'));
}

export function defBigIntParam() {
  return Object.entries(BigInt(123));
}

export function defZeroParam() {
  return Object.entries(0);
}

export function defNaNParam() {
  return Object.entries(NaN);
}

export function defInfinityParam() {
  return {
    inf: Object.entries(Infinity),
    negInf: Object.entries(-Infinity)
  };
}

export function defMaxValueParam() {
  return Object.entries(Number.MAX_VALUE);
}

export function defMinValueParam() {
  return Object.entries(Number.MIN_VALUE);
}


export function defNonEnumerableProp() {
  const obj = {};
  Object.defineProperty(obj, 'a', { value: 1, enumerable: false });
  obj.b = 2;
  return Object.entries(obj);
}

export function defMixedEnumerableProp() {
  const obj = { a: 1 };
  Object.defineProperty(obj, 'hidden', { value: 'secret', enumerable: false });
  obj.c = 3;
  return Object.entries(obj);
}

export function defPropertyIsEnumerableCheck() {
  const obj = { a: 1 };
  Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
  const entries = Object.entries(obj);
  return entries.every(([key]) => obj.propertyIsEnumerable(key));
}

export function defInheritedProp() {
  const proto = { inherited: 'value' };
  const obj = Object.create(proto);
  obj.own = 'property';
  return Object.entries(obj);
}

export function defObjectCreateObj() {
  const myObj = Object.create(
    {},
    {
      getFoo: {
        value() { return this.foo; }
      }
    }
  );
  myObj.foo = "bar";
  return Object.entries(myObj);
}

export function defConstructorProp() {
  function Foo() {}
  Foo.prototype.bar = 'bar';
  const obj = new Foo();
  obj.own = 'own';
  return Object.entries(obj);
}

export function defOnlySymbolKey() {
  const sym = Symbol('key');
  const obj = { [sym]: 'value' };
  return Object.entries(obj);
}

export function defMixedSymbolKey() {
  const obj = { a: 1, [Symbol('s')]: 2, b: 3 };
  return Object.entries(obj);
}

export function defFrozenObj() {
  const obj = Object.freeze({ a: 1, b: 2 });
  return Object.entries(obj);
}

export function defSealedObj() {
  const obj = Object.seal({ a: 1, b: 2 });
  return Object.entries(obj);
}

export function defNonExtensibleObj() {
  const obj = Object.preventExtensions({ a: 1, b: 2 });
  return Object.entries(obj);
}


export function defUndefinedValueProp() {
  const obj = { a: undefined, b: 1 };
  return Object.entries(obj);
}

export function defNullValueProp() {
  const obj = { a: null, b: 1 };
  return Object.entries(obj);
}

export function defNaNValueProp() {
  const obj = { a: NaN, b: 1 };
  return Object.entries(obj);
}

export function defInfinityValueProp() {
  const obj = { a: Infinity, b: -Infinity, c: 1 };
  return Object.entries(obj);
}

export function defZeroValueProp() {
  const obj = { a: 0, b: -0 };
  return Object.entries(obj);
}

export function defNestedObjProp() {
  const obj = { a: 1, b: { c: 2, d: { e: 3 } } };
  const entries = Object.entries(obj);
  return entries[1][1];
}

export function defArrayProp() {
  const obj = { arr: [1, 2, 3] };
  return Object.entries(obj);
}

export function defFunctionProp() {
  const obj = { a: 1, b: () => {} };
  return Object.entries(obj);
}

export function defDateProp() {
  const obj = { date: new Date('2024-01-01') };
  return Object.entries(obj);
}

export function defRegExpProp() {
  const obj = { regex: /abc/gi, flags: /def/m };
  return Object.entries(obj);
}

export function defMapProp() {
  const obj = { map: new Map([['key1', 'value1'], ['key2', {a:1}]]) };
  return Object.entries(obj);
}

export function defSetProp() {
  const obj = { set: new Set([1, 2, 3, 2, 1]) };
  return Object.entries(obj);
}

export function defWeakMapProp() {
  const wm = new WeakMap();
  const key = {};
  wm.set(key, 'value');
  const obj = { weakmap: wm };
  return Object.entries(obj);
}

export function defWeakSetProp() {
  const ws = new WeakSet();
  const item = {};
  ws.add(item);
  const obj = { weakset: ws };
  return Object.entries(obj);
}

export function defArrayBufferProp() {
  const obj = { buffer: new ArrayBuffer(16) };
  return Object.entries(obj);
}

export function defDataViewProp() {
  const obj = { view: new DataView(new ArrayBuffer(16)) };
  return Object.entries(obj);
}

export function defTypedArrayProp() {
  const obj = { buffer: new Uint8Array([72, 101, 108, 108, 111]) };
  return Object.entries(obj);
}

export function defPromiseProp() {
  const obj = { promise: new Promise((resolve) => setTimeout(() => resolve('done'), 100)) };
  return Object.entries(obj);
}


export function defEmptyObj() {
  return Object.entries({});
}

export function defNullPrototypeObj() {
  return Object.entries(Object.create(null));
}

export function defLargeObj() {
  const obj = Object.fromEntries([...Array(10000).keys()].map(i => [i, i]));
  const entries = Object.entries(obj);
  return entries.length;
}

export function defLongKeyObj() {
  const longKey = 'a'.repeat(10000);
  const obj = { [longKey]: 'value' };
  const entries = Object.entries(obj);
  return entries[0][0].length;
}

export function defEmptyStringKey() {
  const obj = { '': 'empty key' };
  return Object.entries(obj);
}

export function defSpaceKey() {
  const obj = { ' ': 'space key', '  ': 'two spaces' };
  return Object.entries(obj);
}

export function defSpecialCharKey() {
  const obj = { '!@#$%^&*()': 'special', '键': 'unicode' };
  return Object.entries(obj);
}

export function defEmojiKey() {
  const obj = { '👆': 'emoji1', '💯': 'emoji2' };
  return Object.entries(obj);
}

export function defNumericStringKey() {
  const obj = { '3': 'c', '1': 'a', '2': 'b' };
  return Object.entries(obj);
}

export function defNegativeKey() {
  const obj = { '-1': 'neg', '-100': 'neg100' };
  return Object.entries(obj);
}

export function defMixedKeyOrder() {
  const obj = { b: 2, 1: 'num', a: 1, 2: 'num2' };
  return Object.entries(obj);
}

export function defLargeIntKey() {
  const obj = { 100: 'a', 2: 'b', 10: 'c' };
  return Object.entries(obj);
}


export function defKeysConsistency() {
  const obj = { a: 1, b: 2, c: 3 };
  const entries = Object.entries(obj);
  const keys = Object.keys(obj);
  return entries.every((entry, i) => entry[0] === keys[i]);
}

export function defValuesConsistency() {
  const obj = { a: 1, b: 2, c: 3 };
  const entries = Object.entries(obj);
  const values = Object.values(obj);
  return entries.every((entry, i) => entry[1] === values[i]);
}

export function defLengthConsistency() {
  const obj = { a: 1, b: 2, c: 3 };
  return Object.entries(obj).length === Object.keys(obj).length &&
         Object.entries(obj).length === Object.values(obj).length;
}

export function defFromEntriesRoundTrip() {
  const obj = { a: 1, b: 2 };
  const entries = Object.entries(obj);
  const newObj = Object.fromEntries(entries);
  return JSON.stringify(obj) === JSON.stringify(newObj);
}

export function defMultipleRoundTrip() {
  const obj = { a: 1, b: 2 };
  const newObj = Object.fromEntries(Object.entries(obj));
  const newObj2 = Object.fromEntries(Object.entries(newObj));
  return JSON.stringify(obj) === JSON.stringify(newObj2);
}

export function defObjToMap() {
  const obj = { foo: "bar", baz: 42 };
  const map = new Map(Object.entries(obj));
  return { foo: map.get('foo'), baz: map.get('baz') };
}

export function defMapToObjToMap() {
  const originalMap = new Map([['a', 1], ['b', 2]]);
  const obj = Object.fromEntries(originalMap);
  const newMap = new Map(Object.entries(obj));
  return newMap.get('a');
}

export function defForOfTraversal() {
  const obj = { a: 5, b: 7, c: 9 };
  const result = [];
  for (const [key, value] of Object.entries(obj)) {
    result.push(`${key} ${value}`);
  }
  return result;
}

export function defForEachTraversal() {
  const obj = { a: 5, b: 7, c: 9 };
  const result = [];
  Object.entries(obj).forEach(([key, value]) => {
    result.push(`${key} ${value}`);
  });
  return result;
}

export function defDestructuring() {
  const obj = { a: 1, b: 2 };
  const [[k1, v1], [k2, v2]] = Object.entries(obj);
  return { k1, v1, k2, v2 };
}

export function defMapTransform() {
  const obj = { a: 1, b: 2 };
  const doubled = Object.entries(obj).map(([k, v]) => [k, v * 2]);
  return doubled;
}

export function defFilterEntries() {
  const obj = { a: 1, b: 2, c: 3 };
  const filtered = Object.entries(obj).filter(([k, v]) => v > 1);
  return filtered;
}

export function defReduceEntries() {
  const obj = { a: 1, b: 2, c: 3 };
  return Object.entries(obj).reduce((acc, [k, v]) => acc + v, 0);
}

export function defFindEntry() {
  const obj = { a: 1, b: 2, c: 3 };
  return Object.entries(obj).find(([k, v]) => v === 2);
}

export function defSortEntries() {
  const obj = { c: 3, a: 1, b: 2 };
  return Object.entries(obj).sort(([ka], [kb]) => ka.localeCompare(kb));
}


export function defBasicGetter() {
  const obj = {
    get name() { return 'getter'; },
    a: 1
  };
  return Object.entries(obj);
}

export function defComputedGetter() {
  const obj = {
    _value: 10,
    get doubled() { return this._value * 2; }
  };
  return Object.entries(obj);
}

export function defGetterThrows() {
  const obj = {
    get error() { throw new Error('getter error'); },
    a: 1
  };
  try {
    Object.entries(obj);
    return null;
  } catch (e) {
    return e.message;
  }
}

export function defGetterSetter() {
  const obj = {
    _value: 0,
    set value(v) { this._value = v; },
    get value() { return this._value; }
  };
  obj.value = 10;
  return Object.entries(obj);
}

export function defOnlySetter() {
  const obj = {
    set onlySetter(v) { this._value = v; },
    a: 1
  };
  return Object.entries(obj);
}

export function defDynamicAdd() {
  const obj = { a: 1 };
  obj.b = 2;
  obj.c = 3;
  return Object.entries(obj);
}

export function defDynamicDelete() {
  const obj = { a: 1, b: 2, c: 3 };
  delete obj.b;
  return Object.entries(obj);
}

export function defDynamicModify() {
  const obj = { a: 1, b: 2 };
  obj.a = 100;
  return Object.entries(obj);
}

export function defComputedKeyVar() {
  const key = 'dynamic';
  const obj = { [key]: 'value', a: 1 };
  return Object.entries(obj);
}

export function defComputedKeyExpr() {
  const obj = { ['key' + 1]: 'value1', ['key' + 2]: 'value2' };
  return Object.entries(obj);
}

export function defComputedKeyFunc() {
  const getKey = () => 'funcKey';
  const obj = { [getKey()]: 'value' };
  return Object.entries(obj);
}

export function defMethodProp() {
  const obj = {
    method() { return 'method value'; },
    a: 1
  };
  const entries = Object.entries(obj);
  return typeof entries[0][1];
}

export function defArrowFuncProp() {
  const obj = {
    arrow: () => 'arrow value',
    a: 1
  };
  const entries = Object.entries(obj);
  return typeof entries[0][1];
}

export function defAsyncMethodProp() {
  const obj = {
    async asyncMethod() { return 'async'; },
    a: 1
  };
  const entries = Object.entries(obj);
  return typeof entries[0][1];
}


export function defProtoProp() {
  const obj = { __proto__: { injected: 1 }, a: 1 };
  const entries = Object.entries(obj);
  return entries.length;
}

export function defConstructorOverride() {
  const obj = { constructor: 'custom', a: 1 };
  return Object.entries(obj);
}

export function defSelfReference() {
  const obj = { a: 1 };
  obj.self = obj;
  const entries = Object.entries(obj);
  return entries[1][1] === obj;
}

export function defMutualReference() {
  const obj1 = { name: 'obj1' };
  const obj2 = { name: 'obj2', ref: obj1 };
  obj1.ref = obj2;
  const entries1 = Object.entries(obj1);
  return entries1[1][1] === obj2;
}

export function defClassInstance() {
  class MyClass {
    constructor() {
      this.a = 1;
      this.b = 2;
    }
    method() {}
  }
  const instance = new MyClass();
  return Object.entries(instance);
}

export function defStaticClass() {
  class MyClass {
    static staticProp = 'static';
    constructor() {
      this.a = 1;
    }
  }
  const instance = new MyClass();
  return {
    instanceEntries: Object.entries(instance),
    classEntries: Object.entries(MyClass).some(e => e[0] === 'staticProp')
  };
}

export function defArgumentsObj() {
  function test(...args) {
    return Object.entries(args);
  }
  return test(1, 2, 3);
}

export function defEmptyArguments() {
  function test(...args) {
    return Object.entries(args);
  }
  return test();
}

export function defGlobalObj() {
  const entries = Object.entries(Math);
  return Array.isArray(entries);
}

export function defMathObj() {
  const entries = Object.entries(Math);
  return entries.length > 0;
}

export function defJSONObj() {
  const entries = Object.entries(JSON);
  return entries.some(e => e[0] === 'parse' || e[0] === 'stringify');
}

export function defArrayAsObj() {
  const arr = [1, 2, 3];
  arr.custom = 'value';
  return Object.entries(arr);
}

export function defSparseArray() {
  const arr = [1, , 3];
  const entries = Object.entries(arr);
  return entries.length;
}

export function defEmptyArrayWithProp() {
  const arr = [];
  arr.prop = 'added';
  return Object.entries(arr);
}


export function defInt8ArrayProp() {
  const obj = { data: new Int8Array([-128, 127]) };
  const entries = Object.entries(obj);
  return {
    first: entries[0][1][0],
    second: entries[0][1][1]
  };
}

export function defInt8ArrayOverflow() {
  const obj = { data: new Int8Array([-129, 128]) };
  const entries = Object.entries(obj);
  return {
    first: entries[0][1][0],
    second: entries[0][1][1]
  };
}

export function defUint8ArrayProp() {
  const obj = { data: new Uint8Array([0, 255]) };
  const entries = Object.entries(obj);
  return {
    first: entries[0][1][0],
    second: entries[0][1][1]
  };
}

export function defUint8ClampedArrayProp() {
  const obj = { data: new Uint8ClampedArray([-1, 256]) };
  const entries = Object.entries(obj);
  return {
    first: entries[0][1][0],
    second: entries[0][1][1]
  };
}

export function defInt16ArrayProp() {
  const obj = { data: new Int16Array([-32768, 32767]) };
  const entries = Object.entries(obj);
  return entries[0][1][0] === -32768;
}

export function defInt32ArrayProp() {
  const obj = { data: new Int32Array([-2147483648, 2147483647]) };
  const entries = Object.entries(obj);
  return entries[0][1][0] === -2147483648;
}

export function defFloat32ArrayProp() {
  const obj = { data: new Float32Array([3.4028234663852886e38]) };
  const entries = Object.entries(obj);
  return isFinite(entries[0][1][0]);
}

export function defFloat32ArraySpecial() {
  const obj = { data: new Float32Array([Infinity, -Infinity, NaN]) };
  const entries = Object.entries(obj);
  return {
    inf: entries[0][1][0] === Infinity,
    nan: isNaN(entries[0][1][2])
  };
}

export function defFloat64ArrayProp() {
  const obj = { data: new Float64Array([1.7976931348623157e308]) };
  const entries = Object.entries(obj);
  return isFinite(entries[0][1][0]);
}

export function defBigInt64ArrayProp() {
  const obj = { data: new BigInt64Array([-9223372036854775808n, 9223372036854775807n]) };
  const entries = Object.entries(obj);
  return entries[0][1][0] === -9223372036854775808n;
}

export function defBigUint64ArrayProp() {
  const obj = { data: new BigUint64Array([0n, 18446744073709551615n]) };
  const entries = Object.entries(obj);
  return entries[0][1][0] === 0n;
}


export function defEmptyStringValue() {
  const obj = { empty: "" };
  return Object.entries(obj);
}

export function defSpecialCharStringValue() {
  const obj = { special: '!"#$%&\'()*+,-./:;<=>?@[\]^_`{|}~' };
  const entries = Object.entries(obj);
  return entries[0][1].length > 0;
}

export function defAsciiStringValue() {
  const obj = { ascii: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789' };
  const entries = Object.entries(obj);
  return entries[0][1].length === 62;
}

export function defEscapedStringValue() {
  const obj = { escaped: '\n\t\r\b\f\v\\\'\"' };
  const entries = Object.entries(obj);
  return entries[0][1].includes('\n');
}

export function defEmojiStringValue() {
  const obj = { emoji: '👆👀💯🎅' };
  const entries = Object.entries(obj);
  return entries[0][1];
}

export function defUnicodeStringValue() {
  const obj = { unicode: '\ud83d\udc46\ud83d\udc7f' };
  const entries = Object.entries(obj);
  return entries[0][1] === '👆👿';
}

export function defChineseStringValue() {
  const obj = { chinese: '你好世界' };
  const entries = Object.entries(obj);
  return entries[0][1];
}

export function defKeywordStringValue() {
  const obj = { keyword: 'NaN', another: 'undefined', third: 'null' };
  const entries = Object.entries(obj);
  return entries[0][1] === 'NaN';
}

export function defLargeStringValue() {
  const largeStr = 'a'.repeat(1000);
  const obj = { large: largeStr };
  const entries = Object.entries(obj);
  return entries[0][1].length === 1000;
}


export function defZeroValueProps() {
  const obj = { zero: 0, negZero: -0 };
  const entries = Object.entries(obj);
  return entries[0][1] === 0;
}

export function defNaNValueProps() {
  const obj = { nan: NaN };
  const entries = Object.entries(obj);
  return isNaN(entries[0][1]);
}

export function defInfinityValueProps() {
  const obj = { inf: Infinity, negInf: -Infinity };
  const entries = Object.entries(obj);
  return entries[0][1] === Infinity;
}

export function defMaxValueProps() {
  const obj = { max: Number.MAX_VALUE };
  const entries = Object.entries(obj);
  return entries[0][1] === 1.7976931348623157e+308;
}

export function defMinValueProps() {
  const obj = { min: Number.MIN_VALUE };
  const entries = Object.entries(obj);
  return entries[0][1] === 5e-324;
}

export function defMaxSafeIntegerProps() {
  const obj = { safe: Number.MAX_SAFE_INTEGER };
  const entries = Object.entries(obj);
  return entries[0][1] === 9007199254740991;
}

export function defEpsilonProps() {
  const obj = { epsilon: Number.EPSILON };
  const entries = Object.entries(obj);
  return entries[0][1] === 2.220446049250313e-16;
}

export function defHexValueProps() {
  const obj = { hex: 0x0102 };
  const entries = Object.entries(obj);
  return entries[0][1];
}

export function defOctalValueProps() {
  const obj = { octal: 0o7 };
  const entries = Object.entries(obj);
  return entries[0][1];
}

export function defSciNotationValueProps() {
  const obj = { sci1: 1e3, sci2: 2.5e-2 };
  const entries = Object.entries(obj);
  return {
    sci1: entries[0][1] === 1000,
    sci2: entries[1][1] === 0.025
  };
}

export function defBigIntValueProps() {
  const obj = { big: 9007199254740991n };
  const entries = Object.entries(obj);
  return entries[0][1] === 9007199254740991n;
}


export function defTrueValueProp() {
  const obj = { boolTrue: true };
  const entries = Object.entries(obj);
  return entries[0][1] === true;
}

export function defFalseValueProp() {
  const obj = { boolFalse: false };
  const entries = Object.entries(obj);
  return entries[0][1] === false;
}

export function defFalsyValueProps() {
  const obj = { zero: 0, nan: NaN, empty: "", nullVal: null, undef: undefined };
  const entries = Object.entries(obj);
  return {
    length: entries.length,
    nullVal: entries[3][1],
    undef: entries[4][1]
  };
}

export function defBooleanOperationProps() {
  const obj = { notStr: !'s', notZero: !0 };
  const entries = Object.entries(obj);
  return {
    notStr: entries[0][1] === false,
    notZero: entries[1][1] === true
  };
}