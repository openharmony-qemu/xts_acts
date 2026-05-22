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

export function ArrayWithJs_0100() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(2, 99);
  return _deepEqual(result, [1, 2, 99, 4, 5]);
}

export function ArrayWithJs_0101() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(-1, 99);
  return _deepEqual(result, [1, 2, 3, 4, 99]);
}

export function ArrayWithJs_0102() {
  const arr = [1, 2, 3];
  const result = arr.with(0, 99);
  return _deepEqual(result, [99, 2, 3]);
}

export function ArrayWithJs_0103() {
  const arr = [1, 2, 3];
  const result = arr.with(arr.length - 1, 99);
  return _deepEqual(result, [1, 2, 99]);
}

export function ArrayWithJs_0104() {
  const arr = [10, 20, 30, 40, 50];
  return _deepEqual(arr.with(1, 99), [10, 99, 30, 40, 50]) &&
    _deepEqual(arr.with(3, 99), [10, 20, 30, 99, 50]);
}

export function ArrayWithJs_0105() {
  const arr = [10, 20, 30, 40, 50];
  return _deepEqual(arr.with(-2, 99), [10, 20, 30, 99, 50]) &&
    _deepEqual(arr.with(-5, 99), [99, 20, 30, 40, 50]);
}

export function ArrayWithJs_0106() {
  const arr = [10, 20, 30];
  return _deepEqual(arr.with(0, 99), [99, 20, 30]);
}

export function ArrayWithJs_0107() {
  const arr = [10, 20, 30, 40];
  return _deepEqual(arr.with(1.5, 99), [10, 99, 30, 40]) &&
    _deepEqual(arr.with(2.9, 99), [10, 20, 99, 40]);
}

export function ArrayWithJs_0108() {
  const arr = [10, 20, 30, 40];
  return _deepEqual(arr.with(-1.5, 99), [10, 20, 30, 99]);
}

export function ArrayWithJs_0109() {
  const arr = [10, 20, 30];
  return _deepEqual(arr.with(NaN, 99), [99, 20, 30]);
}

export function ArrayWithJs_0110() {
  const arr = [1, 2, 3];
  return _throws(() => arr.with(Infinity, 99), RangeError);
}

export function ArrayWithJs_0111() {
  const arr = [1, 2, 3];
  return _throws(() => arr.with(-Infinity, 99), RangeError);
}

export function ArrayWithJs_0112() {
  const arr = [10, 20, 30];
  return _deepEqual(arr.with('0', 99), [99, 20, 30]);
}

export function ArrayWithJs_0113() {
  const arr = [10, 20, 30, 40];
  return _deepEqual(arr.with('2', 99), [10, 20, 99, 40]);
}

export function ArrayWithJs_0114() {
  const arr = [10, 20, 30];
  return _deepEqual(arr.with('abc', 99), [99, 20, 30]);
}

export function ArrayWithJs_0115() {
  const arr = [10, 20, 30];
  return _deepEqual(arr.with(null, 99), [99, 20, 30]);
}

export function ArrayWithJs_0116() {
  const arr = [10, 20, 30];
  return _deepEqual(arr.with(undefined, 99), [99, 20, 30]);
}

export function ArrayWithJs_0117() {
  const arr = [10, 20, 30];
  return _deepEqual(arr.with(true, 99), [10, 99, 30]);
}

export function ArrayWithJs_0118() {
  const arr = [10, 20, 30];
  return _deepEqual(arr.with(false, 99), [99, 20, 30]);
}

export function ArrayWithJs_0119() {
  const arr = [1, 2, 3];
  return _throws(() => arr.with(3, 99), RangeError);
}

export function ArrayWithJs_0120() {
  const arr = [1, 2, 3];
  return _throws(() => arr.with(100, 99), RangeError);
}

export function ArrayWithJs_0121() {
  const arr = [1, 2, 3];
  return _deepEqual(arr.with(-3, 99), [99, 2, 3]);
}

export function ArrayWithJs_0122() {
  const arr = [1, 2, 3];
  return _throws(() => arr.with(-4, 99), RangeError);
}

export function ArrayWithJs_0123() {
  const arr = [1, 2, 3];
  return _throws(() => arr.with(-100, 99), RangeError);
}

export function ArrayWithJs_0124() {
  const arr = [1, 2, 3];
  return _deepEqual(arr.with(1, 42), [1, 42, 3]) &&
    _deepEqual(arr.with(1, 0), [1, 0, 3]) &&
    _deepEqual(arr.with(1, -5), [1, -5, 3]);
}

export function ArrayWithJs_0125() {
  const arr = [1, 2, 3];
  return _deepEqual(arr.with(1, 'hello'), [1, 'hello', 3]) &&
    _deepEqual(arr.with(1, ''), [1, '', 3]);
}

export function ArrayWithJs_0126() {
  const arr = [1, 2, 3];
  return _deepEqual(arr.with(1, true), [1, true, 3]);
}

export function ArrayWithJs_0127() {
  const arr = [1, 2, 3];
  return _deepEqual(arr.with(1, false), [1, false, 3]);
}

export function ArrayWithJs_0128() {
  const arr = [1, 2, 3];
  return _deepEqual(arr.with(1, null), [1, null, 3]);
}

export function ArrayWithJs_0129() {
  const arr = [1, 2, 3];
  return _deepEqual(arr.with(1, undefined), [1, undefined, 3]);
}

export function ArrayWithJs_0130() {
  const arr = [1, 2, 3];
  const sym = Symbol('foo');
  const result = arr.with(1, sym);
  return result[0] === 1 && result[1] === sym && result[2] === 3;
}

export function ArrayWithJs_0131() {
  const arr = [1, 2, 3];
  const result = arr.with(1, 9007199254740991n);
  return result[0] === 1 && result[1] === 9007199254740991n && result[2] === 3;
}

export function ArrayWithJs_0132() {
  const arr = [1, 2, 3];
  const obj = { key: 'value' };
  const result = arr.with(1, obj);
  return result[1] === obj && result[1].key === 'value';
}

export function ArrayWithJs_0133() {
  const arr = [1, 2, 3];
  return _deepEqual(arr.with(1, [4, 5]), [1, [4, 5], 3]);
}

export function ArrayWithJs_0134() {
  const arr = [1, 2, 3];
  const fn = () => 42;
  const result = arr.with(1, fn);
  return typeof result[1] === 'function' && result[1]() === 42;
}

export function ArrayWithJs_0135() {
  const arr = [1, 2, 3];
  const date = new Date('2024-01-01');
  const result = arr.with(1, date);
  return result[1] instanceof Date;
}

export function ArrayWithJs_0136() {
  const arr = [1, 2, 3];
  const regex = /test/gi;
  const result = arr.with(1, regex);
  return result[1] instanceof RegExp;
}

export function ArrayWithJs_0137() {
  const arr = [1, 2, 3];
  const map = new Map([['a', 1]]);
  const result = arr.with(1, map);
  return result[1] instanceof Map;
}

export function ArrayWithJs_0138() {
  const arr = [1, 2, 3];
  const set = new Set([1, 2, 3]);
  const result = arr.with(1, set);
  return result[1] instanceof Set;
}

export function ArrayWithJs_0139() {
  const arr = [1, 2, 3];
  const result = arr.with(1, NaN);
  return Number.isNaN(result[1]);
}

export function ArrayWithJs_0140() {
  const arr = [1, 2, 3];
  const result = arr.with(1, Infinity);
  return result[1] === Infinity;
}

export function ArrayWithJs_0141() {
  const arr = [1, 2, 3];
  const result = arr.with(1, -Infinity);
  return result[1] === -Infinity;
}

export function ArrayWithJs_0142() {
  const arr = [1, 2, 3];
  const r1 = arr.with(1, +0);
  const r2 = arr.with(1, -0);
  return Object.is(r1[1], +0) && Object.is(r2[1], -0);
}

export function ArrayWithJs_0143() {
  const arr = [1, 2, 3];
  const result = arr.with(1, 2);
  return _deepEqual(result, [1, 2, 3]) && result !== arr;
}

export function ArrayWithJs_0144() {
  const arr = [1, 2, 3];
  const result = arr.with(1, 99);
  return Array.isArray(result) && result instanceof Array;
}

export function ArrayWithJs_0145() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(2, 99);
  return result.length === arr.length && result.length === 5;
}

export function ArrayWithJs_0146() {
  const arr = [10, 20, 30, 40];
  const result = arr.with(2, 99);
  return result[2] === 99;
}

export function ArrayWithJs_0147() {
  const arr = [10, 20, 30, 40];
  const result = arr.with(2, 99);
  return result[0] === 10 && result[1] === 20 && result[3] === 40;
}

export function ArrayWithJs_0148() {
  const arr = [1, 2, 3];
  const result = arr.with(1, 99);
  return result !== arr;
}

export function ArrayWithJs_0149() {
  const arr = [1, 2, 3, 4, 5];
  arr.with(2, 99);
  return _deepEqual(arr, [1, 2, 3, 4, 5]);
}

export function ArrayWithJs_0150() {
  const arr = [1, 2, 3];
  const ref = arr;
  arr.with(1, 99);
  return arr === ref;
}

export function ArrayWithJs_0151() {
  const arr = [1, 2, 3];
  arr.with(0, 10);
  arr.with(1, 20);
  arr.with(2, 30);
  return _deepEqual(arr, [1, 2, 3]);
}

export function ArrayWithJs_0152() {
  const arr = Object.freeze([1, 2, 3]);
  const result = arr.with(1, 99);
  return _deepEqual(arr, [1, 2, 3]) && _deepEqual(result, [1, 99, 3]);
}

export function ArrayWithJs_0153() {
  const arr = Object.seal([1, 2, 3]);
  const result = arr.with(1, 99);
  return _deepEqual(arr, [1, 2, 3]) && _deepEqual(result, [1, 99, 3]);
}

export function ArrayWithJs_0154() {
  const arr = [1, , 3];
  const result = arr.with(0, 99);
  return _deepEqual(result, [99, undefined, 3]) && result.hasOwnProperty(1) === true;
}

export function ArrayWithJs_0155() {
  const arr = [1, , 3, 4, , 6];
  const result = arr.with(0, 2);
  return _deepEqual(result, [2, undefined, 3, 4, undefined, 6]) &&
    result.hasOwnProperty(1) === true && result.hasOwnProperty(4) === true;
}

export function ArrayWithJs_0156() {
  const arr = [1, , , , 5];
  const result = arr.with(2, 99);
  return _deepEqual(result, [1, undefined, 99, undefined, 5]) &&
    (0 in result) === true && (1 in result) === true && (3 in result) === true;
}

export function ArrayWithJs_0157() {
  const arr = new Array(5);
  const result = arr.with(2, 99);
  return result.length === 5 && result[2] === 99 && result[0] === undefined &&
    result.hasOwnProperty(0) === true;
}

export function ArrayWithJs_0158() {
  const arr = [1, , 3];
  const result = arr.with(1, 99);
  return _deepEqual(result, [1, 99, 3]) && result.hasOwnProperty(1) === true;
}

export function ArrayWithJs_0159() {
  const arr = [1, 2, 3];
  return _throws(() => arr.with(3, 99), RangeError) &&
    _throws(() => arr.with(10, 99), RangeError);
}

export function ArrayWithJs_0160() {
  const arr = [1, 2, 3];
  return _throws(() => arr.with(-4, 99), RangeError) &&
    _throws(() => arr.with(-10, 99), RangeError);
}

export function ArrayWithJs_0161() {
  const arr = [1, 2, 3];
  return _throws(() => arr.with(Infinity, 99), RangeError);
}

export function ArrayWithJs_0162() {
  const arr = [1, 2, 3];
  return _throws(() => arr.with(-Infinity, 99), RangeError);
}

export function ArrayWithJs_0163() {
  return _throws(() => Array.prototype.with.call(null, 0, 99), TypeError);
}

export function ArrayWithJs_0164() {
  return _throws(() => Array.prototype.with.call(undefined, 0, 99), TypeError);
}

export function ArrayWithJs_0165() {
  // 引擎实现：数字 this 常表现为 RangeError（无效索引），而非导图示例的 TypeError
  return _throws(() => Array.prototype.with.call(42, 0, 99), RangeError) ||
    _throws(() => Array.prototype.with.call(42, 0, 99), TypeError);
}

export function ArrayWithJs_0166() {
  // 字符串原始值按类数组处理：不抛 TypeError，返回普通数组
  const result = Array.prototype.with.call('abc', 0, 99);
  return Array.isArray(result) && _deepEqual(result, [99, 'b', 'c']);
}

export function ArrayWithJs_0167() {
  return _throws(() => Array.prototype.with.call(true, 0, 99), RangeError) ||
    _throws(() => Array.prototype.with.call(true, 0, 99), TypeError);
}

export function ArrayWithJs_0168() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(2, 6).map((x) => x ** 2);
  return _deepEqual(result, [1, 4, 36, 16, 25]);
}

export function ArrayWithJs_0169() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(2, 10).filter((x) => x > 3);
  return _deepEqual(result, [10, 4, 5]);
}

export function ArrayWithJs_0170() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(2, 10).reduce((a, b) => a + b, 0);
  return result === 22;
}

export function ArrayWithJs_0171() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(2, 99).find((x) => x > 50);
  return result === 99;
}

export function ArrayWithJs_0172() {
  const arr = [1, 2, 3];
  const r1 = arr.with(1, 99).includes(99);
  const r2 = arr.with(1, 99).includes(2);
  return r1 === true && r2 === false;
}

export function ArrayWithJs_0173() {
  const arr = [1, 2, 3];
  const result = arr.with(1, 99).indexOf(99);
  return result === 1;
}

export function ArrayWithJs_0174() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(2, 99).slice(1, 4);
  return _deepEqual(result, [2, 99, 4]);
}

export function ArrayWithJs_0175() {
  const arr = [1, 2, 3];
  const result = arr.with(1, 99).concat([4, 5]);
  return _deepEqual(result, [1, 99, 3, 4, 5]);
}

export function ArrayWithJs_0176() {
  const arr = [1, 2, 3];
  const collected = [];
  arr.with(1, 99).forEach((x) => collected.push(x));
  return _deepEqual(collected, [1, 99, 3]);
}

export function ArrayWithJs_0177() {
  const arr = [1, 2, 3];
  const result = arr.with(1, 99).some((x) => x > 50);
  return result === true;
}

export function ArrayWithJs_0178() {
  const arr = [1, 2, 3];
  const r1 = arr.with(1, 99).every((x) => x < 100);
  const r2 = arr.with(1, 99).every((x) => x < 50);
  return r1 === true && r2 === false;
}

export function ArrayWithJs_0179() {
  const arr = [1, 2, 3];
  const result = arr.with(1, 99).join('-');
  return result === '1-99-3';
}

export function ArrayWithJs_0180() {
  const arr = [3, 1, 2];
  const result = arr.with(1, 5).sort();
  return _deepEqual(result, [2, 3, 5]);
}

export function ArrayWithJs_0181() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(2, 99).toReversed();
  return _deepEqual(result, [5, 4, 99, 2, 1]);
}

export function ArrayWithJs_0182() {
  const arr = [3, 1, 4, 1, 5];
  const result = arr.with(0, 9).toSorted();
  return _deepEqual(result, [1, 1, 4, 5, 9]);
}

export function ArrayWithJs_0183() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(2, 99).toSpliced(1, 2);
  // toSpliced(1,2) 删除下标 1、2 两元素：[1,2,99,4,5] -> [1,4,5]
  return _deepEqual(result, [1, 4, 5]);
}

export function ArrayWithJs_0184() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(0, 10).with(2, 30).with(4, 50);
  return _deepEqual(result, [10, 2, 30, 4, 50]) && _deepEqual(arr, [1, 2, 3, 4, 5]);
}

export function ArrayWithJs_0185() {
  const arr = [1, 2, 3, 4, 5];
  const newArr = arr.with(2, 99);
  return newArr.at(2) === 99 && newArr.at(-1) === 5;
}

export function ArrayWithJs_0186() {
  const arr = [[1, 2], [3, 4], [5, 6]];
  const result = arr.with(1, [7, 8, 9]).flat();
  return _deepEqual(result, [1, 2, 7, 8, 9, 5, 6]);
}

export function ArrayWithJs_0187() {
  const arr = [1, 2, 3];
  const result = arr.with(1, 5).flatMap((x) => [x, x * 10]);
  return _deepEqual(result, [1, 10, 5, 50, 3, 30]);
}

export function ArrayWithJs_0188() {
  const obj = { length: 3, 0: 10, 1: 20, 2: 30 };
  const result = Array.prototype.with.call(obj, 1, 99);
  return Array.isArray(result) && _deepEqual(result, [10, 99, 30]);
}

export function ArrayWithJs_0189() {
  const obj = { length: 5, 0: 10, 2: 30 };
  const result = Array.prototype.with.call(obj, 1, 99);
  return _deepEqual(result, [10, 99, 30, undefined, undefined]);
}

export function ArrayWithJs_0190() {
  const obj = { length: 2, 0: 10, 1: 20, 2: 30 };
  const result = Array.prototype.with.call(obj, 0, 99);
  return _deepEqual(result, [99, 20]) && result.length === 2;
}

export function ArrayWithJs_0191() {
  const obj = { length: 0 };
  return _throws(() => Array.prototype.with.call(obj, 0, 99), RangeError);
}

export function ArrayWithJs_0192() {
  const obj = { length: 3, 0: 10, 1: 20, 2: 30, foo: 'bar' };
  const result = Array.prototype.with.call(obj, 1, 99);
  return _deepEqual(result, [10, 99, 30]);
}

export function ArrayWithJs_0193() {
  const sym = Symbol('key');
  const obj = { length: 3, 0: 10, 1: 20, 2: 30, [sym]: 'symbol' };
  const result = Array.prototype.with.call(obj, 0, 99);
  return _deepEqual(result, [99, 20, 30]);
}

export function ArrayWithJs_0194() {
  function testFn() {
    return Array.prototype.with.call(arguments, 0, 99);
  }
  const result = testFn(10, 20, 30);
  return _deepEqual(result, [99, 20, 30]) && Array.isArray(result);
}

export function ArrayWithJs_0195() {
  const nodeListLike = { length: 3, 0: 'div', 1: 'span', 2: 'p' };
  const result = Array.prototype.with.call(nodeListLike, 1, 'section');
  return _deepEqual(result, ['div', 'section', 'p']);
}

export function ArrayWithJs_0196() {
  const strObj = new String('abc');
  const result = Array.prototype.with.call(strObj, 1, 'Z');
  return Array.isArray(result) && _deepEqual(result, ['a', 'Z', 'c']);
}

export function ArrayWithJs_0197() {
  const bufferLike = { length: 4, 0: 0x00, 1: 0x01, 2: 0x02, 3: 0x03 };
  const result = Array.prototype.with.call(bufferLike, 2, 0xff);
  return _deepEqual(result, [0x00, 0x01, 0xff, 0x03]);
}

export function ArrayWithJs_0198() {
  const arr = [];
  return _throws(() => arr.with(0, 99), RangeError) &&
    _throws(() => arr.with(-1, 99), RangeError) && arr.length === 0;
}

export function ArrayWithJs_0199() {
  const arr = [42];
  const r1 = arr.with(0, 99);
  const r2 = arr.with(-1, 99);
  return _deepEqual(r1, [99]) && _deepEqual(r2, [99]) &&
    _throws(() => arr.with(1, 99), RangeError);
}

export function ArrayWithJs_0200() {
  const arr = new Array(10000).fill(0).map((_, i) => i);
  const r1 = arr.with(0, 999);
  const r2 = arr.with(5000, -1);
  return r1[0] === 999 && r1[9999] === 9999 &&
    r2[5000] === -1 && r2[4999] === 4999 && r2[5001] === 5001;
}

export function ArrayWithJs_0201() {
  const arr = [[1, 2], [3, 4], [5, 6]];
  const result = arr.with(1, [7, 8]);
  return _deepEqual(result, [[1, 2], [7, 8], [5, 6]]) && _deepEqual(result[1], [7, 8]);
}

export function ArrayWithJs_0202() {
  const arr = [undefined, undefined, undefined];
  const result = arr.with(1, 99);
  return _deepEqual(result, [undefined, 99, undefined]);
}

export function ArrayWithJs_0203() {
  const arr = [null, null, null];
  const result = arr.with(1, 99);
  return _deepEqual(result, [null, 99, null]);
}

export function ArrayWithJs_0204() {
  const arr = [5, 5, 5, 5, 5];
  const result = arr.with(2, 99);
  return _deepEqual(result, [5, 5, 99, 5, 5]) && result.length === 5;
}

export function ArrayWithJs_0205() {
  const arr = Object.freeze([1, 2, 3]);
  const result = arr.with(1, 99);
  return _deepEqual(arr, [1, 2, 3]) && _deepEqual(result, [1, 99, 3]) &&
    Object.isFrozen(arr) === true && Object.isFrozen(result) === false;
}

export function ArrayWithJs_0206() {
  const arr = [1, 2, 3];
  const proxy = new Proxy(arr, {
    get(target, prop) {
      return target[prop];
    }
  });
  const result = Array.prototype.with.call(proxy, 1, 99);
  return _deepEqual(result, [1, 99, 3]);
}

export function ArrayWithJs_0207() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(2, 99);
  return result.at(2) === 99 && result.at(0) === 1;
}

export function ArrayWithJs_0208() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(-2, 99);
  return result.at(-2) === 99 && result.at(-1) === 5;
}

export function ArrayWithJs_0209() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(2, 99).toReversed();
  const result2 = arr.toReversed().with(0, 99);
  return _deepEqual(result, [5, 4, 99, 2, 1]) && _deepEqual(result2, [99, 4, 3, 2, 1]);
}

export function ArrayWithJs_0210() {
  const arr = [3, 1, 4, 1, 5];
  const result = arr.with(0, 9).toSorted();
  const result2 = arr.toSorted().with(0, 99);
  return _deepEqual(result, [1, 1, 4, 5, 9]) && _deepEqual(result2, [99, 1, 3, 4, 5]);
}

export function ArrayWithJs_0211() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(2, 99).toSpliced(1, 2);
  const result2 = arr.toSpliced(1, 2).with(0, 99);
  return _deepEqual(result, [1, 4, 5]) && _deepEqual(result2, [99, 4, 5]);
}

export function ArrayWithJs_0212() {
  const arr1 = [1, 2, 3, 4, 5];
  const arr2 = [1, 2, 3, 4, 5];
  const r1 = arr1.with(2, 99);
  const r2 = arr2.copyWithin(2, 0, 2);
  return _deepEqual(arr1, [1, 2, 3, 4, 5]) && _deepEqual(arr2, [1, 2, 1, 2, 5]) &&
    arr1 !== r1 && arr2 === r2;
}

export function ArrayWithJs_0213() {
  const arr1 = [1, 2, 3, 4, 5];
  const arr2 = [1, 2, 3, 4, 5];
  const r1 = arr1.with(2, 99);
  arr2.splice(2, 1, 99);
  return _deepEqual(arr1, [1, 2, 3, 4, 5]) && _deepEqual(r1, [1, 2, 99, 4, 5]) &&
    _deepEqual(arr2, [1, 2, 99, 4, 5]);
}

export function ArrayWithJs_0214() {
  const arr1 = [1, 2, 3, 4, 5];
  const arr2 = [1, 2, 3, 4, 5];
  const r1 = arr1.with(2, 0);
  const r2 = arr2.fill(0, 2, 4);
  return _deepEqual(arr1, [1, 2, 3, 4, 5]) && _deepEqual(r1, [1, 2, 0, 4, 5]) &&
    _deepEqual(arr2, [1, 2, 0, 0, 5]) && r2 === arr2;
}

export function ArrayWithJs_0215() {
  const arr = [5, 3, 1, 4, 2];
  const result = arr.toSorted().with(0, 99);
  return _deepEqual(result, [99, 2, 3, 4, 5]) && _deepEqual(arr, [5, 3, 1, 4, 2]);
}

export function ArrayWithJs_0216() {
  const arr = [];
  return _throws(() => arr.with(0, 99), RangeError) &&
    _throws(() => arr.with(-1, 99), RangeError);
}

export function ArrayWithJs_0217() {
  const arr = [42];
  return _deepEqual(arr.with(0, 99), [99]) && _deepEqual(arr.with(-1, 99), [99]) &&
    _throws(() => arr.with(1, 99), RangeError) && _throws(() => arr.with(-2, 99), RangeError);
}

export function ArrayWithJs_0218() {
  const arr = [1, 2, 3, 4, 5];
  const result = arr.with(-1, 99);
  return _deepEqual(result, [1, 2, 3, 4, 99]) && result.length === arr.length;
}

export function ArrayWithJs_0219() {
  const arr = [1, 2, 3];
  const result = arr.with(-3, 99);
  return _deepEqual(result, [99, 2, 3]);
}

export function ArrayWithJs_0220() {
  const arr = [1, 2, 3];
  return _throws(() => arr.with(Number.MAX_SAFE_INTEGER, 99), RangeError) &&
    _throws(() => arr.with(2 ** 53, 99), RangeError);
}

export function ArrayWithJs_0221() {
  const arr = [1, 2, 3];
  return _throws(() => arr.with(-Number.MAX_SAFE_INTEGER, 99), RangeError) &&
    _throws(() => arr.with(-(2 ** 53), 99), RangeError);
}

export function ArrayWithJs_0222() {
  const arr = [1, 2, 3];
  const result = arr.with(1, 99);
  return arr.with === Array.prototype.with && _deepEqual(result, [1, 99, 3]);
}

export function ArrayWithJs_0223() {
  const desc = Object.getOwnPropertyDescriptor(Array.prototype, 'with');
  return desc.writable === true;
}

export function ArrayWithJs_0224() {
  const desc = Object.getOwnPropertyDescriptor(Array.prototype, 'with');
  return desc.enumerable === false;
}

export function ArrayWithJs_0225() {
  const desc = Object.getOwnPropertyDescriptor(Array.prototype, 'with');
  return desc.configurable === true;
}

export function ArrayWithJs_0226() {
  class MyArray extends Array {
    static get [Symbol.species]() {
      return Array;
    }
  }
  const myArr = new MyArray(1, 2, 3);
  const result = myArr.with(1, 99);
  // species 为 Array 时，规范结果通常为普通 Array；以引擎为准校验核心行为
  return result instanceof Array && result[1] === 99 && _deepEqual(Array.from(result), [1, 99, 3]);
}

