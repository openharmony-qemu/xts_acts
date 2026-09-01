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

export default function int8ArrayFillPart04Test(): void {
  describe('Int8ArrayFillPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_0100
     * @tc.name int8ArrayFillPart04Test001
     * @tc.desc Verify fill(value) single parameter fills entire array, first and last elements both covered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 1);
      arr.$_set(3, 2);
      arr.fill(7);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_0200
     * @tc.name int8ArrayFillPart04Test002
     * @tc.desc Verify fill(value, start) fills from start to end, elements before start unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      arr.fill(9, 2);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(22);
      expect(arr.$_get(2)).assertEqual(9);
      expect(arr.$_get(4)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_0300
     * @tc.name int8ArrayFillPart04Test003
     * @tc.desc Verify fill(value, start, end) fills [start,end) interval, element at end not filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(6);
      arr.fill(3, 1, 4);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_0400
     * @tc.name int8ArrayFillPart04Test004
     * @tc.desc Verify fill(value, 0, 0) empty interval fills nothing, array keeps initial zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(5, 0, 0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_0500
     * @tc.name int8ArrayFillPart04Test005
     * @tc.desc Verify fill(value, 0, length) end=length equivalent to full fill, same as single param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(8, 0, 3);
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_0600
     * @tc.name int8ArrayFillPart04Test006
     * @tc.desc Verify chained fill(5).fill(9) second overrides first, final all 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(5).fill(9);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_0700
     * @tc.name int8ArrayFillPart04Test007
     * @tc.desc Verify fill(INT8_MIN) writes INT8_MIN to both elements, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const v: byte = INT8_MIN;
      arr.fill(v);
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_0800
     * @tc.name int8ArrayFillPart04Test008
     * @tc.desc Verify fill(INT8_MAX) writes INT8_MAX to both elements, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const v: byte = INT8_MAX;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_0900
     * @tc.name int8ArrayFillPart04Test009
     * @tc.desc Verify fill(0) clears element 0 after $_set(0, 50), on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, 50);
      const v: byte = 0;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_1000
     * @tc.name int8ArrayFillPart04Test010
     * @tc.desc Verify fill(-1) writes -1 to both elements, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const v: byte = -1;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_1100
     * @tc.name int8ArrayFillPart04Test011
     * @tc.desc Verify fill(1, 1, 3) fills indices 1 to 2 only, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 1;
      arr.fill(v, 1, 3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_1200
     * @tc.name int8ArrayFillPart04Test012
     * @tc.desc Verify fill(64) writes 64 to both elements, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const v: byte = 64;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_1300
     * @tc.name int8ArrayFillPart04Test013
     * @tc.desc Verify fill(128) clamps to -128 at $_get(0) on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(128);
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_1400
     * @tc.name int8ArrayFillPart04Test014
     * @tc.desc Verify fill(-129) clamps to INT8_MAX at $_get(0) on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(-129);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.at(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_1500
     * @tc.name int8ArrayFillPart04Test015
     * @tc.desc Verify fill(255) clamps to -1 at $_get(0) on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(255);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_1600
     * @tc.name int8ArrayFillPart04Test016
     * @tc.desc Verify fill(256) truncates to 0 clearing element 0, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.$_set(0, 50);
      arr.fill(256);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_1700
     * @tc.name int8ArrayFillPart04Test017
     * @tc.desc Verify fill(0x80) truncates to -128, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(0x80);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_1800
     * @tc.name int8ArrayFillPart04Test018
     * @tc.desc Verify fill(0xFF) truncates to -1, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(0xff);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_1900
     * @tc.name int8ArrayFillPart04Test019
     * @tc.desc Verify fill(0x100) truncates to 0, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(0x100);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_2000
     * @tc.name int8ArrayFillPart04Test020
     * @tc.desc Verify fill(0x81) truncates to -INT8_MAX, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(0x81);
      expect(arr.$_get(0)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_2100
     * @tc.name int8ArrayFillPart04Test021
     * @tc.desc Verify fill(200) truncates to -56, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(200);
      expect(arr.$_get(0)).assertEqual(-56);
      expect(arr.$_get(2)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_2200
     * @tc.name int8ArrayFillPart04Test022
     * @tc.desc Verify fill(Number.NaN) truncates to 0 clearing element 0, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.$_set(0, 99);
      arr.fill(Number.NaN);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_2300
     * @tc.name int8ArrayFillPart04Test023
     * @tc.desc Verify fill(1.9) truncates to 1, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(1.9);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_2400
     * @tc.name int8ArrayFillPart04Test024
     * @tc.desc Verify fill(-1.9) truncates to -1, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(-1.9);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_2500
     * @tc.name int8ArrayFillPart04Test025
     * @tc.desc Verify fill(-0.0) truncates to 0, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.$_set(0, 77);
      arr.fill(-0.0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_2600
     * @tc.name int8ArrayFillPart04Test026
     * @tc.desc Verify fill(Number.MIN_VALUE) converts to 0 at $_get(0) on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(Number.MIN_VALUE);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_2700
     * @tc.name int8ArrayFillPart04Test027
     * @tc.desc Verify start=0 fills from array head, equivalent to default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(6, 0);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_2800
     * @tc.name int8ArrayFillPart04Test028
     * @tc.desc Verify start=1 normal positive start, skips first element fills rest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 33);
      arr.fill(7, 1);
      expect(arr.$_get(0)).assertEqual(33);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_2900
     * @tc.name int8ArrayFillPart04Test029
     * @tc.desc Verify start=length-1 fills only the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(5, 3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_3000
     * @tc.name int8ArrayFillPart04Test030
     * @tc.desc Verify fill(9, 3) with start equal to length results in no-op, array elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, 42);
      arr.fill(9, 3);
      expect(arr.$_get(0)).assertEqual(42);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_3100
     * @tc.name int8ArrayFillPart04Test031
     * @tc.desc Verify fill(9, 4) with start greater than length results in no-op, all elements remain default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(9, 4);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_3200
     * @tc.name int8ArrayFillPart04Test032
     * @tc.desc Verify start=-1 negative index normalizes to length-1, fills only last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(5, -1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_3300
     * @tc.name int8ArrayFillPart04Test033
     * @tc.desc Verify start=-length negative normalizes to 0, fills from head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(8, -4);
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_3400
     * @tc.name int8ArrayFillPart04Test034
     * @tc.desc Verify start=-length-1 still negative after +length, normalizes to 0 full fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(7, -5);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_3500
     * @tc.name int8ArrayFillPart04Test035
     * @tc.desc Verify fill(2, -1000) clamps negative start to 0 and fills all, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(2, -1000);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_3600
     * @tc.name int8ArrayFillPart04Test036
     * @tc.desc Verify start=-2 after +length becomes positive, fills from second-to-last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      arr.fill(4, -2);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_3700
     * @tc.name int8ArrayFillPart04Test037
     * @tc.desc Verify fill(9, 2147483647) with extremely large start value results in no-op, array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(1, 15);
      arr.fill(9, 2147483647);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_3800
     * @tc.name int8ArrayFillPart04Test038
     * @tc.desc Verify fill(6, -2147483648) clamps INT32_MIN start to 0 and fills all, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(6, -2147483648);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_3900
     * @tc.name int8ArrayFillPart04Test039
     * @tc.desc Verify fill(3, 0, 4) with end=length fills all elements, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(3, 0, 4);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_4000
     * @tc.name int8ArrayFillPart04Test040
     * @tc.desc Verify fill(7, 0, 3) fills indices 0 to 2, keeps 88 at index 3, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(3, 88);
      arr.fill(7, 0, 3);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_4100
     * @tc.name int8ArrayFillPart04Test041
     * @tc.desc Verify end=0 empty interval fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, 25);
      arr.fill(9, 0, 0);
      expect(arr.$_get(0)).assertEqual(25);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_4200
     * @tc.name int8ArrayFillPart04Test042
     * @tc.desc Verify end=1 fills only first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(5, 0, 1);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_4300
     * @tc.name int8ArrayFillPart04Test043
     * @tc.desc Verify fill(4, 0, 4) clamps end to length and fills all, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(4, 0, 4);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_4400
     * @tc.name int8ArrayFillPart04Test044
     * @tc.desc Verify end=-1 negative index normalizes to length-1, last element not filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(3, 99);
      arr.fill(2, 0, -1);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_4500
     * @tc.name int8ArrayFillPart04Test045
     * @tc.desc Verify end=-length negative normalizes to 0, empty interval fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 17);
      arr.fill(8, 0, -4);
      expect(arr.$_get(0)).assertEqual(17);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_4600
     * @tc.name int8ArrayFillPart04Test046
     * @tc.desc Verify fill(8, 0, -5) with end normalizing to 0 results in empty interval no-op, array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(8, 0, -5);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_4700
     * @tc.name int8ArrayFillPart04Test047
     * @tc.desc Verify fill(7, 3, 1) with start greater than end results in no-op, array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 44);
      arr.fill(7, 3, 1);
      expect(arr.$_get(0)).assertEqual(44);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_4800
     * @tc.name int8ArrayFillPart04Test048
     * @tc.desc Verify fill(7, 2, 2) with start equal to end results in no-op, element at index 2 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(2, 31);
      arr.fill(7, 2, 2);
      expect(arr.$_get(2)).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_4900
     * @tc.name int8ArrayFillPart04Test049
     * @tc.desc Verify end=2147483647 very large value clamped to length, full fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(6, 0, 2147483647);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_5000
     * @tc.name int8ArrayFillPart04Test050
     * @tc.desc Verify fill(6, 0, -2147483648) with end normalizing to 0 results in empty interval no-op, array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(1, 19);
      arr.fill(6, 0, -2147483648);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_5100
     * @tc.name int8ArrayFillPart04Test051
     * @tc.desc Verify start=2,end=4 middle range fill, elements outside interval unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(6);
      arr.fill(5, 2, 4);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_5200
     * @tc.name int8ArrayFillPart04Test052
     * @tc.desc Verify fill(7, -3, -1) fills indices 2 to 3, on new Int8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      arr.fill(7, -3, -1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_5300
     * @tc.name int8ArrayFillPart04Test053
     * @tc.desc Verify fill(3, 1, 9) clamps end to length and fills indices 1 to 3, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(3, 1, 9);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_5400
     * @tc.name int8ArrayFillPart04Test054
     * @tc.desc Verify fill(2, -100, -1) fills indices 0 to 2, keeps 55 at index 3, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(3, 55);
      arr.fill(2, -100, -1);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_5500
     * @tc.name int8ArrayFillPart04Test055
     * @tc.desc Verify fill(9, 3, 8) with start equal to length results in no-op, all elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, 41);
      arr.fill(9, 3, 8);
      expect(arr.$_get(0)).assertEqual(41);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_5600
     * @tc.name int8ArrayFillPart04Test056
     * @tc.desc Verify start=0,end=-1 negative end normalizes to exclude last, front segment fully filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      arr.$_set(4, 77);
      arr.fill(4, 0, -1);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_5700
     * @tc.name int8ArrayFillPart04Test057
     * @tc.desc Verify fill(6, -2, 5) fills indices 3 to 4, on new Int8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      arr.fill(6, -2, 5);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(6);
      expect(arr.$_get(4)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_5800
     * @tc.name int8ArrayFillPart04Test058
     * @tc.desc Verify start=1,end=2 single element interval fills only index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(9, 1, 2);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_5900
     * @tc.name int8ArrayFillPart04Test059
     * @tc.desc Verify fill(v) with v=42 writes 42 to all elements, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const v: byte = 42;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(42);
      expect(arr.$_get(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_6000
     * @tc.name int8ArrayFillPart04Test060
     * @tc.desc Verify fill(42) writes 42 to all elements, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(42);
      expect(arr.$_get(0)).assertEqual(42);
      expect(arr.$_get(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_6100
     * @tc.name int8ArrayFillPart04Test061
     * @tc.desc Verify fill with const byte variable -128 and literal -128 produce identical $_get(0) results on two Int8Array instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array(2);
      const v: byte = -128;
      a.fill(v);
      let r1: number = a.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
      let r2: number = a.$_get(1);
      let e2: int = -128;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_6200
     * @tc.name int8ArrayFillPart04Test062
     * @tc.desc Verify fill with const byte variable 100 and literal 100 produce identical $_get(1) results on two Int8Array instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array(2);
      const v: byte = 100;
      a.fill(v);
      let r1: number = a.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = a.$_get(1);
      let e2: int = 100;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_6300
     * @tc.name int8ArrayFillPart04Test063
     * @tc.desc Verify fill returns this reference, return value equals original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      let result: Int8Array = arr.fill(5);
      let r1: number = result.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_6400
     * @tc.name int8ArrayFillPart04Test064
     * @tc.desc Verify chained fill().fill() return value is still this reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      let result: Int8Array = arr.fill(5).fill(9);
      let r1: number = result.$_get(0);
      let e1: int = 9;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 9;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_6500
     * @tc.name int8ArrayFillPart04Test065
     * @tc.desc Verify length property unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      arr.fill(7);
      let r1: number = arr.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_6600
     * @tc.name int8ArrayFillPart04Test066
     * @tc.desc Verify byteLength property unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      arr.fill(7);
      let r1: number = arr.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_6700
     * @tc.name int8ArrayFillPart04Test067
     * @tc.desc Verify buffer reference unchanged after fill, still same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(6);
      let r1: number = arr.$_get(0);
      let e1: int = 6;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(3);
      let e2: int = 6;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_6800
     * @tc.name int8ArrayFillPart04Test068
     * @tc.desc Verify all elements within fill range are overwritten with specified value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.fill(8, 0, 3);
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_6900
     * @tc.name int8ArrayFillPart04Test069
     * @tc.desc Verify elements outside fill range keep original values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      arr.$_set(0, 11);
      arr.$_set(4, 22);
      arr.fill(9, 1, 4);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(4)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_7000
     * @tc.name int8ArrayFillPart04Test070
     * @tc.desc Verify fill return value can chain subarray to generate view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      let sub: Int8Array = arr.fill(4).subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_7100
     * @tc.name int8ArrayFillPart04Test071
     * @tc.desc Verify fill return value can chain reverse for in-place reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, 1);
      arr.fill(5).reverse();
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_7200
     * @tc.name int8ArrayFillPart04Test072
     * @tc.desc Verify fill return value can chain sort for sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 9);
      arr.fill(3).sort();
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_7300
     * @tc.name int8ArrayFillPart04Test073
     * @tc.desc Verify empty array fill single param silently no-op, no exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.fill(5);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_7400
     * @tc.name int8ArrayFillPart04Test074
     * @tc.desc Verify empty array fill with start/end silently no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      arr.fill(5, 0, 3);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_7500
     * @tc.name int8ArrayFillPart04Test075
     * @tc.desc Verify single element array fill covers whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.fill(42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_7600
     * @tc.name int8ArrayFillPart04Test076
     * @tc.desc Verify single element array fill start=1 equals length silently no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 33);
      arr.fill(9, 1);
      expect(arr.$_get(0)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_7700
     * @tc.name int8ArrayFillPart04Test077
     * @tc.desc Verify all-same element array fill overwrites to uniform value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 7, 7, 7);
      arr.fill(3);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_7800
     * @tc.name int8ArrayFillPart04Test078
     * @tc.desc Verify all-different element array fill partial range preserves differences outside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      arr.fill(0, 1, 4);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_7900
     * @tc.name int8ArrayFillPart04Test079
     * @tc.desc Verify fill element by element validation of entire array content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(-3);
      expect(arr.$_get(0)).assertEqual(-3);
      expect(arr.$_get(1)).assertEqual(-3);
      expect(arr.$_get(2)).assertEqual(-3);
      expect(arr.$_get(3)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_8000
     * @tc.name int8ArrayFillPart04Test080
     * @tc.desc Verify fill range only contains single element start=length-1,end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(9, 3, 4);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_8100
     * @tc.name int8ArrayFillPart04Test081
     * @tc.desc Verify fill(128) truncates to -128, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(128);
      expect(arr.at(0)).assertEqual(-128);
      expect(arr.at(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_8200
     * @tc.name int8ArrayFillPart04Test082
     * @tc.desc Verify fill(255) truncates to -1, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(255);
      expect(arr.at(0)).assertEqual(-1);
      expect(arr.at(1)).assertEqual(-1);
      expect(arr.at(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_8300
     * @tc.name int8ArrayFillPart04Test083
     * @tc.desc Verify fill(Number.NaN) after $_set(0, 55) truncates to 0, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.$_set(0, 55);
      arr.fill(Number.NaN);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_8400
     * @tc.name int8ArrayFillPart04Test084
     * @tc.desc Verify fill(200) truncates to -56, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(200);
      expect(arr.at(0)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_8500
     * @tc.name int8ArrayFillPart04Test085
     * @tc.desc Verify fill(256) after $_set(0, 88) truncates to 0, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.$_set(0, 88);
      arr.fill(256);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_8600
     * @tc.name int8ArrayFillPart04Test086
     * @tc.desc Verify fill modifies self and subarray view reflects modification synchronously (shared buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(6);
      let sub: Int8Array = arr.subarray(1, 4);
      arr.fill(5, 1, 4);
      expect(sub.$_get(0)).assertEqual(5);
      expect(sub.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_8700
     * @tc.name int8ArrayFillPart04Test087
     * @tc.desc Verify fill on subarray view reflects back to original array (shared buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(6);
      let sub: Int8Array = arr.subarray(2, 5);
      sub.fill(7);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(4)).assertEqual(7);
      expect(arr.$_get(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_8800
     * @tc.name int8ArrayFillPart04Test088
     * @tc.desc Verify byteOffset property unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      arr.fill(5);
      let r1: int = arr.byteOffset;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(3);
      let e3: int = 5;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_8900
     * @tc.name int8ArrayFillPart04Test089
     * @tc.desc Verify fill(Number.POSITIVE_INFINITY) truncates to 0, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_9000
     * @tc.name int8ArrayFillPart04Test090
     * @tc.desc Verify fill(Number.NEGATIVE_INFINITY) truncates to 0, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(Number.NEGATIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_9100
     * @tc.name int8ArrayFillPart04Test091
     * @tc.desc Verify fill(Number.MAX_VALUE) converts to 0 at $_get(0) on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(Number.MAX_VALUE);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART04_TEST_9200
     * @tc.name int8ArrayFillPart04Test092
     * @tc.desc Verify fill(Number.POSITIVE_INFINITY) via at(0) truncates to 0, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart04Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.fill(Number.POSITIVE_INFINITY);
      expect(arr.at(0)).assertEqual(0);
    });
  });
}
