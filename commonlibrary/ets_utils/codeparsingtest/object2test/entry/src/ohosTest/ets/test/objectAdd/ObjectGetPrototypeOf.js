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

export function getPrototypeOfBasic001() {
  const proto = {};
  const obj = Object.create(proto);
  return Object.getPrototypeOf(obj) === proto;
}

export function getPrototypeOfNullProto002() {
  const obj = Object.create(null);
  return Object.getPrototypeOf(obj);
}

export function getPrototypeOfObjectProto003() {
  const obj = {};
  return Object.getPrototypeOf(obj) === Object.prototype;
}

export function getPrototypeOfReturnType004() {
  const obj = {};
  const result = Object.getPrototypeOf(obj);
  return typeof result === 'object' || result === null;
}

export function getPrototypeOfProtoProperty005() {
  const obj = {};
  return Object.getPrototypeOf(obj) === obj.__proto__;
}

export function getPrototypeOfConstructor006() {
  function Foo() {}
  const foo = new Foo();
  return Object.getPrototypeOf(foo) === Foo.prototype;
}

export function getPrototypeOfString007() {
  return Object.getPrototypeOf('foo') === String.prototype;
}

export function getPrototypeOfNumber008() {
  return Object.getPrototypeOf(42) === Number.prototype;
}

export function getPrototypeOfBoolean009() {
  return Object.getPrototypeOf(true) === Boolean.prototype;
}

export function getPrototypeOfSymbol010() {
  const sym = Symbol('test');
  return Object.getPrototypeOf(sym) === Symbol.prototype;
}

export function getPrototypeOfBigInt011() {
  return Object.getPrototypeOf(10n) === BigInt.prototype;
}

export function getPrototypeOfNull012() {
  try {
    Object.getPrototypeOf(null);
    return false;
  } catch (e) {
    return e.name;
  }
}

export function getPrototypeOfUndefined013() {
  try {
    Object.getPrototypeOf(undefined);
    return false;
  } catch (e) {
    return e.name;
  }
}

export function getPrototypeOfObjectLiteral014() {
  const obj = { a: 1 };
  return Object.getPrototypeOf(obj) === Object.prototype;
}

export function getPrototypeOfConstructorObj015() {
  function Person(name) { this.name = name; }
  const p = new Person('test');
  return Object.getPrototypeOf(p) === Person.prototype;
}

export function getPrototypeOfArray016() {
  return Object.getPrototypeOf([1, 2, 3]) === Array.prototype;
}

export function getPrototypeOfArrayConstructor017() {
  return Object.getPrototypeOf(new Array(1, 2, 3)) === Array.prototype;
}

export function getPrototypeOfFuncDecl018() {
  function foo() {}
  return Object.getPrototypeOf(foo) === Function.prototype;
}

export function getPrototypeOfFuncExpr019() {
  const foo = function() {};
  return Object.getPrototypeOf(foo) === Function.prototype;
}

export function getPrototypeOfArrow020() {
  const foo = () => {};
  return Object.getPrototypeOf(foo) === Function.prototype;
}

export function getPrototypeOfDate021() {
  return Object.getPrototypeOf(new Date()) === Date.prototype;
}

export function getPrototypeOfRegExp022() {
  return Object.getPrototypeOf(/test/) === RegExp.prototype;
}

export function getPrototypeOfError023() {
  return Object.getPrototypeOf(new Error('test')) === Error.prototype;
}

export function getPrototypeOfMap024() {
  return Object.getPrototypeOf(new Map()) === Map.prototype;
}

export function getPrototypeOfSet025() {
  return Object.getPrototypeOf(new Set()) === Set.prototype;
}

export function getPrototypeOfWeakMap026() {
  return Object.getPrototypeOf(new WeakMap()) === WeakMap.prototype;
}

export function getPrototypeOfWeakSet027() {
  return Object.getPrototypeOf(new WeakSet()) === WeakSet.prototype;
}

export function getPrototypeOfPromise028() {
  return Object.getPrototypeOf(new Promise(function(resolve) { resolve(); })) === Promise.prototype;
}

export function getPrototypeOfInt8Array029() {
  return Object.getPrototypeOf(new Int8Array([1, 2, 3])) === Int8Array.prototype;
}

export function getPrototypeOfUint8Array030() {
  return Object.getPrototypeOf(new Uint8Array([1, 2, 3])) === Uint8Array.prototype;
}

export function getPrototypeOfUint8Clamped031() {
  return Object.getPrototypeOf(new Uint8ClampedArray([1, 2, 3])) === Uint8ClampedArray.prototype;
}

export function getPrototypeOfInt16Array032() {
  return Object.getPrototypeOf(new Int16Array([1, 2, 3])) === Int16Array.prototype;
}

export function getPrototypeOfUint16Array033() {
  return Object.getPrototypeOf(new Uint16Array([1, 2, 3])) === Uint16Array.prototype;
}

export function getPrototypeOfInt32Array034() {
  return Object.getPrototypeOf(new Int32Array([1, 2, 3])) === Int32Array.prototype;
}

export function getPrototypeOfUint32Array035() {
  return Object.getPrototypeOf(new Uint32Array([1, 2, 3])) === Uint32Array.prototype;
}

export function getPrototypeOfFloat32Arr036() {
  return Object.getPrototypeOf(new Float32Array([1.1, 2.2])) === Float32Array.prototype;
}

export function getPrototypeOfFloat64Arr037() {
  return Object.getPrototypeOf(new Float64Array([1.1, 2.2])) === Float64Array.prototype;
}

export function getPrototypeOfBigInt64Arr038() {
  return Object.getPrototypeOf(new BigInt64Array([1n, 2n])) === BigInt64Array.prototype;
}

export function getPrototypeOfBigUint64Arr039() {
  return Object.getPrototypeOf(new BigUint64Array([1n, 2n])) === BigUint64Array.prototype;
}

export function getPrototypeOfArrayBuffer040() {
  return Object.getPrototypeOf(new ArrayBuffer(16)) === ArrayBuffer.prototype;
}

export function getPrototypeOfDataView041() {
  const buffer = new ArrayBuffer(16);
  return Object.getPrototypeOf(new DataView(buffer)) === DataView.prototype;
}

export function getPrototypeOfTwoLayer042() {
  const grandProto = { a: 1 };
  const parentProto = Object.create(grandProto);
  return Object.getPrototypeOf(parentProto) === grandProto;
}

export function getPrototypeOfThreeLayer043() {
  function Grand() {}
  function Parent() {}
  Parent.prototype = Object.create(Grand.prototype);
  return Object.getPrototypeOf(Parent.prototype) === Grand.prototype;
}

export function getPrototypeOfObjectProtoNull044() {
  return Object.getPrototypeOf(Object.prototype) === null;
}

export function getPrototypeOfChainToNull045() {
  const obj = {};
  let current = obj;
  while (Object.getPrototypeOf(current) !== null) {
    current = Object.getPrototypeOf(current);
  }
  return current === Object.prototype;
}

export function getPrototypeOfClassInherit046() {
  class Parent {}
  class Child extends Parent {}
  const child = new Child();
  return {
    childProto: Object.getPrototypeOf(child) === Child.prototype,
    childProtoProto: Object.getPrototypeOf(Child.prototype) === Parent.prototype
  };
}

export function getPrototypeOfMultiClass047() {
  class A {}
  class B extends A {}
  class C extends B {}
  const c = new C();
  return {
    cProto: Object.getPrototypeOf(c) === C.prototype,
    cProtoProto: Object.getPrototypeOf(C.prototype) === B.prototype,
    bProtoProto: Object.getPrototypeOf(B.prototype) === A.prototype
  };
}

export function getPrototypeOfZero048() {
  return Object.getPrototypeOf(0) === Number.prototype;
}

export function getPrototypeOfNegZero049() {
  return Object.getPrototypeOf(-0) === Number.prototype;
}

export function getPrototypeOfNaN050() {
  return Object.getPrototypeOf(NaN) === Number.prototype;
}

export function getPrototypeOfInfinity051() {
  return Object.getPrototypeOf(Infinity) === Number.prototype;
}

export function getPrototypeOfNegInfinity052() {
  return Object.getPrototypeOf(-Infinity) === Number.prototype;
}

export function getPrototypeOfMaxValue053() {
  return Object.getPrototypeOf(Number.MAX_VALUE) === Number.prototype;
}

export function getPrototypeOfMinValue054() {
  return Object.getPrototypeOf(Number.MIN_VALUE) === Number.prototype;
}

export function getPrototypeOfMaxSafeInt055() {
  return Object.getPrototypeOf(Number.MAX_SAFE_INTEGER) === Number.prototype;
}

export function getPrototypeOfMinSafeInt056() {
  return Object.getPrototypeOf(Number.MIN_SAFE_INTEGER) === Number.prototype;
}

export function getPrototypeOfEmptyString057() {
  return Object.getPrototypeOf('') === String.prototype;
}

export function getPrototypeOfSpecialStr058() {
  return Object.getPrototypeOf('!@#$%^&*()') === String.prototype;
}

export function getPrototypeOfUnicodeStr059() {
  return Object.getPrototypeOf('你好世界') === String.prototype;
}

export function getPrototypeOfLongStr060() {
  const longStr = 'a'.repeat(10000);
  return Object.getPrototypeOf(longStr) === String.prototype;
}

export function getPrototypeOfNoArg061() {
  try {
    Object.getPrototypeOf();
    return false;
  } catch (e) {
    return e.name;
  }
}

export function getPrototypeOfNullMsg062() {
  try {
    Object.getPrototypeOf(null);
    return false;
  } catch (e) {
    return e.name;
  }
}

export function getPrototypeOfSetProto063() {
  const obj = {};
  const proto = { a: 1 };
  Object.setPrototypeOf(obj, proto);
  return Object.getPrototypeOf(obj) === proto;
}

export function getPrototypeOfSetNull064() {
  const obj = {};
  Object.setPrototypeOf(obj, null);
  return Object.getPrototypeOf(obj);
}

export function getPrototypeOfCreateProto065() {
  const proto = { a: 1 };
  const obj = Object.create(proto);
  return Object.getPrototypeOf(obj) === proto;
}

export function getPrototypeOfIsProto066() {
  const proto = { a: 1 };
  const obj = Object.create(proto);
  return {
    protoMatch: Object.getPrototypeOf(obj) === proto,
    isProto: proto.isPrototypeOf(obj)
  };
}

export function getPrototypeOfReflect067() {
  const obj = {};
  return Object.getPrototypeOf(obj) === Reflect.getPrototypeOf(obj);
}

export function getPrototypeOfReflectNull068() {
  const obj = Object.create(null);
  return Object.getPrototypeOf(obj) === Reflect.getPrototypeOf(obj);
}

export function getPrototypeOfProtoConsistency069() {
  const obj = {};
  return Object.getPrototypeOf(obj) === obj.__proto__;
}

export function getPrototypeOfConstructorProto070() {
  function Foo() {}
  const foo = new Foo();
  return Object.getPrototypeOf(foo) === foo.constructor.prototype;
}

export function getPrototypeOfFrozen071() {
  const obj = Object.freeze({ a: 1 });
  return Object.getPrototypeOf(obj) === Object.prototype;
}

export function getPrototypeOfSealed072() {
  const obj = Object.seal({ a: 1 });
  return Object.getPrototypeOf(obj) === Object.prototype;
}

export function getPrototypeOfNonExtensible073() {
  const obj = Object.preventExtensions({ a: 1 });
  return Object.getPrototypeOf(obj) === Object.prototype;
}

export function getPrototypeOfProxy074() {
  const target = { a: 1 };
  const handler = {};
  const proxy = new Proxy(target, handler);
  return Object.getPrototypeOf(proxy) === Object.prototype;
}

export function getPrototypeOfProxyTrap075() {
  const target = { a: 1 };
  const customProto = { b: 2 };
  const handler = {
    getPrototypeOf: function() { return customProto; }
  };
  const proxy = new Proxy(target, handler);
  return Object.getPrototypeOf(proxy) === customProto;
}

export function getPrototypeOfProxyTrapNull076() {
  const target = { a: 1 };
  const handler = {
    getPrototypeOf: function() { return null; }
  };
  const proxy = new Proxy(target, handler);
  return Object.getPrototypeOf(proxy);
}

export function getPrototypeOfObjectProtoProto077() {
  return Object.getPrototypeOf(Object.prototype);
}

export function getPrototypeOfFuncProtoProto078() {
  return Object.getPrototypeOf(Function.prototype) === Object.prototype;
}

export function getPrototypeOfArrayProtoProto079() {
  return Object.getPrototypeOf(Array.prototype) === Object.prototype;
}

export function getPrototypeOfStringProtoProto080() {
  return Object.getPrototypeOf(String.prototype) === Object.prototype;
}

export function getPrototypeOfNumberProtoProto081() {
  return Object.getPrototypeOf(Number.prototype) === Object.prototype;
}

export function getPrototypeOfBooleanProtoProto082() {
  return Object.getPrototypeOf(Boolean.prototype) === Object.prototype;
}

export function getPrototypeOfSymbolProtoProto083() {
  return Object.getPrototypeOf(Symbol.prototype) === Object.prototype;
}

export function getPrototypeOfBigIntProtoProto084() {
  return Object.getPrototypeOf(BigInt.prototype) === Object.prototype;
}

export function getPrototypeOfDateProtoProto085() {
  return Object.getPrototypeOf(Date.prototype) === Object.prototype;
}

export function getPrototypeOfRegExpProtoProto086() {
  return Object.getPrototypeOf(RegExp.prototype) === Object.prototype;
}

export function getPrototypeOfErrorProtoProto087() {
  return Object.getPrototypeOf(Error.prototype) === Object.prototype;
}

export function getPrototypeOfMapProtoProto088() {
  return Object.getPrototypeOf(Map.prototype) === Object.prototype;
}

export function getPrototypeOfSetProtoProto089() {
  return Object.getPrototypeOf(Set.prototype) === Object.prototype;
}

export function getPrototypeOfPromiseProtoProto090() {
  return Object.getPrototypeOf(Promise.prototype) === Object.prototype;
}

export function getPrototypeOfObjectConstructor091() {
  return Object.getPrototypeOf(Object) === Function.prototype;
}

export function getPrototypeOfFunctionConstructor092() {
  return Object.getPrototypeOf(Function) === Function.prototype;
}

export function getPrototypeOfArrayConstructor093() {
  return Object.getPrototypeOf(Array) === Function.prototype;
}

export function getPrototypeOfSymbolConstructor094() {
  return Object.getPrototypeOf(Symbol) === Function.prototype;
}

export function getPrototypeOfBigIntConstructor095() {
  return Object.getPrototypeOf(BigInt) === Function.prototype;
}

export function getPrototypeOfTypeErrorProto096() {
  return Object.getPrototypeOf(TypeError.prototype) === Error.prototype;
}

export function getPrototypeOfRangeErrorProto097() {
  return Object.getPrototypeOf(RangeError.prototype) === Error.prototype;
}

export function getPrototypeOfSyntaxErrorProto098() {
  return Object.getPrototypeOf(SyntaxError.prototype) === Error.prototype;
}

export function getPrototypeOfRefErrorProto099() {
  return Object.getPrototypeOf(ReferenceError.prototype) === Error.prototype;
}

export function getPrototypeOfURIErrorProto100() {
  return Object.getPrototypeOf(URIError.prototype) === Error.prototype;
}

export function getPrototypeOfProxyTrapNonObj101() {
  const target = { a: 1 };
  const handler = {
    getPrototypeOf: function(target) { return 'not an object'; }
  };
  const proxy = new Proxy(target, handler);
  try {
    Object.getPrototypeOf(proxy);
    return false;
  } catch (e) {
    return e.name;
  }
}

export function getPrototypeOfFrozenModifyProto102() {
  const obj = Object.freeze({});
  const proto = { a: 1 };
  try {
    Object.setPrototypeOf(obj, proto);
    return false;
  } catch (e) {
    return Object.getPrototypeOf(obj) === Object.prototype;
  }
}

export function getPrototypeOfGlobalThis103() {
  const result = Object.getPrototypeOf(globalThis);
  return result !== null && typeof result === 'object';
}

export function getPrototypeOfJSON104() {
  return Object.getPrototypeOf(JSON) === Object.prototype;
}



export function getPrototypeOfChainDepth106() {
  let depth = 0;
  let current = {};
  while (Object.getPrototypeOf(current) !== null) {
    depth++;
    current = Object.getPrototypeOf(current);
  }
  return depth + 1;
}

export function getPrototypeOfNoCycle107() {
  const seen = new Set();
  let current = {};
  while (current !== null) {
    if (seen.has(current)) return false;
    seen.add(current);
    current = Object.getPrototypeOf(current);
  }
  return true;
}

export function getPrototypeOfChainToNull108() {
  const obj = {};
  let current = obj;
  while (Object.getPrototypeOf(current) !== null) {
    current = Object.getPrototypeOf(current);
  }
  return current === Object.prototype && Object.getPrototypeOf(current) === null;
}

export function getPrototypeOfNullProtoProp109() {
  const obj = Object.create(null);
  return Object.getPrototypeOf(obj) === null && obj.__proto__ === undefined;
}

export function getPrototypeOfSetProtoToNull110() {
  const obj = {};
  Object.setPrototypeOf(obj, null);
  return Object.getPrototypeOf(obj);
}
