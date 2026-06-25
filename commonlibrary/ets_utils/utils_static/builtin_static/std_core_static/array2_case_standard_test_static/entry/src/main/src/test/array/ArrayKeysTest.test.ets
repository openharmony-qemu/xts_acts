'use static'
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class ArrayKeysObjectItem {
  id: number = 0;

  constructor(id: number) {
    this.id = id;
  }
}

function collectKeys(iterator: IterableIterator<int>): Array<int> {
  let keys = new Array<int>();
  let next = iterator.next();
  while (!next.done) {
    let current = next.value;
    if (current != undefined) {
      keys.pushOne(current);
    }
    next = iterator.next();
  }
  return keys;
}

function assertSequentialKeys(iterator: IterableIterator<int>, expectedLength: int): void {
  for (let i: int = 0; i < expectedLength; i++) {
    const next = iterator.next();
    expect(next.done).assertFalse();
    expect(next.value).assertEqual(i);
  }
  const completed = iterator.next();
  expect(completed.done).assertTrue();
  expect(completed.value).assertUndefined();
}

function keysFromAnyNumberArray(value: Any): string {
  const arr = value as Array<number>;
  return collectKeys(arr.keys()).toString();
}

function createLargeIntArray(size: int): Array<int> {
  let arr = new Array<int>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

export default function ArrayKeysTest(): void {
  describe('ArrayKeysTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_0100
     * @tc.name testArrayKeys001
     * @tc.desc Verify keys does not accept parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let iterator = arr.keys();
      expect(iterator != undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_0200
     * @tc.name testArrayKeys002
     * @tc.desc Verify keys returns an index iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30);
      let iterator = arr.keys();
      let first = iterator.next();
      expect(typeof iterator.next).assertEqual('function');
      expect(first.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_0300
     * @tc.name testArrayKeys003
     * @tc.desc Verify the return value can be iterated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(1, 2, 3);
      let iterator = arr.keys();
      let count = 0;
      for (const key of iterator) {
        expect(typeof key).assertEqual('int');
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_0400
     * @tc.name testArrayKeys004
     * @tc.desc Verify next returns ordered value and done states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b');
      let iterator = arr.keys();
      let result1 = iterator.next();
      let result2 = iterator.next();
      let result3 = iterator.next();
      expect(result1.value).assertEqual(0);
      expect(result1.done).assertFalse();
      expect(result2.value).assertEqual(1);
      expect(result2.done).assertFalse();
      expect(result3.value).assertUndefined();
      expect(result3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_0500
     * @tc.name testArrayKeys005
     * @tc.desc Verify returned values are array indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30);
      let iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_0600
     * @tc.name testArrayKeys006
     * @tc.desc Verify empty arrays return an immediately completed iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>();
      let iterator = arr.keys();
      let result = iterator.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_0700
     * @tc.name testArrayKeys007
     * @tc.desc Verify keys works for single element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(1, (index: int): int => 10);
      let iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_0800
     * @tc.name testArrayKeys008
     * @tc.desc Verify keys can iterate large arrays in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createLargeIntArray(10);
      let iterator = arr.keys();
      let count = 0;
      for (const key of iterator) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_0900
     * @tc.name testArrayKeys009
     * @tc.desc Verify each keys call returns a new iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(1, 2, 3);
      let iter1 = arr.keys();
      let iter2 = arr.keys();
      iter1.next();
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_1000
     * @tc.name testArrayKeys010
     * @tc.desc Verify two iterators do not share iteration state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let iter1 = arr.keys();
      let iter2 = arr.keys();
      expect(iter1.next().value).assertEqual(0);
      expect(iter2.next().value).assertEqual(0);
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_1100
     * @tc.name testArrayKeys011
     * @tc.desc Verify array updates after iterator creation do not break key iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(1, 2, 3);
      let iterator = arr.keys();
      arr.pushOne(4);
      arr.splice(0, 1);
      let keys = collectKeys(iterator);
      let doneStep = iterator.next();
      expect(keys.toString()).assertEqual('0,1,2');
      expect(doneStep.done).assertTrue();
      expect(doneStep.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_1200
     * @tc.name testArrayKeys012
     * @tc.desc Verify for of can traverse keys in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let keys = new Array<int>();
      for (const key of arr.keys()) {
        keys.pushOne(key);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(1);
      expect(keys[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_1300
     * @tc.name testArrayKeys013
     * @tc.desc Verify keys can be used to access array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30);
      for (const key of arr.keys()) {
        expect(arr[key]).assertEqual((key + 1) * 10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_1400
     * @tc.name testArrayKeys014
     * @tc.desc Verify keys returns indexes while values returns array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30);
      let keysIter = arr.keys();
      let valuesIter = arr.values();
      expect(keysIter.next().value).assertEqual(0);
      expect(valuesIter.next().value).assertEqual(10);
      expect(keysIter.next().value).assertEqual(1);
      expect(valuesIter.next().value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_1500
     * @tc.name testArrayKeys015
     * @tc.desc Verify keys returns indexes while entries returns index value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b');
      let keysIter = arr.keys();
      let entriesIter = arr.entries();
      let keyResult = keysIter.next();
      let entryResult = entriesIter.next();
      expect(keyResult.value).assertEqual(0);
      expect(entryResult.done).assertFalse();
      expect(entryResult.value != undefined).assertTrue();
      if (entryResult.value != undefined) {
        let entryValue = entryResult.value as [int, string];
        expect(entryValue[0]).assertEqual(0);
        expect(entryValue[1]).assertEqual('a');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_1600
     * @tc.name testArrayKeys016
     * @tc.desc Verify keys returns indexes while $_iterator returns values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30);
      let keysIter = arr.keys();
      let valuesIter = arr.$_iterator();
      expect(keysIter.next().value).assertEqual(0);
      expect(valuesIter.next().value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_1700
     * @tc.name testArrayKeys017
     * @tc.desc Verify explicit undefined values do not affect manual next progression of keys iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int | undefined>(3, (_index) => undefined);
      arr[0] = 10;
      arr[2] = 30;
      let iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_1800
     * @tc.name testArrayKeys018
     * @tc.desc Verify keys can be collected in spread equivalent order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30);
      let keys = collectKeys(arr.keys());
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(1);
      expect(keys[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_1900
     * @tc.name testArrayKeys019
     * @tc.desc Verify keys can be collected in Array from equivalent order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let keys = collectKeys(arr.keys());
      expect(Array.isArray(keys)).assertTrue();
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_2000
     * @tc.name testArrayKeys020
     * @tc.desc Verify keys is not affected by the array generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<int>(1, 2, 3);
      let iter1 = arr1.keys();
      let arr2 = new Array<string>('a', 'b', 'c');
      let iter2 = arr2.keys();
      expect(typeof iter1.next().value).assertEqual('int');
      expect(typeof iter2.next().value).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_2100
     * @tc.name testArrayKeys021
     * @tc.desc Verify keys works across different element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberArr = new Array<int>(1, 2);
      let stringArr = new Array<string>('a', 'b');
      let boolArr = new Array<boolean>(true, false);
      let charArr = new Array<char>(c'A', c'B');
      expect(numberArr.keys().next().value).assertEqual(0);
      expect(stringArr.keys().next().value).assertEqual(0);
      expect(boolArr.keys().next().value).assertEqual(0);
      expect(charArr.keys().next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_2200
     * @tc.name testArrayKeys022
     * @tc.desc Verify collected keys can be processed with forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30);
      let keys = collectKeys(arr.keys());
      let sum = 0;
      keys.forEach((key: int): void => {
        expect(typeof key).assertEqual('int');
        sum += key;
      });
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_2300
     * @tc.name testArrayKeys023
     * @tc.desc Verify collected keys can be mapped to derived values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30);
      let keys = collectKeys(arr.keys());
      let doubled = keys.map((key: int): int => arr[key] * 2);
      expect(doubled[0]).assertEqual(20);
      expect(doubled[1]).assertEqual(40);
      expect(doubled[2]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_2400
     * @tc.name testArrayKeys024
     * @tc.desc Verify collected keys can be filtered by index rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30, 40);
      let keys = collectKeys(arr.keys());
      let evenKeys = keys.filter((key: int): boolean => key % 2 === 0);
      expect(evenKeys.length).assertEqual(2);
      expect(evenKeys[0]).assertEqual(0);
      expect(evenKeys[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_2500
     * @tc.name testArrayKeys025
     * @tc.desc Verify keys returns continuous indexes starting from zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(100, 200, 300, 400, 500);
      let iterator = arr.keys();
      for (let i: int = 0; i < arr.length; i++) {
        expect(iterator.next().value).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_2600
     * @tc.name testArrayKeys026
     * @tc.desc Verify the number of keys matches array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(1, 2, 3, 4, 5);
      let keys = collectKeys(arr.keys());
      expect(keys.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_2700
     * @tc.name testArrayKeys027
     * @tc.desc Verify break can interrupt keys iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(1, 2, 3, 4, 5);
      let keys = new Array<int>();
      for (const key of arr.keys()) {
        keys.pushOne(key);
        if (key === 2) {
          break;
        }
      }
      expect(keys.length).assertEqual(3);
      expect(keys[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_2800
     * @tc.name testArrayKeys028
     * @tc.desc Verify iterator state can be observed after partial consumption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(1, 2, 3, 4, 5);
      let iterator = arr.keys();
      let first = iterator.next();
      let remaining = collectKeys(iterator);
      expect(first.value).assertEqual(0);
      expect(remaining.length).assertEqual(4);
      expect(remaining[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_2900
     * @tc.name testArrayKeys029
     * @tc.desc Verify Array keys differs from Object keys in return shape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30);
      let arrKeys = collectKeys(arr.keys());
      let objKeys = Object.keys(arr);
      expect(arrKeys[0]).assertEqual(0);
      expect(objKeys[0]).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_3000
     * @tc.name testArrayKeys030
     * @tc.desc Verify keys can be used while retrieving both indexes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let pairs = new Array<string>();
      for (const key of arr.keys()) {
        pairs.pushOne(key.toString() + ':' + arr[key]);
      }
      expect(pairs.length).assertEqual(3);
      expect(pairs[0]).assertEqual('0:a');
      expect(pairs[2]).assertEqual('2:c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_3100
     * @tc.name testArrayKeys031
     * @tc.desc Verify values can be filtered by selected key indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30, 40, 50);
      let evenIndexValues = collectKeys(arr.keys())
        .filter((key: int): boolean => key % 2 === 0)
        .map((key: int): int => arr[key]);
      expect(evenIndexValues[0]).assertEqual(10);
      expect(evenIndexValues[1]).assertEqual(30);
      expect(evenIndexValues[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_3200
     * @tc.name testArrayKeys032
     * @tc.desc Verify keys can build index to element mappings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('apple', 'banana', 'cherry');
      let indexMap = new Map<number, string>();
      for (const key of arr.keys()) {
        indexMap.set(key, arr[key]);
      }
      expect(indexMap.get(0)).assertEqual('apple');
      expect(indexMap.get(2)).assertEqual('cherry');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_3300
     * @tc.name testArrayKeys033
     * @tc.desc Verify collecting keys from an empty array yields no indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>();
      let keys = collectKeys(arr.keys());
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_3400
     * @tc.name testArrayKeys034
     * @tc.desc Verify collecting keys from a single element array yields zero only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(100);
      let keys = collectKeys(arr.keys());
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_3500
     * @tc.name testArrayKeys035
     * @tc.desc Verify very large arrays still expose the first key correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createLargeIntArray(100000);
      let iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_3600
     * @tc.name testArrayKeys036
     * @tc.desc Verify pushing elements changes keys in newly created iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(1, 2);
      let keys1 = collectKeys(arr.keys());
      arr.pushOne(3);
      let keys2 = collectKeys(arr.keys());
      expect(keys1.length).assertEqual(2);
      expect(keys2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_3700
     * @tc.name testArrayKeys037
     * @tc.desc Verify removing the last element changes keys in new iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(1, 2, 3);
      let keys1 = collectKeys(arr.keys());
      arr.pop();
      let keys2 = collectKeys(arr.keys());
      expect(keys1.length).assertEqual(3);
      expect(keys2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_3800
     * @tc.name testArrayKeys038
     * @tc.desc Verify splice updates keys for newly created iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(1, 2, 3, 4, 5);
      let keys1 = collectKeys(arr.keys());
      arr.splice(1, 2);
      let keys2 = collectKeys(arr.keys());
      expect(keys1.length).assertEqual(5);
      expect(keys2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_3900
     * @tc.name testArrayKeys039
     * @tc.desc Verify readonly arrays also support keys iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyArray<int> = [1, 2, 3];
      assertSequentialKeys(arr.keys(), 3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_4000
     * @tc.name testArrayKeys040
     * @tc.desc Verify keys can enumerate indexes for a 1-element numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeIntArray(1);
      assertSequentialKeys(arr.keys(), 1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_4100
     * @tc.name testArrayKeys041
     * @tc.desc Verify keys on a dense array with explicit undefined values still enumerates every index up to length minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(6, (_index) => undefined);
      arr[2] = 20;
      arr[5] = 50;
      const result = collectKeys(arr.keys());
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(0);
      expect(result[5]).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_4200
     * @tc.name testArrayKeys042
     * @tc.desc Verify keys iterator created before push observes the appended index while iterating
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      arr.pushOne(30);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_4300
     * @tc.name testArrayKeys043
     * @tc.desc Verify keys iterator created before shrinkTo respects the shorter final length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeIntArray(5);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      arr.shrinkTo(2);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_4400
     * @tc.name testArrayKeys044
     * @tc.desc Verify keys continues to enumerate zero-based indexes after shift changes the head value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(7, 8, 9);
      arr.shift();
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(arr[0]).assertEqual(8);
      expect(iterator.next().value).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_4500
     * @tc.name testArrayKeys045
     * @tc.desc Verify keys can enumerate indexes after splice inserts an extra middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 4);
      arr.splice(2, 0, 3);
      const result = collectKeys(arr.keys());
      expect(result.toString()).assertEqual('0,1,2,3');
      expect(arr[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_4600
     * @tc.name testArrayKeys046
     * @tc.desc Verify keys can enumerate indexes on a reversed array while values change order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      const keys = collectKeys(arr.keys());
      expect(keys.toString()).assertEqual('0,1,2');
      expect(arr.toString()).assertEqual('3,2,1');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_4700
     * @tc.name testArrayKeys047
     * @tc.desc Verify keys can enumerate indexes on a sorted array while values become ordered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(30, 10, 20);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(arr[0]).assertEqual(10);
      expect(iterator.next().value).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_4800
     * @tc.name testArrayKeys048
     * @tc.desc Verify keys can enumerate indexes on arrays created by concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4, 5));
      const result = collectKeys(arr.keys());
      expect(result.length).assertEqual(5);
      expect(result[4]).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_4900
     * @tc.name testArrayKeys049
     * @tc.desc Verify keys can enumerate indexes on arrays produced by Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(5, 6, 7);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_5000
     * @tc.name testArrayKeys050
     * @tc.desc Verify keys can enumerate indexes on arrays produced by Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Array<number>(9, 8, 7, 6));
      const result = collectKeys(arr.keys());
      expect(result.toString()).assertEqual('0,1,2,3');
      expect(arr[0]).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_5100
     * @tc.name testArrayKeys051
     * @tc.desc Verify keys can enumerate indexes on a toReversed copy without changing the source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4);
      const arr = source.toReversed();
      const result = collectKeys(arr.keys());
      expect(result.toString()).assertEqual('0,1,2,3');
      expect(source.toString()).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_5200
     * @tc.name testArrayKeys052
     * @tc.desc Verify keys can enumerate indexes on a toSpliced copy with a changed length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toSpliced(1, 1, 7, 8);
      const result = collectKeys(arr.keys());
      expect(result.toString()).assertEqual('0,1,2,3');
      expect(arr.length).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_5300
     * @tc.name testArrayKeys053
     * @tc.desc Verify keys can enumerate indexes on a with copy while preserving source contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      const arr = source.with(1, 9);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(source[1]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_5400
     * @tc.name testArrayKeys054
     * @tc.desc Verify keys can enumerate indexes on a toSorted copy while leaving source order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(4, 1, 3, 2);
      const arr = source.toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const result = collectKeys(arr.keys());
      expect(result.toString()).assertEqual('0,1,2,3');
      expect(source.toString()).assertEqual('4,1,3,2');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_5500
     * @tc.name testArrayKeys055
     * @tc.desc Verify keys iterator reports done and undefined value after full consumption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      const completed = iterator.next();
      expect(completed.done).assertTrue();
      expect(completed.value).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_5600
     * @tc.name testArrayKeys056
     * @tc.desc Verify multiple iterator next calls stay completed after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      const done1 = iterator.next();
      const done2 = iterator.next();
      expect(done1.done).assertTrue();
      expect(done1.value).assertUndefined();
      expect(done2.done).assertTrue();
      expect(done2.value).assertUndefined();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_5700
     * @tc.name testArrayKeys057
     * @tc.desc Verify keys can enumerate a three-element array in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_5800
     * @tc.name testArrayKeys058
     * @tc.desc Verify keys on an empty array finishes immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.keys().next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_5900
     * @tc.name testArrayKeys059
     * @tc.desc Verify keys on a single-element array yields zero only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(99);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_6000
     * @tc.name testArrayKeys060
     * @tc.desc Verify keys works after push appends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.push(1, 2, 3);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_6100
     * @tc.name testArrayKeys061
     * @tc.desc Verify keys works after pop removes the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.pop();
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_6200
     * @tc.name testArrayKeys062
     * @tc.desc Verify keys works after shift removes the head but preserves zero-based indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.shift();
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_6300
     * @tc.name testArrayKeys063
     * @tc.desc Verify keys works on arrays returned by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).slice(1, 4);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_6400
     * @tc.name testArrayKeys064
     * @tc.desc Verify keys works on arrays returned by map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).map((value: number): number => value * 2);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_6500
     * @tc.name testArrayKeys065
     * @tc.desc Verify keys works on arrays returned by filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).filter((value: number): boolean => value > 2);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_6600
     * @tc.name testArrayKeys066
     * @tc.desc Verify keys works on arrays returned by toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toReversed();
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_6700
     * @tc.name testArrayKeys067
     * @tc.desc Verify a keys iterator can be drained with manual next calls into an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const iterator = arr.keys();
      const keys = new Array<int>();
      let next = iterator.next();
      while (!next.done) {
        keys.pushOne(next.value as int);
        next = iterator.next();
      }
      expect(keys.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_6800
     * @tc.name testArrayKeys068
     * @tc.desc Verify keys can be reduced into the sum of all indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7, 8);
      const sum = collectKeys(arr.keys()).reduce((acc: int, key: int): int => acc + key, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_6900
     * @tc.name testArrayKeys069
     * @tc.desc Verify keys can be filtered to keep only odd indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const oddKeys = collectKeys(arr.keys()).filter((key: int): boolean => key % 2 === 1);
      expect(oddKeys.toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_7000
     * @tc.name testArrayKeys070
     * @tc.desc Verify keys can map indexes back to matching value text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const mapped = collectKeys(arr.keys()).map((key: int): string => key.toString() + ':' + arr[key]);
      expect(mapped.toString()).assertEqual('0:a,1:b,2:c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_7100
     * @tc.name testArrayKeys071
     * @tc.desc Verify keys on a dense array with explicit undefined values can still drive value lookups for present slots only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(5, (_index) => undefined);
      arr[1] = 10;
      arr[4] = 40;
      const present = collectKeys(arr.keys()).filter((key: int): boolean => arr[key] !== undefined);
      expect(present.toString()).assertEqual('1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_7200
     * @tc.name testArrayKeys072
     * @tc.desc Verify a partially consumed iterator does not affect a newly created iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const first = arr.keys();
      first.next();
      first.next();
      const second = arr.keys();
      expect(first.next().value).assertEqual(2);
      expect(second.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_7300
     * @tc.name testArrayKeys073
     * @tc.desc Verify a keys iterator created before pop stops at the shorter final length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      arr.pop();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_7400
     * @tc.name testArrayKeys074
     * @tc.desc Verify a keys iterator created before splice can observe the new longer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 4);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      arr.splice(1, 0, 2, 3);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_7500
     * @tc.name testArrayKeys075
     * @tc.desc Verify keys on a copyWithin-mutated array still yields continuous indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.copyWithin(1, 0, 2);
      expect(collectKeys(arr.keys()).toString()).assertEqual('0,1,2,3');
      expect(arr.toString()).assertEqual('1,1,2,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_7600
     * @tc.name testArrayKeys076
     * @tc.desc Verify keys on a fill-mutated array still matches the current length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.fill(9, 1, 3);
      const result = collectKeys(arr.keys());
      expect(result.length).assertEqual(arr.length);
      expect(result.toString()).assertEqual('0,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_7700
     * @tc.name testArrayKeys077
     * @tc.desc Verify keys can enumerate indexes on arrays returned by flatMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      const arr = source.flatMap((value: number): Array<number> => new Array<number>(value, value * 10));
      expect(collectKeys(arr.keys()).toString()).assertEqual('0,1,2,3,4,5');
      expect(source.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_7800
     * @tc.name testArrayKeys078
     * @tc.desc Verify keys can enumerate indexes on arrays returned by toSpliced with extra items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toSpliced(1, 1, 7, 8);
      expect(collectKeys(arr.keys()).toString()).assertEqual('0,1,2,3');
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_7900
     * @tc.name testArrayKeys079
     * @tc.desc Verify keys can enumerate indexes on arrays returned by with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      const arr = source.with(2, 9);
      expect(collectKeys(arr.keys()).toString()).assertEqual('0,1,2');
      expect(source[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_8000
     * @tc.name testArrayKeys080
     * @tc.desc Verify keys can enumerate indexes on arrays returned by Array.from from typed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const typed = new Uint8Array([7, 8, 9]);
      const arr = Array.from<number>(typed);
      expect(collectKeys(arr.keys()).toString()).assertEqual('0,1,2');
      expect(typed[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_8100
     * @tc.name testArrayKeys081
     * @tc.desc Verify keys can enumerate indexes on arrays returned by Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(3, 4, 5, 6);
      const keys = collectKeys(arr.keys());
      expect(keys.toString()).assertEqual('0,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_8200
     * @tc.name testArrayKeys082
     * @tc.desc Verify keys can enumerate indexes on arrays returned by concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3), new Array<number>(4, 5));
      const keys = collectKeys(arr.keys());
      expect(keys.toString()).assertEqual('0,1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_8300
     * @tc.name testArrayKeys083
     * @tc.desc Verify keys can be consumed after collecting values from a matching array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('x', 'y', 'z');
      const values = new Array<string>();
      for (const key of arr.keys()) {
        values.pushOne(arr[key]);
      }
      expect(values.toString()).assertEqual('x,y,z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_8400
     * @tc.name testArrayKeys084
     * @tc.desc Verify keys can drive an entries-style reconstruction of index value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      const pairs = new Array<string>();
      for (const key of arr.keys()) {
        pairs.pushOne(key.toString() + '=' + arr[key].toString());
      }
      expect(pairs.toString()).assertEqual('0=4,1=5,2=6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_8500
     * @tc.name testArrayKeys085
     * @tc.desc Verify keys iterator stays valid after the source variable is reassigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      const original = arr;
      const iterator = arr.keys();
      arr = new Array<number>(9);
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(original.length).assertEqual(3);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_8600
     * @tc.name testArrayKeys086
     * @tc.desc Verify keys can iterate over readonly array aliases the same way as mutable arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const readonlyAlias: ReadonlyArray<number> = arr;
      expect(collectKeys(readonlyAlias.keys()).toString()).assertEqual('0,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_8700
     * @tc.name testArrayKeys087
     * @tc.desc Verify keys can enumerate indexes on a boolean array without depending on element truthiness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, true, false);
      expect(collectKeys(arr.keys()).toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_8800
     * @tc.name testArrayKeys088
     * @tc.desc Verify keys can enumerate indexes on a bigint array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n, 4n);
      expect(collectKeys(arr.keys()).toString()).assertEqual('0,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_8900
     * @tc.name testArrayKeys089
     * @tc.desc Verify keys can enumerate indexes on a char array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b', c'c');
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_9000
     * @tc.name testArrayKeys090
     * @tc.desc Verify keys can enumerate indexes on an array of custom object instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ArrayKeysObjectItem(1);
      const second = new ArrayKeysObjectItem(2);
      const arr = new Array<Object>(first, second);
      expect(collectKeys(arr.keys()).toString()).assertEqual('0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_9100
     * @tc.name testArrayKeys091
     * @tc.desc Verify keys can be consumed after the array length is manually reset to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.keys();
      arr.length = 0;
      const result = iterator.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_9200
     * @tc.name testArrayKeys092
     * @tc.desc Verify keys can enumerate indexes again after the array is cleared and rebuilt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(9);
      arr.pushOne(8);
      const iterator = arr.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_9300
     * @tc.name testArrayKeys093
     * @tc.desc Verify keys on a large generated array can confirm the last emitted index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeIntArray(32);
      const keys = collectKeys(arr.keys());
      expect(keys.length).assertEqual(32);
      expect(keys[31]).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_9400
     * @tc.name testArrayKeys094
     * @tc.desc Verify keys can be consumed with forEach after collection into an intermediate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7, 8);
      let text = '';
      collectKeys(arr.keys()).forEach((key: int): void => {
        text += key.toString();
      });
      expect(text).assertEqual('0123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_9500
     * @tc.name testArrayKeys095
     * @tc.desc Verify keys can cooperate with filter and map to derive selected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const selected = collectKeys(arr.keys())
        .filter((key: int): boolean => key % 2 === 0)
        .map((key: int): number => arr[key]);
      expect(selected.toString()).assertEqual('10,30,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_9600
     * @tc.name testArrayKeys096
     * @tc.desc Verify keys and Object.keys produce the same indexes for a dense array filled with undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[1] = 10;
      arr[3] = 30;
      const keys = collectKeys(arr.keys());
      const objectKeys = Object.keys(arr);
      expect(keys.toString()).assertEqual('0,1,2,3');
      expect(objectKeys.toString()).assertEqual('0,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_9700
     * @tc.name testArrayKeys097
     * @tc.desc Verify keys works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(keysFromAnyNumberArray(anyValue)).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_KEYS_9800
     * @tc.name testArrayKeys098
     * @tc.desc Verify keys supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayKeys098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      const keys = collectKeys(anyArr.keys());
      expect(keys.toString()).assertEqual('0,1,2');
      expect(anyArr.toString()).assertEqual('1,two,true');
    });

  });
}
