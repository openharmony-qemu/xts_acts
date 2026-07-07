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

function _throws(fn, Ctor) {
  try {
    fn();
    return false;
  } catch (e) {
    return e instanceof Ctor;
  }
}

function _deepEqual(a, b) {
  if (Object.is(a, b)) {
    return true;
  }
  if (Number.isNaN(a) && Number.isNaN(b)) {
    return true;
  }
  if (a === null || b === null || a === undefined || b === undefined) {
    return a === b;
  }
  if (Array.isArray(a) && Array.isArray(b)) {
    if (a.length !== b.length) {
      return false;
    }
    for (let i = 0; i < a.length; i++) {
      if (!_deepEqual(a[i], b[i])) {
        return false;
      }
    }
    return true;
  }
  return false;
}

function _json(a) {
  return JSON.stringify(a);
}

function _speciesArraySubclass() {
  return class MyArray extends Array {
    static get [Symbol.species]() {
      return Array;
    }
  };
}

export function ArraySymbolSpeciesJs_0100() {
  const species = Array[Symbol.species];
  return species === Array && typeof species === 'function';
}

export function ArraySymbolSpeciesJs_0101() {
  const sym = Symbol.species;
  return Array[sym] === Array;
}

export function ArraySymbolSpeciesJs_0102() {
  const descriptor = Object.getOwnPropertyDescriptor(Array, Symbol.species);
  return descriptor.enumerable === false;
}

export function ArraySymbolSpeciesJs_0103() {
  const descriptor = Object.getOwnPropertyDescriptor(Array, Symbol.species);
  return descriptor.configurable === true;
}

export function ArraySymbolSpeciesJs_0104() {
  const descriptor = Object.getOwnPropertyDescriptor(Array, Symbol.species);
  return typeof descriptor.get === 'function' && descriptor.set === undefined;
}

export function ArraySymbolSpeciesJs_0105() {
  const species = Array[Symbol.species];
  return typeof species === 'function' && species instanceof Function;
}

export function ArraySymbolSpeciesJs_0106() {
  return Array[Symbol.species] === Array && Array[Symbol.species].name === 'Array';
}

export function ArraySymbolSpeciesJs_0107() {
  const species1 = Array[Symbol.species];
  const species2 = Array[Symbol.species];
  const species3 = Array[Symbol.species];
  return species1 === species2 && species2 === species3;
}

export function ArraySymbolSpeciesJs_0108() {
  const SpeciesConstructor = Array[Symbol.species];
  const arr = new SpeciesConstructor(1, 2, 3);
  return Array.isArray(arr) && _deepEqual(arr, [1, 2, 3]);
}

export function ArraySymbolSpeciesJs_0109() {
  class MyArray extends Array {}
  return MyArray[Symbol.species] === MyArray;
}

export function ArraySymbolSpeciesJs_0110() {
  class MyArray extends Array {}
  const myArr = new MyArray(1, 2, 3);
  return myArr.constructor[Symbol.species] === MyArray;
}

export function ArraySymbolSpeciesJs_0111() {
  class MyArray extends Array {}
  class MySubArray extends MyArray {}
  return MySubArray[Symbol.species] === MySubArray;
}

export function ArraySymbolSpeciesJs_0112() {
  class Level1 extends Array {}
  class Level2 extends Level1 {}
  class Level3 extends Level2 {}
  return Level3[Symbol.species] === Level3;
}

export function ArraySymbolSpeciesJs_0113() {
  class MyArray extends Array {}
  const myArr = new MyArray(1, 2, 3, 4);
  const filtered = myArr.filter(x => x > 2);
  return filtered instanceof MyArray;
}

export function ArraySymbolSpeciesJs_0114() {
  class MyArray extends Array {}
  const myArr = new MyArray(1, 2, 3);
  const mapped = myArr.map(x => x * 2);
  return mapped instanceof MyArray;
}

export function ArraySymbolSpeciesJs_0115() {
  class MyArray extends Array {}
  const myArr = new MyArray(1, 2);
  const concatenated = myArr.concat([3, 4]);
  return concatenated instanceof MyArray;
}

export function ArraySymbolSpeciesJs_0116() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  return MyArray[Symbol.species] === Array && MyArray[Symbol.species] !== MyArray;
}

export function ArraySymbolSpeciesJs_0117() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, 2, 3, 4);
  const filtered = myArr.filter(x => x > 2);
  return filtered instanceof Array && !(filtered instanceof MyArray);
}

export function ArraySymbolSpeciesJs_0118() {
  class CustomArray extends Array {}
  class MyArray extends Array {
    static get [Symbol.species]() { return CustomArray; }
  }
  return MyArray[Symbol.species] === CustomArray;
}

export function ArraySymbolSpeciesJs_0119() {
  class CustomArray extends Array {}
  class MyArray extends Array {
    static get [Symbol.species]() { return CustomArray; }
  }
  const myArr = new MyArray(1, 2, 3);
  const mapped = myArr.map(x => x * 2);
  return mapped instanceof CustomArray && !(mapped instanceof MyArray);
}

export function ArraySymbolSpeciesJs_0120() {
  class MyArray extends Array {
    static get [Symbol.species]() { return null; }
  }
  return MyArray[Symbol.species] === null;
}

export function ArraySymbolSpeciesJs_0121() {
  class MyArray extends Array {
    static get [Symbol.species]() { return undefined; }
  }
  return MyArray[Symbol.species] === undefined;
}

export function ArraySymbolSpeciesJs_0122() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, 2, 3);
  const mapped = myArr.map(x => x * 2);
  return mapped.constructor === Array && _deepEqual(mapped, [2, 4, 6]);
}

export function ArraySymbolSpeciesJs_0123() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray();
  const mapped = myArr.map(x => x);
  return mapped.length === 0 && mapped.constructor === Array;
}

export function ArraySymbolSpeciesJs_0124() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, 2, 3, 4, 5);
  const filtered = myArr.filter(x => x % 2 === 0);
  return filtered.constructor === Array && _deepEqual(filtered, [2, 4]);
}

export function ArraySymbolSpeciesJs_0125() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, 2, 3);
  const filtered = myArr.filter(x => x > 10);
  return filtered.length === 0 && filtered.constructor === Array;
}

export function ArraySymbolSpeciesJs_0126() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, 2);
  const concatenated = myArr.concat([3, 4], [5, 6]);
  return concatenated.constructor === Array && _deepEqual(concatenated, [1, 2, 3, 4, 5, 6]);
}

export function ArraySymbolSpeciesJs_0127() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, 2, 3);
  const concatenated = myArr.concat();
  return concatenated.constructor === Array && _deepEqual(concatenated, [1, 2, 3]);
}

export function ArraySymbolSpeciesJs_0128() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, 2, 3, 4, 5);
  const sliced = myArr.slice(1, 4);
  return sliced.constructor === Array && _deepEqual(sliced, [2, 3, 4]);
}

export function ArraySymbolSpeciesJs_0129() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, 2, 3, 4, 5);
  const sliced = myArr.slice(-3, -1);
  return sliced.constructor === Array && _deepEqual(sliced, [3, 4]);
}

export function ArraySymbolSpeciesJs_0130() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray([1, 2], [3, 4], [5]);
  const flattened = myArr.flat();
  return flattened.constructor === Array && _deepEqual(flattened, [1, 2, 3, 4, 5]);
}

export function ArraySymbolSpeciesJs_0131() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, 2, 3);
  const flatMapped = myArr.flatMap(x => [x, x * 2]);
  return flatMapped.constructor === Array && _deepEqual(flatMapped, [1, 2, 2, 4, 3, 6]);
}

export function ArraySymbolSpeciesJs_0132() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, 2, 3, 4, 5);
  const removed = myArr.splice(1, 3);
  return removed.constructor === Array && _deepEqual(removed, [2, 3, 4]);
}

export function ArraySymbolSpeciesJs_0133() {
  class NotAnArray {
    constructor(length) { this.length = length; }
  }
  const arr = [1, 2, 3];
  arr.constructor = { [Symbol.species]: NotAnArray };
  const mapped = arr.map(x => x * 2);
  return mapped instanceof NotAnArray && mapped.length === 3;
}

export function ArraySymbolSpeciesJs_0134() {
  class NotAnArray {
    constructor(length) { this.length = length; }
  }
  const arr = [1, 2, 3, 4, 5];
  arr.constructor = { [Symbol.species]: NotAnArray };
  const filtered = arr.filter(x => x > 2);
  return filtered instanceof NotAnArray && filtered.length === 0;
}

export function ArraySymbolSpeciesJs_0135() {
  const arr = [1, 2, 3];
  arr.constructor = { [Symbol.species]: Set };
  if (arr.constructor[Symbol.species] !== Set) {
    return false;
  }
  try {
    const mapped = arr.map(x => x);
    return mapped instanceof Set;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function ArraySymbolSpeciesJs_0136() {
  const arr = [1, 2, 3];
  arr.constructor = { [Symbol.species]: Map };
  if (arr.constructor[Symbol.species] !== Map) {
    return false;
  }
  try {
    const mapped = arr.map((x, i) => [i, x]);
    return mapped instanceof Map;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function ArraySymbolSpeciesJs_0137() {
  const handler = {
    construct(target, args) {
      return new target(...args);
    }
  };
  const ProxiedArray = new Proxy(Array, handler);
  class MyArray extends Array {
    static get [Symbol.species]() { return ProxiedArray; }
  }
  const myArr = new MyArray(1, 2, 3);
  const mapped = myArr.map(x => x * 2);
  return mapped instanceof Array && _deepEqual(mapped, [2, 4, 6]);
}

export function ArraySymbolSpeciesJs_0138() {
  function CustomArray(...args) {
    Array.apply(this, args);
    if (args.length === 1 && typeof args[0] === 'number') {
      this.length = args[0];
    } else {
      for (let i = 0; i < args.length; i++) {
        this[i] = args[i];
      }
      this.length = args.length;
    }
  }
  CustomArray.prototype = Object.create(Array.prototype);
  CustomArray.prototype.constructor = CustomArray;
  const BoundCustomArray = CustomArray.bind(null);
  class MyArray extends Array {
    static get [Symbol.species]() { return BoundCustomArray; }
  }
  const myArr = new MyArray(1, 2, 3);
  const mapped = myArr.map(x => x * 2);
  return mapped instanceof CustomArray;
}

export function ArraySymbolSpeciesJs_0139() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray();
  const mapped = myArr.map(x => x);
  return mapped.length === 0 && mapped.constructor === Array;
}

export function ArraySymbolSpeciesJs_0140() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray();
  const filtered = myArr.filter(x => x > 0);
  return filtered.length === 0 && filtered.constructor === Array;
}

export function ArraySymbolSpeciesJs_0141() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(...Array(10000).keys());
  const mapped = myArr.map(x => x * 2);
  return mapped.length === 10000 && mapped.constructor === Array;
}

export function ArraySymbolSpeciesJs_0142() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(10);
  myArr[0] = 1;
  myArr[9] = 10;
  const mapped = myArr.map(x => x * 2);
  return mapped.length === 10 && mapped.constructor === Array && (0 in mapped) && !(5 in mapped);
}

export function ArraySymbolSpeciesJs_0143() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, undefined, 3);
  const mapped = myArr.map(x => x);
  return mapped.constructor === Array && mapped[1] === undefined;
}

export function ArraySymbolSpeciesJs_0144() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, null, 3);
  const mapped = myArr.map(x => x);
  return mapped.constructor === Array && mapped[1] === null;
}

export function ArraySymbolSpeciesJs_0145() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, NaN, 3);
  const mapped = myArr.map(x => x);
  return mapped.constructor === Array && Number.isNaN(mapped[1]);
}

export function ArraySymbolSpeciesJs_0146() {
  let counter = 0;
  class MyArray extends Array {
    static get [Symbol.species]() {
      counter++;
      return counter % 2 === 0 ? Array : MyArray;
    }
  }
  const myArr = new MyArray(1, 2, 3);
  const mapped1 = myArr.map(x => x);
  const mapped2 = myArr.map(x => x);
  return mapped1.constructor === MyArray && mapped2.constructor === Array;
}

export function ArraySymbolSpeciesJs_0147() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const myArr = new MyArray(1, 2, 3);
  myArr.push(myArr);
  const mapped = myArr.map(x => x);
  return mapped.constructor === Array && mapped[3] === myArr;
}

export function ArraySymbolSpeciesJs_0148() {
  class MyArray extends Array {
    static get [Symbol.species]() {
      throw new Error('Species getter error');
    }
  }
  try {
    const species = MyArray[Symbol.species];
    return false;
  } catch (e) {
    return e.message === 'Species getter error';
  }
}

export function ArraySymbolSpeciesJs_0149() {
  class MyArray extends Array {
    static get [Symbol.species]() {
      throw new TypeError('Invalid species');
    }
  }
  try {
    const species = MyArray[Symbol.species];
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function ArraySymbolSpeciesJs_0150() {
  class MyArray extends Array {
    static get [Symbol.species]() { return 'not a constructor'; }
  }
  return typeof MyArray[Symbol.species] === 'string';
}

export function ArraySymbolSpeciesJs_0151() {
  class MyArray extends Array {
    static get [Symbol.species]() { return 42; }
  }
  return typeof MyArray[Symbol.species] === 'number';
}

export function ArraySymbolSpeciesJs_0152() {
  class MyArray extends Array {
    static get [Symbol.species]() { return { not: 'a constructor' }; }
  }
  return typeof MyArray[Symbol.species] === 'object';
}

export function ArraySymbolSpeciesJs_0153() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Symbol('test'); }
  }
  return typeof MyArray[Symbol.species] === 'symbol';
}

export function ArraySymbolSpeciesJs_0154() {
  const desc = Object.getOwnPropertyDescriptor(Array, Symbol.species);
  const hadSpecies = desc !== undefined;
  let result = false;
  try {
    delete Array[Symbol.species];
    result = Array[Symbol.species] === undefined;
  } finally {
    if (hadSpecies && desc.configurable) {
      Object.defineProperty(Array, Symbol.species, desc);
    }
  }
  return result;
}

export function ArraySymbolSpeciesJs_0155() {
  class MyArray extends Array {
    static get [Symbol.species]() { return Array; }
  }
  const before = MyArray[Symbol.species] === Array;
  const desc = Object.getOwnPropertyDescriptor(MyArray, Symbol.species);
  delete MyArray[Symbol.species];
  const after = MyArray[Symbol.species] === MyArray;
  if (desc && desc.configurable) {
    Object.defineProperty(MyArray, Symbol.species, desc);
  }
  return before && after;
}

export function ArraySymbolSpeciesJs_0156() {
  class MyArray extends Array {}
  Object.defineProperty(MyArray, Symbol.species, {
    value: Array,
    writable: false,
    configurable: false
  });
  const before = MyArray[Symbol.species] === Array;
  try {
    MyArray[Symbol.species] = MyArray;
  } catch (e) {
    // strict mode may throw
  }
  return before && MyArray[Symbol.species] === Array;
}

export function ArraySymbolSpeciesJs_0157() {
  class BadConstructor {
    constructor(...args) {
      throw new Error('Constructor error');
    }
  }
  const arr = [1, 2, 3];
  arr.constructor = { [Symbol.species]: BadConstructor };
  try {
    arr.map(x => x * 2);
    return false;
  } catch (e) {
    return e.message === 'Constructor error';
  }
}

export function ArraySymbolSpeciesJs_0158() {
  const arr = [1, 2, 3];
  arr.constructor = null;
  try {
    const mapped = arr.map(x => x * 2);
    return mapped instanceof Array && _deepEqual(mapped, [2, 4, 6]);
  } catch (e) {
    return typeof e.message === 'string';
  }
}
