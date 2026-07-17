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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayIteratorPart01Test(): void {
  describe('Int8ArrayIteratorPart01Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;
    const INT8_ZERO = 0;


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_0100
     * @tc.name int8ArrayIteratorPart01Test001
     * @tc.desc Verify $_iterator() returns iterator whose first next() yields first element and done is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertEqual(10);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_0200
     * @tc.name int8ArrayIteratorPart01Test002
     * @tc.desc Verify $_iterator() iterates [10, 20] fully, third next() returns done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let it: IterableIterator<Number> = arr.$_iterator();
      it.next();
      it.next();
      let r: IteratorResult<Number> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_0300
     * @tc.name int8ArrayIteratorPart01Test003
     * @tc.desc Verify single-element array [0] (zero value), iterator returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_0400
     * @tc.name int8ArrayIteratorPart01Test004
     * @tc.desc Verify single-element array [-128] (int8 min), iterator returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_0500
     * @tc.name int8ArrayIteratorPart01Test005
     * @tc.desc Verify single-element array [127] (int8 max), iterator returns 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_0600
     * @tc.name int8ArrayIteratorPart01Test006
     * @tc.desc Verify single-element array [-1] (negative marker), iterator returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_0700
     * @tc.name int8ArrayIteratorPart01Test007
     * @tc.desc Verify single-element array [128] (positive overflow +1), int8 truncates to -128, iterator returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_0800
     * @tc.name int8ArrayIteratorPart01Test008
     * @tc.desc Verify single-element array [255] (uint8 max), int8 truncates to -1, iterator returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([255]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_0900
     * @tc.name int8ArrayIteratorPart01Test009
     * @tc.desc Verify single-element array [-129] (negative underflow -1), int8 truncates to 127, iterator returns 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-129]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_1000
     * @tc.name int8ArrayIteratorPart01Test010
     * @tc.desc Verify single-element array [256] (full wraparound), int8 truncates to 0, iterator returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([256]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_1100
     * @tc.name int8ArrayIteratorPart01Test011
     * @tc.desc Verify single-element array [129] (positive overflow), int8 truncates to -127, iterator returns -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([129]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertEqual(-127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_1200
     * @tc.name int8ArrayIteratorPart01Test012
     * @tc.desc Verify single-element array [NaN], int8 converts to 0, iterator returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([Number.NaN]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_1500
     * @tc.name int8ArrayIteratorPart01Test015
     * @tc.desc Verify single-element array [1.9] (positive float truncation toward zero), int8 truncates to 1, iterator returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1.9]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_1600
     * @tc.name int8ArrayIteratorPart01Test016
     * @tc.desc Verify single-element array [-1.9] (negative float truncation toward zero), int8 truncates to -1, iterator returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1.9]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_1700
     * @tc.name int8ArrayIteratorPart01Test017
     * @tc.desc Verify two-element array [-128, 127] (min then max), iterator returns -128 then 127 in index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r1: IteratorResult<Number> = it.next();
      let r2: IteratorResult<Number> = it.next();
      expect(r1.value).assertEqual(INT8_MIN);
      expect(r2.value).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_1800
     * @tc.name int8ArrayIteratorPart01Test018
     * @tc.desc Verify three-element array [0, -1, 1] (zero, negative, positive mix), iterator returns 0, -1, 1 in index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, -1, 1]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r1: IteratorResult<Number> = it.next();
      let r2: IteratorResult<Number> = it.next();
      let r3: IteratorResult<Number> = it.next();
      expect(r1.value).assertEqual(0);
      expect(r2.value).assertEqual(-1);
      expect(r3.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_1900
     * @tc.name int8ArrayIteratorPart01Test019
     * @tc.desc Verify three-element array [127, 0, -128] (max, zero, min), iterator returns 127, 0, -128 in index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 0, INT8_MIN]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r1: IteratorResult<Number> = it.next();
      let r2: IteratorResult<Number> = it.next();
      let r3: IteratorResult<Number> = it.next();
      expect(r1.value).assertEqual(INT8_MAX);
      expect(r2.value).assertEqual(0);
      expect(r3.value).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_2000
     * @tc.name int8ArrayIteratorPart01Test020
     * @tc.desc Verify two-element array [127, -128] (max then min), iterator returns 127 then -128 in index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r1: IteratorResult<Number> = it.next();
      let r2: IteratorResult<Number> = it.next();
      expect(r1.value).assertEqual(INT8_MAX);
      expect(r2.value).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_2100
     * @tc.name int8ArrayIteratorPart01Test021
     * @tc.desc Verify three all-zero array [0, 0, 0], iterator returns three 0s and none are done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r1: IteratorResult<Number> = it.next();
      let r2: IteratorResult<Number> = it.next();
      let r3: IteratorResult<Number> = it.next();
      expect(r1.value).assertEqual(0);
      expect(r2.value).assertEqual(0);
      expect(r3.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_2200
     * @tc.name int8ArrayIteratorPart01Test022
     * @tc.desc Verify three all-min array [-128, -128, -128], iterator returns three -128s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MIN, INT8_MIN]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r1: IteratorResult<Number> = it.next();
      let r2: IteratorResult<Number> = it.next();
      let r3: IteratorResult<Number> = it.next();
      expect(r1.value).assertEqual(INT8_MIN);
      expect(r2.value).assertEqual(INT8_MIN);
      expect(r3.value).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_2300
     * @tc.name int8ArrayIteratorPart01Test023
     * @tc.desc Verify three-element array [128, 255, -129] (mixed integer overflow truncation), iterator returns -128, -1, 127 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128, 255, -129]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r1: IteratorResult<Number> = it.next();
      let r2: IteratorResult<Number> = it.next();
      let r3: IteratorResult<Number> = it.next();
      expect(r1.value).assertEqual(INT8_MIN);
      expect(r2.value).assertEqual(-1);
      expect(r3.value).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_2500
     * @tc.name int8ArrayIteratorPart01Test025
     * @tc.desc Verify length-1 array [42] (single element), iterator returns 42 then next() immediately returns done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r1: IteratorResult<Number> = it.next();
      let r2: IteratorResult<Number> = it.next();
      expect(r1.value).assertEqual(42);
      expect(r1.done).assertFalse();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_2600
     * @tc.name int8ArrayIteratorPart01Test026
     * @tc.desc Verify length-2 array [7, 8] (minimum multi-element), iterator returns 7, 8 then third next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r1: IteratorResult<Number> = it.next();
      let r2: IteratorResult<Number> = it.next();
      let r3: IteratorResult<Number> = it.next();
      expect(r1.value).assertEqual(7);
      expect(r2.value).assertEqual(8);
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_2700
     * @tc.name int8ArrayIteratorPart01Test027
     * @tc.desc Verify large array new Int8Array(100) (all zeros), iterator produces 100 elements then done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      let it: IterableIterator<Number> = arr.$_iterator();
      let count: int = 0;
      let r: IteratorResult<Number> = it.next();
      while (!r.done) {
        count = count + 1;
        r = it.next();
      }
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_2800
     * @tc.name int8ArrayIteratorPart01Test028
     * @tc.desc Verify five-element boundary scan array [-128, -1, 0, 1, 127] (min/neg/zero/pos/max), iterator returns all 5 boundary values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, -1, 0, 1, INT8_MAX]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r1: IteratorResult<Number> = it.next();
      let r2: IteratorResult<Number> = it.next();
      let r3: IteratorResult<Number> = it.next();
      let r4: IteratorResult<Number> = it.next();
      let r5: IteratorResult<Number> = it.next();
      expect(r1.value).assertEqual(INT8_MIN);
      expect(r2.value).assertEqual(-1);
      expect(r3.value).assertEqual(0);
      expect(r4.value).assertEqual(1);
      expect(r5.value).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_2900
     * @tc.name int8ArrayIteratorPart01Test029
     * @tc.desc Verify four-element array [10, 20, 30, 40], iterator output count equals array length and last element is 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let it: IterableIterator<Number> = arr.$_iterator();
      let count: int = 0;
      let last: Number = 0;
      let r: IteratorResult<Number> = it.next();
      while (!r.done) {
        last = r.value!;
        count = count + 1;
        r = it.next();
      }
      expect(count).assertEqual(4);
      expect(last).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_3000
     * @tc.name int8ArrayIteratorPart01Test030
     * @tc.desc Verify two-element array [1, 2] exhausted, two consecutive next() calls both return done (exhaustion stability)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let it: IterableIterator<Number> = arr.$_iterator();
      it.next();
      it.next();
      let r1: IteratorResult<Number> = it.next();
      let r2: IteratorResult<Number> = it.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_3100
     * @tc.name int8ArrayIteratorPart01Test031
     * @tc.desc Verify two-element array [1, 2] exhausted, next() returns value as undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let it: IterableIterator<Number> = arr.$_iterator();
      it.next();
      it.next();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_3200
     * @tc.name int8ArrayIteratorPart01Test032
     * @tc.desc Verify for-of iterates empty array new Int8Array(0), loop body executes 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let count: int = 0;
      for (let v of arr) {
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_3300
     * @tc.name int8ArrayIteratorPart01Test033
     * @tc.desc Verify for-of iterates single-element array [5], loop body executes once with value 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let count: int = 0;
      let first: Number = 0;
      for (let v of arr) {
        first = v;
        count = count + 1;
      }
      expect(count).assertEqual(1);
      expect(first).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_3400
     * @tc.name int8ArrayIteratorPart01Test034
     * @tc.desc Verify for-of iterates [10, 20, 30], collects all 3 values in index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let collected: Array<Number> = [];
      for (let v of arr) {
        collected.push(v);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(10);
      expect(collected[1]).assertEqual(20);
      expect(collected[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_3500
     * @tc.name int8ArrayIteratorPart01Test035
     * @tc.desc Verify for-of iteration, each yielded value equals arr.$_get(i) at corresponding index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let i: int = 0;
      for (let v of arr) {
        expect(v).assertEqual(arr.$_get(i));
        i = i + 1;
      }
      expect(i).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_3600
     * @tc.name int8ArrayIteratorPart01Test036
     * @tc.desc Verify for-of iterates [128] (truncated value), yields -128 not 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128]);
      let collected: Array<Number> = [];
      for (let v of arr) {
        collected.push(v);
      }
      expect(collected.length).assertEqual(1);
      expect(collected[0]).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_3700
     * @tc.name int8ArrayIteratorPart01Test037
     * @tc.desc Verify for-of uses break to terminate early after collecting 1 element, only first element collected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let collected: Array<Number> = [];
      for (let v of arr) {
        if (collected.length === 1) {
          break;
        }
        collected.push(v);
      }
      expect(collected.length).assertEqual(1);
      expect(collected[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_3800
     * @tc.name int8ArrayIteratorPart01Test038
     * @tc.desc Verify for-of uses continue to skip second element processing, loop still visits all 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let arr: Int8Array = new Int8Array([10, 20, 30]);

      let collected: Array<Number> = [];

      for (let v of arr) {

        if (v === 20) {

          continue;

        }

        collected.push(v);

      }

      expect(collected.length).assertEqual(2);

      expect(collected[0]).assertEqual(10);

      expect(collected[1]).assertEqual(30);

    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_3900
     * @tc.name int8ArrayIteratorPart01Test039
     * @tc.desc Verify for-of iterates array containing 0 [0, 1], 0 (falsy) is not skipped, loop body executes 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1]);
      let count: int = 0;
      let first: Number = 0;
      for (let v of arr) {
        if (count === 0) {
          first = v;
        }
        count = count + 1;
      }
      expect(count).assertEqual(2);
      expect(first).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_4000
     * @tc.name int8ArrayIteratorPart01Test040
     * @tc.desc Verify for-of iterates large array new Int8Array(100), loop body executes 100 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      let count: int = 0;
      for (let v of arr) {
        count = count + 1;
      }
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_4200
     * @tc.name int8ArrayIteratorPart01Test042
     * @tc.desc Verify for-of iterates [255, 256] (truncation pair), yields -1, 0 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([255, 256]);
      let collected: Array<Number> = [];
      for (let v of arr) {
        collected.push(v);
      }
      expect(collected[0]).assertEqual(-1);
      expect(collected[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_4300
     * @tc.name int8ArrayIteratorPart01Test043
     * @tc.desc Verify for-of iterates [1.9, -1.9] (float truncation toward zero pair), yields 1, -1 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1.9, -1.9]);
      let collected: Array<Number> = [];
      for (let v of arr) {
        collected.push(v);
      }
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_4400
     * @tc.name int8ArrayIteratorPart01Test044
     * @tc.desc Verify $_iterator() and values() first next() return same value and done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let it1: IterableIterator<Number> = arr.$_iterator();
      let it2: IterableIterator<Number> = arr.values();
      let r1: IteratorResult<Number> = it1.next();
      let r2: IteratorResult<Number> = it2.next();
      expect(r1.value).assertEqual(r2.value);
      expect(r1.done).assertEqual(r2.done);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_4500
     * @tc.name int8ArrayIteratorPart01Test045
     * @tc.desc Verify $_iterator() and values() produce identical 3-element sequence and reach done synchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let it1: IterableIterator<Number> = arr.$_iterator();
      let it2: IterableIterator<Number> = arr.values();
      let r1a: IteratorResult<Number> = it1.next();
      let r2a: IteratorResult<Number> = it2.next();
      let r1b: IteratorResult<Number> = it1.next();
      let r2b: IteratorResult<Number> = it2.next();
      let r1c: IteratorResult<Number> = it1.next();
      let r2c: IteratorResult<Number> = it2.next();
      expect(r1a.value).assertEqual(r2a.value);
      expect(r1b.value).assertEqual(r2b.value);
      expect(r1c.value).assertEqual(r2c.value);
      expect(r1c.done).assertEqual(r2c.done);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_4600
     * @tc.name int8ArrayIteratorPart01Test046
     * @tc.desc Verify on empty array $_iterator() and values() first next() both return done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let it1: IterableIterator<Number> = arr.$_iterator();
      let it2: IterableIterator<Number> = arr.values();
      let r1: IteratorResult<Number> = it1.next();
      let r2: IteratorResult<Number> = it2.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_4700
     * @tc.name int8ArrayIteratorPart01Test047
     * @tc.desc Verify two $_iterator() calls produce independent iterators, exhausting it1 does not affect it2 starting fresh
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let it1: IterableIterator<Number> = arr.$_iterator();
      let it2: IterableIterator<Number> = arr.$_iterator();
      it1.next();
      it1.next();
      let r2: IteratorResult<Number> = it2.next();
      expect(r2.value).assertEqual(10);
      expect(r2.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_4800
     * @tc.name int8ArrayIteratorPart01Test048
     * @tc.desc Verify $_iterator() and values() interleaved next() calls, each independently advances to second element 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let it1: IterableIterator<Number> = arr.$_iterator();
      let it2: IterableIterator<Number> = arr.values();
      let r1a: IteratorResult<Number> = it1.next();
      let r2a: IteratorResult<Number> = it2.next();
      let r1b: IteratorResult<Number> = it1.next();
      let r2b: IteratorResult<Number> = it2.next();
      expect(r1b.value).assertEqual(20);
      expect(r2b.value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_4900
     * @tc.name int8ArrayIteratorPart01Test049
     * @tc.desc Verify empty array new Int8Array(0) $_iterator() first next() returns done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_5000
     * @tc.name int8ArrayIteratorPart01Test050
     * @tc.desc Verify empty array new Int8Array(0) $_iterator() first next() returns value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_5100
     * @tc.name int8ArrayIteratorPart01Test051
     * @tc.desc Verify empty array $_iterator() second next() still returns done true (iterator does not reset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let it: IterableIterator<Number> = arr.$_iterator();
      it.next();
      let r: IteratorResult<Number> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ITERATOR_PART01_5200
     * @tc.name int8ArrayIteratorPart01Test052
     * @tc.desc Verify empty array via Int8Array.of() (static construction), $_iterator() first next() returns done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIteratorPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of();
      let it: IterableIterator<Number> = arr.$_iterator();
      let r: IteratorResult<Number> = it.next();
      expect(r.done).assertTrue();
    });

  });
}
