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

export default function int8ArrayWithPart03Test(): void {
  describe('Int8ArrayWithPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_0100
     * @tc.name int8ArrayWithPart03Test001
     * @tc.desc Verify with value=-128 (int8 min) writes -128 to target position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = -128;
      let result: Int8Array = arr.with(0, v);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_0200
     * @tc.name int8ArrayWithPart03Test002
     * @tc.desc Verify with value=127 (int8 max) writes 127 to target position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 127;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_0300
     * @tc.name int8ArrayWithPart03Test003
     * @tc.desc Verify with value=0 writes 0 to target position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 0;
      let result: Int8Array = arr.with(2, v);
      let r1: number = result.$_get(2);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_0400
     * @tc.name int8ArrayWithPart03Test004
     * @tc.desc Verify with value=-1 (sentinel) writes -1 to target position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = -1;
      let result: Int8Array = arr.with(0, v);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_0500
     * @tc.name int8ArrayWithPart03Test005
     * @tc.desc Verify with value=1 (min positive int) writes 1 to target position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 1;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_0600
     * @tc.name int8ArrayWithPart03Test006
     * @tc.desc Verify with 128 wraps to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 128;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_0700
     * @tc.name int8ArrayWithPart03Test007
     * @tc.desc Verify with 129 wraps to -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 129;
      let result: Int8Array = arr.with(0, v);
      let r1: number = result.$_get(0);
      let e1: int = -127;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_0800
     * @tc.name int8ArrayWithPart03Test008
     * @tc.desc Verify with 255 wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 255;
      let result: Int8Array = arr.with(2, v);
      let r1: number = result.$_get(2);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_0900
     * @tc.name int8ArrayWithPart03Test009
     * @tc.desc Verify with 256 wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 256;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_1000
     * @tc.name int8ArrayWithPart03Test010
     * @tc.desc Verify with 300 wraps to 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 300;
      let result: Int8Array = arr.with(0, v);
      let r1: number = result.$_get(0);
      let e1: int = 44;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_1100
     * @tc.name int8ArrayWithPart03Test011
     * @tc.desc Verify with 383 wraps to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 383;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_1200
     * @tc.name int8ArrayWithPart03Test012
     * @tc.desc Verify with 384 wraps to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 384;
      let result: Int8Array = arr.with(2, v);
      let r1: number = result.$_get(2);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_1300
     * @tc.name int8ArrayWithPart03Test013
     * @tc.desc Verify with -129 wraps to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = -129;
      let result: Int8Array = arr.with(0, v);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_1400
     * @tc.name int8ArrayWithPart03Test014
     * @tc.desc Verify with -130 wraps to 126
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = -130;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: int = 126;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_1500
     * @tc.name int8ArrayWithPart03Test015
     * @tc.desc Verify with -255 wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = -255;
      let result: Int8Array = arr.with(2, v);
      let r1: number = result.$_get(2);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_1600
     * @tc.name int8ArrayWithPart03Test016
     * @tc.desc Verify with -256 wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = -256;
      let result: Int8Array = arr.with(0, v);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_1700
     * @tc.name int8ArrayWithPart03Test017
     * @tc.desc Verify with -257 wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = -257;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_1800
     * @tc.name int8ArrayWithPart03Test018
     * @tc.desc Verify with -300 wraps to -44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = -300;
      let result: Int8Array = arr.with(2, v);
      let r1: number = result.$_get(2);
      let e1: int = -44;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_1900
     * @tc.name int8ArrayWithPart03Test019
     * @tc.desc Verify with NaN value truncates to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = Number.NaN;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_2000
     * @tc.name int8ArrayWithPart03Test020
     * @tc.desc Verify with negative infinity truncates to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = Number.NEGATIVE_INFINITY;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_2100
     * @tc.name int8ArrayWithPart03Test021
     * @tc.desc Verify with Number.MIN_VALUE truncates to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = Number.MIN_VALUE;
      let result: Int8Array = arr.with(0, v);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_2200
     * @tc.name int8ArrayWithPart03Test022
     * @tc.desc Verify with 1.9 truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 1.9;
      let result: Int8Array = arr.with(0, v);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_2300
     * @tc.name int8ArrayWithPart03Test023
     * @tc.desc Verify with -1.9 truncates to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = -1.9;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_2400
     * @tc.name int8ArrayWithPart03Test024
     * @tc.desc Verify with 127.9 truncates to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 127.9;
      let result: Int8Array = arr.with(2, v);
      let r1: number = result.$_get(2);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_2500
     * @tc.name int8ArrayWithPart03Test025
     * @tc.desc Verify with -128.9 truncates to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = -128.9;
      let result: Int8Array = arr.with(0, v);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_2600
     * @tc.name int8ArrayWithPart03Test026
     * @tc.desc Verify with 0.5 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 0.5;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_2700
     * @tc.name int8ArrayWithPart03Test027
     * @tc.desc Verify with -0.5 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = -0.5;
      let result: Int8Array = arr.with(2, v);
      let r1: number = result.$_get(2);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_2800
     * @tc.name int8ArrayWithPart03Test028
     * @tc.desc Verify with 128.5 wraps to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 128.5;
      let result: Int8Array = arr.with(0, v);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_2900
     * @tc.name int8ArrayWithPart03Test029
     * @tc.desc Verify with negative zero stores zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = -0.0;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_3000
     * @tc.name int8ArrayWithPart03Test030
     * @tc.desc Verify value=127.999 (near upper bound float) truncates to 127 without overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 127.999;
      let result: Int8Array = arr.with(2, v);
      let r1: number = result.$_get(2);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_3100
     * @tc.name int8ArrayWithPart03Test031
     * @tc.desc Verify with(-1) replaces last element with 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 99;
      let result: Int8Array = arr.with(-1, v);
      let r1: number = result.$_get(arr.length - 1);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_3200
     * @tc.name int8ArrayWithPart03Test032
     * @tc.desc Verify with index=middle replaces middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let v: number = 99;
      let result: Int8Array = arr.with(2, v);
      let r1: number = result.$_get(2);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_3300
     * @tc.name int8ArrayWithPart03Test033
     * @tc.desc Verify with(-3) replaces corresponding element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let v: number = 66;
      let result: Int8Array = arr.with(-3, v);
      let r1: number = result.$_get(2);
      let e1: int = 66;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_3400
     * @tc.name int8ArrayWithPart03Test034
     * @tc.desc Verify with return value is Int8Array type via length and value access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 50;
      let result: Int8Array = arr.with(1, v);
      let r1: int = result.length;
      let e1: int = arr.length;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_3600
     * @tc.name int8ArrayWithPart03Test036
     * @tc.desc Verify with returns new array reference not equal to original (copy semantic)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 50;
      let result: Int8Array = arr.with(1, v);
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_3700
     * @tc.name int8ArrayWithPart03Test037
     * @tc.desc Verify original array value unchanged after with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 99;
      arr.with(1, v);
      let r1: number = arr.$_get(1);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_3800
     * @tc.name int8ArrayWithPart03Test038
     * @tc.desc Verify with two hundred wraps target negative fifty six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 200;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: int = -56;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_3900
     * @tc.name int8ArrayWithPart03Test039
     * @tc.desc Verify with ninety nine keeps other positions original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let v: number = 99;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(3);
      let e3: int = 40;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_4000
     * @tc.name int8ArrayWithPart03Test040
     * @tc.desc Verify with returns new array byteLength equals original byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let v: number = 50;
      let result: Int8Array = arr.with(2, v);
      let r1: int = result.byteLength;
      let e1: int = arr.byteLength;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_4100
     * @tc.name int8ArrayWithPart03Test041
     * @tc.desc Verify with modifying new array does not affect original (copy independence - write new read old)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 50;
      let result: Int8Array = arr.with(1, v);
      result.$_set(0, 100);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_4200
     * @tc.name int8ArrayWithPart03Test042
     * @tc.desc Verify chained with calls return new array each time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let firstValue: number = 10;
      let secondValue: number = 20;
      let result: Int8Array = arr.with(0, firstValue).with(2, secondValue);
      let r1: number = result.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_4300
     * @tc.name int8ArrayWithPart03Test043
     * @tc.desc Verify original array can be with-ed again after first with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let firstValue: number = 50;
      let secondValue: number = 60;
      let r1: Int8Array = arr.with(0, firstValue);
      let r2: Int8Array = arr.with(1, secondValue);
      let r1Val: number = r1.$_get(0);
      let e1: int = 50;
      expect(r1Val).assertEqual(e1);
      let r2Val: number = r2.$_get(1);
      let e2: int = 60;
      expect(r2Val).assertEqual(e2);
      let r3: number = arr.$_get(0);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_4400
     * @tc.name int8ArrayWithPart03Test044
     * @tc.desc Verify chained cumulative with based on previous return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let firstValue: number = 11;
      let secondValue: number = 22;
      let thirdValue: number = 33;
      let result: Int8Array = arr.with(0, firstValue).with(1, secondValue).with(2, thirdValue);
      let r1: number = result.$_get(0);
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 22;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 33;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_4500
     * @tc.name int8ArrayWithPart03Test045
     * @tc.desc Verify with returns new array with byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 50;
      let result: Int8Array = arr.with(1, v);
      let r1: int = result.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_4600
     * @tc.name int8ArrayWithPart03Test046
     * @tc.desc Verify single element array with(0, v) returns new array with length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      let v: number = 50;
      let result: Int8Array = arr.with(0, v);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_4700
     * @tc.name int8ArrayWithPart03Test047
     * @tc.desc Verify index=0 value=-128 first element with int8 min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = -128;
      let result: Int8Array = arr.with(0, v);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_4800
     * @tc.name int8ArrayWithPart03Test048
     * @tc.desc Verify with(-1, 127) last element with int8 max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 127;
      let result: Int8Array = arr.with(-1, v);
      let r1: number = result.$_get(arr.length - 1);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(arr.length - 1);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_4900
     * @tc.name int8ArrayWithPart03Test049
     * @tc.desc Verify index=middle value=Number.NaN middle position with special value truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let v: number = Number.NaN;
      let result: Int8Array = arr.with(2, v);
      let r1: number = result.$_get(2);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_5000
     * @tc.name int8ArrayWithPart03Test050
     * @tc.desc Verify index=-1 value=128 negative index with positive overflow wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 128;
      let result: Int8Array = arr.with(-1, v);
      let r1: number = result.$_get(2);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_5100
     * @tc.name int8ArrayWithPart03Test051
     * @tc.desc Verify index=middle value=1.9 middle position with float truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let v: number = 1.9;
      let result: Int8Array = arr.with(2, v);
      let r1: number = result.$_get(2);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_5200
     * @tc.name int8ArrayWithPart03Test052
     * @tc.desc Verify index=1 value=300 normal position with large number wraps to 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let v: number = 300;
      let result: Int8Array = arr.with(1, v);
      let r1: number = result.$_get(1);
      let e1: int = 44;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_5700
     * @tc.name int8ArrayWithPart03Test057
     * @tc.desc Verify empty array with(-1, v) throws RangeError (-1 < -0 out of bounds)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let v: number = 50;
      try {
        arr.with(arr.length - 1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_5800
     * @tc.name int8ArrayWithPart03Test058
     * @tc.desc Verify single element array with(1, v) throws RangeError (1 >= length=1 out of bounds)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      let v: number = 50;
      try {
        arr.with(1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_5900
     * @tc.name int8ArrayWithPart03Test059
     * @tc.desc Verify with index twice length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 50;
      try {
        arr.with(2 * arr.length, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_6000
     * @tc.name int8ArrayWithPart03Test060
     * @tc.desc Verify with index negative twice length minus one throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 50;
      try {
        arr.with(-2 * arr.length - 1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART03_6100
     * @tc.name int8ArrayWithPart03Test061
     * @tc.desc Verify out-of-bounds with throws RangeError and original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = 50;
      try {
        arr.with(arr.length, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r2: number = arr.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(1);
      let e3: int = 20;
      expect(r3).assertEqual(e3);
      let r4: number = arr.$_get(2);
      let e4: int = 30;
      expect(r4).assertEqual(e4);
    });
  });
}
