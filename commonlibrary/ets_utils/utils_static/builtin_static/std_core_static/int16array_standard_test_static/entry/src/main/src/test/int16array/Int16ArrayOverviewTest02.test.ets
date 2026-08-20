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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Int16ArrayOverviewTest02(): void {
  describe('Int16ArrayOverviewTest02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_0100
     * @tc.name testInt16ArrayOverviewTestTwo001
     * @tc.desc Verify filter(fn) returns matching values in order with an independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767, 5);
      const result = arr.filter((v: number, _i: int, _a: Int16Array) => v > 9);
      let actualString: string = result.toString();
      let expectedString: string = '10,32767';
      expect(actualString).assertEqual(expectedString);
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_0200
     * @tc.name testInt16ArrayOverviewTestTwo002
     * @tc.desc Verify filter(fn) returns the complete matching sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767, 5);
      const result = arr.filter((v: number, _i: int, _a: Int16Array) => v > 9);
      let actual: int = result.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actualString: string = result.toString();
      let expectedString: string = '10,32767';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_0300
     * @tc.name testInt16ArrayOverviewTestTwo003
     * @tc.desc Verify indexOf(999) returns -1 when missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767, 50);
      let actual: int = arr.indexOf(999);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_0400
     * @tc.name testInt16ArrayOverviewTestTwo004
     * @tc.desc Verify find(fn) typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767, 50);
      const result = arr.find((v: number, _i: int, _a: Int16Array) => v > 100);
      let actual: string = typeof result;
      let expected: string = 'number';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_0500
     * @tc.name testInt16ArrayOverviewTestTwo005
     * @tc.desc Verify sort rejects an object cast to compare function with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(3, 1, 2);
      const unsupported: Object = new Object();
      try {
        const invalidCompareFn: (a: number, b: number) => int = unsupported as object as (a: number, b: number) => int;
        arr.sort(invalidCompareFn);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_0600
     * @tc.name testInt16ArrayOverviewTestTwo006
     * @tc.desc Verify some rejects an object cast to predicate with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidPredicate: (element: number, index: int, array: Int16Array) => boolean = unsupported as object as (
          element: number,
          index: int,
          array: Int16Array,
        ) => boolean;
        arr.some(invalidPredicate);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_0700
     * @tc.name testInt16ArrayOverviewTestTwo007
     * @tc.desc Verify reduce rejects an object cast to callback with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidCallback: (
          previousValue: number,
          currentValue: number,
          currentIndex: int,
          array: Int16Array,
        ) => number = unsupported as object as (
          previousValue: number,
          currentValue: number,
          currentIndex: int,
          array: Int16Array,
        ) => number;
        arr.reduce(invalidCallback, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_0800
     * @tc.name testInt16ArrayOverviewTestTwo008
     * @tc.desc Verify reduceRight rejects an object cast to callback with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidCallback: (
          previousValue: number,
          currentValue: number,
          currentIndex: int,
          array: Int16Array,
        ) => number = unsupported as object as (
          previousValue: number,
          currentValue: number,
          currentIndex: int,
          array: Int16Array,
        ) => number;
        arr.reduceRight(invalidCallback, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_0900
     * @tc.name testInt16ArrayOverviewTestTwo009
     * @tc.desc Verify map rejects an object cast to callback with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidCallback: (val: number, index: int, array: Int16Array) => number = unsupported as object as (
          val: number,
          index: int,
          array: Int16Array,
        ) => number;
        arr.map(invalidCallback);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_1000
     * @tc.name testInt16ArrayOverviewTestTwo010
     * @tc.desc Verify every rejects an object cast to predicate with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidPredicate: (element: number, index: int, array: Int16Array) => boolean = unsupported as object as (
          element: number,
          index: int,
          array: Int16Array,
        ) => boolean;
        arr.every(invalidPredicate);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_1100
     * @tc.name testInt16ArrayOverviewTestTwo011
     * @tc.desc Verify filter rejects an object cast to callback with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidCallback: (val: number, index: int, array: Int16Array) => boolean = unsupported as object as (
          val: number,
          index: int,
          array: Int16Array,
        ) => boolean;
        arr.filter(invalidCallback);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_1200
     * @tc.name testInt16ArrayOverviewTestTwo012
     * @tc.desc Verify find rejects an object cast to predicate with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidPredicate: (value: number, index: int, obj: Int16Array) => boolean = unsupported as object as (
          value: number,
          index: int,
          obj: Int16Array,
        ) => boolean;
        arr.find(invalidPredicate);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_1300
     * @tc.name testInt16ArrayOverviewTestTwo013
     * @tc.desc Verify findIndex rejects an object cast to predicate with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidPredicate: (value: number, index: int, obj: Int16Array) => boolean = unsupported as object as (
          value: number,
          index: int,
          obj: Int16Array,
        ) => boolean;
        arr.findIndex(invalidPredicate);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_1400
     * @tc.name testInt16ArrayOverviewTestTwo014
     * @tc.desc Verify findLast rejects an object cast to callback with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidCallback: (val: number, index: int, array: Int16Array) => boolean = unsupported as object as (
          val: number,
          index: int,
          array: Int16Array,
        ) => boolean;
        arr.findLast(invalidCallback);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_1500
     * @tc.name testInt16ArrayOverviewTestTwo015
     * @tc.desc Verify findLastIndex rejects an object cast to callback with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidCallback: (val: number, index: int, array: Int16Array) => boolean = unsupported as object as (
          val: number,
          index: int,
          array: Int16Array,
        ) => boolean;
        arr.findLastIndex(invalidCallback);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_1600
     * @tc.name testInt16ArrayOverviewTestTwo016
     * @tc.desc Verify forEach rejects an object cast to callback with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidCallback: (value: number, index: int, array: Int16Array) => void = unsupported as object as (
          value: number,
          index: int,
          array: Int16Array,
        ) => void;
        arr.forEach(invalidCallback);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_1700
     * @tc.name testInt16ArrayOverviewTestTwo017
     * @tc.desc Verify join() defaults to comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767);
      let actual: string = arr.join();
      let expected: string = '10,32767';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_1800
     * @tc.name testInt16ArrayOverviewTestTwo018
     * @tc.desc Verify toString() on Int16Array.of(10, 32767) returns '10,32767'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767);
      const result = arr.toString();
      expect(result).assertEqual('10,32767');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_1900
     * @tc.name testInt16ArrayOverviewTestTwo019
     * @tc.desc Verify valueOf() returns array with original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 32767);
      const result = arr.valueOf();
      let actual: int = result.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_2000
     * @tc.name testInt16ArrayOverviewTestTwo020
     * @tc.desc Verify BYTES_PER_ELEMENT returns value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int16Array.BYTES_PER_ELEMENT;
      expect(v).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_2100
     * @tc.name testInt16ArrayOverviewTestTwo021
     * @tc.desc Verify Int16Array.of(-32768) byteLength equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = -32768;
      const arr: Int16Array = Int16Array.of(val);
      let actual: int = arr.byteLength;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_2200
     * @tc.name testInt16ArrayOverviewTestTwo022
     * @tc.desc Verify indexOf() returns index of int16 MIN_VALUE and -1 negative elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(-32768, -1);
      let minIndex: int = arr.indexOf(-32768);
      let minExpected: int = 0;
      expect(minIndex).assertEqual(minExpected);
      let negOneIndex: int = arr.indexOf(-1);
      let negOneExpected: int = 1;
      expect(negOneIndex).assertEqual(negOneExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_2300
     * @tc.name testInt16ArrayOverviewTestTwo023
     * @tc.desc Verify entries() entry [0] int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(32767, 50);
      const entriesIt = arr.entries();
      const entry = entriesIt.$_iterator().next().value!;
      let entryIndex: int = entry[0];
      let expectedIndex: int = 0;
      expect(entryIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_2400
     * @tc.name testInt16ArrayOverviewTestTwo024
     * @tc.desc Verify keys() iterator first value is index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(32767, 50);
      const keysIt = arr.keys();
      const first = keysIt.$_iterator().next().value;
      expect(first).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_2500
     * @tc.name testInt16ArrayOverviewTestTwo025
     * @tc.desc Verify values() iterator first value is first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(32767, 50);
      const valuesIt = arr.values();
      const first = valuesIt.$_iterator().next().value;
      expect(first).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_2600
     * @tc.name testInt16ArrayOverviewTestTwo026
     * @tc.desc Verify set(array) returns void undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const result: void = arr.set(Int16Array.of(32767, 50));
      expect(result).assertUndefined();
      const setFirstValue: number = arr.$_get(0);
      const expectedSetFirstValue: int = 32767;
      expect(setFirstValue).assertEqual(expectedSetFirstValue);
      const setSecondValue: number = arr.$_get(1);
      const expectedSetSecondValue: int = 50;
      expect(setSecondValue).assertEqual(expectedSetSecondValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_2700
     * @tc.name testInt16ArrayOverviewTestTwo027
     * @tc.desc Verify toLocaleString('en-US') returns the complete formatted sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1000, 32767);
      const result = arr.toLocaleString('en-US');
      const expected: string = '1,000,32,767';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_2800
     * @tc.name testInt16ArrayOverviewTestTwo028
     * @tc.desc Verify $_get(-1) throws RangeError for out-of-range negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_2900
     * @tc.name testInt16ArrayOverviewTestTwo029
     * @tc.desc Verify $_get(length) throws RangeError for out-of-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_3000
     * @tc.name testInt16ArrayOverviewTestTwo030
     * @tc.desc Verify $_get(2147483647) throws RangeError for huge positive index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.$_get(2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_3100
     * @tc.name testInt16ArrayOverviewTestTwo031
     * @tc.desc Verify $_set(-1, value) throws RangeError without changing length or elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirstElement: number = arr.$_get(0);
      let expectedFirstElement: int = 10;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualThirdElement: number = arr.$_get(2);
      let expectedThirdElement: int = 30;
      expect(actualThirdElement).assertEqual(expectedThirdElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_3200
     * @tc.name testInt16ArrayOverviewTestTwo032
     * @tc.desc Verify $_set(length, value) throws RangeError for out-of-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.$_set(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualThirdElement: number = arr.$_get(2);
      let expectedThirdElement: int = 30;
      expect(actualThirdElement).assertEqual(expectedThirdElement);
      let actualLength: int = arr.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_3300
     * @tc.name testInt16ArrayOverviewTestTwo033
     * @tc.desc Verify $_set(2147483647, value) throws RangeError for huge positive index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.$_set(2147483647, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualFirstElement: number = arr.$_get(0);
      let expectedFirstElement: int = 10;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualLength: int = arr.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_3400
     * @tc.name testInt16ArrayOverviewTestTwo034
     * @tc.desc Verify with(length, value) throws RangeError for out-of-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.with(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_3500
     * @tc.name testInt16ArrayOverviewTestTwo035
     * @tc.desc Verify with(-length-1, -32769) throws RangeError before overflow write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.with(-4, -32769);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_3600
     * @tc.name testInt16ArrayOverviewTestTwo036
     * @tc.desc Verify set(-1, value) single-value insertPos throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      try {
        arr.set(-1, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_3700
     * @tc.name testInt16ArrayOverviewTestTwo037
     * @tc.desc Verify set(length, value) single-value insertPos throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      try {
        arr.set(3, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_3800
     * @tc.name testInt16ArrayOverviewTestTwo038
     * @tc.desc Verify set(-1, -32769) throws RangeError for invalid insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      try {
        arr.set(-1, -32769);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_3900
     * @tc.name testInt16ArrayOverviewTestTwo039
     * @tc.desc Verify set(Int16Array source) throws RangeError when source exceeds target remaining space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int16Array(3);
      const source = Int16Array.of(10, 20, 30, 40);
      try {
        target.set(source, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_4000
     * @tc.name testInt16ArrayOverviewTestTwo040
     * @tc.desc Verify set(source, offset) throws RangeError when source exceeds remaining target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int16Array(3);
      const source = Int16Array.of(10, 20);
      try {
        target.set(source, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_4100
     * @tc.name testInt16ArrayOverviewTestTwo041
     * @tc.desc Verify set(FixedArray, offset) throws RangeError when source exceeds target remaining space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int16Array(2);
      const src: FixedArray<short> = [1, 2, 3];
      try {
        target.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_4200
     * @tc.name testInt16ArrayOverviewTestTwo042
     * @tc.desc Verify new Int16Array(0-byte ArrayBuffer, 0, positive length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      try {
        const arr = new Int16Array(buf, 0, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_4300
     * @tc.name testInt16ArrayOverviewTestTwo043
     * @tc.desc Verify new Int16Array(-1) throws RangeError for negative length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Int16Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_4400
     * @tc.name testInt16ArrayOverviewTestTwo044
     * @tc.desc Verify new Int16Array(buffer, byteOffset=1) throws RangeError for unaligned offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      try {
        const arr = new Int16Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_4500
     * @tc.name testInt16ArrayOverviewTestTwo045
     * @tc.desc Verify new Int16Array(buffer, byteOffset, length) throws RangeError when view exceeds buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      try {
        const arr = new Int16Array(buf, 2, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_4600
     * @tc.name testInt16ArrayOverviewTestTwo046
     * @tc.desc Verify new Int16Array(buffer, 0, too-large length) throws RangeError when elements exceed buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      try {
        const arr = new Int16Array(buf, 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_4700
     * @tc.name testInt16ArrayOverviewTestTwo047
     * @tc.desc Verify find callback thrown TypeError is rethrown and not swallowed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      try {
        arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
          throw new TypeError('callback error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_4800
     * @tc.name testInt16ArrayOverviewTestTwo048
     * @tc.desc Verify find callback Error at middle element is rethrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 20, 3);
      try {
        arr.find((value: number, _index: int, _array: Int16Array): boolean => {
          if (value > 10) {
            throw new TypeError('middle error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_4900
     * @tc.name testInt16ArrayOverviewTestTwo049
     * @tc.desc Verify findIndex callback thrown TypeError is rethrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      try {
        arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => {
          throw new TypeError('findIndex error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_5000
     * @tc.name testInt16ArrayOverviewTestTwo050
     * @tc.desc Verify findLast callback thrown TypeError is rethrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      try {
        arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
          throw new TypeError('findLast error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_5100
     * @tc.name testInt16ArrayOverviewTestTwo051
     * @tc.desc Verify findLastIndex callback thrown TypeError is rethrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      try {
        arr.findLastIndex((_value: number, _index: int, _array: Int16Array): boolean => {
          throw new TypeError('findLastIndex error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_5200
     * @tc.name testInt16ArrayOverviewTestTwo052
     * @tc.desc Verify forEach callback thrown TypeError is rethrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      try {
        arr.forEach((_value: number, _index: int, _array: Int16Array): void => {
          throw new TypeError('forEach error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_5300
     * @tc.name testInt16ArrayOverviewTestTwo053
     * @tc.desc Verify map callback thrown TypeError is rethrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      try {
        arr.map((_value: number, _index: int, _array: Int16Array): number => {
          throw new TypeError('map error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_5400
     * @tc.name testInt16ArrayOverviewTestTwo054
     * @tc.desc Verify filter callback thrown TypeError is rethrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      try {
        arr.filter((_value: number, _index: int, _array: Int16Array): boolean => {
          throw new TypeError('filter error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_5500
     * @tc.name testInt16ArrayOverviewTestTwo055
     * @tc.desc Verify some callback thrown TypeError is rethrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      try {
        arr.some((_element: number, _index: int, _array: Int16Array): boolean => {
          throw new TypeError('some error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_5600
     * @tc.name testInt16ArrayOverviewTestTwo056
     * @tc.desc Verify every callback thrown TypeError is rethrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      try {
        arr.every((_element: number, _index: int, _array: Int16Array): boolean => {
          throw new TypeError('every error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_5700
     * @tc.name testInt16ArrayOverviewTestTwo057
     * @tc.desc Verify reduce callback thrown TypeError is rethrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      try {
        arr.reduce((_prev: number, _cur: number, _idx: int, _a: Int16Array): number => {
          throw new TypeError('reduce error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_5800
     * @tc.name testInt16ArrayOverviewTestTwo058
     * @tc.desc Verify fill(-32769) wraps overflow value to 32767 for all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      arr.fill(-32769);
      let actualFirstElement: number = arr.$_get(0);
      let expectedFirstElement: int = 32767;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = arr.$_get(1);
      let expectedSecondElement: int = 32767;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
      let actualThirdElement: number = arr.$_get(2);
      let expectedThirdElement: int = 32767;
      expect(actualThirdElement).assertEqual(expectedThirdElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_5900
     * @tc.name testInt16ArrayOverviewTestTwo059
     * @tc.desc Verify Int16Array.from(source with -32769) wraps overflow value to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [-32769, 0];
      const arr = Int16Array.from(source);
      let actualFirstElement: number = arr.$_get(0);
      let expectedFirstElement: int = 32767;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_6000
     * @tc.name testInt16ArrayOverviewTestTwo060
     * @tc.desc Verify lastIndexOf(NaN) returns -1 for Int16Array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      let actualIndex: number = arr.lastIndexOf(Number.NaN);
      let expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_6100
     * @tc.name testInt16ArrayOverviewTestTwo061
     * @tc.desc Verify empty Int16Array reduce() without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      try {
        arr.reduce((_prev: number, _cur: number, _idx: int, _a: Int16Array): number => {
          return 0;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_6200
     * @tc.name testInt16ArrayOverviewTestTwo062
     * @tc.desc Verify empty Int16Array reduceRight() without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      try {
        arr.reduceRight((_prev: number, _cur: number, _idx: int, _a: Int16Array): number => {
          return 0;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_6300
     * @tc.name testInt16ArrayOverviewTestTwo063
     * @tc.desc Verify empty Int16Array findIndex() returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      const result = arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => {
        return true;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_6400
     * @tc.name testInt16ArrayOverviewTestTwo064
     * @tc.desc Verify empty Int16Array findLast() throws Error when no element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      try {
        arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_6500
     * @tc.name testInt16ArrayOverviewTestTwo065
     * @tc.desc Verify empty Int16Array indexOf() returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      let actualIndex: int = arr.indexOf(0);
      let expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_6600
     * @tc.name testInt16ArrayOverviewTestTwo066
     * @tc.desc Verify empty Int16Array lastIndexOf() returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      let actualIndex: int = arr.lastIndexOf(0);
      let expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_6700
     * @tc.name testInt16ArrayOverviewTestTwo067
     * @tc.desc Verify empty Int16Array entries() iterator yields no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      let count: int = 0;
      for (const _entry of arr.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_6800
     * @tc.name testInt16ArrayOverviewTestTwo068
     * @tc.desc Verify empty Int16Array keys() iterator yields no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      let count: int = 0;
      for (const _key of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_6900
     * @tc.name testInt16ArrayOverviewTestTwo069
     * @tc.desc Verify empty Int16Array values() iterator yields no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      let count: int = 0;
      for (const _value of arr.values()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_7000
     * @tc.name testInt16ArrayOverviewTestTwo070
     * @tc.desc Verify empty Int16Array forEach() does not invoke callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      let callCount: int = 0;
      arr.forEach((_value: number, _index: int, _array: Int16Array): void => {
        callCount++;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_7100
     * @tc.name testInt16ArrayOverviewTestTwo071
     * @tc.desc Verify copyWithin(target=-1, start) normalizes target to relative end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3, 4);
      arr.copyWithin(-1, 2);
      let actualFirstElement: number = arr.$_get(0);
      let expectedFirstElement: int = 1;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualLastElement: number = arr.$_get(3);
      let expectedLastElement: int = 3;
      expect(actualLastElement).assertEqual(expectedLastElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_7200
     * @tc.name testInt16ArrayOverviewTestTwo072
     * @tc.desc Verify subarray(begin=-1) normalizes begin to relative end shares last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const sub = arr.subarray(-1);
      let actualFirstElement: number = sub.$_get(0);
      let expectedFirstElement: int = 30;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualLength: int = sub.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_7300
     * @tc.name testInt16ArrayOverviewTestTwo073
     * @tc.desc Verify new Int16Array() returns empty array with length and byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array();
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_7400
     * @tc.name testInt16ArrayOverviewTestTwo074
     * @tc.desc Verify new Int16Array, $_get, fill overview scenario 32768 wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      arr.fill(32768);
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = -32768;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = arr.$_get(1);
      let expectedValue1: int = -32768;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2: number = arr.$_get(2);
      let expectedValue2: int = -32768;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_7500
     * @tc.name testInt16ArrayOverviewTestTwo075
     * @tc.desc Verify Int16Array.of, $_get, fill overflow truncation wrap semantics 32768 wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.fill(32768, 1, 2);
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = 1;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = arr.$_get(1);
      let expectedValue1: int = -32768;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2: number = arr.$_get(2);
      let expectedValue2: int = 3;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_7600
     * @tc.name testInt16ArrayOverviewTestTwo076
     * @tc.desc Verify new Int16Array, Int16Array.of, $_get overflow truncation wrap semantics 32768 wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(2);
      let val: int = 32768;
      arr.set(Int16Array.of(val));
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = -32768;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_7700
     * @tc.name testInt16ArrayOverviewTestTwo077
     * @tc.desc Verify Int16Array.from, Int16Array.of, $_get overflow truncation wrap semantics 32768 wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 32768;
      const source: Int16Array = Int16Array.of(val);
      const arr = Int16Array.from(source);
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = -32768;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_7800
     * @tc.name testInt16ArrayOverviewTestTwo078
     * @tc.desc Int16Array.from with Array of int 32768 truncates $_get value to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [32768];
      const arr = Int16Array.from(source);
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = -32768;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_7900
     * @tc.name testInt16ArrayOverviewTestTwo079
     * @tc.desc Verify Int16Array.of, $_get, with overflow truncation wrap semantics 32768 wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2);
      const replaced = arr.with(0, 32768);
      let actualValue0: number = replaced.$_get(0);
      let expectedValue0: int = -32768;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = arr.$_get(0);
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_8000
     * @tc.name testInt16ArrayOverviewTestTwo080
     * @tc.desc Verify Int16Array.of, $_set, subarray buffer sharing semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Int16Array.of(10, 20, 30, 40);
      const child = parent.subarray(1, 3);
      child.$_set(0, 99);
      let actualValue0: int = parent.length;
      let expectedValue0: int = 4;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_8100
     * @tc.name testInt16ArrayOverviewTestTwo081
     * @tc.desc Verify Int16Array.of, $_get, fill buffer sharing semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Int16Array.of(10, 20, 30, 40);
      const child = parent.subarray(1, 3);
      parent.fill(7);
      let actualValue0: number = child.$_get(0);
      let expectedValue0: int = 7;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = child.$_get(1);
      let expectedValue1: int = 7;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_8200
     * @tc.name testInt16ArrayOverviewTestTwo082
     * @tc.desc Verify Int16Array.of, $_set, $_get overflow truncation wrap semantics 32768 wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Int16Array.of(10, 20);
      const child = parent.subarray(0, 1);
      child.$_set(0, 32768);
      let actualValue0: number = parent.$_get(0);
      let expectedValue0: int = -32768;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_8300
     * @tc.name testInt16ArrayOverviewTestTwo083
     * @tc.desc Int16Array.of subarray(1, 3) length is 2 elements over shared parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Int16Array.of(10, 20, 30, 40);
      const child = parent.subarray(1, 3);
      let actualValue0: int = child.length;
      let expectedValue0: int = 2;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_8400
     * @tc.name testInt16ArrayOverviewTestTwo084
     * @tc.desc Int16Array.of slice copy $_set 99 at index 0 leaves parent $_get index 1 at 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30, 40);
      const sliced = arr.slice(1, 3);
      sliced.$_set(0, 99);
      let actualValue0: number = arr.$_get(1);
      let expectedValue0: int = 20;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_8500
     * @tc.name testInt16ArrayOverviewTestTwo085
     * @tc.desc Verify Int16Array.of, slice buffer sharing semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      const sliced = arr.slice(0, 1);
      expect(arr.buffer).not().assertEqual(sliced.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_8600
     * @tc.name testInt16ArrayOverviewTestTwo086
     * @tc.desc Verify new Int16Array, Int16Array.of, $_set copy isolation semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      const copy = new Int16Array(arr);
      copy.$_set(0, 99);
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = 10;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_8700
     * @tc.name testInt16ArrayOverviewTestTwo087
     * @tc.desc Verify Int16Array.from, Int16Array.of, $_set copy isolation semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      const copy = Int16Array.from(arr);
      copy.$_set(0, 99);
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = 10;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_8800
     * @tc.name testInt16ArrayOverviewTestTwo088
     * @tc.desc new Int16Array fill with 32768 preserves length unchanged at 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const lenBefore = arr.length;
      arr.fill(32768);
      let actualValue0: int = arr.length;
      let expectedValue0: number = lenBefore;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_8900
     * @tc.name testInt16ArrayOverviewTestTwo089
     * @tc.desc Int16Array.of reverse keeps length unchanged at 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const lenBefore = arr.length;
      arr.reverse();
      let actualValue0: int = arr.length;
      let expectedValue0: number = lenBefore;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_9000
     * @tc.name testInt16ArrayOverviewTestTwo090
     * @tc.desc Verify Int16Array.of, $_get, reverse overview scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.reverse();
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = 30;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = arr.$_get(1);
      let expectedValue1: int = 20;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2: number = arr.$_get(2);
      let expectedValue2: int = 10;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_9100
     * @tc.name testInt16ArrayOverviewTestTwo091
     * @tc.desc Verify Int16Array.of, sort overview scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(30, 10, 20);
      const lenBefore = arr.length;
      arr.sort();
      let actualValue0: int = arr.length;
      let expectedValue0: number = lenBefore;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_9200
     * @tc.name testInt16ArrayOverviewTestTwo092
     * @tc.desc Verify Int16Array.of, $_get, sort overview scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(30, 10, 20);
      arr.sort();
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = 10;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = arr.$_get(1);
      let expectedValue1: int = 20;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2: number = arr.$_get(2);
      let expectedValue2: int = 30;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_TWO_9300
     * @tc.name testInt16ArrayOverviewTestTwo093
     * @tc.desc Verify Int16Array.of, copyWithin overview scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30, 40);
      const lenBefore = arr.length;
      arr.copyWithin(0, 2);
      let actualValue0: int = arr.length;
      let expectedValue0: number = lenBefore;
      expect(actualValue0).assertEqual(expectedValue0);
    });
  });
}
