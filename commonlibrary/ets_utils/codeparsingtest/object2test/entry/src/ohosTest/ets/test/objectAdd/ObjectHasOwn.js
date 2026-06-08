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

export function hasOwnStringProp001() {
  const obj = { prop: "exists" };
  return Object.hasOwn(obj, "prop");
}

export function hasOwnSymbolProp002() {
  const sym = Symbol("key");
  const obj = {};
  obj[sym] = "value";
  return Object.hasOwn(obj, sym);
}

export function hasOwnNonExistent003() {
  const obj = { prop: "exists" };
  return Object.hasOwn(obj, "nonexistent");
}

export function hasOwnInherited004() {
  const example = {};
  return {
    hasToString: Object.hasOwn(example, "toString"),
    hasHasOwnProperty: Object.hasOwn(example, "hasOwnProperty")
  };
}

export function hasOwnProtoInherited005() {
  const parent = { inherited: "value" };
  const child = Object.create(parent);
  return Object.hasOwn(child, "inherited");
}

export function hasOwnNullValue006() {
  const obj = {};
  obj.prop = null;
  return Object.hasOwn(obj, "prop");
}

export function hasOwnUndefinedValue007() {
  const obj = {};
  obj.prop = undefined;
  return Object.hasOwn(obj, "prop");
}

export function hasOwnPlainObj008() {
  const obj = { a: 1, b: "test" };
  return Object.hasOwn(obj, "a");
}

export function hasOwnArray009() {
  const arr = ["Apple", "Banana", "Watermelon"];
  return {
    idx0: Object.hasOwn(arr, 0),
    idx3: Object.hasOwn(arr, 3),
    hasLength: Object.hasOwn(arr, "length")
  };
}

export function hasOwnFunction010() {
  function func() {}
  func.customProp = "value";
  return {
    hasCustom: Object.hasOwn(func, "customProp"),
    funcName: Object.hasOwn(func, "name"),
    funcLength: Object.hasOwn(func, "length"),
    hasCall: Object.hasOwn(func, "call")
  };
}

export function hasOwnDate011() {
  const date = new Date();
  date.customProp = "test";
  return {
    hasCustom: Object.hasOwn(date, "customProp"),
    hasGetTime: Object.hasOwn(date, "getTime")
  };
}

export function hasOwnRegExp012() {
  const regex = /abc/gi;
  regex.customProp = "test";
  return {
    hasCustom: Object.hasOwn(regex, "customProp"),
    hasLastIndex: Object.hasOwn(regex, "lastIndex")
  };
}

export function hasOwnMap013() {
  const map = new Map([["key1", "value1"]]);
  map.customProp = "test";
  return {
    hasCustom: Object.hasOwn(map, "customProp"),
    hasSize: Object.hasOwn(map, "size")
  };
}

export function hasOwnSet014() {
  const set = new Set([1, 2, 3]);
  set.customProp = "test";
  return Object.hasOwn(set, "customProp");
}

export function hasOwnNullProto015() {
  const obj = Object.create(null);
  obj.prop = "exists";
  return {
    hasProp: Object.hasOwn(obj, "prop"),
    hasToString: Object.hasOwn(obj, "toString")
  };
}

export function hasOwnStringProp016() {
  const obj = { prop: "value", "my-prop": "test" };
  return {
    normal: Object.hasOwn(obj, "prop"),
    dashed: Object.hasOwn(obj, "my-prop")
  };
}

export function hasOwnSymbolProp017() {
  const sym1 = Symbol("key1");
  const sym2 = Symbol("key2");
  const obj = {};
  obj[sym1] = "value1";
  return {
    hasSym1: Object.hasOwn(obj, sym1),
    hasSym2: Object.hasOwn(obj, sym2)
  };
}

export function hasOwnNumericProp018() {
  const obj = {};
  obj['1'] = 'one';
  obj['2'] = 'two';
  return {
    has1: Object.hasOwn(obj, 1),
    has2: Object.hasOwn(obj, 2),
    has3: Object.hasOwn(obj, 3)
  };
}

export function hasOwnEmptyProp019() {
  const obj = {};
  obj[''] = 'empty key';
  return Object.hasOwn(obj, "");
}

export function hasOwnSpecialChars020() {
  const obj = {};
  obj['!@#$%^&*()'] = 'special1';
  return Object.hasOwn(obj, "!@#$%^&*()");
}

export function hasOwnUnicode021() {
  const obj = {};
  obj['中文'] = 'chinese';
  return Object.hasOwn(obj, "中文");
}

export function hasOwnEscapeChars022() {
  const obj = {};
  obj['line\nbreak'] = 'test1';
  return Object.hasOwn(obj, "line\nbreak");
}

export function hasOwnKeywords023() {
  const obj = {};
  obj['if'] = 'keyword1';
  obj['for'] = 'keyword2';
  return { hasIf: Object.hasOwn(obj, "if"), hasFor: Object.hasOwn(obj, "for") };
}

export function hasOwnLongString024() {
  const longKey = 'a'.repeat(10000);
  const obj = {};
  obj[longKey] = 'value';
  return Object.hasOwn(obj, longKey);
}

export function hasOwnReturnType025() {
  const obj = { a: 1 };
  return {
    trueType: typeof Object.hasOwn(obj, "a"),
    falseType: typeof Object.hasOwn(obj, "nonexistent")
  };
}

export function hasOwnStrictReturn026() {
  const obj = { a: 1 };
  const r1 = Object.hasOwn(obj, "a");
  const r2 = Object.hasOwn(obj, "nonexistent");
  return { r1ExactTrue: r1 === true, r1NotOne: r1 !== 1, r2ExactFalse: r2 === false, r2NotZero: r2 !== 0 };
}

export function hasOwnEnumerable027() {
  const obj = { a: 1, b: 2 };
  return { hasA: Object.hasOwn(obj, "a"), hasB: Object.hasOwn(obj, "b") };
}

export function hasOwnNonEnumerable028() {
  const obj = {};
  Object.defineProperty(obj, "hidden", { value: "secret", enumerable: false });
  return Object.hasOwn(obj, "hidden");
}

export function hasOwnGetterSetter029() {
  const obj = {
    _value: 10,
    get value() { return this._value; },
    set value(v) { this._value = v; }
  };
  return { value: Object.hasOwn(obj, "value"), inner: Object.hasOwn(obj, "_value") };
}

export function hasOwnDefineProperty030() {
  const obj = {};
  Object.defineProperty(obj, "defined", { value: 42, writable: true, enumerable: true, configurable: true });
  return Object.hasOwn(obj, "defined");
}

export function hasOwnNonExistentProp031() {
  const obj = { a: 1 };
  return { noB: Object.hasOwn(obj, "nonexistent"), noC: Object.hasOwn(obj, "b") };
}

export function hasOwnInheritedProp032() {
  const parent = { inherited: "value" };
  const child = Object.create(parent);
  const normalObj = {};
  return { childInherited: Object.hasOwn(child, "inherited"), hasToString: Object.hasOwn(normalObj, "toString") };
}

export function hasOwnProtoChain033() {
  const grandParent = { grand: "value" };
  const parent = Object.create(grandParent);
  parent.parent = "value";
  const child = Object.create(parent);
  return {
    grand: Object.hasOwn(child, "grand"),
    parent: Object.hasOwn(child, "parent"),
    hasOwnProp: Object.hasOwn(child, "hasOwnProperty")
  };
}

export function hasOwnSetPrototype034() {
  const proto = { inherited: "value" };
  const obj = {};
  Object.setPrototypeOf(obj, proto);
  return Object.hasOwn(obj, "inherited");
}

export function hasOwnClassInherited035() {
  class Parent {
    parentMethod() {}
  }
  class Child extends Parent {
    childMethod() {}
  }
  const child = new Child();
  return {
    parentMethod: Object.hasOwn(child, "parentMethod"),
    childMethod: Object.hasOwn(child, "childMethod")
  };
}

export function hasOwnNestedObj036() {
  const obj = { a: 1, b: { c: 2, d: { e: 3 } } };
  return {
    hasA: Object.hasOwn(obj, "a"),
    hasB: Object.hasOwn(obj, "b"),
    hasC: Object.hasOwn(obj, "c"),
    hasCInB: Object.hasOwn(obj.b, "c")
  };
}

export function hasOwnEmptyObj037() {
  const obj = {};
  return { hasAny: Object.hasOwn(obj, "any"), hasToString: Object.hasOwn(obj, "toString") };
}

export function hasOwnLargeObj038() {
  const largeObj = {};
  for (let i = 0; i < 10000; i++) {
    largeObj['prop' + i] = i;
  }
  return {
    prop0: Object.hasOwn(largeObj, "prop0"),
    prop9999: Object.hasOwn(largeObj, "prop9999"),
    prop10000: Object.hasOwn(largeObj, "prop10000")
  };
}

export function hasOwnNullProtoObj039() {
  const obj = Object.create(null);
  obj.prop = "exists";
  return { hasProp: Object.hasOwn(obj, "prop"), hasToString: Object.hasOwn(obj, "toString") };
}

export function hasOwnFrozenObj040() {
  const obj = Object.freeze({ a: 1, b: 2 });
  return { hasA: Object.hasOwn(obj, "a"), hasB: Object.hasOwn(obj, "b"), hasC: Object.hasOwn(obj, "c") };
}

export function hasOwnSealedObj041() {
  const obj = Object.seal({ a: 1, b: 2 });
  return Object.hasOwn(obj, "a");
}

export function hasOwnMixedKeys042() {
  const sym1 = Symbol("s1");
  const sym2 = Symbol("s2");
  const obj = { a: 1, b: 2, c: 3 };
  obj[sym1] = 'value1';
  obj[sym2] = 'value2';
  return { strA: Object.hasOwn(obj, "a"), strB: Object.hasOwn(obj, "b"), sym1: Object.hasOwn(obj, sym1), sym2: Object.hasOwn(obj, sym2) };
}

export function hasOwnArrayNormal043() {
  const arr = ["Apple", "Banana", "Watermelon"];
  return {
    idx0: Object.hasOwn(arr, 0),
    idx1: Object.hasOwn(arr, 1),
    idx3: Object.hasOwn(arr, 3),
    length: Object.hasOwn(arr, "length")
  };
}

export function hasOwnSparseArray044() {
  const arr = [1, , , 4];
  return { idx0: Object.hasOwn(arr, 0), idx1: Object.hasOwn(arr, 1), idx3: Object.hasOwn(arr, 3) };
}

export function hasOwnArraySpecialValues045() {
  const arr = [undefined, null, NaN, Infinity];
  return { idx0: Object.hasOwn(arr, 0), idx1: Object.hasOwn(arr, 1), idx2: Object.hasOwn(arr, 2), idx3: Object.hasOwn(arr, 3) };
}

export function hasOwnArrayNonNumericProp046() {
  const arr = [1, 2, 3];
  arr.customProp = "value";
  return { idx0: Object.hasOwn(arr, 0), hasCustom: Object.hasOwn(arr, "customProp") };
}

export function hasOwnEmptyArray047() {
  const arr = [];
  return { idx0: Object.hasOwn(arr, 0), length: Object.hasOwn(arr, "length") };
}

export function hasOwnInt8Array048() {
  const int8 = new Int8Array([1, 2, 3, -128, 127]);
  return { idx0: Object.hasOwn(int8, 0), idx3: Object.hasOwn(int8, 3), length: Object.hasOwn(int8, "length") };
}

export function hasOwnFloat32Array049() {
  const float32 = new Float32Array([1.5, -3.14, Infinity, NaN]);
  return { idx0: Object.hasOwn(float32, 0), idx1: Object.hasOwn(float32, 1), length: Object.hasOwn(float32, "length") };
}

export function hasOwnWeakMap050() {
  const weakMap = new WeakMap();
  weakMap.customProp = "test";
  return { hasCustom: Object.hasOwn(weakMap, "customProp"), hasSet: Object.hasOwn(weakMap, "set") };
}

export function hasOwnPromise051() {
  const promise = new Promise(function(resolve) { setTimeout(function() { resolve(); }, 100); });
  promise.customProp = "test";
  return { hasCustom: Object.hasOwn(promise, "customProp"), hasThen: Object.hasOwn(promise, "then") };
}

export function hasOwnError052() {
  const error = new Error("test error");
  error.customProp = "test";
  return { hasCustom: Object.hasOwn(error, "customProp"), errMsg: Object.hasOwn(error, "message"), errName: Object.hasOwn(error, "name") };
}

export function hasOwnAfterDelete053() {
  const obj = { a: 1, b: 2 };
  const beforeA = Object.hasOwn(obj, "a");
  delete obj.a;
  return { beforeA: beforeA, afterA: Object.hasOwn(obj, "a"), b: Object.hasOwn(obj, "b") };
}

export function hasOwnNonConfigDelete054() {
  const obj = {};
  Object.defineProperty(obj, "a", { value: 1, configurable: false });
  const before = Object.hasOwn(obj, "a");
  try {
    delete obj.a;
  } catch (e) {}
  return { before: before, after: Object.hasOwn(obj, "a") };
}

export function hasOwnWritable055() {
  const obj = {};
  Object.defineProperty(obj, "writable", { value: "can change", writable: true });
  const before = Object.hasOwn(obj, "writable");
  obj.writable = 'changed';
  return { before: before, after: Object.hasOwn(obj, "writable") };
}

export function hasOwnNonWritable056() {
  const obj = {};
  Object.defineProperty(obj, "readonly", { value: "cannot change", writable: false });
  return Object.hasOwn(obj, "readonly");
}

export function hasOwnConfigurable057() {
  const obj = {};
  Object.defineProperty(obj, "configurable", { value: "can delete", configurable: true });
  const before = Object.hasOwn(obj, "configurable");
  delete obj.configurable;
  return { before: before, after: Object.hasOwn(obj, "configurable") };
}

export function hasOwnGetterSet058() {
  const obj = {
    _value: 10,
    get value() { return this._value; },
    set value(v) { this._value = v; }
  };
  return { valueProp: Object.hasOwn(obj, "value"), innerProp: Object.hasOwn(obj, "_value") };
}

export function hasOwnNegativeZero059() {
  const obj = { a: 0, b: -0 };
  return { hasA: Object.hasOwn(obj, "a"), hasB: Object.hasOwn(obj, "b") };
}

export function hasOwnBigIntProp060() {
  const obj = {};
  obj['a'] = 9007199254740991n;
  return Object.hasOwn(obj, "a");
}

export function hasOwnMaxArrayIndex061() {
  const arr = [];
  arr['4294967294'] = 'max index';
  return { maxIdx: Object.hasOwn(arr, 4294967294), beyondMax: Object.hasOwn(arr, 4294967295) };
}

export function hasOwnMaxValue062() {
  const obj = {};
  obj[Number.MAX_VALUE] = 'max';
  return Object.hasOwn(obj, Number.MAX_VALUE);
}

export function hasOwnMinValue063() {
  const obj = {};
  obj[Number.MIN_VALUE] = 'min';
  return Object.hasOwn(obj, Number.MIN_VALUE);
}

export function hasOwnMaxSafeInt064() {
  const obj = {};
  obj[Number.MAX_SAFE_INTEGER] = 'max safe';
  return Object.hasOwn(obj, Number.MAX_SAFE_INTEGER);
}

export function hasOwnScientificNotation065() {
  const obj = {};
  obj['1000'] = 'scientific';
  return Object.hasOwn(obj, 1000);
}

export function hasOwnNullObj066() {
  try {
    Object.hasOwn(null, "prop");
    return false;
  } catch (e) {
    return e.name;
  }
}

export function hasOwnUndefinedObj067() {
  try {
    Object.hasOwn(undefined, "prop");
    return false;
  } catch (e) {
    return e.name;
  }
}

export function hasOwnStringObj068() {
  const str = "test";
  return { length: Object.hasOwn(str, "length"), idx0: Object.hasOwn(str, "0") };
}

export function hasOwnNumberObj069() {
  const num = 123;
  return Object.hasOwn(num, "toString");
}

export function hasOwnSymbolObj070() {
  const sym = Symbol("test");
  return { hasDescription: Object.hasOwn(sym, "description"), hasToString: Object.hasOwn(sym, "toString") };
}

export function hasOwnUndefinedProp071() {
  const obj = {};
  obj['undefined'] = 'value';
  return { viaUndefined: Object.hasOwn(obj, undefined), viaString: Object.hasOwn(obj, "undefined") };
}

export function hasOwnNullProp072() {
  const obj = {};
  obj['null'] = 'value';
  return { viaNull: Object.hasOwn(obj, null), viaString: Object.hasOwn(obj, "null") };
}

export function hasOwnObjectProp073() {
  const obj = {};
  const keyObj = { toString: function() { return "customKey"; } };
  obj.customKey = 'value';
  return Object.hasOwn(obj, keyObj);
}

export function hasOwnNoArgs074() {
  try {
    Object.hasOwn();
    return false;
  } catch (e) {
    return e.name;
  }
}

export function hasOwnOverriddenHasOwnProperty075() {
  const obj = {
    bar: "test",
    hasOwnProperty: function() { return false; }
  };
  return { overridden: obj.hasOwnProperty("bar"), usingHasOwn: Object.hasOwn(obj, "bar") };
}

export function hasOwnReflectDelete076() {
  const obj = { a: 1, b: 2 };
  const before = Object.hasOwn(obj, "a");
  const deleted = Reflect.deleteProperty(obj, "a");
  return { before: before, deleted: deleted, after: Object.hasOwn(obj, "a") };
}

export function hasOwnReflectHas077() {
  const obj = { a: 1 };
  return {
    ownA: Object.hasOwn(obj, "a"),
    reflectA: Reflect.has(obj, "a"),
    ownToString: Object.hasOwn(obj, "toString"),
    reflectToString: Reflect.has(obj, "toString")
  };
}

export function hasOwnSafeAccess078() {
  const obj = { a: 1 };
  obj.__proto__ = { injected: "malicious" };
  return { hasA: Object.hasOwn(obj, "a"), hasInjected: Object.hasOwn(obj, "injected") };
}

export function hasOwnConfigValidate079() {
  const config = { apiKey: "abc123", timeout: 5000 };
  return { hasApiKey: Object.hasOwn(config, "apiKey"), hasRetryCount: Object.hasOwn(config, "retryCount") };
}

export function hasOwnSameDescSymbol080() {
  const sym1 = Symbol("key");
  const sym2 = Symbol("key");
  const obj = {};
  obj[sym1] = 'value';
  return { hasSym1: Object.hasOwn(obj, sym1), hasSym2: Object.hasOwn(obj, sym2) };
}
