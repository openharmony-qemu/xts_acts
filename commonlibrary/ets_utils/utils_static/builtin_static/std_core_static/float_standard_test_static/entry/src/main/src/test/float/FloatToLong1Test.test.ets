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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function FloatToLong1Test(): void {
  describe('FloatToLong1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_0100
     * @tc.name testToLong1001
     * @tc.desc Verify no-arg call to toLong() returns correct long value 123
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(123.5f).toLong();
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_0200
     * @tc.name testToLong1002
     * @tc.desc Verify positive float 100.0f converts to long 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(100.0f).toLong();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_0300
     * @tc.name testToLong1003
     * @tc.desc Verify negative float -100.0f converts to long -100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(-100.0f).toLong();
      expect(result).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_0400
     * @tc.name testToLong1004
     * @tc.desc Verify zero float 0.0f converts to long 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(0.0f).toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_0500
     * @tc.name testToLong1005
     * @tc.desc Verify positive decimal 123.5f truncates to long 123
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(999.9f).toLong();
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_0600
     * @tc.name testToLong1006
     * @tc.desc Verify negative decimal -123.9f truncates to long -123
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(-123.9f).toLong();
      expect(result).assertEqual(-123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_0700
     * @tc.name testToLong1007
     * @tc.desc Verify 2147483647.0f converts to long 2147483648 (float precision causes rounding at >2^24)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(2147483647.0f).toLong();
      expect(result).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_0800
     * @tc.name testToLong1008
     * @tc.desc Verify int min value -2147483648.0f converts to long -2147483648
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(-2147483648.0f).toLong();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_0900
     * @tc.name testToLong1009
     * @tc.desc Verify positive decimal 99.9f truncates to long 99
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(99.9f).toLong();
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_1000
     * @tc.name testToLong1010
     * @tc.desc Verify negative decimal -99.9f truncates to long -99
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(-99.9f).toLong();
      expect(result).assertEqual(-99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_1100
     * @tc.name testToLong1011
     * @tc.desc Verify near-1 positive decimal 1.999999f truncates to long 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(1.999999f).toLong();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_1200
     * @tc.name testToLong1012
     * @tc.desc Verify near -1 negative decimal -1.999999f truncates to long -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(-1.999999f).toLong();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_1300
     * @tc.name testToLong1013
     * @tc.desc Verify tiny positive decimal 0.000001f truncates to long 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(0.000001f).toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_1400
     * @tc.name testToLong1014
     * @tc.desc Verify tiny negative decimal -0.000001f truncates to long 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(-0.000001f).toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_1500
     * @tc.name testToLong1015
     * @tc.desc Verify NaN conversion via toLong returns long type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(Float.NaN).toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_1600
     * @tc.name testToLong1016
     * @tc.desc Verify positive infinity conversion via toLong returns long type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(Float.POSITIVE_INFINITY).toLong();
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_1700
     * @tc.name testToLong1017
     * @tc.desc Verify negative infinity conversion via toLong returns long type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(Float.NEGATIVE_INFINITY).toLong();
      expect(result).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_1800
     * @tc.name testToLong1018
     * @tc.desc Verify negative zero -0.0f converts to long 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(-0.0f).toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_1900
     * @tc.name testToLong1019
     * @tc.desc Verify MIN_VALUE converts to long 0 (truncated toward zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(Float.MIN_VALUE).toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_2000
     * @tc.name testToLong1020
     * @tc.desc Verify MAX_VALUE overflow via toLong returns long type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(Float.MAX_VALUE).toLong();
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_2100
     * @tc.name testToLong1021
     * @tc.desc Verify -MAX_VALUE underflow via toLong returns long type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(-Float.MAX_VALUE).toLong();
      expect(result).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_2200
     * @tc.name testToLong1022
     * @tc.desc Verify toLong return value works in arithmetic expression
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(100.5f).toLong() + 1;
      expect(result).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_2300
     * @tc.name testToLong1023
     * @tc.desc Verify multiple calls on same instance return consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(123.5f);
      const r1: long = f.toLong();
      const r2: long = f.toLong();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_2400
     * @tc.name testToLong1024
     * @tc.desc Verify toString on toLong return value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(123.5f).toLong().toString();
      expect(result).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_2500
     * @tc.name testToLong1025
     * @tc.desc Verify long max nearby value conversion returns long type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(4611686018427387903.0f).toLong();
      expect(result).assertEqual(4611686018427387904);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_2600
     * @tc.name testToLong1026
     * @tc.desc Verify default constructor Float() toLong returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float().toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_2700
     * @tc.name testToLong1027
     * @tc.desc Verify double literal constructor new Float(1.5) toLong returns 1 (double-to-float narrow then truncate)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(1.5).toLong();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_1_2800
     * @tc.name testToLong1028
     * @tc.desc Verify MAX_SAFE_INTEGER constructor toLong returns correct value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(Float.MAX_SAFE_INTEGER).toLong();
      expect(result).assertEqual(Float.MAX_SAFE_INTEGER);
    });
  });
}
