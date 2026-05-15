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

export function Fn01_testDefaultStringSort() {
  const arr = [10, 5, 20, 15, 3];
  const sortedArr = arr.sort();
  return JSON.stringify(sortedArr) === JSON.stringify([10, 15, 20, 3, 5]);
}

export function Fn02_testNumberAscendingSort() {
  const arr = [10, 5, 20, 15, 3];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([3, 5, 10, 15, 20]);
}

export function Fn03_testInPlaceSort() {
  const arr = [3, 1, 2];
  const originalArray = arr;
  arr.sort();
  return JSON.stringify(originalArray) === JSON.stringify([1, 2, 3]);
}

export function Fn04_testStringAlphabeticalSort() {
  const arr = ['banana', 'apple', 'cherry'];
  const sortedArr = arr.sort();
  return JSON.stringify(sortedArr) === JSON.stringify(['apple', 'banana', 'cherry']);
}

export function Fn05_testNumberDescendingSort() {
  const arr = [10, 5, 20, 15, 3];
  const sortedArr = arr.sort((a, b) => b - a);
  return JSON.stringify(sortedArr) === JSON.stringify([20, 15, 10, 5, 3]);
}

export function Fn06_testEmptyArraySort() {
  const arr = [];
  const sortedArr = arr.sort();
  return JSON.stringify(sortedArr) === JSON.stringify([]);
}

export function Fn07_testSingleElementSort() {
  const arr = [42];
  const sortedArr = arr.sort();
  return JSON.stringify(sortedArr) === JSON.stringify([42]);
}

export function Fn08_testAllSameElementsSort() {
  const arr = [5, 5, 5, 5];
  const sortedArr = arr.sort();
  return JSON.stringify(sortedArr) === JSON.stringify([5, 5, 5, 5]);
}

export function Fn09_testNegativeNumbersSort() {
  const arr = [-3, -1, -5];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([-5, -3, -1]);
}

export function Fn10_testZeroInArraySort() {
  const arr = [0, 3, -2, 0, 5];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([-2, 0, 0, 3, 5]);
}

export function Fn11_testStringLengthSort() {
  const arr = ['a', 'ccc', 'bb'];
  const sortedArr = arr.sort((a, b) => a.length - b.length);
  return JSON.stringify(sortedArr) === JSON.stringify(['a', 'bb', 'ccc']);
}

export function Fn12_testObjectPropertySort() {
  const arr = [{age: 30}, {age: 20}, {age: 25}];
  const sortedArr = arr.sort((a, b) => a.age - b.age);
  return JSON.stringify(sortedArr) === JSON.stringify([{age: 20}, {age: 25}, {age: 30}]);
}

export function Fn13_testMixedStringNumberSort() {
  const arr = [10, '5', 20, '15'];
  const sortedArr = arr.sort();
  return JSON.stringify(sortedArr) === JSON.stringify([10,'15',20,'5']);
}

export function Fn14_testCaseSensitiveSort() {
  const arr = ['Banana', 'apple', 'Cherry'];
  const sortedArr = arr.sort();
  return JSON.stringify(sortedArr) === JSON.stringify(['Banana', 'Cherry', 'apple']);
}

export function Fn15_testCaseInsensitiveSort() {
  const arr = ['Banana', 'apple', 'Cherry'];
  const sortedArr = arr.sort((a, b) => a.toLowerCase().localeCompare(b.toLowerCase()));
  return JSON.stringify(sortedArr) === JSON.stringify(['apple', 'Banana', 'Cherry']);
}

export function Fn16_testStringReverseSort() {
  const arr = ['a', 'b', 'c'];
  const sortedArr = arr.sort((a, b) => b.localeCompare(a));
  return JSON.stringify(sortedArr) === JSON.stringify(['c', 'b', 'a']);
}

export function Fn17_testNullInArraySort() {
  const arr = [3, null, 1, null, 2];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([null, null, 1, 2, 3]);
}

export function Fn18_testUndefinedInArraySort() {
  const arr = [3, undefined, 1, 2];
  const sortedArr = arr.sort((a, b) => (a || 0) - (b || 0));
  return JSON.stringify(sortedArr) === JSON.stringify([1, 2, 3, undefined]);
}

export function Fn19_testMultipleObjectPropertiesSort() {
  const arr = [
    {age: 25, name: 'Bob'},
    {age: 20, name: 'Alice'},
    {age: 25, name: 'Alice'}
  ];
  const sortedArr = arr.sort((a, b) => {
    if (a.age !== b.age) return a.age - b.age;
    return a.name.localeCompare(b.name);
  });
  return JSON.stringify(sortedArr) === JSON.stringify([
    {age: 20, name: 'Alice'},
    {age: 25, name: 'Alice'},
    {age: 25, name: 'Bob'}
  ]);
}

export function Fn20_testFloatNumbersSort() {
  const arr = [3.14, 1.5, 2.71, 0.5];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([0.5, 1.5, 2.71, 3.14]);
}

export function Fn21_testLargeIntegersSort() {
  const arr = [1000000, 500000, 2000000];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([500000, 1000000, 2000000]);
}

export function Fn22_testBooleansInArraySort() {
  const arr = [true, false, true, false];
  const sortedArr = arr.sort();
  return JSON.stringify(sortedArr) === JSON.stringify([false, false, true, true]);
}

export function Fn23_testStringWithNumbersSort() {
  const arr = ['item2', 'item10', 'item1'];
  const sortedArr = arr.sort((a, b) => {
    const numA = parseInt(a.replace('item', ''));
    const numB = parseInt(b.replace('item', ''));
    return numA - numB;
  });
  return JSON.stringify(sortedArr) === JSON.stringify(['item1', 'item2', 'item10']);
}

export function Fn24_testOriginalArrayReference() {
  const arr = [3, 1, 2];
  const original = arr;
  arr.sort();
  return arr === original;
}

export function Fn25_testArrowFunctionSort() {
  const arr = [5, 3, 8];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([3, 5, 8]);
}

export function Fn26_testSparseArraySort() {
  const arr = [, 3, , 1, 2];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([1,2,3,null,null]);
}

export function Fn27_testSpecialCharactersSort() {
  const arr = ['$', '!', '#', '%'];
  const sortedArr = arr.sort();
  return JSON.stringify(sortedArr) === JSON.stringify(['!', '#', '$', '%']);
}

export function Fn28_testObjectPropertyLengthSort() {
  const arr = [
    {name: 'Anna'},
    {name: 'Bob'},
    {name: 'Alexandra'}
  ];
  const sortedArr = arr.sort((a, b) => a.name.length - b.name.length);
  return JSON.stringify(sortedArr) === JSON.stringify([
    {name: 'Bob'},
    {name: 'Anna'},
    {name: 'Alexandra'}
  ]);
}

export function Fn29_testNestedArraySort() {
  const arr = [[3, 'c'], [1, 'a'], [2, 'b']];
  const sortedArr = arr.sort((a, b) => a[0] - b[0]);
  return JSON.stringify(sortedArr) === JSON.stringify([[1, 'a'], [2, 'b'], [3, 'c']]);
}

export function Fn30_testLocaleCompareSort() {
  const arr = ['ä', 'a', 'b'];
  const sortedArr = arr.sort((a, b) => a.localeCompare(b));
  return JSON.stringify(sortedArr) === JSON.stringify(['a', 'ä', 'b']);
}

export function Fn31_testNaNInArraySort() {
  const arr = [3, NaN, 1, 2];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([3,null,1,2]);
}

export function Fn32_testDateStringSort() {
  const arr = ['2023-12-01', '2023-01-15', '2023-06-30'];
  const sortedArr = arr.sort();
  return JSON.stringify(sortedArr) === JSON.stringify(['2023-01-15', '2023-06-30', '2023-12-01']);
}

export function Fn33_testDateObjectSort() {
  const arr = [
    new Date(2023, 11, 1),
    new Date(2023, 0, 15),
    new Date(2023, 5, 30)
  ];
  const sortedArr = arr.sort((a, b) => a - b);
  return sortedArr[0].getTime() === new Date(2023, 0, 15).getTime() &&
    sortedArr[1].getTime() === new Date(2023, 5, 30).getTime() &&
    sortedArr[2].getTime() === new Date(2023, 11, 1).getTime();
}

export function Fn34_testLastCharacterSort() {
  const arr = ['apple', 'banana', 'cherry'];
  const sortedArr = arr.sort((a, b) => {
    const lastA = a[a.length - 1];
    const lastB = b[b.length - 1];
    return lastA.localeCompare(lastB);
  });
  return JSON.stringify(sortedArr) === JSON.stringify(['banana', 'apple', 'cherry']);
}

export function Fn35_testArrayLengthAfterSort() {
  const arr = [5, 3, 8, 1];
  const originalLength = arr.length;
  arr.sort();
  return arr.length === originalLength;
}

export function Fn36_testFunctionExpressionSort() {
  const arr = [5, 3, 8];
  const sortedArr = arr.sort(function(a, b) { return a - b; });
  return JSON.stringify(sortedArr) === JSON.stringify([3, 5, 8]);
}

export function Fn37_testAbsoluteValueSort() {
  const arr = [-3, 1, -5, 2];
  const sortedArr = arr.sort((a, b) => Math.abs(a) - Math.abs(b));
  return JSON.stringify(sortedArr) === JSON.stringify([1, 2, -3, -5]);
}

export function Fn38_testUnicodeCharactersSort() {
  const arr = ['č', 'a', 'b', 'ć'];
  const sortedArr = arr.sort((a, b) => a.localeCompare(b));
  return JSON.stringify(sortedArr) === JSON.stringify(['a', 'b', 'ć', 'č']);
}

export function Fn40_testObjectPropertyReverseSort() {
  const arr = [{score: 80}, {score: 90}, {score: 70}];
  const sortedArr = arr.sort((a, b) => b.score - a.score);
  return JSON.stringify(sortedArr) === JSON.stringify([{score: 90}, {score: 80}, {score: 70}]);
}

export function Fn41_testMixedTypesSort() {
  const arr = [null, 3, 'apple', true, {key: 'value'}];
  const sortedArr = arr.sort();
  return JSON.stringify(sortedArr) === JSON.stringify([3, {key: 'value'}, 'apple', null, true]);
}

export function Fn42_testVowelCountSort() {
  const arr = ['apple', 'banana', 'cherry'];
  const countVowels = str => (str.match(/[aeiou]/gi) || []).length;
  const sortedArr = arr.sort((a, b) => countVowels(a) - countVowels(b));
  return JSON.stringify(sortedArr) === JSON.stringify(['cherry', 'apple', 'banana']);
}

export function Fn43_test2DArraySecondColumnSort() {
  const arr = [[1, 5], [2, 3], [3, 7]];
  const sortedArr = arr.sort((a, b) => a[1] - b[1]);
  return JSON.stringify(sortedArr) === JSON.stringify([[2, 3], [1, 5], [3, 7]]);
}

export function Fn44_testMaxValuePosition() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  return arr[arr.length - 1] === 9;
}

export function Fn45_testMinValuePosition() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  return arr[0] === 1;
}

export function Fn46_testCompareFunctionReturnZero() {
  const arr = [2, 1, 3];
  const sortedArr = arr.sort((a, b) => 0);
  return JSON.stringify(sortedArr) === JSON.stringify([2, 1, 3]);
}

export function Fn47_testFirstLetterCapitalSort() {
  const arr = ['apple', 'Banana', 'cherry', 'Date'];
  const sortedArr = arr.sort((a, b) => {
    const firstA = a.charAt(0).toUpperCase();
    const firstB = b.charAt(0).toUpperCase();
    return firstA.localeCompare(firstB);
  });
  return JSON.stringify(sortedArr) === JSON.stringify(['apple', 'Banana', 'cherry', 'Date']);
}

export function Fn48_testRegExpSort() {
  const arr = [/z/, /a/, /m/];
  const sortedArr = arr.sort((a, b) => a.source.localeCompare(b.source));
  return sortedArr[0].source === 'a' && sortedArr[1].source === 'm' && sortedArr[2].source === 'z';
}

export function Fn49_testNestedObjectPropertySort() {
  const arr = [
    {user: {age: 30}},
    {user: {age: 20}},
    {user: {age: 25}}
  ];
  const sortedArr = arr.sort((a, b) => a.user.age - b.user.age);
  return JSON.stringify(sortedArr) === JSON.stringify([
    {user: {age: 20}},
    {user: {age: 25}},
    {user: {age: 30}}
  ]);
}

export function Fn50_testBufferSort() {
  if (typeof Buffer === 'undefined') return true;
  const arr = [Buffer.from('c'), Buffer.from('a'), Buffer.from('b')];
  const sortedArr = arr.sort((a, b) => a.toString().localeCompare(b.toString()));
  return sortedArr[0].toString() === 'a' &&
    sortedArr[1].toString() === 'b' &&
    sortedArr[2].toString() === 'c';
}

export function Fn51_testSubstringPresenceSort() {
  const arr = ['apple', 'banana', 'pineapple', 'grape'];
  const sortedArr = arr.sort((a, b) => {
    const hasA = a.includes('app') ? 0 : 1;
    const hasB = b.includes('app') ? 0 : 1;
    return hasA - hasB;
  });
  return JSON.stringify(sortedArr) === JSON.stringify(['apple', 'pineapple', 'banana', 'grape']);
}

export function Fn52_testLargeArraySort() {
  const arr = [];
  for (let i = 1000; i > 0; i--) arr.push(i);
  const start = Date.now();
  arr.sort((a, b) => a - b);
  const end = Date.now();
  return end - start < 100 && arr[0] === 1 && arr[999] === 1000;
}

export function Fn53_testOccurrenceCountSort() {
  const arr = [1, 3, 2, 3, 1, 3, 2, 1, 4];
  const countMap = {};
  arr.forEach(num => countMap[num] = (countMap[num] || 0) + 1);
  const sortedArr = [...new Set(arr)].sort((a, b) => countMap[b] - countMap[a]);
  return JSON.stringify(sortedArr) === JSON.stringify([1, 3, 2, 4]);
}

export function Fn54_testCompareFunctionReturnPositive() {
  const arr = [1, 2];
  const sortedArr = arr.sort((a, b) => 1);
  return JSON.stringify(sortedArr) === JSON.stringify([1, 2]);
}

export function Fn55_testCompareFunctionReturnNegative() {
  const arr = [2, 1];
  const sortedArr = arr.sort((a, b) => -1);
  return JSON.stringify(sortedArr) === JSON.stringify([1, 2]);
}

export function Fn56_testAsciiSumSort() {
  const arr = ['a', 'bc', 'def'];
  const getAsciiSum = str => [...str].reduce((sum, char) => sum + char.charCodeAt(0), 0);
  const sortedArr = arr.sort((a, b) => getAsciiSum(a) - getAsciiSum(b));
  return JSON.stringify(sortedArr) === JSON.stringify(['a', 'bc', 'def']);
}

export function Fn57_testSetToArraySort() {
  const set = new Set([3, 1, 2, 3]);
  const arr = Array.from(set);
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([1, 2, 3]);
}

export function Fn58_testObjectCreationTimeSort() {
  const obj1 = {created: new Date(2023, 0, 1)};
  const obj2 = {created: new Date(2023, 1, 1)};
  const obj3 = {created: new Date(2022, 11, 31)};
  const arr = [obj1, obj2, obj3];
  const sortedArr = arr.sort((a, b) => a.created - b.created);
  return sortedArr[0] === obj3 && sortedArr[1] === obj1 && sortedArr[2] === obj2;
}

export function Fn59_testMapValuesSort() {
  const map = new Map();
  map.set('a', 3);
  map.set('b', 1);
  map.set('c', 2);
  const values = Array.from(map.values());
  const sortedValues = values.sort((a, b) => a - b);
  return JSON.stringify(sortedValues) === JSON.stringify([1, 2, 3]);
}

export function Fn60_testPalindromeSort() {
  const isPalindrome = str => str === str.split('').reverse().join('');
  const arr = ['level', 'hello', 'madam', 'world'];
  const sortedArr = arr.sort((a, b) => {
    const aIsPal = isPalindrome(a) ? 0 : 1;
    const bIsPal = isPalindrome(b) ? 0 : 1;
    return aIsPal - bIsPal;
  });
  return JSON.stringify(sortedArr) === JSON.stringify(['level', 'madam', 'hello', 'world']);
}

export function Fn61_testArrayLikeSort() {
  const arrayLike = {0: 3, 1: 1, 2: 2, length: 3};
  Array.prototype.sort.call(arrayLike, (a, b) => a - b);
  return arrayLike[0] === 1 && arrayLike[1] === 2 && arrayLike[2] === 3;
}

export function Fn62_testEvenOddSort() {
  const arr = [3, 4, 1, 2, 5];
  const sortedArr = arr.sort((a, b) => {
    if (a % 2 === 0 && b % 2 !== 0) return -1;
    if (a % 2 !== 0 && b % 2 === 0) return 1;
    return a - b;
  });
  return JSON.stringify(sortedArr) === JSON.stringify([2, 4, 1, 3, 5]);
}

export function Fn63_testSymbolSort() {
  const sym1 = Symbol('b');
  const sym2 = Symbol('a');
  const sym3 = Symbol('c');
  const arr = [sym1, sym2, sym3];
  const sortedArr = arr.sort((a, b) => a.description.localeCompare(b.description));
  return sortedArr[0] === sym2 && sortedArr[1] === sym1 && sortedArr[2] === sym3;
}

export function Fn64_testPropertyExistenceSort() {
  const arr = [
    {name: 'Alice', age: 25},
    {name: 'Bob'},
    {name: 'Charlie', age: 30}
  ];
  const sortedArr = arr.sort((a, b) => {
    const hasAgeA = 'age' in a ? 0 : 1;
    const hasAgeB = 'age' in b ? 0 : 1;
    return hasAgeA - hasAgeB || (a.age || 0) - (b.age || 0);
  });
  return JSON.stringify(sortedArr) === JSON.stringify([
    {name: 'Alice', age: 25},
    {name: 'Charlie', age: 30},
    {name: 'Bob'}
  ]);
}

export function Fn65_testNumericStringSort() {
  const arr = ['10', '5', '20', '15', '3'];
  const sortedArr = arr.sort((a, b) => parseInt(a) - parseInt(b));
  return JSON.stringify(sortedArr) === JSON.stringify(['3', '5', '10', '15', '20']);
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

export function Fn68_testStringNumbersSumSort() {
  const arr = ['a1b2', 'c3d4', 'e5f0'];
  const getNumberSum = str => {
    const numbers = str.match(/\d/g) || [];
    return numbers.reduce((sum, num) => sum + parseInt(num), 0);
  };
  const sortedArr = arr.sort((a, b) => getNumberSum(a) - getNumberSum(b));
  return JSON.stringify(sortedArr) === JSON.stringify(['a1b2', 'e5f0', 'c3d4']);
}

export function Fn69_testMiddleElementAfterSort() {
  const arr = [5, 3, 8, 1, 9, 2, 7];
  arr.sort((a, b) => a - b);
  return arr[3] === 5;
}

export function Fn70_testObjectStringPropertyLengthSort() {
  const arr = [
    {name: 'Anna'},
    {name: 'Bob'},
    {name: 'Alex'}
  ];
  const sortedArr = arr.sort((a, b) => a.name.length - b.name.length);
  return JSON.stringify(sortedArr) === JSON.stringify([
    {name: 'Bob'},
    {name: 'Anna'},
    {name: 'Alex'}
  ]);
}

export function Fn71_testEmptyStringSort() {
  const arr = ['', 'apple', '', 'banana'];
  const sortedArr = arr.sort((a, b) => {
    if (a === '' && b !== '') return -1;
    if (a !== '' && b === '') return 1;
    return a.localeCompare(b);
  });
  return JSON.stringify(sortedArr) === JSON.stringify(['', '', 'apple', 'banana']);
}

export function Fn72_testSquareValueSort() {
  const arr = [-3, 1, -2, 4];
  const sortedArr = arr.sort((a, b) => a * a - b * b);
  return JSON.stringify(sortedArr) === JSON.stringify([1, -2, -3, 4]);
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

export function Fn74_testObjectDateStringSort() {
  const arr = [
    {event: 'Meeting', date: '2023-12-01'},
    {event: 'Party', date: '2023-01-15'},
    {event: 'Conference', date: '2023-06-30'}
  ];
  const sortedArr = arr.sort((a, b) => new Date(a.date) - new Date(b.date));
  return JSON.stringify(sortedArr) === JSON.stringify([
    {event: 'Party', date: '2023-01-15'},
    {event: 'Conference', date: '2023-06-30'},
    {event: 'Meeting', date: '2023-12-01'}
  ]);
}

export function Fn75_testStrictlyIncreasingAfterSort() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  for (let i = 1; i < arr.length; i++) {
    if (arr[i] <= arr[i - 1]) return false;
  }
  return true;
}

export function Fn76_testUpperCaseCountSort() {
  const arr = ['Apple', 'BANANA', 'cherry', 'Date'];
  const countUpperCase = str => (str.match(/[A-Z]/g) || []).length;
  const sortedArr = arr.sort((a, b) => countUpperCase(b) - countUpperCase(a));
  return JSON.stringify(sortedArr) === JSON.stringify(['BANANA', 'Apple', 'Date', 'cherry']);
}

export function Fn77_testArrayOfArraysSort() {
  const arr = [[1], [1, 2, 3], [1, 2]];
  const sortedArr = arr.sort((a, b) => a.length - b.length);
  return JSON.stringify(sortedArr) === JSON.stringify([[1], [1, 2], [1, 2, 3]]);
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

export function Fn79_testInfinityInArraySort() {
  const arr = [Infinity, 5, -Infinity, 10];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([-Infinity, 5, 10, Infinity]);
}

export function Fn81_testEveryAfterSort() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  return arr.every((val, i, array) => i === 0 || val >= array[i - 1]);
}

export function Fn82_testReverseAlphabeticalPropertySort() {
  const arr = [
    {name: 'Charlie'},
    {name: 'Alice'},
    {name: 'Bob'}
  ];
  const sortedArr = arr.sort((a, b) => b.name.localeCompare(a.name));
  return JSON.stringify(sortedArr) === JSON.stringify([
    {name: 'Charlie'},
    {name: 'Bob'},
    {name: 'Alice'}
  ]);
}

export function Fn83_testSortedCopyEquality() {
  const arr = [5, 3, 8, 1, 9];
  const expected = [...arr].sort((a, b) => a - b);
  arr.sort((a, b) => a - b);
  return JSON.stringify(arr) === JSON.stringify(expected);
}

export function Fn84_testFunctionParameterCountSort() {
  const func1 = (a, b) => {};
  const func2 = () => {};
  const func3 = (a) => {};
  const arr = [func1, func2, func3];
  const sortedArr = arr.sort((a, b) => a.length - b.length);
  return sortedArr[0] === func2 && sortedArr[1] === func3 && sortedArr[2] === func1;
}

export function Fn85_testHexadecimalNumbersSort() {
  const arr = [0x10, 0x5, 0x1A, 0x3];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([0x3, 0x5, 0x10, 0x1A]);
}

export function Fn86_testSpecificCharCountSort() {
  const arr = ['apple', 'banana', 'pineapple', 'grape'];
  const countChar = (str, char) => (str.match(new RegExp(char, 'g')) || []).length;
  const sortedArr = arr.sort((a, b) => countChar(b, 'p') - countChar(a, 'p'));
  return JSON.stringify(sortedArr) === JSON.stringify(['pineapple', 'apple', 'grape', 'banana']);
}

export function Fn87_testErrorObjectSort() {
  const err1 = new Error('B error');
  const err2 = new Error('A error');
  const err3 = new Error('C error');
  const arr = [err1, err2, err3];
  const sortedArr = arr.sort((a, b) => a.message.localeCompare(b.message));
  return sortedArr[0] === err2 && sortedArr[1] === err1 && sortedArr[2] === err3;
}

export function Fn88_testPrimeNumberSort() {
  const isPrime = num => {
    if (num <= 1) return false;
    for (let i = 2; i <= Math.sqrt(num); i++) {
      if (num % i === 0) return false;
    }
    return true;
  };
  const arr = [4, 5, 9, 7, 10];
  const sortedArr = arr.sort((a, b) => {
    if (isPrime(a) && !isPrime(b)) return -1;
    if (!isPrime(a) && isPrime(b)) return 1;
    return a - b;
  });
  return JSON.stringify(sortedArr) === JSON.stringify([5, 7, 4, 9, 10]);
}

export function Fn89_testFirstElementAfterSort() {
  const arr = [9, 3, 7, 1, 5];
  arr.sort((a, b) => a - b);
  return arr[0] === 1;
}

export function Fn90_testObjectArrayPropertyLengthSort() {
  const arr = [
    {tags: ['js', 'array']},
    {tags: ['sort']},
    {tags: ['test', 'case', 'function']}
  ];
  const sortedArr = arr.sort((a, b) => a.tags.length - b.tags.length);
  return JSON.stringify(sortedArr) === JSON.stringify([
    {tags: ['sort']},
    {tags: ['js', 'array']},
    {tags: ['test', 'case', 'function']}
  ]);
}

export function Fn91_testScientificNotationSort() {
  const arr = [1e3, 5e2, 2e3, 3e1];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([3e1, 5e2, 1e3, 2e3]);
}

export function Fn92_testStringPrefixSort() {
  const arr = ['apple', 'apricot', 'banana', 'avocado'];
  const sortedArr = arr.sort((a, b) => {
    const aHas = a.startsWith('ap') ? 0 : 1;
    const bHas = b.startsWith('ap') ? 0 : 1;
    return aHas - bHas || a.localeCompare(b);
  });
  return JSON.stringify(sortedArr) === JSON.stringify(['apple', 'apricot', 'avocado', 'banana']);
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

export function Fn94_testNumberDigitCountSort() {
  const arr = [123, 45, 6, 7890];
  const getDigitCount = num => Math.abs(num).toString().length;
  const sortedArr = arr.sort((a, b) => getDigitCount(a) - getDigitCount(b));
  return JSON.stringify(sortedArr) === JSON.stringify([6, 45, 123, 7890]);
}

export function Fn95_testSomeAfterSort() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  return arr.some(val => val === 8);
}

export function Fn96_testObjectPropertyCountSort() {
  const obj1 = {a: 1, b: 2};
  const obj2 = {c: 3};
  const obj3 = {d: 4, e: 5, f: 6};
  const arr = [obj1, obj2, obj3];
  const sortedArr = arr.sort((a, b) => Object.keys(a).length - Object.keys(b).length);
  return sortedArr[0] === obj2 && sortedArr[1] === obj1 && sortedArr[2] === obj3;
}

export function Fn97_testNegativeZeroSort() {
  const arr = [0, -0, 1, -1];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([-1, -0, 0, 1]);
}

export function Fn98_testLastCharPositionSort() {
  const arr = ['apple', 'pineapple', 'grape', 'banana'];
  const getLastPos = (str, char) => str.lastIndexOf(char);
  const sortedArr = arr.sort((a, b) => getLastPos(a, 'p') - getLastPos(b, 'p'));
  return JSON.stringify(sortedArr) === JSON.stringify(['banana', 'apple', 'grape', 'pineapple']);
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

export function Fn100_testOddFirstSort() {
  const arr = [4, 5, 2, 7, 10, 3];
  const sortedArr = arr.sort((a, b) => {
    if (a % 2 !== 0 && b % 2 === 0) return -1;
    if (a % 2 === 0 && b % 2 !== 0) return 1;
    return a - b;
  });
  return JSON.stringify(sortedArr) === JSON.stringify([3, 5, 7, 2, 4, 10]);
}

export function Fn101_testSpreadSortEquality() {
  const arr = [5, 3, 8, 1, 9];
  const sorted1 = arr.sort((a, b) => a - b);
  const sorted2 = [...arr].sort((a, b) => a - b);
  return JSON.stringify(sorted1) === JSON.stringify(sorted2);
}

export function Fn102_testKeysAfterSort() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  const keys = Array.from(arr.keys());
  return JSON.stringify(keys) === JSON.stringify([0, 1, 2, 3, 4]);
}

export function Fn103_testRegExpSourceSort() {
  const reg1 = /c/;
  const reg2 = /a/;
  const reg3 = /b/;
  const arr = [reg1, reg2, reg3];
  const sortedArr = arr.sort((a, b) => a.source.localeCompare(b.source));
  return sortedArr[0] === reg2 && sortedArr[1] === reg3 && sortedArr[2] === reg1;
}

export function Fn104_testNestedArrayPropertySort() {
  const arr = [
    {data: [3, 'c']},
    {data: [1, 'a']},
    {data: [2, 'b']}
  ];
  const sortedArr = arr.sort((a, b) => a.data[0] - b.data[0]);
  return JSON.stringify(sortedArr) === JSON.stringify([
    {data: [1, 'a']},
    {data: [2, 'b']},
    {data: [3, 'c']}
  ]);
}

export function Fn105_testFindAfterSort() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  return arr.find(val => val === 5) === 5;
}

export function Fn106_testCaseRatioSort() {
  const arr = ['Apple', 'BANANA', 'Cherry', 'DATE'];
  const getCaseRatio = str => {
    const upper = (str.match(/[A-Z]/g) || []).length;
    const lower = (str.match(/[a-z]/g) || []).length;
    return lower === 0 ? Infinity : upper / lower;
  };
  const sortedArr = arr.sort((a, b) => getCaseRatio(a) - getCaseRatio(b));
  return JSON.stringify(sortedArr) === JSON.stringify(['Cherry', 'Apple', 'BANANA', 'DATE']);
}


export function Fn107_testMixedDateTimestampSort() {
  const arr = [
    new Date(2023, 0, 1).getTime(),
    new Date(2023, 1, 15),
    new Date(2023, 5, 30).getTime()
  ];
  const sortedArr = arr.sort((a, b) => {
    const timeA = typeof a === 'number' ? a : a.getTime();
    const timeB = typeof b === 'number' ? b : b.getTime();
    return timeA - timeB;
  });
  return sortedArr[0] === new Date(2023, 0, 1).getTime() &&
    sortedArr[2] === new Date(2023, 5, 30).getTime();
}

export function Fn108_testUniqueValueCountSort() {
  const arr1 = [1, 2, 3, 2, 1];
  const arr2 = [5, 5, 5];
  const arr3 = [10, 20, 30, 40];
  const outerArr = [arr1, arr2, arr3];
  const sortedArr = outerArr.sort((a, b) => new Set(a).size - new Set(b).size);
  return sortedArr[0] === arr2 && sortedArr[1] === arr1 && sortedArr[2] === arr3;
}

export function Fn109_testNoDuplicatesAfterSort() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  return new Set(arr).size === arr.length;
}

export function Fn110_testFunctionReturnTypeSort() {
  const func1 = () => 'string';
  const func2 = () => 42;
  const func3 = () => {};
  const arr = [func1, func2, func3];
  const getTypeOrder = func => {
    const type = typeof func();
    const order = {number: 0, string: 1, object: 2};
    return order[type] || 3;
  };
  const sortedArr = arr.sort((a, b) => getTypeOrder(a) - getTypeOrder(b));
  return sortedArr[0] === func1 && sortedArr[1] === func2 && sortedArr[2] === func3;
}

export function Fn111_testMixedDateStringSort() {
  const arr = [new Date(2023, 0, 1), '2023-02-15', new Date(2023, 1, 10)];
  const sortedArr = arr.sort((a, b) => {
    const dateA = typeof a === 'string' ? new Date(a) : a;
    const dateB = typeof b === 'string' ? new Date(b) : b;
    return dateA - dateB;
  });
  return sortedArr[0].toString().includes('Jan') &&
  sortedArr[1].toString().includes('Feb 10') &&
  sortedArr[2].includes('2023-02-15');
}

export function Fn112_testCubeValueSort() {
  const arr = [-2, 3, -1, 2];
  const sortedArr = arr.sort((a, b) => a **3 - b** 3);
  return JSON.stringify(sortedArr) === JSON.stringify([-2, -1, 2, 3]);
}

export function Fn113_testFilterAfterSort() {
  const arr = [5, 3, 8, 1, 9, 2, 7];
  arr.sort((a, b) => a - b);
  const filtered = arr.filter(val => val > 4 && val < 8);
  return JSON.stringify(filtered) === JSON.stringify([5, 7]);
}

export function Fn114_testVowelConsonantRatioSort() {
  const arr = ['apple', 'banana', 'cherry'];
  const getRatio = str => {
    const vowels = (str.match(/[aeiou]/gi) || []).length;
    const consonants = str.length - vowels;
    return consonants === 0 ? 0 : vowels / consonants;
  };
  const sortedArr = arr.sort((a, b) => getRatio(a) - getRatio(b));
  return JSON.stringify(sortedArr) === JSON.stringify(['cherry', 'apple', 'banana']);
}

export function Fn115_testMapSetSizeSort() {
  const map = new Map([[1, 'a'], [2, 'b']]);
  const set = new Set([1, 2, 3]);
  const smallMap = new Map([[3, 'c']]);
  const arr = [map, set, smallMap];
  const sortedArr = arr.sort((a, b) => a.size - b.size);
  return sortedArr[0] === smallMap && sortedArr[1] === map && sortedArr[2] === set;
}

export function Fn116_testObjectNumericStringLengthSort() {
  const arr = [
    {id: '123'},
    {id: '4'},
    {id: '56'}
  ];
  const sortedArr = arr.sort((a, b) => a.id.length - b.id.length);
  return JSON.stringify(sortedArr) === JSON.stringify([
    {id: '4'},
    {id: '56'},
    {id: '123'}
  ]);
}

export function Fn117_testReduceAfterSort() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  const sum = arr.reduce((acc, val) => acc + val, 0);
  return sum === 26;
}

export function Fn118_testAlphanumericMixedSort() {
  const arr = ['abc', '123', 'a1b2', '45d6'];
  const isMixed = str => /[a-zA-Z]/.test(str) && /\d/.test(str);
  const sortedArr = arr.sort((a, b) => {
    const aMix = isMixed(a) ? 0 : 1;
    const bMix = isMixed(b) ? 0 : 1;
    return aMix - bMix || a.localeCompare(b);
  });
  return JSON.stringify(sortedArr) === JSON.stringify(['45d6', 'a1b2', '123', 'abc']);
}

export function Fn119_testProxyObjectSort() {
  const obj1 = {value: 3};
  const obj2 = {value: 1};
  const obj3 = {value: 2};
  const proxy1 = new Proxy(obj1, {});
  const proxy2 = new Proxy(obj2, {});
  const proxy3 = new Proxy(obj3, {});
  const arr = [proxy1, proxy2, proxy3];
  const sortedArr = arr.sort((a, b) => a.value - b.value);
  return sortedArr[0] === proxy2 && sortedArr[1] === proxy3 && sortedArr[2] === proxy1;
}

export function Fn120_testFactorCountSort() {
  const getFactorCount = num => {
    if (num <= 1) return 1;
    let count = 0;
    for (let i = 1; i <= num; i++) {
      if (num % i === 0) count++;
    }
    return count;
  };
  const arr = [6, 4, 5, 8];
  const sortedArr = arr.sort((a, b) => getFactorCount(a) - getFactorCount(b));
  return JSON.stringify(sortedArr) === JSON.stringify([5, 4, 6, 8]);
}

export function Fn121_testLastElementAfterSort() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  return arr[arr.length - 1] === 9;
}

export function Fn122_testBooleanPropertySort() {
  const arr = [
    {active: false, name: 'A'},
    {active: true, name: 'B'},
    {active: true, name: 'C'},
    {active: false, name: 'D'}
  ];
  const sortedArr = arr.sort((a, b) => {
    if (a.active && !b.active) return -1;
    if (!a.active && b.active) return 1;
    return a.name.localeCompare(b.name);
  });
  return JSON.stringify(sortedArr) === JSON.stringify([
    {active: true, name: 'B'},
    {active: true, name: 'C'},
    {active: false, name: 'A'},
    {active: false, name: 'D'}
  ]);
}

export function Fn123_testAbsoluteValueDescSort() {
  const arr = [-3, 1, -5, 2];
  const sortedArr = arr.sort((a, b) => Math.abs(b) - Math.abs(a));
  return JSON.stringify(sortedArr) === JSON.stringify([-5, -3, 2, 1]);
}

export function Fn124_testFirstLetterPositionSort() {
  const arr = ['banana', 'apple', 'date', 'cherry'];
  const getPosition = str => str.charCodeAt(0) - 'a'.charCodeAt(0);
  const sortedArr = arr.sort((a, b) => getPosition(a) - getPosition(b));
  return JSON.stringify(sortedArr) === JSON.stringify(['apple', 'banana', 'cherry', 'date']);
}

export function Fn125_testSliceAfterSort() {
  const arr = [5, 3, 8, 1, 9, 2, 7];
  arr.sort((a, b) => a - b);
  const sliced = arr.slice(2, 5);
  return JSON.stringify(sliced) === JSON.stringify([3, 5, 7]);
}

export function Fn126_testObjectArrayMaxSort() {
  const arr = [
    {values: [3, 1, 4]},
    {values: [1, 5, 9]},
    {values: [2, 6, 5]}
  ];
  const sortedArr = arr.sort((a, b) => {
    const maxA = Math.max(...a.values);
    const maxB = Math.max(...b.values);
    return maxA - maxB;
  });
  return JSON.stringify(sortedArr) === JSON.stringify([
    {values: [3, 1, 4]},
    {values: [2, 6, 5]},
    {values: [1, 5, 9]}
  ]);
}

export function Fn127_testInfinityValuesSort() {
  const arr = [Infinity, -Infinity, 5, 10, -5];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([-Infinity, -5, 5, 10, Infinity]);
}

export function Fn128_testNumericCharsSumSort() {
  const arr = ['a1b2c3', 'd4e5', 'f6', 'g7h8i9j0'];
  const getNumericSum = str => {
    const nums = str.match(/\d/g) || [];
    return nums.reduce((sum, num) => sum + parseInt(num), 0);
  };
  const sortedArr = arr.sort((a, b) => getNumericSum(a) - getNumericSum(b));
  return JSON.stringify(sortedArr) === JSON.stringify(['a1b2c3', 'f6', 'd4e5', 'g7h8i9j0']);
}

export function Fn129_testIndexOfAfterSort() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  return arr.indexOf(5) === 2;
}

export function Fn130_testNestedPropertyLengthSort() {
  const arr = [
    {user: {name: 'Alice'}},
    {user: {name: 'Bob'}},
    {user: {name: 'Alexandra'}}
  ];
  const sortedArr = arr.sort((a, b) => a.user.name.length - b.user.name.length);
  return JSON.stringify(sortedArr) === JSON.stringify([
    {user: {name: 'Bob'}},
    {user: {name: 'Alice'}},
    {user: {name: 'Alexandra'}}
  ]);
}

export function Fn131_testDifferentBaseNumbersSort() {
  const arr = [0o10, 0x0A, 10, 0b1010];
  const sortedArr = arr.sort((a, b) => a - b);
  return JSON.stringify(sortedArr) === JSON.stringify([0o10, 0x0A, 10, 0b1010]) ||
    JSON.stringify(sortedArr) === JSON.stringify([0b1010, 0o10, 0x0A, 10]);
}

export function Fn132_testUpperCasePresenceSort() {
  const arr = ['Apple', 'banana', 'Cherry', 'date'];
  const hasUpper = str => /[A-Z]/.test(str);
  const sortedArr = arr.sort((a, b) => {
    const aHas = hasUpper(a) ? 0 : 1;
    const bHas = hasUpper(b) ? 0 : 1;
    return aHas - bHas || a.localeCompare(b);
  });
  return JSON.stringify(sortedArr) === JSON.stringify(['Apple', 'Cherry', 'banana', 'date']);
}

export function Fn133_testIncludesAfterSort() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  return arr.includes(3) && !arr.includes(10);
}

export function Fn134_testObjectPropertyAverageSort() {
  const arr = [
    {scores: [80, 90, 70]},
    {scores: [60, 80, 75]},
    {scores: [90, 95, 85]}
  ];
  const getAverage = obj => obj.scores.reduce((sum, s) => sum + s, 0) / obj.scores.length;
  const sortedArr = arr.sort((a, b) => getAverage(a) - getAverage(b));
  return JSON.stringify(sortedArr) === JSON.stringify([
    {scores: [60, 80, 75]},
    {scores: [80, 90, 70]},
    {scores: [90, 95, 85]}
  ]);
}

export function Fn135_testEmptyObjectSort() {
  const arr = [{}, {a: 1}, {}, {b: 2, c: 3}];
  const getPropertyCount = obj => Object.keys(obj).length;
  const sortedArr = arr.sort((a, b) => getPropertyCount(a) - getPropertyCount(b));
  return JSON.stringify(sortedArr) === JSON.stringify([{}, {}, {a: 1}, {b: 2, c: 3}]);
}

export function Fn136_testHighestFrequencyCharSort() {
  const getMostFrequentChar = str => {
    const counts = {};
    for (const char of str) counts[char] = (counts[char] || 0) + 1;
    return Object.entries(counts).sort((a, b) => b[1] - a[1])[0][0];
  };
  const arr = ['apple', 'banana', 'cherry'];
  const sortedArr = arr.sort((a, b) => getMostFrequentChar(a).localeCompare(getMostFrequentChar(b)));
  return JSON.stringify(sortedArr) === JSON.stringify(['banana', 'apple', 'cherry']);
}

export function Fn137_testFlatAfterSort() {
  const arr = [[3], [1], [2]];
  arr.sort((a, b) => a[0] - b[0]);
  const flattened = arr.flat();
  return JSON.stringify(flattened) === JSON.stringify([1, 2, 3]);
}

export function Fn138_testObjectCreationTimeSymbolSort() {
  const createObj = (name) => {
    const obj = {name};
    Object.defineProperty(obj, Symbol('created'), {value: Date.now()});
    for (let i = 0; i < 100000; i++) {}
    return obj;
  };
  const obj1 = createObj('A');
  const obj2 = createObj('B');
  const obj3 = createObj('C');
  const arr = [obj2, obj3, obj1];
  const sortedArr = arr.sort((a, b) => a[Symbol('created')] - b[Symbol('created')]);
  return sortedArr[0] === obj2 && sortedArr[1] === obj3 && sortedArr[2] === obj1;
}

export function Fn139_testSpecialValuesSort() {
  const arr = [NaN, null, undefined, Infinity, -Infinity, 0, -0];
  const sortedArr = arr.sort((a, b) => {
    if (Number.isNaN(a)) return 1;
    if (Number.isNaN(b)) return -1;
    if (a === undefined) return 1;
    if (b === undefined) return -1;
    return a - b;
  });
  return JSON.stringify(sortedArr) === JSON.stringify([null, null, 0, 0, null, null, null]);
}

export function Fn140_testSquareRootSort() {
  const arr = [9, 16, 4, 25];
  const sortedArr = arr.sort((a, b) => Math.sqrt(a) - Math.sqrt(b));
  return JSON.stringify(sortedArr) === JSON.stringify([4, 9, 16, 25]);
}

export function Fn141_testConcatAfterSort() {
  const arr1 = [5, 3, 1];
  const arr2 = [6, 4, 2];
  arr1.sort((a, b) => a - b);
  arr2.sort((a, b) => a - b);
  const combined = arr1.concat(arr2);
  return JSON.stringify(combined) === JSON.stringify([1, 3, 5, 2, 4, 6]);
}

export function Fn142_testObjectArrayIncludesSort() {
  const arr = [
    {tags: ['js', 'array']},
    {tags: ['sort', 'test']},
    {tags: ['array', 'test']}
  ];
  const sortedArr = arr.sort((a, b) => {
    const aHas = a.tags.includes('array') ? 0 : 1;
    const bHas = b.tags.includes('array') ? 0 : 1;
    return aHas - bHas || a.tags.length - b.tags.length;
  });
  return JSON.stringify(sortedArr) === JSON.stringify([
    {tags: ['js', 'array']},
    {tags: ['array', 'test']},
    {tags: ['sort', 'test']}
  ]);
}

export function Fn143_testMixedRegExpStringSort() {
  const arr = [/b/, 'a', /c/, 'd'];
  const sortedArr = arr.sort((a, b) => {
    const strA = typeof a === 'string' ? a : a.source;
    const strB = typeof b === 'string' ? b : b.source;
    return strA.localeCompare(strB);
  });
  return JSON.stringify(sortedArr) === JSON.stringify(['a', /b/, /c/, 'd']);
}

export function Fn144_testReversedStringSort() {
  const arr = ['apple', 'banana', 'cherry'];
  const reversedSort = (a, b) => a.split('').reverse().join('').localeCompare(b.split('').reverse().join(''));
  const sortedArr = arr.sort(reversedSort);
  return JSON.stringify(sortedArr) === JSON.stringify(['banana', 'apple', 'cherry']);
}

export function Fn145_testFillAfterSort() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  arr.fill(0, 1, 3);
  return JSON.stringify(arr) === JSON.stringify([1, 0, 0, 8, 9]);
}

export function Fn146_testObjectMethodCountSort() {
  const obj1 = {a: 1, method1: () => {}};
  const obj2 = {b: 2};
  const obj3 = {c: 3, method1: () => {}, method2: () => {}};
  const arr = [obj1, obj2, obj3];
  const getMethodCount = obj => Object.getOwnPropertyNames(obj).filter(prop => typeof obj[prop] === 'function').length;
  const sortedArr = arr.sort((a, b) => getMethodCount(a) - getMethodCount(b));
  return sortedArr[0] === obj2 && sortedArr[1] === obj1 && sortedArr[2] === obj3;
}

export function Fn147_testMixedArrayLikeSort() {
  const arr = [
    [3, 1, 2],
    {0: 5, 1: 4, length: 2},
    [6]
  ];
  const sortedArr = arr.sort((a, b) => {
    const lenA = Array.isArray(a) ? a.length : a.length;
    const lenB = Array.isArray(b) ? b.length : b.length;
    return lenA - lenB;
  });
  return JSON.stringify(sortedArr) === JSON.stringify([[6], {0: 5, 1: 4, length: 2}, [3, 1, 2]]);
}

export function Fn148_testPerfectSquareSort() {
  const isPerfectSquare = num => {
    const sqrt = Math.sqrt(num);
    return sqrt === Math.floor(sqrt);
  };
  const arr = [16, 15, 9, 8, 25, 7];
  const sortedArr = arr.sort((a, b) => {
    if (isPerfectSquare(a) && !isPerfectSquare(b)) return -1;
    if (!isPerfectSquare(a) && isPerfectSquare(b)) return 1;
    return a - b;
  });
  return JSON.stringify(sortedArr) === JSON.stringify([9, 16, 25, 7, 8, 15]);
}

export function Fn149_testJoinAfterSort() {
  const arr = ['c', 'a', 'b'];
  arr.sort();
  const joined = arr.join(',');
  return joined === 'a,b,c';
}

export function Fn150_testObjectDateMonthSort() {
  const arr = [
    {date: new Date(2023, 5, 1)},
    {date: new Date(2023, 1, 15)},
    {date: new Date(2023, 9, 30)}
  ];
  const sortedArr = arr.sort((a, b) => a.date.getMonth() - b.date.getMonth());
  return JSON.stringify(sortedArr) === JSON.stringify([
    {date: new Date(2023, 1, 15)},
    {date: new Date(2023, 5, 1)},
    {date: new Date(2023, 9, 30)}
  ]);
}

export function Fn151_testMixedSymbolStringSort() {
  const sym1 = Symbol('b');
  const sym2 = Symbol('a');
  const arr = [sym1, 'c', sym2, 'd'];
  const sortedArr = arr.sort((a, b) => {
    const strA = typeof a === 'symbol' ? a.description : a;
    const strB = typeof b === 'symbol' ? b.description : b;
    return strA.localeCompare(strB);
  });
  return sortedArr[0] === sym2 && sortedArr[1] === sym1 && sortedArr[2] === 'c' && sortedArr[3] === 'd';
}

export function Fn152_testUniqueCharCountSort() {
  const arr = ['aaa', 'abc', 'ab', 'abcd'];
  const getUniqueCount = str => new Set(str).size;
  const sortedArr = arr.sort((a, b) => getUniqueCount(a) - getUniqueCount(b));
  return JSON.stringify(sortedArr) === JSON.stringify(['aaa', 'ab', 'abc', 'abcd']);
}

export function Fn153_testSpliceAfterSort() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  arr.splice(2, 1, 4);
  return JSON.stringify(arr) === JSON.stringify([1, 3, 4, 8, 9]);
}

export function Fn154_testObjectArraySumSort() {
  const arr = [
    {values: [3, 1, 4]},
    {values: [1, 5, 9]},
    {values: [2, 6, 5]}
  ];
  const sortedArr = arr.sort((a, b) => {
    const sumA = a.values.reduce((s, v) => s + v, 0);
    const sumB = b.values.reduce((s, v) => s + v, 0);
    return sumA - sumB;
  });
  return JSON.stringify(sortedArr) === JSON.stringify([
    {values: [3, 1, 4]},
    {values: [2, 6, 5]},
    {values: [1, 5, 9]}
  ]);
}

export function Fn155_testObjectStringIsNumberSort() {
  const arr = [
    {value: '123'},
    {value: 'abc'},
    {value: '456'},
    {value: 'def'}
  ];
  const isNumeric = str => !isNaN(parseFloat(str)) && isFinite(str);
  const sortedArr = arr.sort((a, b) => {
    const aNum = isNumeric(a.value) ? 0 : 1;
    const bNum = isNumeric(b.value) ? 0 : 1;
    return aNum - bNum || a.value.localeCompare(b.value);
  });
  return JSON.stringify(sortedArr) === JSON.stringify([
    {value: '123'},
    {value: '456'},
    {value: 'abc'},
    {value: 'def'}
  ]);
}

export function Fn156_testFactorialSort() {
  const factorial = num => num <= 1 ? 1 : num * factorial(num - 1);
  const arr = [3, 5, 2, 4];
  const sortedArr = arr.sort((a, b) => factorial(a) - factorial(b));
  return JSON.stringify(sortedArr) === JSON.stringify([2, 3, 4, 5]);
}

export function Fn157_testReverseAfterSort() {
  const arr = [5, 3, 8, 1, 9];
  arr.sort((a, b) => a - b);
  arr.reverse();
  return JSON.stringify(arr) === JSON.stringify([9, 8, 5, 3, 1]);
}

