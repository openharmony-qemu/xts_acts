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

export function getOwnPropertyNamesBasic001() {
  const obj = { a: 1, b: 2, c: 3 };
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesNonEnum002() {
  const obj = {};
  Object.defineProperty(obj, 'enumerable', { value: 1, enumerable: true });
  Object.defineProperty(obj, 'nonEnumerable', { value: 2, enumerable: false });
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return JSON.stringify(result);
}

export function getOwnPropertyNamesEmpty003() {
  return Object.getOwnPropertyNames({});
}

export function getOwnPropertyNamesArray004() {
  const arr = ['a', 'b', 'c'];
  const result = Object.getOwnPropertyNames(arr);
  result.sort();
  return result;
}

export function getOwnPropertyNamesEmptyArray005() {
  return Object.getOwnPropertyNames([]);
}

export function getOwnPropertyNamesSparseArray006() {
  const arr = [];
  arr[0] = 'a';
  arr[100] = 'b';
  const result = Object.getOwnPropertyNames(arr);
  result.sort();
  return result;
}

export function getOwnPropertyNamesFunction007() {
  function testFunc(a, b, c) { return a + b + c; }
  const result = Object.getOwnPropertyNames(testFunc);
  return {
    hasLength: result.indexOf('length') !== -1,
    hasName: result.indexOf('name') !== -1
  };
}

export function getOwnPropertyNamesAnonymousFunction008() {
  const anonFunc = function() {};
  const result = Object.getOwnPropertyNames(anonFunc);
  return result.indexOf('name') !== -1;
}

export function getOwnPropertyNamesArrowFunction009() {
  const arrowFunc = (a, b) => a + b;
  const result = Object.getOwnPropertyNames(arrowFunc);
  return {
    hasLength: result.indexOf('length') !== -1,
    hasName: result.indexOf('name') !== -1
  };
}

export function getOwnPropertyNamesString010() {
  const result = Object.getOwnPropertyNames('foo');
  result.sort();
  return result;
}

export function getOwnPropertyNamesEmptyString011() {
  return Object.getOwnPropertyNames('');
}

export function getOwnPropertyNamesNumber012() {
  return Object.getOwnPropertyNames(42);
}

export function getOwnPropertyNamesBoolean013() {
  return {
    resultTrue: Object.getOwnPropertyNames(true),
    resultFalse: Object.getOwnPropertyNames(false)
  };
}

export function getOwnPropertyNamesBigInt014() {
  return Object.getOwnPropertyNames(123n);
}

export function getOwnPropertyNamesSymbol015() {
  const sym = Symbol('test');
  return Object.getOwnPropertyNames(sym);
}

export function getOwnPropertyNamesNull016() {
  try {
    Object.getOwnPropertyNames(null);
    return false;
  } catch (e) {
    return e.name;
  }
}

export function getOwnPropertyNamesUndefined017() {
  try {
    Object.getOwnPropertyNames(undefined);
    return false;
  } catch (e) {
    return e.name;
  }
}

export function getOwnPropertyNamesNaN018() {
  return Object.getOwnPropertyNames(NaN);
}

export function getOwnPropertyNamesInfinity019() {
  return Object.getOwnPropertyNames(Infinity);
}

export function getOwnPropertyNamesNegInfinity020() {
  return Object.getOwnPropertyNames(-Infinity);
}

export function getOwnPropertyNamesNegZero021() {
  return Object.getOwnPropertyNames(-0);
}

export function getOwnPropertyNamesInt8Array022() {
  const ta = new Int8Array([1, 2, 3]);
  const result = Object.getOwnPropertyNames(ta);
  result.sort();
  return {
    hasLength: result.indexOf('length') !== -1,
    hasByteLength: result.indexOf('byteLength') !== -1,
    hasByteOffset: result.indexOf('byteOffset') !== -1,
    hasBuffer: result.indexOf('buffer') !== -1
  };
}

export function getOwnPropertyNamesUint8Array023() {
  const ta = new Uint8Array([72, 101, 108, 108, 111]);
  const result = Object.getOwnPropertyNames(ta);
  return {
    hasLength: result.indexOf('length') !== -1,
    hasByteLength: result.indexOf('byteLength') !== -1
  };
}

export function getOwnPropertyNamesFloat32Array024() {
  const ta = new Float32Array([1.5, 2.5, 3.5]);
  const result = Object.getOwnPropertyNames(ta);
  return {
    hasLength: result.indexOf('length') !== -1,
    hasByteOffset: result.indexOf('byteOffset') !== -1
  };
}

export function getOwnPropertyNamesBigInt64Array025() {
  const ta = new BigInt64Array([1n, 2n, 3n]);
  const result = Object.getOwnPropertyNames(ta);
  return {
    hasLength: result.indexOf('length') !== -1,
    hasBuffer: result.indexOf('buffer') !== -1
  };
}

export function getOwnPropertyNamesEmptyTypedArray026() {
  const ta = new Int8Array(0);
  const result = Object.getOwnPropertyNames(ta);
  result.sort();
  return result;
}

export function getOwnPropertyNamesSymbolOnly027() {
  const sym = Symbol('key');
  const obj = {};
  obj[sym] = 'value';
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesMixedSymbol028() {
  const sym = Symbol('symKey');
  const obj = { a: 1, b: 3 };
  obj[sym] = 2;
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesMultiSymbol029() {
  const sym1 = Symbol('s1');
  const sym2 = Symbol('s2');
  const obj = {};
  obj[sym1] = 1;
  obj[sym2] = 2;
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesNumericKeys030() {
  const obj = { '0': 'a', '1': 'b', '2': 'c' };
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesMixedKeys031() {
  const obj = { b: 1, a: 2 };
  obj['2'] = 'two';
  obj['1'] = 'one';
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesLargeNumericKeys032() {
  const obj = {};
  obj['100'] = 'a';
  obj['1'] = 'b';
  obj['50'] = 'c';
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesNegativeKeys033() {
  const obj = { 0: 'zero', 1: 'one' };
  obj['-1'] = 'negative';
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesFloatKeys034() {
  const obj = { 1: 'int' };
  obj['1.5'] = 'float';
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesEmptyKey035() {
  const obj = {};
  obj[''] = 'empty';
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesSpecialChars036() {
  const obj = {};
  obj['!'] = 1;
  obj['@'] = 2;
  obj['#'] = 3;
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesSpaceKeys037() {
  const obj = {};
  obj[' '] = 'space';
  obj['  '] = 'twoSpaces';
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesUnicodeKeys038() {
  const obj = {};
  obj['你好'] = 'hello';
  obj['日本語'] = 'japanese';
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesEscapeKeys039() {
  const obj = {};
  obj['\n'] = 'newline';
  obj['\t'] = 'tab';
  obj['\\'] = 'backslash';
  return Object.getOwnPropertyNames(obj).length;
}

export function getOwnPropertyNamesAllEnumerable040() {
  const obj = { a: 1, b: 2, c: 3 };
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesAllNonEnumerable041() {
  const obj = {};
  Object.defineProperty(obj, 'a', { value: 1, enumerable: false });
  Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesMixedEnumerable042() {
  const obj = { enumerable: 1 };
  Object.defineProperty(obj, 'nonEnumerable', { value: 2, enumerable: false });
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesObjectCreate043() {
  const obj = Object.create({}, {
    hidden: { value: 'secret', enumerable: false },
    visible: { value: 'public', enumerable: true }
  });
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesNonConfigurable044() {
  const obj = {};
  Object.defineProperty(obj, 'prop', { value: 1, configurable: false, enumerable: true });
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesNonConfigNonEnum045() {
  const obj = {};
  Object.defineProperty(obj, 'prop', { value: 1, configurable: false, enumerable: false });
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesFrozen046() {
  const obj = Object.freeze({ a: 1, b: 2 });
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesSealed047() {
  const obj = Object.seal({ a: 1, b: 2 });
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesReadOnly048() {
  const obj = {};
  Object.defineProperty(obj, 'readonly', { value: 1, writable: false });
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesGetterSetter049() {
  const obj = {
    _value: 0,
    get value() { return this._value; },
    set value(v) { this._value = v; }
  };
  const result = Object.getOwnPropertyNames(obj);
  return result.indexOf('value') !== -1;
}

export function getOwnPropertyNamesPrototypeChain050() {
  function Parent() {}
  Parent.prototype.inherited = 'from parent';
  const child = new Parent();
  child.own = 'own property';
  return Object.getOwnPropertyNames(child);
}

export function getOwnPropertyNamesMultiInherit051() {
  function GrandParent() {}
  GrandParent.prototype.grandProp = 'grandparent';
  function Parent() {}
  Parent.prototype = Object.create(GrandParent.prototype);
  Parent.prototype.parentProp = 'parent';
  const child = new Parent();
  child.ownProp = 'child';
  return Object.getOwnPropertyNames(child);
}

export function getOwnPropertyNamesNullProto052() {
  const obj = Object.create(null);
  obj.a = 1;
  obj.b = 2;
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesDate053() {
  return Array.isArray(Object.getOwnPropertyNames(new Date()));
}

export function getOwnPropertyNamesRegExp054() {
  const regex = /abc/gi;
  const result = Object.getOwnPropertyNames(regex);
  return result.indexOf('lastIndex') !== -1;
}

export function getOwnPropertyNamesError055() {
  const err = new Error('test error');
  const result = Object.getOwnPropertyNames(err);
  return result.indexOf('message') !== -1;
}

export function getOwnPropertyNamesMap056() {
  const map = new Map([['key1', 'value1']]);
  return Array.isArray(Object.getOwnPropertyNames(map));
}

export function getOwnPropertyNamesSet057() {
  const set = new Set([1, 2, 3]);
  return Array.isArray(Object.getOwnPropertyNames(set));
}

export function getOwnPropertyNamesWeakMap058() {
  const wm = new WeakMap();
  return Array.isArray(Object.getOwnPropertyNames(wm));
}

export function getOwnPropertyNamesWeakSet059() {
  const ws = new WeakSet();
  return Array.isArray(Object.getOwnPropertyNames(ws));
}

export function getOwnPropertyNamesMath060() {
  const result = Object.getOwnPropertyNames(Math);
  return {
    hasPI: result.indexOf('PI') !== -1,
    hasRandom: result.indexOf('random') !== -1
  };
}

export function getOwnPropertyNamesJSON061() {
  const result = Object.getOwnPropertyNames(JSON);
  return {
    hasParse: result.indexOf('parse') !== -1,
    hasStringify: result.indexOf('stringify') !== -1
  };
}

export function getOwnPropertyNamesProxy062() {
  const target = { a: 1, b: 2 };
  const handler = {};
  const proxy = new Proxy(target, handler);
  const result = Object.getOwnPropertyNames(proxy);
  result.sort();
  return result;
}

export function getOwnPropertyNamesArrayBuffer063() {
  const buffer = new ArrayBuffer(16);
  const result = Object.getOwnPropertyNames(buffer);
  return result.indexOf('byteLength') !== -1;
}

export function getOwnPropertyNamesDataView064() {
  const buffer = new ArrayBuffer(16);
  const view = new DataView(buffer);
  const result = Object.getOwnPropertyNames(view);
  return {
    hasByteLength: result.indexOf('byteLength') !== -1,
    hasByteOffset: result.indexOf('byteOffset') !== -1
  };
}

export function getOwnPropertyNamesPromise065() {
  const promise = new Promise(function(resolve) { resolve(); });
  return Array.isArray(Object.getOwnPropertyNames(promise));
}

export function getOwnPropertyNamesNested066() {
  const obj = { a: 1, b: { c: 2, d: { e: 3 } } };
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesCircular067() {
  const obj = { a: 1 };
  obj.self = obj;
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesIsArray068() {
  return Array.isArray(Object.getOwnPropertyNames({ a: 1, b: 2 }));
}

export function getOwnPropertyNamesAllStrings069() {
  const result = Object.getOwnPropertyNames({ a: 1, b: 2 });
  return result.every(function(item) { return typeof item === 'string'; });
}

export function getOwnPropertyNamesReturnModify070() {
  const obj = { a: 1, b: 2 };
  const result = Object.getOwnPropertyNames(obj);
  result.push('newProp');
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesOrder001071() {
  const obj = {};
  obj['100'] = 'a';
  obj['2'] = 'b';
  obj['1'] = 'c';
  obj['0'] = 'd';
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesStringOrder072() {
  const obj = {};
  obj.b = 1;
  obj.a = 2;
  obj.c = 3;
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesMixedOrder073() {
  const obj = { b: 'str', a: 'str2' };
  obj['2'] = 'num';
  obj['1'] = 'num2';
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesEmptyLength074() {
  return Object.getOwnPropertyNames({}).length;
}

export function getOwnPropertyNamesSingleProp075() {
  return Object.getOwnPropertyNames({ prop: 1 }).length;
}

export function getOwnPropertyNamesMultiProp076() {
  return Object.getOwnPropertyNames({ a: 1, b: 2, c: 3, d: 4 }).length;
}

export function getOwnPropertyNames100Props077() {
  const obj = {};
  for (let i = 0; i < 100; i++) {
    obj['prop' + i] = i;
  }
  return Object.getOwnPropertyNames(obj).length;
}

export function getOwnPropertyNamesUndefinedValue078() {
  const obj = { a: undefined, b: 1 };
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesNullValue079() {
  const obj = { a: null, b: 1 };
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesNaNValue080() {
  const obj = { a: NaN, b: 1 };
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesLongKey081() {
  const longName = 'a'.repeat(1000);
  const obj = {};
  obj[longName] = 1;
  return Object.getOwnPropertyNames(obj)[0].length;
}

export function getOwnPropertyNamesMaxIndex082() {
  const obj = {};
  obj['4294967294'] = 'max';
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesBeyondIndex083() {
  const obj = { 1: 'normal' };
  obj['4294967295'] = 'over';
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesAfterDelete084() {
  const obj = { a: 1, b: 2, c: 3 };
  delete obj.b;
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesReAdd085() {
  const obj = { a: 1, b: 2 };
  delete obj.b;
  obj.b = 3;
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesVsKeys086() {
  const obj = { enumerable: 1 };
  Object.defineProperty(obj, 'nonEnumerable', { value: 2, enumerable: false });
  const names = Object.getOwnPropertyNames(obj);
  const keys = Object.keys(obj);
  return names.length > keys.length;
}

export function getOwnPropertyNamesNonEnumFilter087() {
  const obj = {};
  Object.defineProperty(obj, 'visible', { value: 1, enumerable: true });
  Object.defineProperty(obj, 'hidden', { value: 2, enumerable: false });
  const names = Object.getOwnPropertyNames(obj);
  const keys = Object.keys(obj);
  const nonEnum = names.filter(function(n) { return keys.indexOf(n) === -1; });
  return nonEnum;
}

export function getOwnPropertyNamesOnlyStrings088() {
  const obj = { a: 1, b: 2 };
  const names = Object.getOwnPropertyNames(obj);
  const symbols = Object.getOwnPropertySymbols(obj);
  return { namesLength: names.length, symbolsLength: symbols.length };
}

export function getOwnPropertyNamesOnlySymbols089() {
  const sym = Symbol('key');
  const obj = {};
  obj[sym] = 1;
  const names = Object.getOwnPropertyNames(obj);
  const symbols = Object.getOwnPropertySymbols(obj);
  return { namesLength: names.length, symbolsLength: symbols.length };
}

export function getOwnPropertyNamesCombined090() {
  const sym = Symbol('sym');
  const obj = { str: 1, num: 3 };
  obj[sym] = 2;
  const allKeys = Object.getOwnPropertyNames(obj).concat(Object.getOwnPropertySymbols(obj));
  return allKeys.length;
}

export function getOwnPropertyNamesHasOwn091() {
  const obj = { a: 1, b: 2 };
  const names = Object.getOwnPropertyNames(obj);
  return names.every(function(name) { return Object.hasOwn(obj, name); });
}

export function getOwnPropertyNamesHasOwnNonEnum092() {
  const obj = {};
  Object.defineProperty(obj, 'hidden', { value: 1, enumerable: false });
  return Object.hasOwn(obj, 'hidden');
}

export function getOwnPropertyNamesDescriptor093() {
  const obj = {};
  Object.defineProperty(obj, 'prop', { value: 42, enumerable: false, writable: true });
  const names = Object.getOwnPropertyNames(obj);
  const desc = Object.getOwnPropertyDescriptor(obj, names[0]);
  return {
    isEnumerable: desc ? desc.enumerable : undefined,
    descValue: desc ? desc.value : undefined
  };
}

export function getOwnPropertyNamesForIn094() {
  const obj = { enumerable: 1 };
  Object.defineProperty(obj, 'nonEnumerable', { value: 2, enumerable: false });
  const names = Object.getOwnPropertyNames(obj);
  const forInKeys = [];
  for (const key in obj) {
    forInKeys.push(key);
  }
  return names.length > forInKeys.length;
}

export function getOwnPropertyNamesForInProto095() {
  const proto = { inherited: 1 };
  const obj = Object.create(proto);
  obj.own = 2;
  const names = Object.getOwnPropertyNames(obj);
  const forInKeys = [];
  for (const key in obj) {
    forInKeys.push(key);
  }
  return {
    forInHasInherited: forInKeys.indexOf('inherited') !== -1,
    namesHasInherited: names.indexOf('inherited') !== -1
  };
}

export function getOwnPropertyNamesReflectOwnKeys096() {
  const sym = Symbol('sym');
  const obj = { str: 1 };
  obj[sym] = 2;
  const names = Object.getOwnPropertyNames(obj);
  const ownKeys = Reflect.ownKeys(obj);
  return ownKeys.length > names.length;
}

export function getOwnPropertyNamesReflectOrder097() {
  const obj = { b: 'str', a: 'str2' };
  obj['1'] = 'num';
  obj['2'] = 'num2';
  const names = Object.getOwnPropertyNames(obj);
  const ownKeys = Reflect.ownKeys(obj).filter(function(k) { return typeof k === 'string'; });
  return JSON.stringify(names) === JSON.stringify(ownKeys);
}

export function getOwnPropertyNamesForEachProp098() {
  const obj = {};
  Object.defineProperty(obj, 'normal', { value: 1, enumerable: true });
  Object.defineProperty(obj, 'hidden', { value: 2, enumerable: false });
  const names = Object.getOwnPropertyNames(obj);
  const results = [];
  names.forEach(function(name) {
    const desc = Object.getOwnPropertyDescriptor(obj, name);
    results.push({ name: name, enumerable: desc ? desc.enumerable : undefined });
  });
  return results;
}

export function getOwnPropertyNamesAllEnumVsKeys099() {
  const obj = { a: 1, b: 2, c: 3 };
  const names = Object.getOwnPropertyNames(obj);
  const keys = Object.keys(obj);
  names.sort();
  keys.sort();
  return JSON.stringify(names) === JSON.stringify(keys);
}

export function getOwnPropertyNamesMaxIndexObj100() {
  const obj = {};
  obj['0'] = 'zero';
  obj['1'] = 'one';
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesGlobalThis101() {
  const result = Object.getOwnPropertyNames(globalThis);
  return result.length > 0;
}

export function getOwnPropertyNamesReflectParam102() {
  const result = Object.getOwnPropertyNames(Reflect);
  return {
    hasGet: result.indexOf('get') !== -1,
    hasSet: result.indexOf('set') !== -1
  };
}

export function getOwnPropertyNames1000Props103() {
  const obj = {};
  for (let i = 0; i < 1000; i++) {
    obj['prop' + i] = i;
  }
  return Object.getOwnPropertyNames(obj).length;
}

export function getOwnPropertyNamesDeleteNonConfig104() {
  const obj = {};
  Object.defineProperty(obj, 'fixed', { value: 1, configurable: false });
  try {
    delete obj.fixed;
  } catch (e) {

  }
  const result = Object.getOwnPropertyNames(obj);
  return result[0] === 'fixed' && result.length === 1;
}

export function getOwnPropertyNamesContArray105() {
  const obj = { arr: [1, 2, 3], str: 'test' };
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesContFunc106() {
  const obj = { method: function() {}, prop: 1 };
  const result = Object.getOwnPropertyNames(obj);
  result.sort();
  return result;
}

export function getOwnPropertyNamesGetterOnly107() {
  const obj = {};
  Object.defineProperty(obj, 'getter', {
    get: function() { return 42; },
    enumerable: true
  });
  const result = Object.getOwnPropertyNames(obj);
  return result[0] === 'getter';
}

export function getOwnPropertyNamesSetterOnly108() {
  const obj = {};
  Object.defineProperty(obj, 'setter', {
    set: function(v) { this._value = v; },
    enumerable: true
  });
  const result = Object.getOwnPropertyNames(obj);
  return result[0] === 'setter';
}

export function getOwnPropertyNamesContinuousInt109() {
  const obj = {};
  for (let i = 0; i < 10; i++) {
    obj[i] = i;
  }
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesDiscontInt110() {
  const obj = { 5: 'a', 100: 'b', 3: 'c', 50: 'd' };
  return Object.getOwnPropertyNames(obj);
}

export function getOwnPropertyNamesLargeProps111() {
  const obj = Object.fromEntries(
    Array.from({ length: 1000 }, function(_, i) { return ['prop' + i, i]; })
  );
  return Object.getOwnPropertyNames(obj).length;
}
