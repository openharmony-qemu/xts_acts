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

export default function Float32ArrayFill2Test(): void {
  describe('Float32ArrayFill2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0010
     * @tc.name testFloat32ArrayFillTWO001
     * @tc.desc Verify fill(value) single parameter arity 1, default start=0 end=length full fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(7);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0020
     * @tc.name testFloat32ArrayFillTWO002
     * @tc.desc Verify fill(value, start) two parameters arity 2, default end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(7, 2);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0030
     * @tc.name testFloat32ArrayFillTWO003
     * @tc.desc Verify fill(value, start, end) three parameters arity 3 explicit range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      arr.fill(7, 1, 3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0040
     * @tc.name testFloat32ArrayFillTWO004
     * @tc.desc Verify fill(value, 0, 0) empty range does not write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(9, 0, 0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0050
     * @tc.name testFloat32ArrayFillTWO005
     * @tc.desc Verify fill(value, 0, length) explicit full fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(4, 0, 3);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0060
     * @tc.name testFloat32ArrayFillTWO006
     * @tc.desc Verify fill(value, 0) start is 0 default end full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(8, 0);
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0070
     * @tc.name testFloat32ArrayFillTWO007
     * @tc.desc Verify value is 0 fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.fill(0, 0, 3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0080
     * @tc.name testFloat32ArrayFillTWO008
     * @tc.desc Verify value is -0 negative zero sign preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(-0, 0, 2);
      expect(1 / arr.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0090
     * @tc.name testFloat32ArrayFillTWO009
     * @tc.desc Verify value is 1 fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0100
     * @tc.name testFloat32ArrayFillTWO010
     * @tc.desc Verify value is -1 fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(-1);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0110
     * @tc.name testFloat32ArrayFillTWO011
     * @tc.desc Verify value is Float32 maximum finite value 3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(3.4028234663852886e+38);
      expect(arr.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0120
     * @tc.name testFloat32ArrayFillTWO012
     * @tc.desc Verify value is minimum finite negative value -3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(-3.4028234663852886e+38);
      expect(arr.$_get(0)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0130
     * @tc.name testFloat32ArrayFillTWO013
     * @tc.desc Verify value is minimum positive normalized number 1.1754943508222875e-38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(1.1754943508222875e-38);
      expect(arr.$_get(0)).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0140
     * @tc.name testFloat32ArrayFillTWO014
     * @tc.desc Verify value is minimum positive subnormal number 1.401298464324817e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(1.401298464324817e-45);
      expect(arr.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0150
     * @tc.name testFloat32ArrayFillTWO015
     * @tc.desc Verify value is NaN fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(NaN);
      expect(arr.$_get(0)).assertNaN();
      expect(arr.$_get(1)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0160
     * @tc.name testFloat32ArrayFillTWO016
     * @tc.desc Verify value is Infinity fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(Infinity);
      expect(arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0170
     * @tc.name testFloat32ArrayFillTWO017
     * @tc.desc Verify value is -Infinity fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(-Infinity);
      expect(arr.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0180
     * @tc.name testFloat32ArrayFillTWO018
     * @tc.desc Verify value is 0.1 float32 precision truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(0.1);
      expect(arr.$_get(0)).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0190
     * @tc.name testFloat32ArrayFillTWO019
     * @tc.desc Verify value is 0.2 float32 precision truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(0.2);
      expect(arr.$_get(0)).assertEqual(0.20000000298023224);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0200
     * @tc.name testFloat32ArrayFillTWO020
     * @tc.desc Verify value is 0.3 float32 precision truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(0.3);
      expect(arr.$_get(0)).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0210
     * @tc.name testFloat32ArrayFillTWO021
     * @tc.desc Verify value is 1.1 float32 precision truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(1.1);
      expect(arr.$_get(0)).assertEqual(1.100000023841858);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0220
     * @tc.name testFloat32ArrayFillTWO022
     * @tc.desc Verify value is 1.0000001 precision truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(1.0000001);
      expect(arr.$_get(0)).assertEqual(1.0000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0230
     * @tc.name testFloat32ArrayFillTWO023
     * @tc.desc Verify value is 16777216 i.e. 2^24 exact integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(16777216);
      expect(arr.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0240
     * @tc.name testFloat32ArrayFillTWO024
     * @tc.desc Verify value is 1.0e40 exceeding float32 range overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(1.0e40);
      expect(arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0250
     * @tc.name testFloat32ArrayFillTWO025
     * @tc.desc Verify value is -1.0e40 overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(-1.0e40);
      expect(arr.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0260
     * @tc.name testFloat32ArrayFillTWO026
     * @tc.desc Verify value is 1.0e-46 underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(1.0e-46);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0270
     * @tc.name testFloat32ArrayFillTWO027
     * @tc.desc Verify value is int minimum value -2147483648 stored exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(-2147483648);
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0280
     * @tc.name testFloat32ArrayFillTWO028
     * @tc.desc Verify value is scientific notation 1.0e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(1.0e3);
      expect(arr.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0290
     * @tc.name testFloat32ArrayFillTWO029
     * @tc.desc Verify value is hexadecimal float 9.0 equals 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(9.0);
      expect(arr.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0300
     * @tc.name testFloat32ArrayFillTWO030
     * @tc.desc Verify value is hexadecimal integer 0x10 equals 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(0x10);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0310
     * @tc.name testFloat32ArrayFillTWO031
     * @tc.desc Verify value is octal 0o17 equals 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(0o17);
      expect(arr.$_get(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0320
     * @tc.name testFloat32ArrayFillTWO032
     * @tc.desc Verify value is binary 0b101 equals 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(0b101);
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0330
     * @tc.name testFloat32ArrayFillTWO033
     * @tc.desc Verify value is typical float 123.456 precision truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(123.456);
      expect(arr.$_get(0)).assertEqual(123.45600128173828);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0340
     * @tc.name testFloat32ArrayFillTWO034
     * @tc.desc Verify value is -999.999 precision truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(-999.999);
      expect(arr.$_get(0)).assertEqual(-999.9990234375);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0350
     * @tc.name testFloat32ArrayFillTWO035
     * @tc.desc Verify value is Number.MAX_SAFE_INTEGER truncated to 2^53
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(Number.MAX_SAFE_INTEGER);
      expect(arr.$_get(0)).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0360
     * @tc.name testFloat32ArrayFillTWO036
     * @tc.desc Verify value is Number.MAX_SAFE_INTEGER + 1 i.e. 2^53 exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(Number.MAX_SAFE_INTEGER + 1);
      expect(arr.$_get(0)).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0370
     * @tc.name testFloat32ArrayFillTWO037
     * @tc.desc Verify value is Number.EPSILON underflows to 0 under float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(Number.EPSILON);
      expect(Math.abs(arr.$_get(0) - Number.EPSILON) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0380
     * @tc.name testFloat32ArrayFillTWO038
     * @tc.desc Verify value is tiny value 2.5e-1000 underflows to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(2.5e-1000);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0390
     * @tc.name testFloat32ArrayFillTWO039
     * @tc.desc Verify value is double upper limit 1e308 overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(1e308);
      expect(arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0400
     * @tc.name testFloat32ArrayFillTWO040
     * @tc.desc Verify value is 3.5e38 slightly exceeding float32 MAX overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(3.5e38);
      expect(arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0410
     * @tc.name testFloat32ArrayFillTWO041
     * @tc.desc Verify value is 0.5 exact in float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(0.5);
      expect(arr.$_get(0)).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0420
     * @tc.name testFloat32ArrayFillTWO042
     * @tc.desc Verify value is 2^-24 i.e. 5.960464477539063e-8 exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(5.960464477539063e-8);
      expect(arr.$_get(0)).assertEqual(5.960464477539063e-8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0430
     * @tc.name testFloat32ArrayFillTWO043
     * @tc.desc Verify value is -0.0 literal negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(-0.0);
      expect(1 / arr.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0440
     * @tc.name testFloat32ArrayFillTWO044
     * @tc.desc Verify start is 1 skip first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(6, 1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0450
     * @tc.name testFloat32ArrayFillTWO045
     * @tc.desc Verify start is length-1 only last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(6, 3);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0460
     * @tc.name testFloat32ArrayFillTWO046
     * @tc.desc Verify start is length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(6, 3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0470
     * @tc.name testFloat32ArrayFillTWO047
     * @tc.desc Verify start is -1 normalizes to length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(6, -1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0480
     * @tc.name testFloat32ArrayFillTWO048
     * @tc.desc Verify start is -length normalizes to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(6, -4);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0490
     * @tc.name testFloat32ArrayFillTWO049
     * @tc.desc Verify start is -length-1 clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(6, -5);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0500
     * @tc.name testFloat32ArrayFillTWO050
     * @tc.desc Verify start is -100 large negative number clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(6, -100);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0510
     * @tc.name testFloat32ArrayFillTWO051
     * @tc.desc Verify start is 2147483647 super large positive number no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(6, 2147483647);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0520
     * @tc.name testFloat32ArrayFillTWO052
     * @tc.desc Verify start is -2147483648 super large negative number clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(6, -2147483648);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0530
     * @tc.name testFloat32ArrayFillTWO053
     * @tc.desc Verify start is 2 default end full to tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      arr.fill(3, 2);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0540
     * @tc.name testFloat32ArrayFillTWO054
     * @tc.desc Verify end is 1 only first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(6, 0, 1);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0550
     * @tc.name testFloat32ArrayFillTWO055
     * @tc.desc Verify end is length-1 excluding last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(6, 0, 3);
      expect(arr.$_get(2)).assertEqual(6);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0560
     * @tc.name testFloat32ArrayFillTWO056
     * @tc.desc Verify end is length including last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(6, 0, 4);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0570
     * @tc.name testFloat32ArrayFillTWO057
     * @tc.desc Verify end is length+1 clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(6, 0, 5);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0580
     * @tc.name testFloat32ArrayFillTWO058
     * @tc.desc Verify end is -1 normalizes to length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(6, 0, -1);
      expect(arr.$_get(2)).assertEqual(6);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0590
     * @tc.name testFloat32ArrayFillTWO059
     * @tc.desc Verify end is -length normalizes to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(6, 0, -4);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0600
     * @tc.name testFloat32ArrayFillTWO060
     * @tc.desc Verify end is -length-1 clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(6, 0, -5);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0610
     * @tc.name testFloat32ArrayFillTWO061
     * @tc.desc Verify end is -100 large negative number clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(6, 0, -100);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0620
     * @tc.name testFloat32ArrayFillTWO062
     * @tc.desc Verify end is 2147483647 super large positive number clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(6, 0, 2147483647);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0630
     * @tc.name testFloat32ArrayFillTWO063
     * @tc.desc Verify end is -2147483648 super large negative number clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(6, 0, -2147483648);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0640
     * @tc.name testFloat32ArrayFillTWO064
     * @tc.desc Verify end is 2 partial fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      arr.fill(3, 0, 2);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0650
     * @tc.name testFloat32ArrayFillTWO065
     * @tc.desc Verify start less than end normal range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(6);
      arr.fill(2, 1, 4);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0660
     * @tc.name testFloat32ArrayFillTWO066
     * @tc.desc Verify start equals end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(2, 2, 2);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0670
     * @tc.name testFloat32ArrayFillTWO067
     * @tc.desc Verify start greater than end silently no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(2, 3, 1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0680
     * @tc.name testFloat32ArrayFillTWO068
     * @tc.desc Verify start is -2 end is -1 tail partial range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      arr.fill(2, -2, -1);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0690
     * @tc.name testFloat32ArrayFillTWO069
     * @tc.desc Verify start is 1 end is -1 middle range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      arr.fill(2, 1, -1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0700
     * @tc.name testFloat32ArrayFillTWO070
     * @tc.desc Verify start is -1 end is length only last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(2, -1, 4);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0710
     * @tc.name testFloat32ArrayFillTWO071
     * @tc.desc Verify start is 0 end is -length normalizes to 0 empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(2, 0, -4);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0720
     * @tc.name testFloat32ArrayFillTWO072
     * @tc.desc Verify start and end both negative normalizes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(6);
      arr.fill(2, -3, -2);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0730
     * @tc.name testFloat32ArrayFillTWO073
     * @tc.desc Verify start is -10 end is -1 start clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(2, -10, -1);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0740
     * @tc.name testFloat32ArrayFillTWO074
     * @tc.desc Verify start is 1 end is 100 end clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(2, 1, 100);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0750
     * @tc.name testFloat32ArrayFillTWO075
     * @tc.desc Verify start is -1 end is -1 normalized same empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(2, -1, -1);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0760
     * @tc.name testFloat32ArrayFillTWO076
     * @tc.desc Verify fill returns this same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const ret = arr.fill(5);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0770
     * @tc.name testFloat32ArrayFillTWO077
     * @tc.desc Verify fill chained call returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(1).fill(2, 1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0780
     * @tc.name testFloat32ArrayFillTWO078
     * @tc.desc Verify after fill length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      arr.fill(9);
      expect(arr.length).assertEqual(5);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(4)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0790
     * @tc.name testFloat32ArrayFillTWO079
     * @tc.desc Verify after fill byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.fill(9);
      expect(arr.byteLength).assertEqual(16);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0800
     * @tc.name testFloat32ArrayFillTWO080
     * @tc.desc Verify after fill buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const buf = arr.buffer;
      arr.fill(9);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0810
     * @tc.name testFloat32ArrayFillTWO081
     * @tc.desc Verify fill elements outside range remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.fill(0, 1, 3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0820
     * @tc.name testFloat32ArrayFillTWO082
     * @tc.desc Verify fill elements within range correctly overwritten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.fill(7, 0, 2);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0830
     * @tc.name testFloat32ArrayFillTWO083
     * @tc.desc Verify fill return value is Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const ret = arr.fill(1);
      expect(ret instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0840
     * @tc.name testFloat32ArrayFillTWO084
     * @tc.desc Verify fill three times chained different ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(6);
      arr.fill(1, 0, 2).fill(2, 2, 4).fill(3, 4, 6);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0850
     * @tc.name testFloat32ArrayFillTWO085
     * @tc.desc Verify after fill read via at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(8, 1, 3);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(-1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0860
     * @tc.name testFloat32ArrayFillTWO086
     * @tc.desc Verify fill two parameters returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const ret = arr.fill(5, 1);
      expect(ret).assertEqual(arr);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0870
     * @tc.name testFloat32ArrayFillTWO087
     * @tc.desc Verify value 16777217 range fill truncated to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(16777217, 0, 2);
      expect(arr.$_get(0)).assertEqual(16777216);
      expect(arr.$_get(1)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0880
     * @tc.name testFloat32ArrayFillTWO088
     * @tc.desc Verify value 0.1 range fill float32 truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(0.1, 0, 3);
      expect(arr.$_get(0)).assertEqual(0.10000000149011612);
      expect(arr.$_get(2)).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0890
     * @tc.name testFloat32ArrayFillTWO089
     * @tc.desc Verify value 1e40 range fill overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(1e40, 0, 2);
      expect(arr.$_get(0)).assertEqual(Infinity);
      expect(arr.$_get(1)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0900
     * @tc.name testFloat32ArrayFillTWO090
     * @tc.desc Verify value 1e-46 full fill underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(1e-46);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0910
     * @tc.name testFloat32ArrayFillTWO091
     * @tc.desc Verify value Number.MAX_SAFE_INTEGER full fill truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(Number.MAX_SAFE_INTEGER);
      expect(arr.$_get(0)).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0920
     * @tc.name testFloat32ArrayFillTWO092
     * @tc.desc Verify value 1.0000001 full fill precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(1.0000001);
      expect(arr.$_get(0)).assertEqual(1.0000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0930
     * @tc.name testFloat32ArrayFillTWO093
     * @tc.desc Verify value 2^24 and 2^24+1 after fill stored equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      const b = new Float32Array(1);
      a.fill(16777216);
      b.fill(16777217);
      expect(a.$_get(0)).assertEqual(b.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0940
     * @tc.name testFloat32ArrayFillTWO094
     * @tc.desc Verify value Float32.MAX range fill exact storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(3.4028234663852886e+38);
      expect(arr.$_get(0)).assertEqual(3.4028234663852886e+38);
      expect(arr.$_get(1)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0950
     * @tc.name testFloat32ArrayFillTWO095
     * @tc.desc Verify value slightly exceeding Float32.MAX range fill overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(3.4028234663852886e+38 * 1.0001);
      expect(arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0960
     * @tc.name testFloat32ArrayFillTWO096
     * @tc.desc Verify value -0 range fill sign preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(-0, 0, 2);
      expect(1 / arr.$_get(0)).assertEqual(-Infinity);
      expect(1 / arr.$_get(1)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0970
     * @tc.name testFloat32ArrayFillTWO097
     * @tc.desc Verify value NaN range fill each element is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(NaN, 0, 3);
      expect(arr.$_get(0)).assertNaN();
      expect(arr.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0980
     * @tc.name testFloat32ArrayFillTWO098
     * @tc.desc Verify value Infinity range fill each element is Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(Infinity, 0, 3);
      expect(arr.$_get(0)).assertEqual(Infinity);
      expect(arr.$_get(2)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_0990
     * @tc.name testFloat32ArrayFillTWO099
     * @tc.desc Verify value minimum subnormal number range fill exact storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(1.401298464324817e-45);
      expect(arr.$_get(0)).assertEqual(1.401298464324817e-45);
      expect(arr.$_get(1)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1000
     * @tc.name testFloat32ArrayFillTWO100
     * @tc.desc Verify value minimum normalized number range fill exact storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(1.1754943508222875e-38);
      expect(arr.$_get(0)).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1010
     * @tc.name testFloat32ArrayFillTWO101
     * @tc.desc Verify empty array fill no-op returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const ret = arr.fill(5);
      expect(ret).assertEqual(arr);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1020
     * @tc.name testFloat32ArrayFillTWO102
     * @tc.desc Verify start greater than end silently no-op keeps original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.fill(0, 2, 1);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1030
     * @tc.name testFloat32ArrayFillTWO103
     * @tc.desc Verify start super large negative number clamped to 0 silently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.fill(9, -100);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1040
     * @tc.name testFloat32ArrayFillTWO104
     * @tc.desc Verify end super large positive number clamped to length silently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.fill(9, 0, 100);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1050
     * @tc.name testFloat32ArrayFillTWO105
     * @tc.desc Verify start super large positive number no-op does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(9, 2147483647);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1060
     * @tc.name testFloat32ArrayFillTWO106
     * @tc.desc Verify single-element array full fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.fill(42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1070
     * @tc.name testFloat32ArrayFillTWO107
     * @tc.desc Verify after fill indexed traversal value access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(7, 0, 3);
      let sum: number = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        sum = sum + v;
      }
      expect(sum).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1080
     * @tc.name testFloat32ArrayFillTWO108
     * @tc.desc Verify after fill values iterator value access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(5);
      const it = arr.values();
      expect(it.next().value).assertEqual(5);
      expect(it.next().value).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1090
     * @tc.name testFloat32ArrayFillTWO109
     * @tc.desc Verify fill shared ArrayBuffer view visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf);
      arr.fill(3, 0, 4);
      const view = new Float32Array(buf);
      expect(view.$_get(0)).assertEqual(3);
      expect(view.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1100
     * @tc.name testFloat32ArrayFillTWO110
     * @tc.desc Verify after fill BYTES_PER_ELEMENT preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(9);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1110
     * @tc.name testFloat32ArrayFillTWO111
     * @tc.desc Verify fill explicit full and default fill results consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(4);
      const b = new Float32Array(4);
      a.fill(6);
      b.fill(6, 0, 4);
      expect(a.$_get(0)).assertEqual(b.$_get(0));
      expect(a.$_get(3)).assertEqual(b.$_get(3));
      expect(a.$_get(0)).assertEqual(6);
      expect(a.$_get(3)).assertEqual(6);
      expect(b.$_get(0)).assertEqual(6);
      expect(b.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1120
     * @tc.name testFloat32ArrayFillTWO112
     * @tc.desc Verify fill via subarray view write affects original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const sub = base.subarray(1, 3);
      sub.fill(0);
      expect(base.$_get(0)).assertEqual(1);
      expect(base.$_get(1)).assertEqual(0);
      expect(base.$_get(2)).assertEqual(0);
      expect(base.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1130
     * @tc.name testFloat32ArrayFillTWO113
     * @tc.desc Verify fill different ranges mutually independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      arr.fill(1, 0, 2);
      arr.fill(2, 3, 5);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTWO_1140
     * @tc.name testFloat32ArrayFillTWO114
     * @tc.desc Verify fill explicit full returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTWO114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const ret = arr.fill(5, 0, 3);
      expect(ret).assertEqual(arr);
      expect(arr.$_get(2)).assertEqual(5);
    });

  });
}
