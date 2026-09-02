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

export default function int8ArrayFillPart02Test(): void {
  describe('Int8ArrayFillPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {
      Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_0100
     * @tc.name int8ArrayFillPart02Test001
     * @tc.desc Verify fill(9) fills all elements and returns the same array, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(9);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_0200
     * @tc.name int8ArrayFillPart02Test002
     * @tc.desc Verify fill(9, 1) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 1);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_0300
     * @tc.name int8ArrayFillPart02Test003
     * @tc.desc Verify fill(value, start, end) [start, end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 1, 3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(9);
      expect(r.$_get(2)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_0400
     * @tc.name int8ArrayFillPart02Test004
     * @tc.desc Verify fill(value, undefined, undefined) undefined [0, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(7, undefined, undefined);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_0500
     * @tc.name int8ArrayFillPart02Test005
     * @tc.desc Verify fill(value, 0, undefined) start=0 end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(7, 0, undefined);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_0600
     * @tc.name int8ArrayFillPart02Test006
     * @tc.desc Verify fill(value, undefined, length) start 0 end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(7, undefined, 4);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_0700
     * @tc.name int8ArrayFillPart02Test007
     * @tc.desc Verify fill(Number.NaN) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(Number.NaN);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_0800
     * @tc.name int8ArrayFillPart02Test008
     * @tc.desc Verify fill(127.5) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(127.5);
      expect(r.$_get(0)).assertEqual(INT8_MAX);
      expect(r.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_0900
     * @tc.name int8ArrayFillPart02Test009
     * @tc.desc Verify fill(-128.5) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(-128.5);
      let r1: number = r.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = r.$_get(3);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_1000
     * @tc.name int8ArrayFillPart02Test010
     * @tc.desc Verify fill(1e-100) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(1e-100);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_1100
     * @tc.name int8ArrayFillPart02Test011
     * @tc.desc Verify fill(1.9) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(1.9);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_1200
     * @tc.name int8ArrayFillPart02Test012
     * @tc.desc Verify fill(-1.9) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(-1.9);
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_1300
     * @tc.name int8ArrayFillPart02Test013
     * @tc.desc Verify fill(0.5) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(0.5);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_1400
     * @tc.name int8ArrayFillPart02Test014
     * @tc.desc Verify fill(-0.5) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(-0.5);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_1500
     * @tc.name int8ArrayFillPart02Test015
     * @tc.desc Verify fill(-0.0) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(-0.0);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_1600
     * @tc.name int8ArrayFillPart02Test016
     * @tc.desc Verify fill(0) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(0);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_1700
     * @tc.name int8ArrayFillPart02Test017
     * @tc.desc Verify fill(128) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(128);
      expect(r.$_get(0)).assertEqual(-128);
      expect(r.$_get(3)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_1800
     * @tc.name int8ArrayFillPart02Test018
     * @tc.desc Verify fill(-129) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(-129);
      expect(r.$_get(0)).assertEqual(INT8_MAX);
      expect(r.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_1900
     * @tc.name int8ArrayFillPart02Test019
     * @tc.desc Verify fill(255) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(255);
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_2000
     * @tc.name int8ArrayFillPart02Test020
     * @tc.desc Verify fill(256) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(256);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_2100
     * @tc.name int8ArrayFillPart02Test021
     * @tc.desc Verify fill(200) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(200);
      expect(r.$_get(0)).assertEqual(-56);
      expect(r.$_get(3)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_2200
     * @tc.name int8ArrayFillPart02Test022
     * @tc.desc Verify fill(129) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(129);
      expect(r.$_get(0)).assertEqual(-INT8_MAX);
      expect(r.$_get(3)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_2300
     * @tc.name int8ArrayFillPart02Test023
     * @tc.desc Verify fill(INT8_MAX) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(INT8_MAX);
      expect(r.$_get(0)).assertEqual(INT8_MAX);
      expect(r.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_2400
     * @tc.name int8ArrayFillPart02Test024
     * @tc.desc Verify fill(-128) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(INT8_MIN);
      let r1: number = r.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = r.$_get(3);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_2500
     * @tc.name int8ArrayFillPart02Test025
     * @tc.desc Verify fill(50) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(50);
      expect(r.$_get(0)).assertEqual(50);
      expect(r.$_get(3)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_2600
     * @tc.name int8ArrayFillPart02Test026
     * @tc.desc Verify fill(9007199254740991) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9007199254740991);
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_2700
     * @tc.name int8ArrayFillPart02Test027
     * @tc.desc Verify fill(-9007199254740991) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(-9007199254740991);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_2800
     * @tc.name int8ArrayFillPart02Test028
     * @tc.desc Verify fill(9, 0) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 0);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_2900
     * @tc.name int8ArrayFillPart02Test029
     * @tc.desc Verify fill(9, 3) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 3);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_3000
     * @tc.name int8ArrayFillPart02Test030
     * @tc.desc Verify fill(9, 4) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 4);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_3100
     * @tc.name int8ArrayFillPart02Test031
     * @tc.desc Verify fill(9, -1) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, -1);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_3200
     * @tc.name int8ArrayFillPart02Test032
     * @tc.desc Verify fill(9, -4) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, -4);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_3300
     * @tc.name int8ArrayFillPart02Test033
     * @tc.desc Verify fill(9, -5) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, -5);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_3400
     * @tc.name int8ArrayFillPart02Test034
     * @tc.desc Verify fill(9, 2147483647) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 2147483647);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_3500
     * @tc.name int8ArrayFillPart02Test035
     * @tc.desc Verify fill(9, -2147483647) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, -2147483647);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_3600
     * @tc.name int8ArrayFillPart02Test036
     * @tc.desc Verify fill(9, undefined) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, undefined);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_3700
     * @tc.name int8ArrayFillPart02Test037
     * @tc.desc Verify fill(9, 0, 4) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 0, 4);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_3800
     * @tc.name int8ArrayFillPart02Test038
     * @tc.desc Verify fill(9, 0, 0) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 0, 0);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_3900
     * @tc.name int8ArrayFillPart02Test039
     * @tc.desc Verify fill(9, 0, 1) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 0, 1);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_4000
     * @tc.name int8ArrayFillPart02Test040
     * @tc.desc Verify fill(9, 0, 3) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 0, 3);
      expect(r.$_get(2)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_4100
     * @tc.name int8ArrayFillPart02Test041
     * @tc.desc Verify fill(9, 0, -1) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 0, -1);
      expect(r.$_get(2)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_4200
     * @tc.name int8ArrayFillPart02Test042
     * @tc.desc Verify fill(9, 0, -4) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 0, -4);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_4300
     * @tc.name int8ArrayFillPart02Test043
     * @tc.desc Verify fill(9, 0, -5) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 0, -5);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_4400
     * @tc.name int8ArrayFillPart02Test044
     * @tc.desc Verify fill(9, 0, 5) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 0, 5);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_4500
     * @tc.name int8ArrayFillPart02Test045
     * @tc.desc Verify fill(9, 0, 2147483647) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 0, 2147483647);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_4600
     * @tc.name int8ArrayFillPart02Test046
     * @tc.desc Verify fill(9, 3, 1) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 3, 1);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_4700
     * @tc.name int8ArrayFillPart02Test047
     * @tc.desc Verify fill(9, 1, undefined) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 1, undefined);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_4800
     * @tc.name int8ArrayFillPart02Test048
     * @tc.desc Verify fill(9) writes within view range and keeps outside bytes 0, on new Int8Array(new ArrayBuffer(8), 2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(new ArrayBuffer(8), 2, 4);
      const r = arr.fill(9);
      let r1: int = r.byteOffset;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = r.$_get(0);
      let e2: int = 9;
      expect(r2).assertEqual(e2);
      let r3: number = r.$_get(3);
      let e3: int = 9;
      expect(r3).assertEqual(e3);
      const full = new Int8Array(arr.buffer);
      let r4: number = full.$_get(0);
      let e4: int = 0;
      expect(r4).assertEqual(e4);
      let r5: number = full.$_get(6);
      let e5: int = 0;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_4900
     * @tc.name int8ArrayFillPart02Test049
     * @tc.desc Verify chained fill(1).fill(2) leaves 2 in all elements, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      arr.fill(1).fill(2);
      let r1: number = arr.$_get(0);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(3);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_5000
     * @tc.name int8ArrayFillPart02Test050
     * @tc.desc Verify fill(9) on subarray(1, 3) returns the subarray itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      const r = sub.fill(9);
      expect(r).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_5100
     * @tc.name int8ArrayFillPart02Test051
     * @tc.desc Verify fill(9) on empty new Int8Array(0) returns the same empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(0);
      const r = arr.fill(9);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_5200
     * @tc.name int8ArrayFillPart02Test052
     * @tc.desc Verify fill(9) overwrites single element 7 with 9 on new Int8Array([7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([7]);
      const r = arr.fill(9);
      let r1: number = r.$_get(0);
      let e1: int = 9;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_5300
     * @tc.name int8ArrayFillPart02Test053
     * @tc.desc Verify fill(9, 2, 2) with start===end has no effect (empty range)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 2, 2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_5400
     * @tc.name int8ArrayFillPart02Test054
     * @tc.desc Verify fill(9, -2147483647, 2147483647) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, -2147483647, 2147483647);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_5500
     * @tc.name int8ArrayFillPart02Test055
     * @tc.desc Verify fill(9, 2147483647, 2147483647) with start and end exceeding length, clamped to empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 2147483647, 2147483647);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_5600
     * @tc.name int8ArrayFillPart02Test056
     * @tc.desc Verify fill(9, -2147483647, -2147483647) with negative start and end, both clamped to 0, empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, -2147483647, -2147483647);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_5700
     * @tc.name int8ArrayFillPart02Test057
     * @tc.desc Verify fill(Number.NaN, 1, 3) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(Number.NaN, 1, 3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_5800
     * @tc.name int8ArrayFillPart02Test058
     * @tc.desc Verify fill(200, 2) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(200, 2);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(-56);
      expect(r.$_get(3)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_5900
     * @tc.name int8ArrayFillPart02Test059
     * @tc.desc Verify fill(1.9, 0, 2) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(1.9, 0, 2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_6000
     * @tc.name int8ArrayFillPart02Test060
     * @tc.desc Verify fill(-1.9, 1, -1) end -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(-1.9, 1, -1);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(-1);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_6100
     * @tc.name int8ArrayFillPart02Test061
     * @tc.desc Verify fill(9) on subarray(1, 3) propagates 9 to original array at indices 1, 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      sub.fill(9);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(9);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_6200
     * @tc.name int8ArrayFillPart02Test062
     * @tc.desc Verify fill(9) on slice(1, 3) copy does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const copy = arr.slice(1, 3);
      copy.fill(9);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_6300
     * @tc.name int8ArrayFillPart02Test063
     * @tc.desc Verify fill(9) on subarray(0, 2) propagates 9 to original array at indices 0, 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const sub = arr.subarray(0, 2);
      sub.fill(9);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_6400
     * @tc.name int8ArrayFillPart02Test064
     * @tc.desc Verify fill(9, 0, 2) then reverse() -- filled elements stay at tail after reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      arr.fill(9, 0, 2);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_6500
     * @tc.name int8ArrayFillPart02Test065
     * @tc.desc Verify fill(3) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      arr.$_set(0, 7);
      arr.$_set(1, 7);
      arr.fill(3);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_6600
     * @tc.name int8ArrayFillPart02Test066
     * @tc.desc Verify view.fill(9) on Int8Array(buf, 2, 3) writes 9 in view keeping outside bytes 0 on ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const view = new Int8Array(buf, 2, 3);
      view.fill(9);
      expect(view.$_get(0)).assertEqual(9);
      expect(view.$_get(2)).assertEqual(9);
      const full = new Int8Array(buf);
      expect(full.$_get(0)).assertEqual(0);
      expect(full.$_get(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_6700
     * @tc.name int8ArrayFillPart02Test067
     * @tc.desc Verify fill(9, 1, -1) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, 1, -1);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(9);
      expect(r.$_get(2)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_6800
     * @tc.name int8ArrayFillPart02Test068
     * @tc.desc Verify fill(9, -3, 2) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(9, -3, 2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(9);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_6900
     * @tc.name int8ArrayFillPart02Test069
     * @tc.desc Verify fill(Number.POSITIVE_INFINITY) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(Number.POSITIVE_INFINITY);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_7000
     * @tc.name int8ArrayFillPart02Test070
     * @tc.desc Verify fill(Number.NEGATIVE_INFINITY) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(Number.NEGATIVE_INFINITY);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART02_TEST_7100
     * @tc.name int8ArrayFillPart02Test071
     * @tc.desc Verify fill(Number.POSITIVE_INFINITY, 0, 1) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      const r = arr.fill(Number.POSITIVE_INFINITY, 0, 1);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(2);
    });
  });
}
