'use static';
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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class Item024 {
  value: int = 0;
}

function collectNumberValues(iterator: IterableIterator<int>): Array<int> {
  const values = new Array<int>();
  let next = iterator.next();
  while (!next.done) {
    const current = next.value;
    if (current != undefined) {
      values.pushOne(current);
    }
    next = iterator.next();
  }
  return values;
}

function collectStringValues(iterator: IterableIterator<string>): Array<string> {
  const values = new Array<string>();
  let next = iterator.next();
  while (!next.done) {
    const current = next.value;
    if (current != undefined) {
      values.pushOne(current);
    }
    next = iterator.next();
  }
  return values;
}

function collectOptionalNumberValues(iterator: IterableIterator<int | undefined>): Array<int | undefined> {
  const values = new Array<int | undefined>();
  let next = iterator.next();
  while (!next.done) {
    values.pushOne(next.value);
    next = iterator.next();
  }
  return values;
}

function compareNumberArrays(left: Array<int>, right: Array<int>): void {
  expect(left.length).assertEqual(right.length);
  for (let i = 0; i < left.length; i++) {
    expect(left[i]).assertEqual(right[i]);
  }
}

export default function ArrayIteratorTest(): void {
  describe('ArrayIteratorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0100
     * @tc.name testArrayIterator001
     * @tc.desc Verify iterator method accepts no parameters and returns a non-null iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iterator = arr.$_iterator();
      expect(iterator != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0200
     * @tc.name testArrayIterator002
     * @tc.desc Verify iterator method returns an iterator object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const iterator = arr.$_iterator();
      const nextType = iterator.next
      expect(nextType.name).assertEqual('next');
      expect(iterator.next().value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0300
     * @tc.name testArrayIterator003
     * @tc.desc Verify returned iterator is iterable with for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const iterator = arr.$_iterator();
      let count = 0;
      for (const value of iterator) {
        const valueType = Class.of(value).getName().split('.');
        expect(valueType[valueType.length - 1]).assertEqual('String');
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0400
     * @tc.name testArrayIterator004
     * @tc.desc Verify next returns value and done pairs in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const iterator = arr.$_iterator();

      const result1 = iterator.next();
      expect(result1.value).assertEqual(10);
      expect(result1.done).assertFalse();

      const result2 = iterator.next();
      expect(result2.value).assertEqual(20);
      expect(result2.done).assertFalse();

      const result3 = iterator.next();
      expect(result3.value).assertEqual(30);
      expect(result3.done).assertFalse();

      const result4 = iterator.next();
      expect(result4.done).assertTrue();
      expect(result4.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0500
     * @tc.name testArrayIterator005
     * @tc.desc Verify iterator values are array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const iterator = arr.$_iterator();
      expect(iterator.next().value).assertEqual('a');
      expect(iterator.next().value).assertEqual('b');
      expect(iterator.next().value).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0600
     * @tc.name testArrayIterator006
     * @tc.desc Verify empty arrays return an iterator that finishes immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const iterator = arr.$_iterator();
      const result = iterator.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0700
     * @tc.name testArrayIterator007
     * @tc.desc Verify single-element arrays iterate their only value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(100);
      const iterator = arr.$_iterator();
      expect(iterator.next().value).assertEqual(100);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0800
     * @tc.name testArrayIterator008
     * @tc.desc Verify large arrays can be traversed by iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 10000; i++) {
        arr.pushOne(i);
      }
      const iterator = arr.$_iterator();
      let count = 0;
      for (const value of iterator) {
        expect(value).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_0900
     * @tc.name testArrayIterator009
     * @tc.desc Verify repeated iterator calls return independent iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iter1 = arr.$_iterator();
      const iter2 = arr.$_iterator();

      iter1.next();
      expect(iter1.next().value).assertEqual(2);
      expect(iter2.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1000
     * @tc.name testArrayIterator010
     * @tc.desc Verify two iterators keep independent internal states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iter1 = arr.$_iterator();
      const iter2 = arr.$_iterator();

      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
      expect(iter1.next().value).assertEqual(2);
      expect(iter2.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1100
     * @tc.name testArrayIterator011
     * @tc.desc Verify iterator observes element updates after creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iterator = arr.$_iterator();

      arr.pushOne(4);
      arr[0] = 100;

      expect(iterator.next().value).assertEqual(100);
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1200
     * @tc.name testArrayIterator012
     * @tc.desc Verify for-of can traverse values from the iterator method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const values = new Array<int>();
      for (const value of arr.$_iterator()) {
        values.pushOne(value);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1300
     * @tc.name testArrayIterator013
     * @tc.desc Verify iterator values match values method output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);

      const iter1 = arr.$_iterator();
      const iter2 = arr.values();

      expect(iter1.next().value).assertEqual(iter2.next().value);
      expect(iter1.next().value).assertEqual(iter2.next().value);
      expect(iter1.next().value).assertEqual(iter2.next().value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1400
     * @tc.name testArrayIterator014
     * @tc.desc Verify iterator returns values while keys returns indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);

      const valuesIter = arr.$_iterator();
      const keysIter = arr.keys();

      expect(valuesIter.next().value).assertEqual(10);
      expect(keysIter.next().value).assertEqual(0);

      expect(valuesIter.next().value).assertEqual(20);
      expect(keysIter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1500
     * @tc.name testArrayIterator015
     * @tc.desc Verify iterator returns values while entries returns index value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20);

      const iter = arr.$_iterator();
      const entriesIter = arr.entries();

      const valueResult = iter.next();
      expect(valueResult.value).assertEqual(10);

      const entryResult = entriesIter.next();
      expect(entryResult.done).assertFalse();
      expect(entryResult.value != undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1600
     * @tc.name testArrayIterator016
     * @tc.desc Verify iterator handles sparse arrays and preserves undefined holes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(10, undefined, 30);
      const values = collectOptionalNumberValues(arr.$_iterator());
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertUndefined();
      expect(values[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1700
     * @tc.name testArrayIterator017
     * @tc.desc Verify iterator values can be collected into a new array in spread-equivalent order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const values = collectNumberValues(arr.$_iterator());
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1800
     * @tc.name testArrayIterator018
     * @tc.desc Verify iterator values can be collected into a new array in Array.from-equivalent order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const values = collectStringValues(arr.$_iterator());
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
      expect(values[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_1900
     * @tc.name testArrayIterator019
     * @tc.desc Verify iterator preserves generic element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3);
      const iter1 = arr1.$_iterator();
      const value1 = iter1.next().value;
      expect(value1).assertEqual(1);

      const arr2 = new Array<string>('a', 'b', 'c');
      const iter2 = arr2.$_iterator();
      const value2 = iter2.next().value;
      expect(value2).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2000
     * @tc.name testArrayIterator020
     * @tc.desc Verify iterator works for number string and boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberArr = new Array<int>(1, 2);
      const stringArr = new Array<string>('a', 'b');
      const boolArr = new Array<boolean>(true, false);

      expect(numberArr.$_iterator().next().value).assertEqual(1);
      expect(stringArr.$_iterator().next().value).assertEqual('a');
      expect(boolArr.$_iterator().next().value).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2100
     * @tc.name testArrayIterator021
     * @tc.desc Verify iterator preserves null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null>(1, null, 3);
      const iterator = arr.$_iterator();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertNull();
      expect(iterator.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2200
     * @tc.name testArrayIterator022
     * @tc.desc Verify iterator preserves undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, undefined, 3);
      const iterator = arr.$_iterator();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertUndefined();
      expect(iterator.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2300
     * @tc.name testArrayIterator023
     * @tc.desc Verify iterator preserves NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, NaN, 3);
      const iterator = arr.$_iterator();
      expect(iterator.next().value).assertEqual(1);
      const middle = iterator.next().value;
      expect(middle != undefined).assertTrue();
      if (middle != undefined) {
        expect(Number.isNaN(middle)).assertTrue();
      }
      expect(iterator.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2400
     * @tc.name testArrayIterator024
     * @tc.desc Verify iterator preserves object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item024>();
      const item = new Item024();
      item.value = 100;
      arr.pushOne(item);

      const iterator = arr.$_iterator();
      const result = iterator.next().value as Item024;
      expect(result == item).assertTrue();
      result.value = 200;
      expect(arr[0].value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2500
     * @tc.name testArrayIterator025
     * @tc.desc Verify collected iterator values can be transformed with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const values = collectNumberValues(arr.$_iterator());
      const doubled = values.map((v: int): int => v * 2);
      expect(doubled[0]).assertEqual(2);
      expect(doubled[1]).assertEqual(4);
      expect(doubled[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2600
     * @tc.name testArrayIterator026
     * @tc.desc Verify collected iterator values can be filtered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const values = collectNumberValues(arr.$_iterator());
      const evens = values.filter((v: int): boolean => v % 2 === 0);
      expect(evens.length).assertEqual(2);
      expect(evens[0]).assertEqual(2);
      expect(evens[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2700
     * @tc.name testArrayIterator027
     * @tc.desc Verify collected iterator values can be reduced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const values = collectNumberValues(arr.$_iterator());
      const sum = values.reduce((acc: int, val: int): int => acc + val, 0);
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2800
     * @tc.name testArrayIterator028
     * @tc.desc Verify iteration can be interrupted with break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const values = new Array<int>();
      for (const value of arr.$_iterator()) {
        values.pushOne(value);
        if (value === 3) {
          break;
        }
      }
      expect(values.length).assertEqual(3);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_2900
     * @tc.name testArrayIterator029
     * @tc.desc Verify a partially consumed iterator continues from its current position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const iterator = arr.$_iterator();
      const first = iterator.next();
      expect(first.value).assertEqual(1);
      expect(first.done).assertFalse();
      const remaining = collectNumberValues(iterator);
      compareNumberArrays(remaining, new Array<int>(2, 3, 4, 5));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_3000
     * @tc.name testArrayIterator030
     * @tc.desc Verify iterator method aligns with Symbol.iterator output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iter1 = arr.$_iterator();
      const iter2 = arr.values();

      expect(iter1.next().value).assertEqual(iter2.next().value);
      expect(iter1.next().value).assertEqual(iter2.next().value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_3100
     * @tc.name testArrayIterator031
     * @tc.desc Verify iterator method is equivalent to default for-of traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);

      const values1 = new Array<int>();
      for (const value of arr) {
        values1.pushOne(value);
      }

      const values2 = new Array<int>();
      for (const value of arr.$_iterator()) {
        values2.pushOne(value);
      }

      compareNumberArrays(values1, values2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_3200
     * @tc.name testArrayIterator032
     * @tc.desc Verify iterator method and values method have the same behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');

      const iter1 = arr.$_iterator();
      const iter2 = arr.values();

      const values1 = collectStringValues(iter1);
      const values2 = collectStringValues(iter2);

      expect(values1.length).assertEqual(values2.length);
      for (let i = 0; i < values1.length; i++) {
        expect(values1[i]).assertEqual(values2[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_3300
     * @tc.name testArrayIterator033
     * @tc.desc Verify iterator observes updated array element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iterator = arr.$_iterator();

      arr[0] = 100;
      expect(iterator.next().value).assertEqual(100);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_3400
     * @tc.name testArrayIterator034
     * @tc.desc Verify pushing new elements after iterator creation keeps iteration behavior stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iterator = arr.$_iterator();

      arr.pushOne(4);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().value).assertEqual(3);
      const last = iterator.next();
      expect(last.done).assertFalse();
      expect(last.value).assertEqual(4);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_3500
     * @tc.name testArrayIterator035
     * @tc.desc Verify deleting elements after iterator creation does not crash iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const iterator = arr.$_iterator();

      arr.splice(1, 1);
      expect(iterator.next().value).assertEqual(1);
      const second = iterator.next();
      expect(second.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_3600
     * @tc.name testArrayIterator036
     * @tc.desc Verify iterator can be used for custom traversal loops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const iterator = arr.$_iterator();

      let result = iterator.next();
      while (!result.done) {
        const current = result.value;
        if (current != undefined && current > 3) {
          break;
        }
        result = iterator.next();
      }
      expect(result.value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_3700
     * @tc.name testArrayIterator037
     * @tc.desc Verify collected iterator values support chained processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const values = collectNumberValues(arr.$_iterator());
      const sum = values
        .filter((x: int): boolean => x % 2 === 0)
        .map((x: int): int => x * 2)
        .reduce((a: int, b: int): int => a + b, 0);
      expect(sum).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_3800
     * @tc.name testArrayIterator038
     * @tc.desc Verify iterator supports lazy processing with early break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      const iterator = arr.$_iterator();

      let count = 0;
      let sum = 0;
      for (const value of iterator) {
        sum += value;
        count++;
        if (count >= 3) {
          break;
        }
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_3900
     * @tc.name testArrayIterator039
     * @tc.desc Verify readonly array references can expose iterator values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<int>(1, 2, 3);
      const arr: ReadonlyArray<int> = source;
      const iterator = arr.$_iterator();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_4000
     * @tc.name testArrayIterator040
     * @tc.desc Verify iterator and for-loop traverse the same ordered values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 10000; i++) {
        arr.pushOne(i);
      }

      let iteratorCount = 0;
      for (const value of arr.$_iterator()) {
        expect(value).assertEqual(iteratorCount);
        iteratorCount++;
      }

      let loopCount = 0;
      for (let i = 0; i < arr.length; i++) {
        const value = arr[i];
        expect(value).assertEqual(i);
        loopCount++;
      }
      expect(iteratorCount).assertEqual(loopCount);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_4100
     * @tc.name testArrayIterator041
     * @tc.desc Verify empty array iterator collects zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const values = collectNumberValues(arr.$_iterator());
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_4200
     * @tc.name testArrayIterator042
     * @tc.desc Verify single-element iterators collect exactly one value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(100);
      const values = collectNumberValues(arr.$_iterator());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_4300
     * @tc.name testArrayIterator043
     * @tc.desc Verify iterator preserves zero false empty string null and undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | boolean | string | null | undefined>(0, false, '', null, undefined);
      const iterator = arr.$_iterator();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertFalse();
      expect(iterator.next().value).assertEqual('');
      expect(iterator.next().value).assertNull();
      expect(iterator.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ITERATOR_4400
     * @tc.name testArrayIterator044
     * @tc.desc Verify iterator method is fully equivalent to direct for-of traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIterator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);

      const method = new Array<int>();
      for (const value of arr.$_iterator()) {
        method.pushOne(value);
      }

      const direct = new Array<int>();
      for (const value of arr) {
        direct.pushOne(value);
      }

      compareNumberArrays(method, direct);
    });
  });
}
