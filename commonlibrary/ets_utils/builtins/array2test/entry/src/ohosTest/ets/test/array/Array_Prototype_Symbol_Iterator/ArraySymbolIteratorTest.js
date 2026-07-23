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
  if (a === null || b === null) {
    return a === b;
  }
  if (a === undefined || b === undefined) {
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

export function ArraySymbolIteratorJs_0100() {
  const arr = [1, 2, 3];
  const iter = arr[Symbol.iterator]();
  return iter !== null && typeof iter === 'object' && typeof iter.next === 'function';
}

export function ArraySymbolIteratorJs_0101() {
  const arr = [1, 2, 3];
  const iter = arr[Symbol.iterator]();
  return iter[Symbol.toStringTag] === 'Array Iterator' &&
    Object.prototype.toString.call(iter) === '[object Array Iterator]';
}

export function ArraySymbolIteratorJs_0102() {
  const arr = [1, 2, 3];
  const iter1 = arr[Symbol.iterator]();
  const iter2 = arr[Symbol.iterator]();
  return iter1 !== iter2;
}

export function ArraySymbolIteratorJs_0103() {
  const desc = Object.getOwnPropertyDescriptor(Array.prototype, Symbol.iterator);
  return typeof desc.value === 'function' && desc.writable === true &&
    desc.configurable === true && desc.enumerable === false;
}

export function ArraySymbolIteratorJs_0104() {
  const arr = ['a', 'b', 'c'];
  const result = [];
  for (const v of arr[Symbol.iterator]()) {
    result.push(v);
  }
  return _json(result) === _json(['a', 'b', 'c']);
}

export function ArraySymbolIteratorJs_0105() {
  const arr = [10, 20, 30];
  const iter = arr[Symbol.iterator]();
  return iter.next().value === 10 && iter.next().value === 20 && iter.next().value === 30;
}

export function ArraySymbolIteratorJs_0106() {
  const arr = ['x', 'y', 'z'];
  const iter = arr[Symbol.iterator]();
  return iter.next().value === 'x' && iter.next().value === 'y' && iter.next().value === 'z' &&
    iter.next().done === true;
}

export function ArraySymbolIteratorJs_0107() {
  const arr = [1, 2, 3];
  const iter = arr[Symbol.iterator]();
  const r1 = iter.next();
  return typeof iter.next === 'function' && r1.value === 1 && r1.done === false;
}

export function ArraySymbolIteratorJs_0108() {
  const arr = [1, 2, 3];
  const iter = arr[Symbol.iterator]('ignored', 42);
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return _json(result) === '[1,2,3]';
}

export function ArraySymbolIteratorJs_0109() {
  const arr = ['x'];
  const iter = arr[Symbol.iterator]();
  const result = iter.next();
  return 'value' in result && 'done' in result && typeof result.done === 'boolean';
}

export function ArraySymbolIteratorJs_0110() {
  const arr = ['a', 'b', 'c'];
  const iter = arr[Symbol.iterator]();
  return iter.next().value === 'a' && iter.next().value === 'b' && iter.next().value === 'c' &&
    iter.next().done === true;
}

export function ArraySymbolIteratorJs_0111() {
  const arr = [1];
  const iter = arr[Symbol.iterator]();
  const r = iter.next();
  return r.done === false && r.value === 1;
}

export function ArraySymbolIteratorJs_0112() {
  const arr = [1];
  const iter = arr[Symbol.iterator]();
  iter.next();
  const r = iter.next();
  return r.done === true && r.value === undefined;
}

export function ArraySymbolIteratorJs_0113() {
  const arr = [];
  const iter = arr[Symbol.iterator]();
  const r = iter.next();
  return r.done === true && r.value === undefined;
}

export function ArraySymbolIteratorJs_0114() {
  const arr = [1];
  const iter = arr[Symbol.iterator]();
  iter.next();
  iter.next();
  const r = iter.next();
  return r.done === true && r.value === undefined;
}

export function ArraySymbolIteratorJs_0115() {
  const arr = [42, 'hello', true];
  const iter = arr[Symbol.iterator]();
  return iter.next().value === 42 && iter.next().value === 'hello' && iter.next().value === true;
}

export function ArraySymbolIteratorJs_0116() {
  const arr = [1];
  const iter = arr[Symbol.iterator]();
  iter.next();
  return iter.next().value === undefined;
}

export function ArraySymbolIteratorJs_0117() {
  const arr = [1, 2, 3];
  const iter = arr[Symbol.iterator]();
  return typeof iter[Symbol.iterator] === 'function';
}

export function ArraySymbolIteratorJs_0118() {
  const arr = [1, 2, 3];
  const iter = arr[Symbol.iterator]();
  return iter[Symbol.iterator]() === iter;
}

export function ArraySymbolIteratorJs_0119() {
  const arr = [1, 2, 3];
  const iter = arr[Symbol.iterator]();
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return _json(result) === '[1,2,3]';
}

export function ArraySymbolIteratorJs_0120() {
  const arr = [10, 20, 30];
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return _json(result) === '[10,20,30]';
}

export function ArraySymbolIteratorJs_0121() {
  const arr = [1, 2, 3];
  for (const v of arr) {
    void v;
  }
  return _json(arr) === '[1,2,3]';
}

export function ArraySymbolIteratorJs_0122() {
  const arr = ['a', 'b', 'c'];
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return result[0] === 'a' && result[1] === 'b' && result[2] === 'c';
}

export function ArraySymbolIteratorJs_0123() {
  const arr = ['a', 'b', 'c', 'd', 'e'];
  const iter = arr[Symbol.iterator]();
  const first = [];
  for (const v of iter) {
    first.push(v);
    if (v === 'b') {
      break;
    }
  }
  const second = [];
  for (const v of iter) {
    second.push(v);
  }
  return _json(first) === _json(['a', 'b']) && _json(second) === _json(['c', 'd', 'e']);
}

export function ArraySymbolIteratorJs_0124() {
  const arr = [1, 2, 3];
  const iter = arr[Symbol.iterator]();
  for (const v of iter) {
    break;
  }
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return _json(result) === '[2,3]';
}

export function ArraySymbolIteratorJs_0125() {
  const arr = [1, 2, 3, 4, 5, 6];
  const iter = arr[Symbol.iterator]();
  const r1 = [];
  for (const v of iter) {
    r1.push(v);
    if (v === 2) {
      break;
    }
  }
  const r2 = [];
  for (const v of iter) {
    r2.push(v);
    if (v === 4) {
      break;
    }
  }
  const r3 = [];
  for (const v of iter) {
    r3.push(v);
  }
  return _json(r1) === '[1,2]' && _json(r2) === '[3,4]' && _json(r3) === '[5,6]';
}

export function ArraySymbolIteratorJs_0126() {
  const arr = [1, 2, 3, 4, 5];
  const result = [];
  for (const v of arr) {
    if (v % 2 === 0) {
      continue;
    }
    result.push(v);
  }
  return _json(result) === '[1,3,5]';
}

export function ArraySymbolIteratorJs_0127() {
  const arr = [1, 2, 3];
  const iter = arr[Symbol.iterator]();
  const collected = [];
  try {
    for (const v of iter) {
      collected.push(v);
      if (v === 2) {
        throw new Error('test');
      }
    }
  } catch (e) {
    void e;
  }
  const remaining = [];
  for (const v of iter) {
    remaining.push(v);
  }
  return _json(collected) === '[1,2]' && _json(remaining) === '[3]';
}

export function ArraySymbolIteratorJs_0128() {
  const arr = [1, 2, 3];
  const iter = arr[Symbol.iterator]();
  for (const v of iter) {
    void v;
  }
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return result.length === 0;
}

export function ArraySymbolIteratorJs_0129() {
  const arr = [1];
  const iter = arr[Symbol.iterator]();
  iter.next();
  iter.next();
  return iter.next().done === true && iter.next().done === true;
}

export function ArraySymbolIteratorJs_0130() {
  const arr = ['x'];
  const iter = arr[Symbol.iterator]();
  iter.next();
  iter.next();
  const r1 = iter.next();
  const r2 = iter.next();
  return r1.value === undefined && r1.done === true && r2.value === undefined && r2.done === true;
}

export function ArraySymbolIteratorJs_0131() {
  const arr = ['a', 'b', 'c'];
  const iter = arr[Symbol.iterator]();
  const first = [];
  for (const v of iter) {
    first.push(v);
  }
  const second = [];
  for (const v of iter) {
    second.push(v);
  }
  return _json(first) === _json(['a', 'b', 'c']) && second.length === 0;
}

export function ArraySymbolIteratorJs_0132() {
  const arr = [1, 2, 3, 4, 5];
  const iter = arr[Symbol.iterator]();
  iter.next();
  iter.next();
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return _json(result) === '[3,4,5]';
}

export function ArraySymbolIteratorJs_0133() {
  return Array.prototype.values === Array.prototype[Symbol.iterator];
}

export function ArraySymbolIteratorJs_0134() {
  const arr = [1, 2, 3];
  return arr.values === arr[Symbol.iterator];
}

export function ArraySymbolIteratorJs_0135() {
  const arr = [1, 2, 3];
  const vIter = arr.values();
  const sIter = arr[Symbol.iterator]();
  return vIter[Symbol.toStringTag] === sIter[Symbol.toStringTag] &&
    vIter[Symbol.toStringTag] === 'Array Iterator';
}

export function ArraySymbolIteratorJs_0136() {
  const arr = [1, 2, 3];
  const vIter = arr.values();
  const sIter = arr[Symbol.iterator]();
  return vIter.next().value === sIter.next().value &&
    vIter.next().value === sIter.next().value &&
    vIter.next().value === sIter.next().value;
}

export function ArraySymbolIteratorJs_0137() {
  const arr = [1, 2, 3];
  const fromForOf = [];
  for (const v of arr) {
    fromForOf.push(v);
  }
  const fromIterator = [];
  for (const v of arr[Symbol.iterator]()) {
    fromIterator.push(v);
  }
  return _json(fromForOf) === _json(fromIterator);
}

export function ArraySymbolIteratorJs_0138() {
  const arr = [1, 2, 3];
  arr[Symbol.iterator] = function* () {
    yield 99;
  };
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return _json(result) === '[99]';
}

export function ArraySymbolIteratorJs_0139() {
  const arr = [1, 2, 3];
  const iter = arr[Symbol.iterator]();
  arr[Symbol.iterator] = function* () {
    yield 99;
  };
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return _json(result) === '[1,2,3]';
}

export function ArraySymbolIteratorJs_0140() {
  const arr = [1, 2.5, -3, 0];
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return _json(result) === '[1,2.5,-3,0]';
}

export function ArraySymbolIteratorJs_0141() {
  const arr = ['hello', 'world', ''];
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return _json(result) === _json(['hello', 'world', '']);
}

export function ArraySymbolIteratorJs_0142() {
  const arr = [true, false];
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return _json(result) === '[true,false]';
}

export function ArraySymbolIteratorJs_0143() {
  const arr = [1n, 2n, 3n];
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return result[0] === 1n && result[1] === 2n && result[2] === 3n;
}

export function ArraySymbolIteratorJs_0144() {
  const obj = { key: 'value' };
  const arr = [obj];
  const iter = arr[Symbol.iterator]();
  const r = iter.next();
  return r.value === obj && r.value.key === 'value';
}

export function ArraySymbolIteratorJs_0145() {
  const arr = [[1, 2], [3, 4]];
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return _json(result) === '[[1,2],[3,4]]' && result[0] !== result[1];
}

export function ArraySymbolIteratorJs_0146() {
  const fn = () => 42;
  const arr = [fn];
  const iter = arr[Symbol.iterator]();
  const r = iter.next();
  return r.value === fn && r.value() === 42;
}

export function ArraySymbolIteratorJs_0147() {
  const date = new Date('2024-01-01');
  const arr = [date];
  const iter = arr[Symbol.iterator]();
  return iter.next().value === date && iter.next().value === undefined;
}

export function ArraySymbolIteratorJs_0148() {
  const arr = [1, 'two', true, null, { a: 1 }, [2]];
  const types = [];
  for (const v of arr) {
    types.push(typeof v);
  }
  return _json(types) === '["number","string","boolean","object","object","object"]';
}

export function ArraySymbolIteratorJs_0149() {
  const arr = [undefined, undefined];
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return result.length === 2 && result[0] === undefined && result[1] === undefined;
}

export function ArraySymbolIteratorJs_0150() {
  const arr = [null, null];
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return result.length === 2 && result[0] === null && result[1] === null;
}

export function ArraySymbolIteratorJs_0151() {
  const arr = [NaN];
  const iter = arr[Symbol.iterator]();
  const r = iter.next();
  return Number.isNaN(r.value);
}

export function ArraySymbolIteratorJs_0152() {
  const sym = Symbol('test');
  const arr = [sym];
  const iter = arr[Symbol.iterator]();
  return iter.next().value === sym;
}

export function ArraySymbolIteratorJs_0153() {
  const regex = /test/gi;
  const arr = [regex];
  const iter = arr[Symbol.iterator]();
  return iter.next().value === regex;
}

export function ArraySymbolIteratorJs_0154() {
  const arr = [Infinity, -Infinity];
  const result = [...arr];
  return result[0] === Infinity && result[1] === -Infinity;
}

export function ArraySymbolIteratorJs_0155() {
  const arr = [1, , , 4];
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return result.length === 4 && result[0] === 1 && result[1] === undefined &&
    result[2] === undefined && result[3] === 4;
}

export function ArraySymbolIteratorJs_0156() {
  const arr = ['a', , 'c'];
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return result[0] === 'a' && result[1] === undefined && result[2] === 'c';
}

export function ArraySymbolIteratorJs_0157() {
  const arr = new Array(3);
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return result.length === 3 && result.every((v) => v === undefined);
}

export function ArraySymbolIteratorJs_0158() {
  const arr = Array(5);
  const iter = arr[Symbol.iterator]();
  for (let i = 0; i < 5; i++) {
    const r = iter.next();
    if (r.value !== undefined || r.done !== false) {
      return false;
    }
  }
  return iter.next().done === true;
}

export function ArraySymbolIteratorJs_0159() {
  const arr = [, , 'a', 'b'];
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return result[0] === undefined && result[1] === undefined && result[2] === 'a' && result[3] === 'b';
}

export function ArraySymbolIteratorJs_0160() {
  const arr = ['a', 'b', , ];
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return result.length === 3 && result[0] === 'a' && result[1] === 'b' && result[2] === undefined;
}

export function ArraySymbolIteratorJs_0161() {
  const sparse = [1, , 3];
  const explicit = [1, undefined, 3];
  const sparseVals = [];
  for (const v of sparse) {
    sparseVals.push(v);
  }
  const explicitVals = [];
  for (const v of explicit) {
    explicitVals.push(v);
  }
  return sparseVals[0] === explicitVals[0] && sparseVals[1] === explicitVals[1] &&
    sparseVals[2] === explicitVals[2];
}

export function ArraySymbolIteratorJs_0162() {
  const arr = ['a', 'b', 'c'];
  delete arr[1];
  const result = [...arr];
  return result[0] === 'a' && result[1] === undefined && result[2] === 'c';
}

export function ArraySymbolIteratorJs_0163() {
  const arr = [];
  const iter = arr[Symbol.iterator]();
  const r = iter.next();
  return r.done === true && r.value === undefined;
}

export function ArraySymbolIteratorJs_0164() {
  const arr = [];
  let count = 0;
  for (const v of arr) {
    count++;
  }
  return count === 0;
}

export function ArraySymbolIteratorJs_0165() {
  const arr = [];
  const spread = [...arr];
  return Array.isArray(spread) && spread.length === 0;
}

export function ArraySymbolIteratorJs_0166() {
  const arr = [42];
  const iter = arr[Symbol.iterator]();
  const r1 = iter.next();
  const r2 = iter.next();
  return r1.value === 42 && r1.done === false && r2.value === undefined && r2.done === true;
}

export function ArraySymbolIteratorJs_0167() {
  const arr = [undefined];
  const iter = arr[Symbol.iterator]();
  const r = iter.next();
  return r.value === undefined && r.done === false && iter.next().done === true;
}

export function ArraySymbolIteratorJs_0168() {
  const arr = [''];
  const iter = arr[Symbol.iterator]();
  return iter.next().value === '' && iter.next().done === true;
}

export function ArraySymbolIteratorJs_0169() {
  const arr = [0];
  const iter = arr[Symbol.iterator]();
  return iter.next().value === 0 && iter.next().done === true;
}

export function ArraySymbolIteratorJs_0170() {
  const size = 10000;
  const arr = Array.from({ length: size }, (_, i) => i);
  let count = 0;
  for (const v of arr) {
    if (v !== count) {
      return false;
    }
    count++;
  }
  return count === size;
}

export function ArraySymbolIteratorJs_0171() {
  const arr = new Array(1000);
  arr[0] = 'first';
  arr[999] = 'last';
  let count = 0;
  let undefinedCount = 0;
  for (const v of arr) {
    if (v === undefined) {
      undefinedCount++;
    }
    count++;
  }
  return count === 1000 && undefinedCount === 998;
}

export function ArraySymbolIteratorJs_0172() {
  const arr = ['a', 'b', 'c'];
  const iter = arr[Symbol.iterator]();
  if (iter.next().value !== 'a') {
    return false;
  }
  arr[1] = 'B';
  return iter.next().value === 'B' && iter.next().value === 'c';
}

export function ArraySymbolIteratorJs_0173() {
  const arr = [1, 2, 3];
  const iter = arr[Symbol.iterator]();
  if (iter.next().value !== 1) {
    return false;
  }
  arr[0] = 100;
  return iter.next().value === 2 && iter.next().value === 3;
}

export function ArraySymbolIteratorJs_0174() {
  const arr = ['a', 'b', 'c'];
  const iter = arr[Symbol.iterator]();
  iter.next();
  arr[1] = 'modified';
  const r = iter.next();
  return r.value === 'modified';
}

export function ArraySymbolIteratorJs_0175() {
  const arr = [1, 2, 3];
  const result = [];
  let pushDone = false;
  for (const v of arr) {
    result.push(v);
    if (!pushDone) {
      arr.push(4);
      pushDone = true;
    }
  }
  return result.includes(4);
}

export function ArraySymbolIteratorJs_0176() {
  const arr = ['a', 'b'];
  const result = [];
  for (const v of arr) {
    result.push(v);
    if (v === 'a') {
      arr[2] = 'c';
    }
  }
  return _json(result) === _json(['a', 'b', 'c']);
}

export function ArraySymbolIteratorJs_0177() {
  const arr = ['a', 'b', 'c'];
  const iter = arr[Symbol.iterator]();
  iter.next();
  delete arr[1];
  return iter.next().value === undefined;
}

export function ArraySymbolIteratorJs_0178() {
  const arr = ['a', 'b', 'c'];
  const iter = arr[Symbol.iterator]();
  iter.next();
  arr.pop();
  const r = iter.next();
  const r2 = iter.next();
  return r.value === 'b' && r2.done === true;
}

export function ArraySymbolIteratorJs_0179() {
  const arr = ['a', 'b', 'c'];
  const iter = arr[Symbol.iterator]();
  iter.next();
  arr.shift();
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return result.length > 0;
}

export function ArraySymbolIteratorJs_0180() {
  const arr = ['a', 'b', 'c', 'd'];
  const iter = arr[Symbol.iterator]();
  iter.next();
  arr.splice(1, 1);
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return result.length > 0;
}

export function ArraySymbolIteratorJs_0181() {
  const arr = ['a', 'b', 'c', 'd'];
  const result = [];
  for (const v of arr) {
    result.push(v);
    if (v === 'b') {
      arr.length = 2;
    }
  }
  return _json(result) === _json(['a', 'b']);
}

export function ArraySymbolIteratorJs_0182() {
  const arr = [1, 2, 3];
  const result = [];
  for (const v of arr) {
    result.push(v);
    if (v === 1) {
      arr.length = 10;
    }
  }
  // 迭代过程中增大 length 后，for-of 会继续按新 length 产出空洞为 undefined（与导图示例不同，以引擎为准）
  return result.length === 10 &&
    _json(result) === '[1,2,3,null,null,null,null,null,null,null]';
}

export function ArraySymbolIteratorJs_0183() {
  const arr = ['a', 'b', 'c'];
  const result = [];
  for (const v of arr) {
    result.push(v);
    if (v === 'a') {
      arr.length = 0;
    }
  }
  return _json(result) === '["a"]';
}

export function ArraySymbolIteratorJs_0184() {
  const arrayLike = { length: 3, 0: 'a', 1: 'b', 2: 'c' };
  const iter = Array.prototype[Symbol.iterator].call(arrayLike);
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return _json(result) === _json(['a', 'b', 'c']);
}

export function ArraySymbolIteratorJs_0185() {
  const arrayLike = { length: 2, 0: 'a', 1: 'b', 2: 'c' };
  const iter = Array.prototype[Symbol.iterator].call(arrayLike);
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return _json(result) === _json(['a', 'b']);
}

export function ArraySymbolIteratorJs_0186() {
  function testFn() {
    const iter = Array.prototype[Symbol.iterator].call(arguments);
    const result = [];
    for (const v of iter) {
      result.push(v);
    }
    return result;
  }
  return _json(testFn(1, 2, 3)) === '[1,2,3]';
}

export function ArraySymbolIteratorJs_0187() {
  const arrayLike = { length: 2, 0: 'first', 1: 'second' };
  const iter = Array.prototype[Symbol.iterator].call(arrayLike);
  return iter.next().value === 'first' && iter.next().value === 'second' && iter.next().done === true;
}

export function ArraySymbolIteratorJs_0188() {
  const str = 'abc';
  const iter = Array.prototype[Symbol.iterator].call(str);
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return _json(result) === _json(['a', 'b', 'c']);
}

export function ArraySymbolIteratorJs_0189() {
  const iter = Array.prototype[Symbol.iterator].call('');
  return iter.next().done === true;
}

export function ArraySymbolIteratorJs_0190() {
  const obj = { length: 3 };
  const iter = Array.prototype[Symbol.iterator].call(obj);
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return result.length === 3 && result.every((v) => v === undefined);
}

export function ArraySymbolIteratorJs_0191() {
  const obj = { length: 0, 0: 'a' };
  const iter = Array.prototype[Symbol.iterator].call(obj);
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return result.length === 0;
}

export function ArraySymbolIteratorJs_0192() {
  const obj = { length: 2.7, 0: 'a', 1: 'b', 2: 'c' };
  const iter = Array.prototype[Symbol.iterator].call(obj);
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return result.length === 2 && result[0] === 'a' && result[1] === 'b';
}

export function ArraySymbolIteratorJs_0193() {
  return _throws(() => Array.prototype[Symbol.iterator].call(null), TypeError);
}

export function ArraySymbolIteratorJs_0194() {
  return _throws(() => Array.prototype[Symbol.iterator].call(undefined), TypeError);
}

export function ArraySymbolIteratorJs_0195() {
  const iter = Array.prototype[Symbol.iterator].call(42);
  const r = iter.next();
  return r.done === true;
}

export function ArraySymbolIteratorJs_0196() {
  const iter = Array.prototype[Symbol.iterator].call(true);
  const r = iter.next();
  return r.done === true;
}

export function ArraySymbolIteratorJs_0197() {
  const obj = { length: -1, 0: 'a' };
  const iter = Array.prototype[Symbol.iterator].call(obj);
  const r = iter.next();
  return r.done === true;
}

export function ArraySymbolIteratorJs_0198() {
  const obj = { length: NaN, 0: 'a' };
  const iter = Array.prototype[Symbol.iterator].call(obj);
  const r = iter.next();
  return r.done === true;
}

export function ArraySymbolIteratorJs_0199() {
  const obj = { length: Infinity, 0: 'a', 1: 'b' };
  const iter = Array.prototype[Symbol.iterator].call(obj);
  return iter.next().value === 'a' && iter.next().value === 'b' && iter.next().value === undefined;
}

export function ArraySymbolIteratorJs_0200() {
  const obj = { length: '3', 0: 'a', 1: 'b', 2: 'c' };
  const iter = Array.prototype[Symbol.iterator].call(obj);
  const result = [];
  for (const v of iter) {
    result.push(v);
  }
  return result.length === 3 && result[0] === 'a' && result[1] === 'b' && result[2] === 'c';
}

export function ArraySymbolIteratorJs_0201() {
  const arr = [1, 2, 3];
  arr[Symbol.iterator] = function* () {
    for (let i = this.length - 1; i >= 0; i--) {
      yield this[i];
    }
  };
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return _json(result) === '[3,2,1]';
}

export function ArraySymbolIteratorJs_0202() {
  const arr = [1, 2, 3];
  arr[Symbol.iterator] = function* () {
    yield 'x';
    yield 'y';
  };
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return _json(result) === '["x","y"]';
}

export function ArraySymbolIteratorJs_0203() {
  const arr = [1, 2, 3];
  arr[Symbol.iterator] = function* () {
    /* empty */
  };
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return result.length === 0;
}

export function ArraySymbolIteratorJs_0204() {
  const arr = [10, 20, 30];
  let callCount = 0;
  arr[Symbol.iterator] = function* () {
    callCount++;
    yield* [100, 200];
  };
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return callCount === 1 && _json(result) === '[100,200]';
}

export function ArraySymbolIteratorJs_0205() {
  const arr = [1, 2, 3];
  arr[Symbol.iterator] = function* () {
    yield 99;
  };
  delete arr[Symbol.iterator];
  const result = [...arr];
  return _json(result) === '[1,2,3]';
}

export function ArraySymbolIteratorJs_0206() {
  const obj = Object.create(null);
  obj.length = 2;
  obj[0] = 'a';
  obj[1] = 'b';
  return _throws(() => {
    for (const v of obj) {
      void v;
    }
  }, TypeError);
}

export function ArraySymbolIteratorJs_0207() {
  const arr = [1, 2, 3];
  arr[Symbol.iterator] = function () {
    return { next: 'not a function' };
  };
  return _throws(() => {
    for (const v of arr) {
      void v;
    }
  }, TypeError);
}

export function ArraySymbolIteratorJs_0208() {
  const arr = [1, 2, 3];
  arr[Symbol.iterator] = function () {
    let idx = 0;
    const self = this;
    return {
      next() {
        return idx < self.length
          ? { value: self[idx++] * 10, done: false }
          : { value: undefined, done: true };
      },
      [Symbol.iterator]() {
        return this;
      }
    };
  };
  const result = [];
  for (const v of arr) {
    result.push(v);
  }
  return _json(result) === '[10,20,30]';
}

export function ArraySymbolIteratorJs_0209() {
  const arr = ['a', 'b', 'c'];
  const kIter = arr.keys();
  const eIter = arr.entries();
  const vIter = arr.values();
  const sIter = arr[Symbol.iterator]();
  return kIter !== eIter && eIter !== vIter && vIter !== sIter;
}

export function ArraySymbolIteratorJs_0210() {
  const arr = [1, 2, 3];
  const vResult = [...arr.values()];
  const sResult = [...arr[Symbol.iterator]()];
  return _json(vResult) === _json(sResult);
}

export function ArraySymbolIteratorJs_0211() {
  const arr = ['x', 'y', 'z'];
  const vIter = arr.values();
  const sIter = arr[Symbol.iterator]();
  return vIter.next().value === 'x' && sIter.next().value === 'x' &&
    vIter.next().value === 'y' && sIter.next().value === 'y';
}

export function ArraySymbolIteratorJs_0212() {
  const arr = [1, 2, 3];
  return arr.hasOwnProperty(Symbol.iterator) === false &&
    Array.prototype.hasOwnProperty(Symbol.iterator) === true &&
    typeof Array.prototype[Symbol.iterator] === 'function';
}

export function ArraySymbolIteratorJs_0213() {
  class MyArray extends Array {}
  const myArr = new MyArray(1, 2, 3);
  const result = [...myArr];
  return _json(result) === '[1,2,3]' && myArr[Symbol.iterator] === Array.prototype[Symbol.iterator];
}

export function ArraySymbolIteratorJs_0214() {
  class MyArray extends Array {
    *[Symbol.iterator]() {
      for (let i = this.length - 1; i >= 0; i--) {
        yield this[i];
      }
    }
  }
  const myArr = new MyArray(1, 2, 3);
  const result = [];
  for (const v of myArr) {
    result.push(v);
  }
  return _json(result) === '[3,2,1]';
}

export function ArraySymbolIteratorJs_0215() {
  const arr = [1, 2, 3];
  const spread = [...arr];
  return _json(spread) === '[1,2,3]' && spread !== arr;
}

export function ArraySymbolIteratorJs_0216() {
  const arr = [1, 2, 3, 4, 5];
  const iter = arr[Symbol.iterator]();
  iter.next();
  iter.next();
  const rest = [...iter];
  return _json(rest) === '[3,4,5]';
}

export function ArraySymbolIteratorJs_0217() {
  const arr1 = [1, 2];
  const arr2 = [3, 4];
  const merged = [...arr1, ...arr2];
  return _json(merged) === '[1,2,3,4]';
}

export function ArraySymbolIteratorJs_0218() {
  function sum(a, b, c) {
    return a + b + c;
  }
  const arr = [1, 2, 3];
  return sum(...arr) === 6;
}

export function ArraySymbolIteratorJs_0219() {
  const arr = [1, 2, 3];
  const result = [0, ...arr, 4];
  return _json(result) === '[0,1,2,3,4]';
}

export function ArraySymbolIteratorJs_0220() {
  const arr = [1, 2, 3];
  const [a, b, c] = arr;
  return a === 1 && b === 2 && c === 3;
}

export function ArraySymbolIteratorJs_0221() {
  const arr = [1, 2, 3, 4];
  const [first, ...rest] = arr;
  return first === 1 && _json(rest) === '[2,3,4]';
}

export function ArraySymbolIteratorJs_0222() {
  const arr = [1, 2, 3];
  const [, second, third] = arr;
  return second === 2 && third === 3;
}

export function ArraySymbolIteratorJs_0223() {
  const arr = [1];
  const [a, b = 99] = arr;
  return a === 1 && b === 99;
}

export function ArraySymbolIteratorJs_0224() {
  const arr = [1, [2, 3], 4];
  const [a, [b, c], d] = arr;
  return a === 1 && b === 2 && c === 3 && d === 4;
}

export function ArraySymbolIteratorJs_0225() {
  const arr = [1];
  const iter = arr[Symbol.iterator]();
  iter.next();
  iter.next();
  const [a] = iter;
  return a === undefined;
}

export function ArraySymbolIteratorJs_0226() {
  const arr = [1, 2, 3];
  const newArr = Array.from(arr);
  return _json(newArr) === '[1,2,3]' && newArr !== arr;
}

export function ArraySymbolIteratorJs_0227() {
  const arr = [1, 2, 3];
  const doubled = Array.from(arr, (x) => x * 2);
  return _json(doubled) === '[2,4,6]';
}

export function ArraySymbolIteratorJs_0228() {
  const arr = [1, 2, 3, 4, 5];
  const iter = arr[Symbol.iterator]();
  iter.next();
  const rest = Array.from(iter);
  return _json(rest) === '[2,3,4,5]';
}

export function ArraySymbolIteratorJs_0229() {
  const arr = [1, 2, 2, 3, 3];
  const set = new Set(arr);
  return set.size === 3 && set.has(1) && set.has(2) && set.has(3);
}

export function ArraySymbolIteratorJs_0230() {
  const arr = [['a', 1], ['b', 2]];
  const map = new Map(arr);
  return map.get('a') === 1 && map.get('b') === 2 && map.size === 2;
}

export function ArraySymbolIteratorJs_0231() {
  const obj1 = {};
  const obj2 = {};
  const arr = [obj1, obj2];
  const ws = new WeakSet(arr);
  return ws.has(obj1) && ws.has(obj2);
}

export function ArraySymbolIteratorJs_0232() {
  const key1 = {};
  const key2 = {};
  const arr = [[key1, 'val1'], [key2, 'val2']];
  const wm = new WeakMap(arr);
  return wm.get(key1) === 'val1' && wm.get(key2) === 'val2';
}

export function ArraySymbolIteratorJs_0237() {
  function* gen() {
    yield 'start';
    yield* [1, 2, 3];
    yield 'end';
  }
  const result = [...gen()];
  return _json(result) === '["start",1,2,3,"end"]';
}

export function ArraySymbolIteratorJs_0238() {
  function* gen() {
    const arr = ['a', 'b', 'c'];
    const iter = arr[Symbol.iterator]();
    iter.next();
    yield* iter;
  }
  const result = [...gen()];
  return _json(result) === '["b","c"]';
}

export function ArraySymbolIteratorJs_0239() {
  function* flatten(arr) {
    for (const item of arr) {
      if (Array.isArray(item)) {
        yield* flatten(item);
      } else {
        yield item;
      }
    }
  }
  const result = [...flatten([1, [2, 3], [4, [5]]])];
  return _json(result) === '[1,2,3,4,5]';
}

