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
import Utils from './../Util.test';

export default function int8ArrayEntriesPart02Test(): void {
  describe('Int8ArrayEntriesPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

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
      let r1: boolean = r.done;
      expect(r1).assertFalse();
      let [k0, v0]: [int, double] = r.value!;
      expect(k0).assertEqual(0);
      expect(v0).assertEqual(10);
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
     * @tc.desc Verify entries() next() return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8]);
      let iter = arr.entries();
      let r = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0500
     * @tc.name int8ArrayEntriesPart02Test005
     * @tc.desc Verify entries() first next().value[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      let r = iter.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0600
     * @tc.name int8ArrayEntriesPart02Test006
     * @tc.desc Verify entries() second next().value[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      iter.next();
      let r = iter.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0700
     * @tc.name int8ArrayEntriesPart02Test007
     * @tc.desc Verify entries() step next().value[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0800
     * @tc.name int8ArrayEntriesPart02Test008
     * @tc.desc Verify entries() last next().value[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      let r = iter.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_0900
     * @tc.name int8ArrayEntriesPart02Test009
     * @tc.desc Verify first next() of entries() returns value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1000
     * @tc.name int8ArrayEntriesPart02Test010
     * @tc.desc Verify third next() of entries() returns value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1100
     * @tc.name int8ArrayEntriesPart02Test011
     * @tc.desc Verify element 128 truncates to -128, entries returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128]);
      let iter = arr.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(-128);
      let arr2: Int8Array = new Int8Array([255]);
      let iter2 = arr2.entries();
      let r2 = iter2.next();
      let val2: number = r2.value![1].valueOf();
      expect(val2).assertEqual(-1);
      let arr3: Int8Array = new Int8Array([0]);
      let iter3 = arr3.entries();
      let r3 = iter3.next();
      let val3: number = r3.value![1].valueOf();
      expect(val3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1200
     * @tc.name int8ArrayEntriesPart02Test012
     * @tc.desc Verify element -128 (int8 minimum) entries returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let iter = arr.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1300
     * @tc.name int8ArrayEntriesPart02Test013
     * @tc.desc Verify element 127 (int8 maximum) entries returns 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let iter = arr.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1400
     * @tc.name int8ArrayEntriesPart02Test014
     * @tc.desc Verify element Number.NaN converts to 0, entries returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([Number.NaN]);
      let iter = arr.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1500
     * @tc.name int8ArrayEntriesPart02Test015
     * @tc.desc Verify entries returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter = arr.entries();
      let r = iter.next();
      let v: Object | undefined = r.value;
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1600
     * @tc.name int8ArrayEntriesPart02Test016
     * @tc.desc Verify empty array entries() iterator next() returns {done:true}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter = arr.entries();
      let r = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1700
     * @tc.name int8ArrayEntriesPart02Test017
     * @tc.desc Verify first next() of entries() returns index 0 on single-element Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let iter = arr.entries();
      let r = iter.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1800
     * @tc.name int8ArrayEntriesPart02Test018
     * @tc.desc Verify second next() of entries() on single-element Int8Array is done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let iter = arr.entries();
      iter.next();
      let r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_1900
     * @tc.name int8ArrayEntriesPart02Test019
     * @tc.desc Verify entries() beyond length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      let r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2000
     * @tc.name int8ArrayEntriesPart02Test020
     * @tc.desc Verify entries() exhausted next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      let r = iter.next();
      let v: Object | undefined = r.value;
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2100
     * @tc.name int8ArrayEntriesPart02Test021
     * @tc.desc Verify entries() exhausted then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      let r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2200
     * @tc.name int8ArrayEntriesPart02Test022
     * @tc.desc Verify two consecutive next() of entries() after exhaustion both return done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2300
     * @tc.name int8ArrayEntriesPart02Test023
     * @tc.desc Verify entries() arr.length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      let sum: number = 0;
      let r = iter.next();
      while (!r.done) {
        sum = sum + r.value![1].valueOf();
        r = iter.next();
      }
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2400
     * @tc.name int8ArrayEntriesPart02Test024
     * @tc.desc Verify entries() on ArrayBuffer view keeps byteOffset and yields set values 7, 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let iter = arr.entries();
      let r = iter.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2500
     * @tc.name int8ArrayEntriesPart02Test025
     * @tc.desc Verify entries() while count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2600
     * @tc.name int8ArrayEntriesPart02Test026
     * @tc.desc Verify entries() creation alone does not change arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      let r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2700
     * @tc.name int8ArrayEntriesPart02Test027
     * @tc.desc Verify entries() iteration yields indexes 0-2 with values 10, 20, 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      let r = iter.next();
      let v: Object | undefined = r.value;
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2800
     * @tc.name int8ArrayEntriesPart02Test028
     * @tc.desc Verify two independent entries() iterators yield same values 10, 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter1 = arr.entries();
      let r1a = iter1.next();
      let r1b = iter1.next();
      let iter2 = arr.entries();
      let r2a = iter2.next();
      let r2b = iter2.next();
      let r1: number = r1a.value![1].valueOf();
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = r1b.value![1].valueOf();
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = r2a.value![1].valueOf();
      let e3: int = 10;
      expect(r3).assertEqual(e3);
      let r4: number = r2b.value![1].valueOf();
      let e4: int = 20;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_2900
     * @tc.name int8ArrayEntriesPart02Test029
     * @tc.desc Verify partial entries() iteration yields value 10 and leaves element 20 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      let r = iter.next();
      let r2: number = r.value![0];
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = r.value![1].valueOf();
      let e3: int = 10;
      expect(r3).assertEqual(e3);
      let r1: number = arr.$_get(1);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3000
     * @tc.name int8ArrayEntriesPart02Test030
     * @tc.desc Verify entries() for-of consume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let first: int = -1;
      for (const pair of arr.entries()) {
        first = pair[0];
        break;
      }
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      expect(first).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3100
     * @tc.name int8ArrayEntriesPart02Test031
     * @tc.desc Verify exhausted original iterator then can still entries() again (array not consumed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3200
     * @tc.name int8ArrayEntriesPart02Test032
     * @tc.desc Verify after complete iteration re-entries() first index is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3300
     * @tc.name int8ArrayEntriesPart02Test033
     * @tc.desc Verify entries() same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3400
     * @tc.name int8ArrayEntriesPart02Test034
     * @tc.desc Verify entries() interleaved advance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3500
     * @tc.name int8ArrayEntriesPart02Test035
     * @tc.desc Verify two entries() iterators on same array both start with value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3600
     * @tc.name int8ArrayEntriesPart02Test036
     * @tc.desc Verify entries() yields pair objects of type 'object' on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstType: string = '';
      for (const pair of arr.entries()) {
        firstType = typeof pair;
        break;
      }
      expect(firstType).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3700
     * @tc.name int8ArrayEntriesPart02Test037
     * @tc.desc Verify first pair of entries() on [10,20,30] is index 0 value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3800
     * @tc.name int8ArrayEntriesPart02Test038
     * @tc.desc Verify entries() for-of last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let last: int = -1;
      for (const pair of arr.entries()) {
        last = pair[0];
      }
      expect(last).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_3900
     * @tc.name int8ArrayEntriesPart02Test039
     * @tc.desc Verify consecutive next() of entries() yields indexes 0 then 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let iter = arr.entries();
      let r1 = iter.next();
      let r2 = iter.next();
      let i1: number = r1.value![0];
      let i2: number = r2.value![0];
      expect(i1).assertEqual(0);
      expect(i2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4000
     * @tc.name int8ArrayEntriesPart02Test040
     * @tc.desc Verify subarray view entries index starts from 0 (view relative, not absolute buffer offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let view: Int8Array = arr.subarray(2, 5);
      let iter = view.entries();
      let r = iter.next();
      let idx: number = r.value![0];
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4100
     * @tc.name int8ArrayEntriesPart02Test041
     * @tc.desc Verify subarray view entries value is view window value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let view: Int8Array = arr.subarray(2, 5);
      let iter = view.entries();
      let r = iter.next();
      let val: number = r.value![1].valueOf();
      expect(val).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4200
     * @tc.name int8ArrayEntriesPart02Test042
     * @tc.desc Verify entries() iteration on subarray(1, 4) yields 3 pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4300
     * @tc.name int8ArrayEntriesPart02Test043
     * @tc.desc Verify ArrayBuffer view with byteOffset entries index still starts from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4400
     * @tc.name int8ArrayEntriesPart02Test044
     * @tc.desc Verify shared buffer: view1 modify then view2.entries() reflects new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4500
     * @tc.name int8ArrayEntriesPart02Test045
     * @tc.desc Verify entries() on subarray(2, 5) yields view values 30, 40, 50 and keeps byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let view: Int8Array = arr.subarray(2, 5);
      let iter = view.entries();
      let r1 = iter.next();
      let r2: number = r1.value![1].valueOf();
      let e2: int = 30;
      expect(r2).assertEqual(e2);
      let r6 = iter.next();
      let r3: number = r6.value![1].valueOf();
      let e3: int = 40;
      expect(r3).assertEqual(e3);
      let r7 = iter.next();
      let r4: number = r7.value![1].valueOf();
      let e4: int = 50;
      expect(r4).assertEqual(e4);
      let r8 = iter.next();
      let r5: boolean = r8.done;
      expect(r5).assertTrue();
      let r9: int = view.byteOffset;
      let e1: int = 2;
      expect(r9).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART02_4600
     * @tc.name int8ArrayEntriesPart02Test046
     * @tc.desc Verify same buffer two views each entries count independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
