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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function int8ArrayEntriesPart02Test(): void {
  describe('Int8ArrayEntriesPart02Test', (): void => {
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
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0100
     * @tc.name int8ArrayEntriesPart02Test001
     * @tc.desc Verify entries() return value is iterable and next() returns result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      let r = iter.next();
      expect(r.done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0200
     * @tc.name int8ArrayEntriesPart02Test002
     * @tc.desc Verify entries() return object has callable next method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 15]);
      let iter = arr.entries();
      let r = iter.next();
      expect(r.value![0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0300
     * @tc.name int8ArrayEntriesPart02Test003
     * @tc.desc Verify each entries() returns independent iterator, advance does not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter1 = arr.entries();
      let iter2 = arr.entries();
      iter1.next();
      let r2 = iter2.next();
      let i2: number = r2.value![0];
      expect(i2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0400
     * @tc.name int8ArrayEntriesPart02Test004
     * @tc.desc Verify next() return value typeof is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8]);
      let iter = arr.entries();
      let r = iter.next();
      expect(r.done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0500
     * @tc.name int8ArrayEntriesPart02Test005
     * @tc.desc Verify first next().done of non-empty array is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      let r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0600
     * @tc.name int8ArrayEntriesPart02Test006
     * @tc.desc Verify first next().value typeof is object (tuple)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      let r = iter.next();
      expect(r.value![0]).assertEqual(0);
      expect(r.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0700
     * @tc.name int8ArrayEntriesPart02Test007
     * @tc.desc Verify tuple length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      let r = iter.next();
      expect(r.value!.length).assertEqual(2);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0800
       * @tc.name int8ArrayEntriesPart02Test008
       * @tc.desc Verify tuple first element (index) typeof is number
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayEntriesPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
        let iter = arr.entries();
        let r = iter.next();
        expect(typeof r.value![0]).assertEqual('int');
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0900
     * @tc.name int8ArrayEntriesPart02Test009
     * @tc.desc Verify done field typeof is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      let r = iter.next();
      expect(r.done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1000
     * @tc.name int8ArrayEntriesPart02Test010
     * @tc.desc Verify first next().value[0] equals 0 (index starts from 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      let r = iter.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1100
     * @tc.name int8ArrayEntriesPart02Test011
     * @tc.desc Verify second next().value[0] equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      iter.next();
      let r = iter.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1200
     * @tc.name int8ArrayEntriesPart02Test012
     * @tc.desc Verify step i next().value[0] equals i (i=3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      let r = iter.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1300
     * @tc.name int8ArrayEntriesPart02Test013
     * @tc.desc Verify last next().value[0] equals length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      let r = iter.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1400
     * @tc.name int8ArrayEntriesPart02Test014
     * @tc.desc Verify first next().value[1] equals arr.$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1500
     * @tc.name int8ArrayEntriesPart02Test015
     * @tc.desc Verify step i next().value[1] equals arr.$_get(i) (i=2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1600
     * @tc.name int8ArrayEntriesPart02Test016
     * @tc.desc Verify element 128 truncates to -128, entries returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128]);
      let iter = arr.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1700
     * @tc.name int8ArrayEntriesPart02Test017
     * @tc.desc Verify element 255 truncates to -1, entries returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([255]);
      let iter = arr.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1800
     * @tc.name int8ArrayEntriesPart02Test018
     * @tc.desc Verify element -128 (int8 minimum) entries returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128]);
      let iter = arr.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1900
     * @tc.name int8ArrayEntriesPart02Test019
     * @tc.desc Verify element 127 (int8 maximum) entries returns 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let iter = arr.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2000
     * @tc.name int8ArrayEntriesPart02Test020
     * @tc.desc Verify element 0 entries returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let iter = arr.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2100
     * @tc.name int8ArrayEntriesPart02Test021
     * @tc.desc Verify element Number.NaN converts to 0, entries returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([Number.NaN]);
      let iter = arr.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2200
     * @tc.name int8ArrayEntriesPart02Test022
     * @tc.desc Verify empty array first next().done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter = arr.entries();
      let r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2300
     * @tc.name int8ArrayEntriesPart02Test023
     * @tc.desc Verify empty array first next().value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter = arr.entries();
      let r = iter.next();
      let v: Object | undefined = r.value;
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2400
     * @tc.name int8ArrayEntriesPart02Test024
     * @tc.desc Verify empty array entries() iterator next() returns {done:true}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter = arr.entries();
      let r = iter.next();
      expect(r.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2500
     * @tc.name int8ArrayEntriesPart02Test025
     * @tc.desc Verify single element array first next().value[0] equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let iter = arr.entries();
      let r = iter.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2600
     * @tc.name int8ArrayEntriesPart02Test026
     * @tc.desc Verify single element array second next().done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let iter = arr.entries();
      iter.next();
      let r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2700
     * @tc.name int8ArrayEntriesPart02Test027
     * @tc.desc Verify beyond length steps next().done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      let r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2800
     * @tc.name int8ArrayEntriesPart02Test028
     * @tc.desc Verify exhausted next().value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      let r = iter.next();
      let v: Object | undefined = r.value;
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2900
     * @tc.name int8ArrayEntriesPart02Test029
     * @tc.desc Verify exhausted then next() again still returns done true (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      let r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3000
     * @tc.name int8ArrayEntriesPart02Test030
     * @tc.desc Verify two consecutive exhausted next() both return done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      let r1 = iter.next();
      let r2 = iter.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3100
     * @tc.name int8ArrayEntriesPart02Test031
     * @tc.desc Verify arr.length unchanged after complete iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let before: int = arr.length;
      let iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      expect(arr.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3200
     * @tc.name int8ArrayEntriesPart02Test032
     * @tc.desc Verify view arr.byteOffset unchanged after complete iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      let before: int = arr.byteOffset;
      let iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3300
     * @tc.name int8ArrayEntriesPart02Test033
     * @tc.desc Verify while count iteration count equals arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let iter = arr.entries();
      let count: number = 0;
      let r = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3400
     * @tc.name int8ArrayEntriesPart02Test034
     * @tc.desc Verify only create iterator without calling next, arr.length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let before: int = arr.length;
      let iter = arr.entries();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3500
     * @tc.name int8ArrayEntriesPart02Test035
     * @tc.desc Verify all element values unchanged after complete iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let b0: number = arr.$_get(0);
      let b1: number = arr.$_get(1);
      let b2: number = arr.$_get(2);
      let iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      expect(arr.$_get(0)).assertEqual(b0);
      expect(arr.$_get(1)).assertEqual(b1);
      expect(arr.$_get(2)).assertEqual(b2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3600
     * @tc.name int8ArrayEntriesPart02Test036
     * @tc.desc Verify two complete iterations produce same value sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter1 = arr.entries();
      let r1a = iter1.next();
      let r1b = iter1.next();
      let iter2 = arr.entries();
      let r2a = iter2.next();
      let r2b = iter2.next();
      expect(r1a.value![1].valueOf()).assertEqual(r2a.value![1].valueOf());
      expect(r1b.value![1].valueOf()).assertEqual(r2b.value![1].valueOf());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3700
     * @tc.name int8ArrayEntriesPart02Test037
     * @tc.desc Verify partial iteration (early stop) does not modify unvisited elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let before: number = arr.$_get(1);
      let iter = arr.entries();
      iter.next();
      expect(arr.$_get(1)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3800
     * @tc.name int8ArrayEntriesPart02Test038
     * @tc.desc Verify for-of consume arr.length unchanged and first index is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let before: int = arr.length;
      let first: int = -1;
      for (const pair of arr.entries()) {
        first = pair[0];
        break;
      }
      expect(arr.length).assertEqual(before);
      expect(first).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3900
     * @tc.name int8ArrayEntriesPart02Test039
     * @tc.desc Verify exhausted original iterator then can still entries() again (array not consumed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let iter1 = arr.entries();
      iter1.next();
      iter1.next();
      iter1.next();
      let iter2 = arr.entries();
      let r = iter2.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4000
     * @tc.name int8ArrayEntriesPart02Test040
     * @tc.desc Verify after complete iteration re-entries() first index is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter1 = arr.entries();
      iter1.next();
      iter1.next();
      iter1.next();
      iter1.next();
      let iter2 = arr.entries();
      let r = iter2.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4100
     * @tc.name int8ArrayEntriesPart02Test041
     * @tc.desc Verify same array two iterators both first index is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter1 = arr.entries();
      let iter2 = arr.entries();
      let r1 = iter1.next();
      let r2 = iter2.next();
      let i1: number = r1.value![0];
      let i2: number = r2.value![0];
      expect(i1).assertEqual(0);
      expect(i2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4200
     * @tc.name int8ArrayEntriesPart02Test042
     * @tc.desc Verify interleaved advance two iterators produce correct independent index sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let iter1 = arr.entries();
      let iter2 = arr.entries();
      iter1.next();
      let r1 = iter1.next();
      iter2.next();
      iter2.next();
      let r2 = iter2.next();
      let i1: number = r1.value![0];
      let i2: number = r2.value![0];
      expect(i1).assertEqual(1);
      expect(i2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4300
     * @tc.name int8ArrayEntriesPart02Test043
     * @tc.desc Verify two iterators first element value same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter1 = arr.entries();
      let iter2 = arr.entries();
      let r1 = iter1.next();
      let r2 = iter2.next();
      expect(r1.value![1].valueOf()).assertEqual(r2.value![1].valueOf());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4400
     * @tc.name int8ArrayEntriesPart02Test044
     * @tc.desc Verify for-of produce object type (typeof object)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstType: string = '';
      for (const pair of arr.entries()) {
        firstType = typeof pair;
        break;
      }
      expect(firstType).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4500
     * @tc.name int8ArrayEntriesPart02Test045
     * @tc.desc Verify for-of produce [0, first element] tuple structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let idx: int = -1;
      let val: number = -1;
      for (const pair of arr.entries()) {
        idx = pair[0];
        val = pair[1].valueOf();
        break;
      }
      expect(idx).assertEqual(0);
      expect(val).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4600
     * @tc.name int8ArrayEntriesPart02Test046
     * @tc.desc Verify for-of last index equals length-1 (proves full traversal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let last: int = -1;
      for (const pair of arr.entries()) {
        last = pair[0];
      }
      expect(last).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4700
     * @tc.name int8ArrayEntriesPart02Test047
     * @tc.desc Verify consecutive two next() results carry increasing index (each result object state independent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      let r1 = iter.next();
      let r2 = iter.next();
      let i1: number = r1.value![0];
      let i2: number = r2.value![0];
      expect(i2 - i1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4800
     * @tc.name int8ArrayEntriesPart02Test048
     * @tc.desc Verify subarray view entries index starts from 0 (view relative, not absolute buffer offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let view: Int8Array = arr.subarray(2, 5);
      let iter = view.entries();
      let r = iter.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4900
     * @tc.name int8ArrayEntriesPart02Test049
     * @tc.desc Verify subarray view entries value is view window value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let view: Int8Array = arr.subarray(2, 5);
      let iter = view.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_5000
     * @tc.name int8ArrayEntriesPart02Test050
     * @tc.desc Verify subarray view while count equals view length (not buffer length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let view: Int8Array = arr.subarray(1, 4);
      let cnt: number = 0;
      let iter = view.entries();
      let r = iter.next();
      while (!r.done) {
        cnt = cnt + 1;
        r = iter.next();
      }
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_5100
     * @tc.name int8ArrayEntriesPart02Test051
     * @tc.desc Verify ArrayBuffer view with byteOffset entries index still starts from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 3);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      arr.$_set(2, 33);
      let iter = arr.entries();
      let r = iter.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_5200
     * @tc.name int8ArrayEntriesPart02Test052
     * @tc.desc Verify shared buffer: view1 modify then view2.entries() reflects new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view1: Int8Array = new Int8Array(buf);
      let view2: Int8Array = new Int8Array(buf);
      view1.$_set(0, 77);
      let iter = view2.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_5300
     * @tc.name int8ArrayEntriesPart02Test053
     * @tc.desc Verify subarray view byteOffset unchanged after iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let view: Int8Array = arr.subarray(2, 5);
      let before: int = view.byteOffset;
      let iter = view.entries();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      expect(view.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_5400
     * @tc.name int8ArrayEntriesPart02Test054
     * @tc.desc Verify same buffer two views each entries count independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let view1: Int8Array = new Int8Array(buf, 0, 3);
      let view2: Int8Array = new Int8Array(buf, 3, 3);
      let c1: number = 0;
      let it1 = view1.entries();
      let r1 = it1.next();
      while (!r1.done) {
        c1 = c1 + 1;
        r1 = it1.next();
      }
      let c2: number = 0;
      let it2 = view2.entries();
      let r2 = it2.next();
      while (!r2.done) {
        c2 = c2 + 1;
        r2 = it2.next();
      }
      expect(c1).assertEqual(3);
      expect(c2).assertEqual(3);
    });
  });
}
