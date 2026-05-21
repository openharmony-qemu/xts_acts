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

export function Fn26_testSparseArraySort() {
  const arr = [, 3, , 1, 2];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([1,2,3,null,null]);
}

export function Fn41_testMixedTypesSort() {
  const arr = [null, 3, 'apple', true, {key: 'value'}];
  const sortedArr = arr.sort();
  return JSON.stringify(sortedArr) === JSON.stringify([3, {key: 'value'}, 'apple', null, true]);
}

export function Fn50_testBufferSort() {
  if (typeof Buffer === 'undefined') return true;
  const arr = [Buffer.from('c'), Buffer.from('a'), Buffer.from('b')];
  const sortedArr = arr.sort((a, b) => a.toString().localeCompare(b.toString()));
  return sortedArr[0].toString() === 'a' &&
    sortedArr[1].toString() === 'b' &&
    sortedArr[2].toString() === 'c';
}

export function Fn61_testArrayLikeSort() {
  const arrayLike = {0: 3, 1: 1, 2: 2, length: 3};
  Array.prototype.sort.call(arrayLike, (a, b) => a - b);
  return arrayLike[0] === 1 && arrayLike[1] === 2 && arrayLike[2] === 3;
}

export function Fn63_testSymbolSort() {
  const sym1 = Symbol('b');
  const sym2 = Symbol('a');
  const sym3 = Symbol('c');
  const arr = [sym1, sym2, sym3];
  const sortedArr = arr.sort((a, b) => a.description.localeCompare(b.description));
  return sortedArr[0] === sym2 && sortedArr[1] === sym1 && sortedArr[2] === sym3;
}

export function Fn67_testArrayTypePrioritySort() {
  const arr = [
    [1, 2, 3],
    ['a', 'b', 'c'],
    [true, false],
    [{}, []]
  ];
  const getTypePriority = arr => {
    if (arr.every(x => typeof x === 'number')) return 0;
    if (arr.every(x => typeof x === 'string')) return 1;
    if (arr.every(x => typeof x === 'boolean')) return 2;
    return 3;
  };
  const sortedArr = arr.sort((a, b) => getTypePriority(a) - getTypePriority(b));
  return JSON.stringify(sortedArr) === JSON.stringify([
    [1, 2, 3],
    ['a', 'b', 'c'],
    [true, false],
    [{}, []]
  ]);
}

export function Fn66_testElementTypeSort() {
  const arr = [1, 'a', true, {}, [], null];
  const getTypeOrder = item => {
    const type = Object.prototype.toString.call(item);
    const order = {
      '[object Number]': 0,
      '[object String]': 1,
      '[object Boolean]': 2,
      '[object Array]': 3,
      '[object Object]': 4,
      '[object Null]': 5
    };
    return order[type] || 6;
  };
  const sortedArr = arr.sort((a, b) => getTypeOrder(a) - getTypeOrder(b));
  return JSON.stringify(sortedArr) === JSON.stringify(['a', true, [], {}, null, 1]);
}

export function Fn73_testGeneratorResultSort() {
  function* generateNumbers() {
    yield 3;
    yield 1;
    yield 2;
  }
  const arr = Array.from(generateNumbers());
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([1, 2, 3]);
}

export function Fn78_testObjectMethodReturnSort() {
  const arr = [
    {value: 5, getScore: function() { return this.value * 2; }},
    {value: 3, getScore: function() { return this.value * 2; }},
    {value: 8, getScore: function() { return this.value * 2; }}
  ];
  const sortedArr = arr.sort((a, b) => a.getScore() - b.getScore());
  return JSON.stringify(sortedArr) === JSON.stringify([
    {value: 3, getScore: function() { return this.value * 2; }},
    {value: 5, getScore: function() { return this.value * 2; }},
    {value: 8, getScore: function() { return this.value * 2; }}
  ]);
}

export function Fn84_testFunctionParameterCountSort() {
  const func1 = (a, b) => {};
  const func2 = () => {};
  const func3 = (a) => {};
  const arr = [func1, func2, func3];
  const sortedArr = arr.sort((a, b) => a.length - b.length);
  return sortedArr[0] === func2 && sortedArr[1] === func3 && sortedArr[2] === func1;
}

export function Fn93_testWeakMapKeysSort() {
  const obj1 = {};
  const obj2 = {};
  const obj3 = {};
  const wm = new WeakMap();
  wm.set(obj1, 3);
  wm.set(obj2, 1);
  wm.set(obj3, 2);
  const arr = [obj1, obj2, obj3];
  const sortedArr = arr.sort((a, b) => wm.get(a) - wm.get(b));
  return sortedArr[0] === obj2 && sortedArr[1] === obj3 && sortedArr[2] === obj1;
}

export function Fn99_testPromiseArraySort() {
  const p1 = Promise.resolve(3);
  const p2 = new Promise(() => {});
  const p3 = Promise.reject(1);
  const arr = [p1, p2, p3];
  const sortedArr = arr.sort((a, b) => {
    return 0;
  });
  return Array.isArray(sortedArr) && sortedArr.length === 3;
}
