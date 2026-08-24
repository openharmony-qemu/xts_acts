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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function FloatIsInteger1Test2(): void {
  describe('FloatIsInteger1Test2', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(async (): Promise<void> => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_0100
     * @tc.name testFloatIsIntegerStatic001
     * @tc.desc Verify Float.isInteger(int 1) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 1;
      expect(Float.isInteger(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_0200
     * @tc.name testFloatIsIntegerStatic002
     * @tc.desc Verify Float.isInteger(int -2147483648) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = -2147483648;
      expect(Float.isInteger(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_0300
     * @tc.name testFloatIsIntegerStatic003
     * @tc.desc Verify Float.isInteger(long 100) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      expect(Float.isInteger(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_0400
     * @tc.name testFloatIsIntegerStatic004
     * @tc.desc Verify Float.isInteger(float Float.NaN) returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN;
      expect(Float.isInteger(val)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_0500
     * @tc.name testFloatIsIntegerStatic005
     * @tc.desc Verify Float.isInteger(float Float.POSITIVE_INFINITY) returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.POSITIVE_INFINITY;
      expect(Float.isInteger(val)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_0600
     * @tc.name testFloatIsIntegerStatic006
     * @tc.desc Verify Float.isInteger(float Float.NEGATIVE_INFINITY) returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NEGATIVE_INFINITY;
      expect(Float.isInteger(val)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_0700
     * @tc.name testFloatIsIntegerStatic007
     * @tc.desc Verify Float.isInteger(float 0.0f) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 0.0f;
      expect(Float.isInteger(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_0800
     * @tc.name testFloatIsIntegerStatic008
     * @tc.desc Verify Float.isInteger(float -0.0f) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -0.0f;
      expect(Float.isInteger(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_0900
     * @tc.name testFloatIsIntegerStatic009
     * @tc.desc Verify Float.isInteger(float 10.0f / 2.0f) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 10.0f / 2.0f;
      expect(Float.isInteger(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_1000
     * @tc.name testFloatIsIntegerStatic010
     * @tc.desc Verify Float.isInteger(float 1.0f / 3.0f) returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0f / 3.0f;
      expect(Float.isInteger(val)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_1100
     * @tc.name testFloatIsIntegerStatic011
     * @tc.desc Verify Float.isInteger(float Float.MAX_VALUE) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_VALUE;
      expect(Float.isInteger(val)).assertTrue();
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_1200
     * @tc.name testFloatIsIntegerStatic012
     * @tc.desc Verify Float.isInteger(short -32768) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = -32768 as short;
      const r: boolean = Float.isInteger(val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_1300
     * @tc.name testFloatIsIntegerStatic013
     * @tc.desc Verify Float.isInteger(byte 12) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 12 as byte;
      const r: boolean = Float.isInteger(val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_1400
     * @tc.name testFloatIsIntegerStatic014
     * @tc.desc Verify Float.isInteger(byte -128) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const r: boolean = Float.isInteger(val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_1500
     * @tc.name testFloatIsIntegerStatic015
     * @tc.desc Verify Float.isInteger(Float.MIN_VALUE * 1.5f) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isInteger(Float.MIN_VALUE * 1.5f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_1600
     * @tc.name testFloatIsIntegerStatic016
     * @tc.desc Verify static Float.isInteger matches instance isInteger() for 5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: boolean = Float.isInteger(5.0f);
      const instanceResult: boolean = new Float(5.0f).isInteger();
      expect(staticResult).assertEqual(instanceResult);
      expect(staticResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_1700
     * @tc.name testFloatIsIntegerStatic017
     * @tc.desc Verify Float.isInteger(0.1f + 0.2f) returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isInteger(0.1f + 0.2f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_1800
     * @tc.name testFloatIsIntegerStatic018
     * @tc.desc Verify Float.isInteger(Float.EPSILON) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isInteger(Float.EPSILON);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_1900
     * @tc.name testFloatIsIntegerStatic019
     * @tc.desc Verify Float.isInteger(Float.DELTA) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isInteger(Float.DELTA);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_2000
     * @tc.name testFloatIsIntegerStatic020
     * @tc.desc Verify Float.isInteger(-2.0f) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negTwo: boolean = Float.isInteger(-2.0f);
      expect(negTwo).assertTrue();

      const negFour: boolean = Float.isInteger(-4.0f);
      expect(negFour).assertTrue();

      const negEight: boolean = Float.isInteger(-8.0f);
      expect(negEight).assertTrue();

      const negSixteen: boolean = Float.isInteger(-16.0f);
      expect(negSixteen).assertTrue();

      const negThirtyTwo: boolean = Float.isInteger(-32.0f);
      expect(negThirtyTwo).assertTrue();

      const negSixtyFour: boolean = Float.isInteger(-64.0f);
      expect(negSixtyFour).assertTrue();

      const negOneTwentyEight: boolean = Float.isInteger(-128.0f);
      expect(negOneTwentyEight).assertTrue();

      const negTwoFiftySix: boolean = Float.isInteger(-256.0f);
      expect(negTwoFiftySix).assertTrue();

      const negFiveTwelve: boolean = Float.isInteger(-512.0f);
      expect(negFiveTwelve).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_2100
     * @tc.name testFloatIsIntegerStatic021
     * @tc.desc Verify Float.isInteger(3.0f) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = 3.0f;
      const result: boolean = Float.isInteger(f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_2200
     * @tc.name testFloatIsIntegerStatic022
     * @tc.desc Verify Float.isInteger idempotency: same input multiple calls return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = Float.isInteger(16777216.0f);
      const r2: boolean = Float.isInteger(16777217.0f);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_2300
     * @tc.name testFloatIsIntegerStatic023
     * @tc.desc Verify Float.isInteger(2147483647) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isInteger(2147483647 as int);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_2400
     * @tc.name testFloatIsIntegerStatic024
     * @tc.desc Verify Float.isInteger(-2147483648) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isInteger(-2147483648 as int);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_2500
     * @tc.name testFloatIsIntegerStatic025
     * @tc.desc Verify Float.isInteger(127) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isInteger(127 as byte);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_2600
     * @tc.name testFloatIsIntegerStatic026
     * @tc.desc Verify Float.isInteger(-128) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isInteger(-128 as byte);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_2700
     * @tc.name testFloatIsIntegerStatic027
     * @tc.desc Verify Float.isInteger(32767) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isInteger(32767 as short);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_2800
     * @tc.name testFloatIsIntegerStatic028
     * @tc.desc Verify Float.isInteger(-32768) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isInteger(-32768 as short);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_2900
     * @tc.name testFloatIsIntegerStatic029
     * @tc.desc Verify Float.isInteger(Float.bitCastFromInt(0x3f800000)) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isInteger(Float.bitCastFromInt(0x3f800000));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_STATIC_ONE_3000
     * @tc.name testFloatIsIntegerStatic030
     * @tc.desc Verify Float.isInteger(float 9999999999999999f) returns true (9999999999999999f is considered integer at float precision)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerStatic030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isInteger(9999999999999999f);
      expect(result).assertTrue();
    });

  })
}