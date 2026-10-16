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

export default function int8ArrayValuesPart02Test(): void {
  describe('Int8ArrayValuesPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_0100
     * @tc.name int8ArrayValuesPart02Test001
     * @tc.desc Verify values iterator next returns object non empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5]);
      let iter = arr.values();
      let r = iter.next();
      expect(r.done).assertEqual(false);
      expect(r.value).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_0200
     * @tc.name int8ArrayValuesPart02Test002
     * @tc.desc Verify values iterator next value undefined after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1]);
      let iter = arr.values();
      iter.next();
      let r = iter.next();
      let valueAfterExhaust = r.value;
      let r1: string = typeof valueAfterExhaust;
      let e1: string = 'undefined';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_0300
     * @tc.name int8ArrayValuesPart02Test003
     * @tc.desc Verify values iterator next value undefined on empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let iter = arr.values();
      let r = iter.next();
      let valueOfEmpty = r.value;
      let r1: string = typeof valueOfEmpty;
      let e1: string = 'undefined';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_0400
     * @tc.name int8ArrayValuesPart02Test004
     * @tc.desc Verify values iterator next returns object on empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let iter = arr.values();
      let r = iter.next();
      expect(r.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_0500
     * @tc.name int8ArrayValuesPart02Test005
     * @tc.desc Verify values() next().value returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let iter = arr.values();
      let r = iter.next();
      let r1 = r.value;
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_0600
     * @tc.name int8ArrayValuesPart02Test006
     * @tc.desc Verify values next().value -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let iter = arr.values();
      let r = iter.next();
      let r1 = r.value;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_0700
     * @tc.name int8ArrayValuesPart02Test007
     * @tc.desc Verify values next().value - second call returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let iter = arr.values();
      iter.next();
      let r = iter.next();
      let r1 = r.value;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_0800
     * @tc.name int8ArrayValuesPart02Test008
     * @tc.desc Verify values next().value - third call returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let iter = arr.values();
      iter.next();
      iter.next();
      let r = iter.next();
      let r1 = r.value;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_0900
     * @tc.name int8ArrayValuesPart02Test009
     * @tc.desc Verify values next().done true after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let iter = arr.values();
      iter.next();
      iter.next();
      iter.next();
      let r = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_1000
     * @tc.name int8ArrayValuesPart02Test010
     * @tc.desc Verify values next().value undefined after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let iter = arr.values();
      iter.next();
      iter.next();
      iter.next();
      let r = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_1100
     * @tc.name int8ArrayValuesPart02Test011
     * @tc.desc Verify values next().done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([8]);
      let iter = arr.values();
      let r = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_1200
     * @tc.name int8ArrayValuesPart02Test012
     * @tc.desc Verify values next().done true on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let iter = arr.values();
      let r = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_1300
     * @tc.name int8ArrayValuesPart02Test013
     * @tc.desc Verify values next().value undefined on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let iter = arr.values();
      let r = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_1400
     * @tc.name int8ArrayValuesPart02Test014
     * @tc.desc Verify values next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let iter = arr.values();
      iter.next();
      let r = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_1500
     * @tc.name int8ArrayValuesPart02Test015
     * @tc.desc Verify values int8 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX]);
      let iter = arr.values();
      let r = iter.next();
      let r1 = r.value;
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_1600
     * @tc.name int8ArrayValuesPart02Test016
     * @tc.desc Verify values int8 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN]);
      let iter = arr.values();
      let r = iter.next();
      let r1 = r.value;
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_1700
     * @tc.name int8ArrayValuesPart02Test017
     * @tc.desc Verify values().next().value returns 0 for Int8Array containing single zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0]);
      let iter = arr.values();
      let r = iter.next();
      let r1 = r.value;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_1800
     * @tc.name int8ArrayValuesPart02Test018
     * @tc.desc Verify values().next().value returns -5 for Int8Array containing single -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-5]);
      let iter = arr.values();
      let r = iter.next();
      let r1 = r.value;
      let e1: int = -5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_1900
     * @tc.name int8ArrayValuesPart02Test019
     * @tc.desc Verify values 256 int8 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([256]);
      let iter = arr.values();
      let r = iter.next();
      let r1 = r.value;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_2000
     * @tc.name int8ArrayValuesPart02Test020
     * @tc.desc Verify values -129 min-1 int8 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-129]);
      let iter = arr.values();
      let r = iter.next();
      let r1 = r.value;
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_2100
     * @tc.name int8ArrayValuesPart02Test021
     * @tc.desc Verify values r1.value next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let iter = arr.values();
      let r1 = iter.next();
      iter.next();
      let r1Value = r1.value;
      let e1: int = 1;
      expect(r1Value).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_2200
     * @tc.name int8ArrayValuesPart02Test022
     * @tc.desc Verify values iteration count equals array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let iter = arr.values();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_2300
     * @tc.name int8ArrayValuesPart02Test023
     * @tc.desc Verify values() iteration count matches length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let iter = arr.values();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_2400
     * @tc.name int8ArrayValuesPart02Test024
     * @tc.desc Verify values iterator count equals byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let iter = arr.values();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_2500
     * @tc.name int8ArrayValuesPart02Test025
     * @tc.desc Verify values() iteration count matches byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let iter = arr.values();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_2600
     * @tc.name int8ArrayValuesPart02Test026
     * @tc.desc Verify values iteration preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let lenBefore = arr.length;
      let iter = arr.values();
      let r = iter.next();
      while (!r.done) {
        r = iter.next();
      }
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_2700
     * @tc.name int8ArrayValuesPart02Test027
     * @tc.desc Verify values iteration leaves first and last elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33]);
      let iter = arr.values();
      let r = iter.next();
      while (!r.done) {
        r = iter.next();
      }
      let r1: number = arr.$_get(0);
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 33;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_2800
     * @tc.name int8ArrayValuesPart02Test028
     * @tc.desc Verify values() next keeps length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let iter = arr.values();
      iter.next();
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_2900
     * @tc.name int8ArrayValuesPart02Test029
     * @tc.desc Verify values() does not mutate array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 6, 7]);
      let before = arr.$_get(0);
      let iter = arr.values();
      iter.next();
      iter.next();
      iter.next();
      let r1: number = arr.$_get(0);
      let e1 = before;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_3000
     * @tc.name int8ArrayValuesPart02Test030
     * @tc.desc Verify values() repeated calls leave elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let iteresultVal1 = arr.values();
      let doneVal1: boolean = iteresultVal1.next().done;
      expect(doneVal1).assertFalse();
      let iteresultVal2 = arr.values();
      let doneVal2: boolean = iteresultVal2.next().done;
      expect(doneVal2).assertFalse();
      let iteresultVal3 = arr.values();
      let doneVal3: boolean = iteresultVal3.next().done;
      expect(doneVal3).assertFalse();
      let r1: number = arr.$_get(1);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_3100
     * @tc.name int8ArrayValuesPart02Test031
     * @tc.desc Verify values iteration preserves byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let blBefore = arr.byteLength;
      let iter = arr.values();
      let r = iter.next();
      while (!r.done) {
        r = iter.next();
      }
      let r1: int = arr.byteLength;
      let e1: number = blBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_3200
     * @tc.name int8ArrayValuesPart02Test032
     * @tc.desc Verify values iteration preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int8Array(buf, 2, 4);
      let offBefore = arr.byteOffset;
      let iter = arr.values();
      let r = iter.next();
      while (!r.done) {
        r = iter.next();
      }
      let r1: int = arr.byteOffset;
      let e1: number = offBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_3300
     * @tc.name int8ArrayValuesPart02Test033
     * @tc.desc Verify values() fresh iterator after previous exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20]);
      let iter1 = arr.values();
      iter1.next();
      iter1.next();
      iter1.next();
      let iter2 = arr.values();
      let r = iter2.next();
      let r1: boolean = r.done;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_3400
     * @tc.name int8ArrayValuesPart02Test034
     * @tc.desc Verify values new iterator always starts first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let iter1 = arr.values();
      iter1.next();
      iter1.next();
      let iter2 = arr.values();
      let r = iter2.next();
      let r1 = r.value;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_3500
     * @tc.name int8ArrayValuesPart02Test035
     * @tc.desc Verify values two iterators advance independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let iter1 = arr.values();
      let iter2 = arr.values();
      iter1.next();
      iter2.next();
      let r = iter1.next();
      let r1 = r.value;
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_3600
     * @tc.name int8ArrayValuesPart02Test036
     * @tc.desc Verify values view iterator starts at byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let full = new Int8Array(buf);
      full.$_set(0, 1);
      full.$_set(1, 2);
      full.$_set(2, 3);
      full.$_set(3, 4);
      full.$_set(4, 5);
      full.$_set(5, 6);
      let view = new Int8Array(buf, 2, 3);
      let iter = view.values();
      let r = iter.next();
      let r1 = r.value;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_3700
     * @tc.name int8ArrayValuesPart02Test037
     * @tc.desc Verify values view iterator count equals view length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int8Array(buf, 0, 4);
      let iter = view.values();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_3800
     * @tc.name int8ArrayValuesPart02Test038
     * @tc.desc Verify values iteration count equals view byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int8Array(buf, 2, 3);
      let iter = view.values();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(view.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_3900
     * @tc.name int8ArrayValuesPart02Test039
     * @tc.desc Verify values view iterator yields last view element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(5);
      let full = new Int8Array(buf);
      full.$_set(0, 10);
      full.$_set(1, 20);
      full.$_set(2, 30);
      full.$_set(3, 40);
      full.$_set(4, 50);
      let view = new Int8Array(buf, 1, 3);
      let iter = view.values();
      iter.next();
      iter.next();
      let r = iter.next();
      let r1 = r.value;
      let e1: int = 40;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_4000
     * @tc.name int8ArrayValuesPart02Test040
     * @tc.desc Verify values on buffer view starts at byteOffset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let full = new Int8Array(buf);
      full.$_set(0, 100);
      full.$_set(1, 110);
      full.$_set(2, 120);
      full.$_set(3, INT8_MAX);
      let view = new Int8Array(buf, 1, 2);
      let iter = view.values();
      let r = iter.next();
      let r1 = r.value;
      let e1: int = 110;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_4100
     * @tc.name int8ArrayValuesPart02Test041
     * @tc.desc Verify subarray values() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let sub = arr.subarray(1, 4);
      let iter = sub.values();
      let r = iter.next();
      let r1 = r.value;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_4200
     * @tc.name int8ArrayValuesPart02Test042
     * @tc.desc Verify values next() reflects live mutation between calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let iter = arr.values();
      iter.next();
      arr.$_set(1, 99);
      let r = iter.next();
      let r1 = r.value;
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_4300
     * @tc.name int8ArrayValuesPart02Test043
     * @tc.desc Verify values zero length view next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let view = new Int8Array(buf, 2, 0);
      let iter = view.values();
      let r = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART02_4400
     * @tc.name int8ArrayValuesPart02Test044
     * @tc.desc Verify values value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let view = new Int8Array(buf, 0, 2);
      let iter = view.values();
      iter.next();
      iter.next();
      let r = iter.next();
      expect(r.value).assertUndefined();
    });
  });
}
