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

class ValuesItem014 {
  value: number = 0;
}

enum ValuesColor011 {
  Red,
  Green,
  Blue
}

function createLargeNumberArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.push(i);
  }
  return arr;
}

function collectNumbers(iterator: IterableIterator<number>): Array<number> {
  let values = new Array<number>();
  let next = iterator.next();
  while (!next.done) {
    let current = next.value;
    if (current != undefined) {
      values.push(current);
    }
    next = iterator.next();
  }
  return values;
}

function valuesFromAnyNumberArray(value: Any): string {
  const arr = value as Array<number>;
  return collectNumbers(arr.values()).toString();
}

export default function ArrayValuesTest(): void {
  describe('ArrayValuesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0010
     * @tc.name testArrayValues001
     * @tc.desc Verify values accepts no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      expect(iterator != undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0020
     * @tc.name testArrayValues002
     * @tc.desc Verify values returns an iterator object whose next method yields array elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      expect(typeof iterator.next).assertEqual('function');
      expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0030
     * @tc.name testArrayValues003
     * @tc.desc Verify values returns an iterable iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      expect(iterator != undefined).assertTrue();
      expect(typeof iterator.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0040
     * @tc.name testArrayValues004
     * @tc.desc Verify next returns ordered values and completion states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      const result1 = iterator.next();
      const result2 = iterator.next();
      const result3 = iterator.next();
      const result4 = iterator.next();
      expect(result1.value).assertEqual(1);
      expect(result1.done).assertFalse();
      expect(result2.value).assertEqual(2);
      expect(result2.done).assertFalse();
      expect(result3.value).assertEqual(3);
      expect(result3.done).assertFalse();
      expect(result4.done).assertTrue();
      expect(result4.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0050
     * @tc.name testArrayValues005
     * @tc.desc Verify values does not modify the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const originalStr = arr.toString();
      arr.values();
      expect(arr.toString()).assertEqual(originalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0060
     * @tc.name testArrayValues006
     * @tc.desc Verify the iterator yields array element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(10);
      expect(iterator.next().value).assertEqual(20);
      expect(iterator.next().value).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0070
     * @tc.name testArrayValues007
     * @tc.desc Verify empty arrays return an immediately completed iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const iterator = arr.values();
      const result = iterator.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0080
     * @tc.name testArrayValues008
     * @tc.desc Verify single-element arrays iterate their only value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(42);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(42);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0090
     * @tc.name testArrayValues009
     * @tc.desc Verify two-element arrays iterate both values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0100
     * @tc.name testArrayValues010
     * @tc.desc Verify large arrays can create a values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArray(1000);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0110
     * @tc.name testArrayValues011
     * @tc.desc Verify char arrays yield char values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'A', c'B', c'C');
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(c'A');
      expect(iterator.next().value).assertEqual(c'B');
      expect(iterator.next().value).assertEqual(c'C');
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0120
     * @tc.name testArrayValues012
     * @tc.desc Verify enum arrays yield enum values without numeric coercion in storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ValuesColor011>(ValuesColor011.Red, ValuesColor011.Blue);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(ValuesColor011.Red);
      expect(iterator.next().value).assertEqual(ValuesColor011.Blue);
      expect(arr[1]).assertEqual(ValuesColor011.Blue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0130
     * @tc.name testArrayValues013
     * @tc.desc Verify Array.from over Set values preserves Set insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const setValues = new Set<number>(new Array<number>(2, 1, 2, 3));
      const arr = Array.from<number>(setValues);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(3);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0140
     * @tc.name testArrayValues014
     * @tc.desc Verify breaking out of for-of leaves the iterator positioned after the break value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const iterator = arr.values();
      let consumed = '';
      for (const value of iterator) {
        consumed += value.toString();
        if (value == 2) {
          break;
        }
      }
      expect(consumed).assertEqual('12');
      expect(iterator.next().value).assertEqual(3);
      expect(iterator.next().value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0150
     * @tc.name testArrayValues015
     * @tc.desc Verify Array.from consumes only the remaining values after manual next calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
      const remaining = Array.from<number>(iterator);
      expect(remaining.toString()).assertEqual('3,4');
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0160
     * @tc.name testArrayValues016
     * @tc.desc Verify next can be called repeatedly to fetch values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      let result = iterator.next();
      expect(result.value).assertEqual(1);
      expect(result.done).assertFalse();
      result = iterator.next();
      expect(result.value).assertEqual(2);
      result = iterator.next();
      expect(result.value).assertEqual(3);
      result = iterator.next();
      expect(result.value).assertUndefined();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0170
     * @tc.name testArrayValues017
     * @tc.desc Verify values iterates according to array order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(10);
      expect(iterator.next().value).assertEqual(20);
      expect(iterator.next().value).assertEqual(30);
      expect(iterator.next().value).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0180
     * @tc.name testArrayValues018
     * @tc.desc Verify done becomes true after iteration finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const iterator = arr.values();
      iterator.next();
      iterator.next();
      const result = iterator.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0190
     * @tc.name testArrayValues019
     * @tc.desc Verify values and $_iterator yield the same first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const valuesIterator = arr.values();
      const iterator = arr.$_iterator();
      expect(valuesIterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0200
     * @tc.name testArrayValues020
     * @tc.desc Verify values and $_iterator expose next functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const valuesIter = arr.values();
      const iter = arr.$_iterator();
      expect(typeof valuesIter.next).assertEqual('function');
      expect(typeof iter.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0210
     * @tc.name testArrayValues021
     * @tc.desc Verify values returns element values while keys returns indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const valuesIterator = arr.values();
      const keysIterator = arr.keys();
      expect(valuesIterator.next().value).assertEqual(10);
      expect(keysIterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0220
     * @tc.name testArrayValues022
     * @tc.desc Verify keys and values can be consumed together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const keysIter = arr.keys();
      const valuesIter = arr.values();
      const key = keysIter.next().value;
      const value = valuesIter.next().value;
      expect(key).assertEqual(0);
      expect(value).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0230
     * @tc.name testArrayValues023
     * @tc.desc Verify values returns values while entries returns index-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const valuesIterator = arr.values();
      const entriesIterator = arr.entries();
      const entry = entriesIterator.next().value as [int, number] | undefined;
      expect(valuesIterator.next().value).assertEqual(1);
      expect(entry != undefined).assertTrue();
      if (entry != undefined) {
        expect(entry[0]).assertEqual(0);
        expect(entry[1]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0240
     * @tc.name testArrayValues024
     * @tc.desc Verify values leaves array length and first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      arr.values();
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0250
     * @tc.name testArrayValues025
     * @tc.desc Verify each values call returns an independent iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator1 = arr.values();
      const iterator2 = arr.values();
      expect(iterator1 !== iterator2).assertTrue();
      expect(iterator1.next().value).assertEqual(1);
      expect(iterator2.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0260
     * @tc.name testArrayValues026
     * @tc.desc Verify for of can traverse values directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let sum = 0;
      for (const value of arr.values()) {
        sum += value;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0270
     * @tc.name testArrayValues027
     * @tc.desc Verify values can be copied into a new array manually
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const copy = collectNumbers(arr.values());
      expect(copy.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0280
     * @tc.name testArrayValues028
     * @tc.desc Verify manual iteration can skip earlier elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const iterator = arr.values();
      iterator.next();
      const result = iterator.next();
      expect(result.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0290
     * @tc.name testArrayValues029
     * @tc.desc Verify null elements are returned by the iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertNull();
      expect(iterator.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0300
     * @tc.name testArrayValues030
     * @tc.desc Verify undefined elements are returned by the iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertUndefined();
      expect(iterator.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0310
     * @tc.name testArrayValues031
     * @tc.desc Verify zero elements are returned without being skipped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 0, 3);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0320
     * @tc.name testArrayValues032
     * @tc.desc Verify empty-string elements are returned by the iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', '', 'c');
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual('a');
      expect(iterator.next().value).assertEqual('');
      expect(iterator.next().value).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0330
     * @tc.name testArrayValues033
     * @tc.desc Verify two references to one values iterator share a single cursor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      const shared = iterator;
      expect(iterator.next().value).assertEqual(1);
      expect(shared.next().value).assertEqual(2);
      expect(iterator.next().value).assertEqual(3);
      expect(shared.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0340
     * @tc.name testArrayValues034
     * @tc.desc Verify the ArkTS iterator method returns the same values iterator instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      const iterator = arr.values();
      const same = iterator.$_iterator();
      expect(same === iterator).assertTrue();
      expect(same.next().value).assertEqual('a');
      expect(iterator.next().value).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0350
     * @tc.name testArrayValues035
     * @tc.desc Verify independent values iterators have separate cursors over shared data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const first = arr.values();
      const second = arr.values();
      expect(first.next().value).assertEqual(1);
      arr[0] = 9;
      expect(second.next().value).assertEqual(9);
      expect(first.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0360
     * @tc.name testArrayValues036
     * @tc.desc Verify a values iterator observes future slot changes before reaching them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      arr[1] = 20;
      expect(iterator.next().value).assertEqual(20);
      expect(iterator.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0370
     * @tc.name testArrayValues037
     * @tc.desc Verify push after iterator creation extends the remaining values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      arr.push(3);
      const remaining = Array.from<number>(iterator);
      expect(remaining.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0380
     * @tc.name testArrayValues038
     * @tc.desc Verify clearing length during values iteration completes the iterator early
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      arr.length = 0;
      const result = iterator.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0390
     * @tc.name testArrayValues039
     * @tc.desc Verify partial iteration over large arrays can stop early
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArray(10000);
      const iterator = arr.values();
      let count = 0;
      let result = iterator.next();
      while (!result.done && count < 100) {
        count++;
        result = iterator.next();
      }
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0400
     * @tc.name testArrayValues040
     * @tc.desc Verify iterator creation exposes a callable next method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      expect(typeof iterator.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0410
     * @tc.name testArrayValues041
     * @tc.desc Verify next returns an iterator result object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      const result = iterator.next();
      expect(typeof result).assertEqual('object');
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0420
     * @tc.name testArrayValues042
     * @tc.desc Verify values can be used to find a target element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const iterator = arr.values();
      let found: number = 0;
      let result = iterator.next();
      while (!result.done) {
        const current = result.value;
        if (current != undefined && current === 3) {
          found = current;
          break;
        }
        result = iterator.next();
      }
      expect(found).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0430
     * @tc.name testArrayValues043
     * @tc.desc Verify first next result exposes value and false done state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1);
      const iterator = arr.values();
      const result = iterator.next();
      expect(result.value).assertEqual(1);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0440
     * @tc.name testArrayValues044
     * @tc.desc Verify values can process only the first few elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const iterator = arr.values();
      for (let i: int = 0; i < 3; i++) {
        const result = iterator.next();
        expect(result.value).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0450
     * @tc.name testArrayValues045
     * @tc.desc Verify values supports lazy retrieval across separate next calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const iterator = arr.values();
      const result1 = iterator.next();
      expect(result1.value).assertEqual(1);
      const result2 = iterator.next();
      expect(result2.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0460
     * @tc.name testArrayValues046
     * @tc.desc Verify completed iterators keep returning done with undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1);
      const iterator = arr.values();
      iterator.next();
      const completed = iterator.next();
      const completedAgain = iterator.next();
      expect(completed.done).assertTrue();
      expect(completed.value).assertUndefined();
      expect(completedAgain.done).assertTrue();
      expect(completedAgain.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0470
     * @tc.name testArrayValues047
     * @tc.desc Verify NaN elements are returned by values without normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(NaN, 1);
      const iterator = arr.values();
      const firstValue = iterator.next().value;
      expect(firstValue != firstValue).assertTrue();
      expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0480
     * @tc.name testArrayValues048
     * @tc.desc Verify Infinity and negative Infinity are preserved by values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Infinity, -Infinity);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(Infinity);
      expect(iterator.next().value).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0490
     * @tc.name testArrayValues049
     * @tc.desc Verify negative zero is preserved by values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-0, 4);
      const iterator = arr.values();
      const firstValue = iterator.next().value;
      expect(firstValue).assertEqual(0);
      if (firstValue != undefined) {
        expect(1.0 / firstValue).assertEqual(-Infinity);
      }
      expect(iterator.next().value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0500
     * @tc.name testArrayValues050
     * @tc.desc Verify duplicate values are not collapsed during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 3);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0510
     * @tc.name testArrayValues051
     * @tc.desc Verify object elements keep their original references during values iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new ValuesItem014();
      item1.value = 5;
      const item2 = new ValuesItem014();
      item2.value = 6;
      const arr = new Array<ValuesItem014>(item1, item2);
      const iterator = arr.values();
      expect(iterator.next().value === item1).assertTrue();
      expect(iterator.next().value === item2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0520
     * @tc.name testArrayValues052
     * @tc.desc Verify nested array elements are returned by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstNested = new Array<number>(6, 7);
      const secondNested = new Array<number>(8, 9);
      const arr = new Array<Array<number>>(firstNested, secondNested);
      const iterator = arr.values();
      expect(iterator.next().value === firstNested).assertTrue();
      expect(iterator.next().value === secondNested).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0530
     * @tc.name testArrayValues053
     * @tc.desc Verify values preserves order for a copied numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(7, 8, 9);
      const arr = source.slice();
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(7);
      expect(iterator.next().value).assertEqual(8);
      expect(iterator.next().value).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0540
     * @tc.name testArrayValues054
     * @tc.desc Verify Array.from can consume the values iterator and rebuild the sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(8, 9, 10);
      const copy = Array.from<number>(arr.values());
      expect(copy.toString()).assertEqual('8,9,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0550
     * @tc.name testArrayValues055
     * @tc.desc Verify repeated next calls stay completed after iteration ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 10);
      const iterator = arr.values();
      iterator.next();
      iterator.next();
      const completed = iterator.next();
      const completedAgain = iterator.next();
      expect(completed.done).assertTrue();
      expect(completed.value).assertUndefined();
      expect(completedAgain.done).assertTrue();
      expect(completedAgain.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0560
     * @tc.name testArrayValues056
     * @tc.desc Verify independent values iterators do not share cursor state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 11, 12);
      const iterator1 = arr.values();
      const iterator2 = arr.values();
      expect(iterator1.next().value).assertEqual(10);
      expect(iterator1.next().value).assertEqual(11);
      expect(iterator2.next().value).assertEqual(10);
      expect(iterator2.next().value).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0570
     * @tc.name testArrayValues057
     * @tc.desc Verify iteration continues from the current cursor after one manual next call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(11, 12, 13);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(11);
      const remaining = collectNumbers(iterator);
      expect(remaining.toString()).assertEqual('12,13');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0580
     * @tc.name testArrayValues058
     * @tc.desc Verify values does not change array contents before or after toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(12, 13, 14);
      const before = arr.toString();
      const iterated = collectNumbers(arr.values()).toString();
      const after = arr.toString();
      expect(iterated).assertEqual(before);
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0590
     * @tc.name testArrayValues059
     * @tc.desc Verify values preserves order on concat results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(13, 14).concat(new Array<number>(15, 16));
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(13);
      expect(iterator.next().value).assertEqual(14);
      expect(iterator.next().value).assertEqual(15);
      expect(iterator.next().value).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0600
     * @tc.name testArrayValues060
     * @tc.desc Verify values yields nested array references without flattening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested1 = new Array<number>(14, 15);
      const nested2 = new Array<number>(16);
      const arr = new Array<Array<number>>(nested1, nested2);
      const iterator = arr.values();
      expect(iterator.next().value === nested1).assertTrue();
      expect(iterator.next().value === nested2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0610
     * @tc.name testArrayValues061
     * @tc.desc Verify values on slice(0, 0) returns an immediately completed iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(15, 16, 17).slice(0, 0);
      const iterator = arr.values();
      const result = iterator.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0620
     * @tc.name testArrayValues062
     * @tc.desc Verify an array initialized with undefined yields undefined values before completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, (_index) => undefined);
      const iterator = arr.values();
      const first = iterator.next();
      const second = iterator.next();
      const completed = iterator.next();
      expect(first.value).assertUndefined();
      expect(first.done).assertFalse();
      expect(second.value).assertUndefined();
      expect(second.done).assertFalse();
      expect(completed.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0630
     * @tc.name testArrayValues063
     * @tc.desc Verify falsy values are returned without being skipped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | boolean | string>(false, 0, '');
      const iterator = arr.values();
      expect(iterator.next().value).assertFalse();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0640
     * @tc.name testArrayValues064
     * @tc.desc Verify collectNumbers can fully consume a numeric values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const copy = collectNumbers(arr.values());
      expect(copy.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0650
     * @tc.name testArrayValues065
     * @tc.desc Verify values on an empty array finishes immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const iterator = arr.values();
      const result = iterator.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0660
     * @tc.name testArrayValues066
     * @tc.desc Verify a single-element iterator stays completed after the value is consumed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(99);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(99);
      const completed = iterator.next();
      const completedAgain = iterator.next();
      expect(completed.done).assertTrue();
      expect(completedAgain.done).assertTrue();
      expect(completedAgain.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0670
     * @tc.name testArrayValues067
     * @tc.desc Verify values can continue manually after a for-of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('red', 'green', 'blue', 'cyan');
      const iterator = arr.values();
      let seen = '';
      for (const value of iterator) {
        seen += value + '|';
        if (value === 'green') {
          break;
        }
      }
      expect(seen).assertEqual('red|green|');
      expect(iterator.next().value).assertEqual('blue');
      expect(iterator.next().value).assertEqual('cyan');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0680
     * @tc.name testArrayValues068
     * @tc.desc Verify sharing a values iterator between consumers advances one cursor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const firstConsumer = arr.values();
      const secondConsumer = firstConsumer;
      expect(firstConsumer.next().value).assertTrue();
      expect(secondConsumer.next().value).assertFalse();
      expect(firstConsumer.next().value).assertTrue();
      expect(secondConsumer.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0690
     * @tc.name testArrayValues069
     * @tc.desc Verify Array.from consumes remaining bigint values after a partial read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(5n, 6n, 7n);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(5n);
      const remaining = Array.from<bigint>(iterator);
      expect(remaining.length).assertEqual(2);
      expect(remaining[0]).assertEqual(6n);
      expect(remaining[1]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0700
     * @tc.name testArrayValues070
     * @tc.desc Verify explicit undefined middle elements are yielded without changing the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      const hole = iterator.next();
      expect(hole.value).assertUndefined();
      expect(hole.done).assertFalse();
      expect(iterator.next().value).assertEqual(3);
      expect(iterator.next().done).assertTrue();
      expect(arr.indexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0710
     * @tc.name testArrayValues071
     * @tc.desc Verify a leading explicit undefined value is still a yielded step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[1] = 2;
      arr[2] = 3;
      const iterator = arr.values();
      const first = iterator.next();
      expect(first.value).assertUndefined();
      expect(first.done).assertFalse();
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().value).assertEqual(3);
      expect(arr.indexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0720
     * @tc.name testArrayValues072
     * @tc.desc Verify trailing explicit undefined values are yielded before completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[0] = 1;
      arr[1] = 2;
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
      const firstHole = iterator.next();
      const secondHole = iterator.next();
      expect(firstHole.value).assertUndefined();
      expect(firstHole.done).assertFalse();
      expect(secondHole.value).assertUndefined();
      expect(secondHole.done).assertFalse();
      expect(iterator.next().done).assertTrue();
      expect(arr.indexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0730
     * @tc.name testArrayValues073
     * @tc.desc Verify explicit undefined is yielded as a normal non-completed step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      const explicitUndefined = iterator.next();
      expect(explicitUndefined.value).assertUndefined();
      expect(explicitUndefined.done).assertFalse();
      expect(iterator.next().value).assertEqual(3);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0740
     * @tc.name testArrayValues074
     * @tc.desc Verify null is yielded as a real value instead of being skipped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      const nullResult = iterator.next();
      expect(nullResult.value).assertNull();
      expect(nullResult.done).assertFalse();
      expect(iterator.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0750
     * @tc.name testArrayValues075
     * @tc.desc Verify function element references pass through values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn = (): string => {
        return 'x';
      };
      const arr = new Array<() => string>(fn);
      const current = arr.values().next().value;
      expect(current === fn).assertTrue();
      if (current != undefined) {
        expect(current()).assertEqual('x');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0760
     * @tc.name testArrayValues076
     * @tc.desc Verify an iterator created on an empty array observes a later push before completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const iterator = arr.values();
      arr.push(1);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0770
     * @tc.name testArrayValues077
     * @tc.desc Verify a completed empty iterator is not revived by later push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const iterator = arr.values();
      expect(iterator.next().done).assertTrue();
      arr.push(1);
      const afterPush = iterator.next();
      expect(afterPush.done).assertTrue();
      expect(afterPush.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0780
     * @tc.name testArrayValues078
     * @tc.desc Verify push during iteration extends the live iteration window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      arr.push(3);
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().value).assertEqual(3);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0790
     * @tc.name testArrayValues079
     * @tc.desc Verify pop during iteration shortens the live iteration window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      arr.pop();
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0800
     * @tc.name testArrayValues080
     * @tc.desc Verify shift during iteration can skip the element moved before the cursor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      arr.shift();
      expect(iterator.next().value).assertEqual(3);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0810
     * @tc.name testArrayValues081
     * @tc.desc Verify unshift during iteration can make an already-read element appear again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      arr.unshift(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0820
     * @tc.name testArrayValues082
     * @tc.desc Verify modifying a future slot is observed by the iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      arr[1] = 99;
      expect(iterator.next().value).assertEqual(99);
      expect(iterator.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0830
     * @tc.name testArrayValues083
     * @tc.desc Verify modifying an already-consumed slot is not revisited
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      arr[0] = 99;
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0840
     * @tc.name testArrayValues084
     * @tc.desc Verify setting length to zero during iteration completes the iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      arr.length = 0;
      const result = iterator.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0850
     * @tc.name testArrayValues085
     * @tc.desc Verify shrinkTo during iteration updates the completion boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      arr.shrinkTo(2);
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0860
     * @tc.name testArrayValues086
     * @tc.desc Verify extendTo during iteration appends observable undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, 2);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      arr.extendTo(5, undefined);
      expect(iterator.next().value).assertEqual(2);
      const third = iterator.next();
      const fourth = iterator.next();
      const fifth = iterator.next();
      expect(third.value).assertUndefined();
      expect(third.done).assertFalse();
      expect(fourth.value).assertUndefined();
      expect(fourth.done).assertFalse();
      expect(fifth.value).assertUndefined();
      expect(fifth.done).assertFalse();
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0870
     * @tc.name testArrayValues087
     * @tc.desc Verify values are not snapshotted before the first next call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const iterator = arr.values();
      arr[0] = 9;
      expect(iterator.next().value).assertEqual(9);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0880
     * @tc.name testArrayValues088
     * @tc.desc Verify length is not snapshotted before the first next call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const iterator = arr.values();
      arr.pop();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0890
     * @tc.name testArrayValues089
     * @tc.desc Verify independent iterators keep separate cursors but share live source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const iterator1 = arr.values();
      const iterator2 = arr.values();
      expect(iterator1.next().value).assertEqual(1);
      arr[0] = 99;
      expect(iterator2.next().value).assertEqual(99);
      expect(iterator1.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0900
     * @tc.name testArrayValues090
     * @tc.desc Verify the ArkTS iterator method returns the same iterator instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const iterator = arr.values();
      const sameIterator = iterator.$_iterator();
      expect(sameIterator === iterator).assertTrue();
      expect(sameIterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0910
     * @tc.name testArrayValues091
     * @tc.desc Verify for-of over a consumed values iterator executes zero times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const iterator = arr.values();
      iterator.next();
      iterator.next();
      iterator.next();
      let count: int = 0;
      for (const value of iterator) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0920
     * @tc.name testArrayValues092
     * @tc.desc Verify for-of over values includes explicit undefined steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      let steps: int = 0;
      let undefinedCount: int = 0;
      let sum: number = 0;
      for (const value of arr.values()) {
        steps++;
        if (value == undefined) {
          undefinedCount++;
        } else {
          sum += value;
        }
      }
      expect(steps).assertEqual(3);
      expect(undefinedCount).assertEqual(1);
      expect(sum).assertEqual(4);
      expect(arr.indexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0930
     * @tc.name testArrayValues093
     * @tc.desc Verify Array.from over values preserves explicit undefined output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const rebuilt = Array.from<number | undefined>(arr.values());
      expect(rebuilt.length).assertEqual(3);
      expect(rebuilt[0]).assertEqual(1);
      expect(rebuilt[1]).assertUndefined();
      expect(rebuilt[2]).assertEqual(3);
      expect(rebuilt.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0940
     * @tc.name testArrayValues094
     * @tc.desc Verify Array.from consumes only the remaining portion of a values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      const remaining = Array.from<number>(iterator);
      expect(remaining.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0950
     * @tc.name testArrayValues095
     * @tc.desc Verify a large array initialized with undefined yields one step per index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1000, (_index) => undefined);
      const iterator = arr.values();
      let count: int = 0;
      let result = iterator.next();
      while (!result.done) {
        count++;
        result = iterator.next();
      }
      expect(count).assertEqual(1000);
      expect(arr.indexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0960
     * @tc.name testArrayValues096
     * @tc.desc Verify push from inside for-of is observed by the live values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      let pushed = false;
      let trace = '';
      for (const value of arr.values()) {
        trace += value.toString();
        if (value == 1 && !pushed) {
          arr.push(3);
          pushed = true;
        }
      }
      expect(trace).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0970
     * @tc.name testArrayValues097
     * @tc.desc Verify shift from inside for-of skips the element moved behind the cursor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let trace = '';
      for (const value of arr.values()) {
        trace += value.toString();
        if (value == 1) {
          arr.shift();
        }
      }
      expect(trace).assertEqual('13');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0980
     * @tc.name testArrayValues098
     * @tc.desc Verify clearing length from inside for-of stops subsequent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let trace = '';
      for (const value of arr.values()) {
        trace += value.toString();
        arr.length = 0;
      }
      expect(trace).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_0990
     * @tc.name testArrayValues099
     * @tc.desc Verify an undefined yielded step still advances before later pushed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, (_index) => undefined);
      const iterator = arr.values();
      const sparseStep = iterator.next();
      arr.push(2);
      expect(sparseStep.value).assertUndefined();
      expect(sparseStep.done).assertFalse();
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().done).assertTrue();
      expect(arr.indexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_1000
     * @tc.name testArrayValues100
     * @tc.desc Verify a completed non-empty iterator is not revived by later source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1);
      const iterator = arr.values();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().done).assertTrue();
      arr.push(2);
      const afterPush = iterator.next();
      expect(afterPush.done).assertTrue();
      expect(afterPush.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_1010
     * @tc.name testArrayValues101
     * @tc.desc Verify values works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(valuesFromAnyNumberArray(anyValue)).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_VALUES_1020
     * @tc.name testArrayValues102
     * @tc.desc Verify values supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayValues102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      const iterator = anyArr.values();
      const first = iterator.next();
      const second = iterator.next();
      const third = iterator.next();
      expect(first.done).assertFalse();
      expect(second.done).assertFalse();
      expect(third.done).assertFalse();
      expect(first.value == 1).assertTrue();
      expect(second.value == 'two').assertTrue();
      expect(third.value == true).assertTrue();
    });

  });
}

