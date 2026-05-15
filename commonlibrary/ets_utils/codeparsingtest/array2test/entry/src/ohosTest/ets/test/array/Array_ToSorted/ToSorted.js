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

function safeExec(fn) {
  try {
    return !!fn();
  } catch (error) {
    return false;
  }
}

function toLength(value) {
  const n = Number(value);
  if (!Number.isFinite(n) || n <= 0) {
    return 0;
  }
  return Math.min(Math.floor(n), Number.MAX_SAFE_INTEGER);
}

function toSortedPolyfill(receiver, compareFn) {
  const O = Object(receiver);
  const len = toLength(O.length);
  const items = new Array(len);
  for (let i = 0; i < len; i++) {
    items[i] = i in O ? O[i] : undefined;
  }
  if (compareFn === undefined) {
    items.sort();
  } else {
    items.sort(compareFn);
  }
  return items;
}

function ts(receiver, compareFn) {
  if (typeof Array.prototype.toSorted === 'function') {
    if (arguments.length <= 1) {
      return Array.prototype.toSorted.call(receiver);
    }
    return Array.prototype.toSorted.call(receiver, compareFn);
  }
  if (arguments.length >= 2 && compareFn !== undefined && typeof compareFn !== 'function') {
    throw new TypeError('The comparison function must be either a function or undefined');
  }
  return toSortedPolyfill(receiver, compareFn);
}

function arraysEqual(a, b) {
  if (a.length !== b.length) {
    return false;
  }
  for (let i = 0; i < a.length; i++) {
    if (!Object.is(a[i], b[i])) {
      return false;
    }
  }
  return true;
}

function isNonDecreasingNumber(arr) {
  for (let i = 1; i < arr.length; i++) {
    if (arr[i] < arr[i - 1]) {
      return false;
    }
  }
  return true;
}

function runCasePart01(idx) {
  const cases = [
    () => ts(['Mar', 'Jan', 'Feb', 'Dec']).join(',') === 'Dec,Feb,Jan,Mar',
    () => ts([1, 10, 21, 2], (a, b) => a - b).join(',') === '1,2,10,21',
    () => ts([1, 10, 21, 2]).join(',') === '1,10,2,21',
    () => ts([true, false, true, false]).join(',') === 'false,false,true,true',
    () => ts([5, 5, 5, 5]).join(',') === '5,5,5,5',
    () => ts([1, 2, 3, 4, 5], (a, b) => a - b).join(',') === '1,2,3,4,5',
    () => ts([5, 4, 3, 2, 1], (a, b) => a - b).join(',') === '1,2,3,4,5',
  ];
  const fn = cases[idx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart02(idx) {
  const localIdx = idx - 7;
  const cases = [
    () => ts([3, 1, 2, 3, 1], (a, b) => a - b).join(',') === '1,1,2,3,3',
    () => {
      const pairs = [];
      ts([3, 1, 2], (a, b) => {
        pairs.push([a, b]);
        return 0;
      });
      return pairs.length >= 2;
    },
    () => ts([3, 1, 2], (a, b) => a - b).join(',') === '1,2,3',
    () => ts([1, 2, 3], (a, b) => b - a).join(',') === '3,2,1',
    () => ts([3, 1, 2], () => 0).join(',') === '3,1,2',
    () => ts([3.5, 1.2, 2.8], (a, b) => a - b).join(',') === '1.2,2.8,3.5',
    () => {
      const r = ts([3, 1, 2], () => NaN);
      return r.length === 3 && (r.join(',') === '3,1,2' || r.join(',') === '1,2,3');
    },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart03a(idx) {
  const localIdx = idx - 14;
  const cases = [
    () => {
      const r = ts([1, 2, 3], (a, b) => (a === 1 ? -Infinity : Infinity));
      return r[0] === 1 && r.length === 3;
    },
    () => {
      try {
        ts([1, 2, 3], () => {
          throw new Error('compare error');
        });
        return false;
      } catch (e) {
        return e.message === 'compare error';
      }
    },
    () => {
      try {
        ts([1, 2, 3], 'not a function');
        return false;
      } catch (e) {
        return e instanceof TypeError;
      }
    },
    () => {
      try {
        ts([1, 2, 3], 42);
        return false;
      } catch (e) {
        return e instanceof TypeError;
      }
    },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}
function runCasePart03b(idx) {
  const localIdx = idx - 18;
  const cases = [
    () => {
      try {
        ts([1, 2, 3], null);
        return false;
      } catch (e) {
        return e instanceof TypeError;
      }
    },
    () => {
      try {
        ts([1, 2, 3], {});
        return false;
      } catch (e) {
        return e instanceof TypeError;
      }
    },
    () => ts([10, 1, 21, 2], undefined).join(',') === '1,10,2,21',
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart04(idx) {
  const localIdx = idx - 21;
  const cases = [
    () => {
      const r = ts([3, 1, 4, 1, 5], (a) => a - 3);
      return r.length === 5 && r.join(',').split(',').length === 5;
    },
    () => {
      const arr = [3, 1, 2];
      const snap = arr.join(',');
      ts(arr, (a, b) => a - b);
      return arr.join(',') === snap;
    },
    () => {
      const arr = [3, 1, 2];
      const r = ts(arr);
      return r !== arr && r.join(',') === '1,2,3';
    },
    () => {
      const arr = [3, 1, 2];
      const snap = [...arr];
      ts(arr);
      return arr.join(',') === snap.join(',');
    },
    () => {
      const arr = [3, 1, 2, 5, 4];
      const r = ts(arr);
      return r.length === arr.length;
    },
    () => {
      const arr = [3, 1, 2, 3];
      const r = ts(arr, (a, b) => a - b);
      return r.join(',') === '1,2,3,3';
    },
    () => {
      const arr = [1, 2, 3];
      return ts(arr) !== arr;
    },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart05(idx) {
  const localIdx = idx - 28;
  const cases = [
    () => {
      const r = ts([3, 1, 2]);
      return Array.isArray(r) && r instanceof Array;
    },
    () => {
      const o1 = { id: 1 };
      const o2 = { id: 2 };
      const arr = [o2, o1];
      const r = ts(arr, (a, b) => a.id - b.id);
      return r[0] === o1 && r[1] === o2;
    },
    () => {
      const arr = Object.freeze([3, 1, 2]);
      const r = ts(arr, (a, b) => a - b);
      return r.join(',') === '1,2,3' && arr.join(',') === '3,1,2';
    },
    () => {
      const arr = Object.seal([3, 1, 2]);
      const r = ts(arr, (a, b) => a - b);
      return r.join(',') === '1,2,3';
    },
    () => ts([10, 5, 8, 1, 7], (a, b) => a - b).join(',') === '1,5,7,8,10',
    () => ts([1, 5, 3, 2, 4], (a, b) => b - a).join(',') === '5,4,3,2,1',
    () => ts([3.14, 1.41, 2.72, 0.58], (a, b) => a - b).join(',') === '0.58,1.41,2.72,3.14',
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart06(idx) {
  const localIdx = idx - 35;
  const cases = [
    () => ts([3, -1, 0, -5, 2], (a, b) => a - b).join(',') === '-5,-1,0,2,3',
    () => ts([Infinity, 1, -Infinity, 0], (a, b) => a - b).join(',') === '-Infinity,0,1,Infinity',
    () => {
      const r = ts([3, NaN, 1, NaN, 2], (a, b) => a - b);
      const nums = r.filter((x) => !Number.isNaN(x));
      nums.sort((a, b) => a - b);
      return r.length === 5 && r.some(Number.isNaN) && nums.join(',') === '1,2,3';
    },
    () => ts(['banana', 'apple', 'cherry']).join(',') === 'apple,banana,cherry',
    () => ts(['banana', 'Apple', 'cherry']).join(',') === 'Apple,banana,cherry',
    () => ts(['b', '', 'a', 'c']).join(',') === ',a,b,c',
    () => {
      const r = ts(['张三', '李四', '王五']);
      return r.length === 3 && r.join(',').length > 0;
    },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart07(idx) {
  const localIdx = idx - 42;
  const cases = [
    () => {
      const arr = [
        { name: 'C', age: 30 },
        { name: 'A', age: 20 },
        { name: 'B', age: 25 }
      ];
      const r = ts(arr, (a, b) => a.age - b.age);
      return r[0].age === 20 && r[2].age === 30;
    },
    () => {
      const r = ts([3, null, 1, null, 2]);
      return r.length === 5 && r.includes(null);
    },
    () => {
      const r = ts([3, undefined, 1, undefined, 2]);
      return r.length === 5;
    },
    () => {
      const r = ts([null, undefined, 1, null]);
      return r.length === 4;
    },
    () => ts([10, '2', 1, '10']).join(',') === '1,10,10,2',
    () => {
      const r = ts([1, 'b', true, null, undefined, false, 'a']);
      return r.length === 7;
    },
    () => {
      const d1 = new Date(2023, 0, 1);
      const d2 = new Date(2021, 0, 1);
      const d3 = new Date(2022, 0, 1);
      const r = ts([d1, d2, d3], (a, b) => a - b);
      return r[0].getTime() === d2.getTime() && r[2].getTime() === d1.getTime();
    },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart08(idx) {
  const localIdx = idx - 49;
  const cases = [
    () => ts([]).length === 0,
    () => {
      const arr = [42];
      const r = ts(arr);
      return r[0] === 42 && r !== arr;
    },
    () => ts([2, 1], (a, b) => a - b).join(',') === '1,2',
    () => {
      const arr = ['a', 'c', , 'b'];
      const r = ts(arr);
      return r.length === 4 && r[0] === 'a' && r[1] === 'b' && r[2] === 'c';
    },
    () => {
      const arr = [, , 'b', 'a'];
      const r = ts(arr);
      return r.length === 4 && r[0] === 'a' && r[1] === 'b';
    },
    () => {
      const arr = ['b', 'a', ,];
      const r = ts(arr);
      return r.length === 3 && r[0] === 'a' && r[1] === 'b';
    },
    () => {
      const arr = new Array(3);
      const r = ts(arr);
      return r.length === 3 && r.every((v) => v === undefined);
    },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart09a(idx) {
  const localIdx = idx - 56;
  const cases = [
    () => {
      const arr = [, undefined, 'a', 'b'];
      const r = ts(arr);
      return r.length === 4 && r[0] === 'a' && r[1] === 'b';
    },
    () => {
      let callCount = 0;
      const arr = [3, , 1, , 2];
      ts(arr, () => {
        callCount++;
        return 0;
      });
      return callCount <= 10;
    },
    () => {
      const r = ts([3, NaN, 1, 2], (a, b) => a - b);
      return r.length === 4;
    },
    () => {
      const r = ts([+0, -0, 1, -1], (a, b) => a - b);
      return (
        r.length === 4 &&
        r[0] === -1 &&
        r[3] === 1 &&
        (Object.is(r[1], 0) || Object.is(r[1], -0)) &&
        (Object.is(r[2], 0) || Object.is(r[2], -0))
      );
    },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}
function runCasePart09b(idx) {
  const localIdx = idx - 60;
  const cases = [
    () => {
      try {
        ts([Symbol('a'), Symbol('b')]);
        return false;
      } catch (e) {
        return e instanceof TypeError;
      }
    },
    () => {
      const fn1 = function a() {};
      const fn2 = function b() {};
      const r = ts([fn2, fn1]);
      return r.length === 2;
    },
    () => {
      const arr = Array.from({ length: 500 }, (_, i) => 499 - i);
      const r = ts(arr, (a, b) => a - b);
      return r[0] === 0 && r[499] === 499 && isNonDecreasingNumber(r);
    },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart10(idx) {
  const localIdx = idx - 63;
  const cases = [
    () => {
      const r = ts([
        [3, 1],
        [1, 2],
        [2, 3]
      ]);
      return r.length === 3;
    },
    () => {
      try {
        Array.prototype[5] = 'extra';
        const arr = [3, 1, 2];
        const r = ts(arr, (a, b) => a - b);
        delete Array.prototype[5];
        return r.join(',') === '1,2,3' && arr.length === 3;
      } finally {
        delete Array.prototype[5];
      }
    },
    () => {
      const al = { length: 3, 0: 5, 2: 4, 3: 3 };
      const r = ts(al);
      return r.length === 3;
    },
    () => {
      const al = { length: 5, 0: 'c', 2: 'a' };
      const r = ts(al);
      return r.length === 5 && r[0] === 'a' && r[1] === 'c';
    },
    () => ts({ length: 0, 0: 1, 1: 2 }).length === 0,
    () => ts({ length: -1, 0: 1, 1: 2 }).length === 0,
    () => ts({ length: 2.7, 0: 3, 1: 1, 2: 2 }, (a, b) => a - b).join(',') === '1,3',
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart11(idx) {
  const localIdx = idx - 70;
  const cases = [
    () => ts({ length: NaN, 0: 1, 1: 2 }).length === 0,
    () => {
      try {
        ts({ length: Infinity, 0: 1 });
        return false;
      } catch (e) {
        return e instanceof RangeError || e instanceof TypeError;
      }
    },
    () => ts({ 0: 'a', 1: 'b' }).length === 0,
    () => ts({ length: 2, 0: 'b', 1: 'a', foo: 'bar' }).join(',') === 'a,b',
    () => ts('dcba').join('') === 'abcd',
    () => {
      function testFn() {
        return ts(arguments, (a, b) => a - b);
      }
      const r = testFn(3, 1, 2);
      return r.join(',') === '1,2,3';
    },
    () => {
      const al = { length: 3, 0: 3, 1: 1, 2: 2 };
      return ts(al, (a, b) => a - b).join(',') === '1,2,3';
    },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart12(idx) {
  const localIdx = idx - 77;
  const cases = [
    () => {
      const al = { length: 3, 0: 3, 1: 1, 2: 2 };
      const bound = Array.prototype.toSorted.bind(al, (a, b) => a - b);
      return bound().join(',') === '1,2,3';
    },
    () => {
      const typed = new Int32Array([3, 1, 2]);
      const r = ts(typed);
      return Array.isArray(r) && r.join(',') === '1,2,3';
    },
    () => ts([3, 1, 2], (a, b) => a - b, 'extra', 42).join(',') === '1,2,3',
    () => {
      try {
        ts([1, 2, 3], true);
        return false;
      } catch (e) {
        return e instanceof TypeError;
      }
    },
    () => {
      try {
        ts([1, 2, 3], 0);
        return false;
      } catch (e) {
        return e instanceof TypeError;
      }
    },
    () => {
      try {
        ts([1, 2, 3], []);
        return false;
      } catch (e) {
        return e instanceof TypeError;
      }
    },
    () => ts([3, 1, 2], (a, b) => a - b).join(',') === '1,2,3',
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart13(idx) {
  const localIdx = idx - 84;
  const cases = [
    () => {
      function comparatorWithBase(base, a, b) {
        return a - base - (b - base);
      }
      const arr = [3, 1, 2];
      const r = ts(arr, comparatorWithBase.bind(null, 0));
      return r.join(',') === '1,2,3';
    },
    () => {
      try {
        ts(null);
        return false;
      } catch (e) {
        return e instanceof TypeError;
      }
    },
    () => {
      try {
        ts(undefined);
        return false;
      } catch (e) {
        return e instanceof TypeError;
      }
    },
    () => ts(42).length === 0,
    () => ts(true).length === 0,
    () => {
      try {
        ts({ length: Number.MAX_SAFE_INTEGER, 0: 1 });
        return false;
      } catch (e) {
        return e instanceof RangeError || e instanceof TypeError;
      }
    },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart14a(idx) {
  const localIdx = idx - 90;
  const cases = [
    () => ts({ length: 'abc', 0: 1, 1: 2 }).length === 0,
    () => {
      try {
        new Array(Math.pow(2, 32));
        return false;
      } catch (e) {
        return e instanceof RangeError;
      }
    },
    () => {
      const obj = {
        get length() {
          return 3;
        },
        0: 3,
        1: 1,
        2: 2
      };
      return ts(obj, (a, b) => a - b).join(',') === '1,2,3';
    },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}
function runCasePart14b(idx) {
  const localIdx = idx - 93;
  const cases = [
    () => {
      try {
        const obj = {
          get length() {
            throw new Error('length error');
          },
          0: 1
        };
        ts(obj);
        return false;
      } catch (e) {
        return e.message === 'length error';
      }
    },
    () => {
      try {
        const obj = {
          length: 2,
          get 0() {
            return 1;
          },
          get 1() {
            throw new Error('element error');
          }
        };
        ts(obj);
        return false;
      } catch (e) {
        return e.message === 'element error';
      }
    },
    () => {
      const arr1 = [3, 1, 4, 1, 5, 9];
      const arr2 = [...arr1];
      const sorted1 = ts(arr1, (a, b) => a - b);
      arr2.sort((a, b) => a - b);
      return arraysEqual(sorted1, arr2);
    },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart15(idx) {
  const localIdx = idx - 96;
  const cases = [
    () => {
      const arr1 = [3, 1, 2];
      const arr2 = [3, 1, 2];
      const r1 = ts(arr1);
      const r2 = arr2.sort();
      return arr1.join(',') === '3,1,2' && r1.join(',') === r2.join(',');
    },
    () => {
      const arr = [3, 1, 2];
      if (typeof arr.toReversed !== 'function') {
        return true;
      }
      const r = ts(arr, (a, b) => a - b).toReversed();
      return r.join(',') === '3,2,1';
    },
    () => {
      const arr = [3, 1, 2, 4];
      if (typeof arr.toSpliced !== 'function') {
        return ts(arr, (a, b) => a - b).join(',') === '1,2,3,4';
      }
      const r = ts(arr, (a, b) => a - b).toSpliced(1, 1);
      return r.join(',') === '1,3,4';
    },
    () => {
      const arr = [3, 1, 2];
      if (typeof arr.with !== 'function') {
        return ts(arr, (a, b) => a - b).join(',') === '1,2,3';
      }
      const r = ts(arr, (a, b) => a - b).with(0, 99);
      return r[0] === 99 && r[1] === 2 && r[2] === 3;
    },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCase(id) {
  const idx = id - 100;
  if (idx < 7) return runCasePart01(idx);
  if (idx < 14) return runCasePart02(idx);
  if (idx < 18) return runCasePart03a(idx);
  if (idx < 21) return runCasePart03b(idx);
  if (idx < 28) return runCasePart04(idx);
  if (idx < 35) return runCasePart05(idx);
  if (idx < 42) return runCasePart06(idx);
  if (idx < 49) return runCasePart07(idx);
  if (idx < 56) return runCasePart08(idx);
  if (idx < 60) return runCasePart09a(idx);
  if (idx < 63) return runCasePart09b(idx);
  if (idx < 70) return runCasePart10(idx);
  if (idx < 77) return runCasePart11(idx);
  if (idx < 84) return runCasePart12(idx);
  if (idx < 90) return runCasePart13(idx);
  if (idx < 93) return runCasePart14a(idx);
  if (idx < 96) return runCasePart14b(idx);
  return runCasePart15(idx);
}

export function ToSortedJs_0100() {
  return runCase(100);
}
export function ToSortedJs_0101() {
  return runCase(101);
}
export function ToSortedJs_0102() {
  return runCase(102);
}
export function ToSortedJs_0103() {
  return runCase(103);
}
export function ToSortedJs_0104() {
  return runCase(104);
}
export function ToSortedJs_0105() {
  return runCase(105);
}
export function ToSortedJs_0106() {
  return runCase(106);
}
export function ToSortedJs_0107() {
  return runCase(107);
}
export function ToSortedJs_0108() {
  return runCase(108);
}
export function ToSortedJs_0109() {
  return runCase(109);
}
export function ToSortedJs_0110() {
  return runCase(110);
}
export function ToSortedJs_0111() {
  return runCase(111);
}
export function ToSortedJs_0112() {
  return runCase(112);
}
export function ToSortedJs_0113() {
  return runCase(113);
}
export function ToSortedJs_0114() {
  return runCase(114);
}
export function ToSortedJs_0115() {
  return runCase(115);
}
export function ToSortedJs_0116() {
  return runCase(116);
}
export function ToSortedJs_0117() {
  return runCase(117);
}
export function ToSortedJs_0118() {
  return runCase(118);
}
export function ToSortedJs_0119() {
  return runCase(119);
}
export function ToSortedJs_0120() {
  return runCase(120);
}
export function ToSortedJs_0121() {
  return runCase(121);
}
export function ToSortedJs_0122() {
  return runCase(122);
}
export function ToSortedJs_0123() {
  return runCase(123);
}
export function ToSortedJs_0124() {
  return runCase(124);
}
export function ToSortedJs_0125() {
  return runCase(125);
}
export function ToSortedJs_0126() {
  return runCase(126);
}
export function ToSortedJs_0127() {
  return runCase(127);
}
export function ToSortedJs_0128() {
  return runCase(128);
}
export function ToSortedJs_0129() {
  return runCase(129);
}
export function ToSortedJs_0130() {
  return runCase(130);
}
export function ToSortedJs_0131() {
  return runCase(131);
}
export function ToSortedJs_0132() {
  return runCase(132);
}
export function ToSortedJs_0133() {
  return runCase(133);
}
export function ToSortedJs_0134() {
  return runCase(134);
}
export function ToSortedJs_0135() {
  return runCase(135);
}
export function ToSortedJs_0136() {
  return runCase(136);
}
export function ToSortedJs_0137() {
  return runCase(137);
}
export function ToSortedJs_0138() {
  return runCase(138);
}
export function ToSortedJs_0139() {
  return runCase(139);
}
export function ToSortedJs_0140() {
  return runCase(140);
}
export function ToSortedJs_0141() {
  return runCase(141);
}
export function ToSortedJs_0142() {
  return runCase(142);
}
export function ToSortedJs_0143() {
  return runCase(143);
}
export function ToSortedJs_0144() {
  return runCase(144);
}
export function ToSortedJs_0145() {
  return runCase(145);
}
export function ToSortedJs_0146() {
  return runCase(146);
}
export function ToSortedJs_0147() {
  return runCase(147);
}
export function ToSortedJs_0148() {
  return runCase(148);
}
export function ToSortedJs_0149() {
  return runCase(149);
}
export function ToSortedJs_0150() {
  return runCase(150);
}
export function ToSortedJs_0151() {
  return runCase(151);
}
export function ToSortedJs_0152() {
  return runCase(152);
}
export function ToSortedJs_0153() {
  return runCase(153);
}
export function ToSortedJs_0154() {
  return runCase(154);
}
export function ToSortedJs_0155() {
  return runCase(155);
}
export function ToSortedJs_0156() {
  return runCase(156);
}
export function ToSortedJs_0157() {
  return runCase(157);
}
export function ToSortedJs_0158() {
  return runCase(158);
}
export function ToSortedJs_0159() {
  return runCase(159);
}
export function ToSortedJs_0160() {
  return runCase(160);
}
export function ToSortedJs_0161() {
  return runCase(161);
}
export function ToSortedJs_0162() {
  return runCase(162);
}
export function ToSortedJs_0163() {
  return runCase(163);
}
export function ToSortedJs_0164() {
  return runCase(164);
}
export function ToSortedJs_0165() {
  return runCase(165);
}
export function ToSortedJs_0166() {
  return runCase(166);
}
export function ToSortedJs_0167() {
  return runCase(167);
}
export function ToSortedJs_0168() {
  return runCase(168);
}
export function ToSortedJs_0169() {
  return runCase(169);
}
export function ToSortedJs_0170() {
  return runCase(170);
}
export function ToSortedJs_0171() {
  return runCase(171);
}
export function ToSortedJs_0172() {
  return runCase(172);
}
export function ToSortedJs_0173() {
  return runCase(173);
}
export function ToSortedJs_0174() {
  return runCase(174);
}
export function ToSortedJs_0175() {
  return runCase(175);
}
export function ToSortedJs_0176() {
  return runCase(176);
}
export function ToSortedJs_0177() {
  return runCase(177);
}
export function ToSortedJs_0178() {
  return runCase(178);
}
export function ToSortedJs_0179() {
  return runCase(179);
}
export function ToSortedJs_0180() {
  return runCase(180);
}
export function ToSortedJs_0181() {
  return runCase(181);
}
export function ToSortedJs_0182() {
  return runCase(182);
}
export function ToSortedJs_0183() {
  return runCase(183);
}
export function ToSortedJs_0184() {
  return runCase(184);
}
export function ToSortedJs_0185() {
  return runCase(185);
}
export function ToSortedJs_0186() {
  return runCase(186);
}
export function ToSortedJs_0187() {
  return runCase(187);
}
export function ToSortedJs_0188() {
  return runCase(188);
}
export function ToSortedJs_0189() {
  return runCase(189);
}
export function ToSortedJs_0190() {
  return runCase(190);
}
export function ToSortedJs_0191() {
  return runCase(191);
}
export function ToSortedJs_0192() {
  return runCase(192);
}
export function ToSortedJs_0193() {
  return runCase(193);
}
export function ToSortedJs_0194() {
  return runCase(194);
}
export function ToSortedJs_0195() {
  return runCase(195);
}
export function ToSortedJs_0196() {
  return runCase(196);
}
export function ToSortedJs_0197() {
  return runCase(197);
}
export function ToSortedJs_0198() {
  return runCase(198);
}
export function ToSortedJs_0199() {
  return runCase(199);
}
