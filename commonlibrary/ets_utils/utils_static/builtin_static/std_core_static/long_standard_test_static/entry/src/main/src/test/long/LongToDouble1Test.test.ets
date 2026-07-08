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
import Utils from '../Util.test';

export default function LongToDouble1Test(): void {
  describe('LongToDouble1Test', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const TD1_NEG_1000000: long = -1000000;
    const TD1_NEG_10: long = -10;
    const TD1_NEG_1: long = -1;
    const TD1_0: long = 0;
    const TD1_1: long = 1;
    const TD1_7: long = 7;
    const TD1_42: long = 42;
    const TD1_1000000: long = 1000000;
    const TD1_DOUBLE_EXACT_BOUNDARY: long = 9007199254740992;
    const TD1_DOUBLE_PRECISION_LOSS: long = 9007199254740993;
    const TD1_DOUBLE_EXACT_BOUNDARY_VAL: double = 9007199254740992.0;
    const TD1_MAX_MINUS_1: long = 9223372036854775806;
    const TD1_MIN_PLUS_1: long = -9223372036854775807;
    const TD1_DOUBLE_EXACT_MINUS_1: long = 9007199254740991;
    const TD1_DOUBLE_EXACT_MINUS_1_VAL: double = 9007199254740991.0;
    const TD1_DOUBLE_EXACT_NEG: long = -9007199254740992;
    const TD1_DOUBLE_EXACT_NEG_VAL: double = -9007199254740992.0;
    const TD1_DOUBLE_PRECISION_LOSS_NEG: long = -9007199254740993;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_0100
     * @tc.name testLongToDouble1001
     * @tc.desc Verify toDouble() basic 7 -> 7.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_7);
      const result: double = value.toDouble();
      expect(result).assertEqual(TD1_7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_0200
     * @tc.name testLongToDouble1002
     * @tc.desc Verify toDouble() zero -> 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_0);
      const result: double = value.toDouble();
      expect(result).assertEqual(TD1_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_0300
     * @tc.name testLongToDouble1003
     * @tc.desc Verify toDouble() negative -10 -> -10.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_NEG_10);
      const result: double = value.toDouble();
      expect(result).assertEqual(TD1_NEG_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_0400
     * @tc.name testLongToDouble1004
     * @tc.desc Verify toDouble() value 1 -> 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_1);
      const result: double = value.toDouble();
      expect(result).assertEqual(TD1_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_0500
     * @tc.name testLongToDouble1005
     * @tc.desc Verify toDouble() value -1 -> -1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_NEG_1);
      const result: double = value.toDouble();
      expect(result).assertEqual(TD1_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_0600
     * @tc.name testLongToDouble1006
     * @tc.desc Verify toDouble() large positive TD1_1000000 returns double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_1000000);
      const result: double = value.toDouble();
      expect(result).assertEqual(TD1_1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_0700
     * @tc.name testLongToDouble1007
     * @tc.desc Verify toDouble() large negative -TD1_1000000 returns double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_NEG_1000000);
      const result: double = value.toDouble();
      expect(result).assertEqual(TD1_NEG_1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_0800
     * @tc.name testLongToDouble1008
     * @tc.desc Verify toDouble() multiple calls return consistent result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_42);
      const result1: double = value.toDouble();
      const result2: double = value.toDouble();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_0900
     * @tc.name testLongToDouble1009
     * @tc.desc Verify toDouble() default constructor -> 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long();
      const result: double = value.toDouble();
      expect(result).assertEqual(TD1_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_1000
     * @tc.name testLongToDouble1010
     * @tc.desc Verify toDouble(TD1_DOUBLE_EXACT_BOUNDARY) exact at 2^53 boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_DOUBLE_EXACT_BOUNDARY);
      const result: double = value.toDouble();
      expect(result).assertEqual(TD1_DOUBLE_EXACT_BOUNDARY_VAL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_1100
     * @tc.name testLongToDouble1011
     * @tc.desc Verify toDouble(TD1_DOUBLE_PRECISION_LOSS) precision loss at 2^53+1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_DOUBLE_PRECISION_LOSS);
      const result: double = value.toDouble();
      expect(result).assertEqual(TD1_DOUBLE_EXACT_BOUNDARY_VAL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_1200
     * @tc.name testLongToDouble1012
     * @tc.desc Verify toDouble() with Long.MAX_VALUE returns finite double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(Long.MAX_VALUE);
      const result: double = value.toDouble();
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_1300
     * @tc.name testLongToDouble1013
     * @tc.desc Verify toDouble() with Long.MIN_VALUE returns finite double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(Long.MIN_VALUE);
      const result: double = value.toDouble();
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_1400
     * @tc.name testLongToDouble1014
     * @tc.desc Verify toDouble() with Long.MAX_VALUE - 1 (adjacent to MAX) returns finite positive double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_MAX_MINUS_1);
      const result: double = value.toDouble();
      expect(isFinite(result)).assertTrue();
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_1500
     * @tc.name testLongToDouble1015
     * @tc.desc Verify toDouble() with Long.MIN_VALUE + 1 (adjacent to MIN) returns finite negative double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_MIN_PLUS_1);
      const result: double = value.toDouble();
      expect(isFinite(result)).assertTrue();
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_1600
     * @tc.name testLongToDouble1016
     * @tc.desc Verify toDouble() at 2^53 - 1 max exact representable below double boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_DOUBLE_EXACT_MINUS_1);
      const result: double = value.toDouble();
      expect(result).assertEqual(TD1_DOUBLE_EXACT_MINUS_1_VAL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_1700
     * @tc.name testLongToDouble1017
     * @tc.desc Verify toDouble() at -(2^53) negative double exact boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_DOUBLE_EXACT_NEG);
      const result: double = value.toDouble();
      expect(result).assertEqual(TD1_DOUBLE_EXACT_NEG_VAL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE1_1800
     * @tc.name testLongToDouble1018
     * @tc.desc Verify toDouble() at -(2^53 + 1) precision loss converges to -(2^53)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TD1_DOUBLE_PRECISION_LOSS_NEG);
      const result: double = value.toDouble();
      expect(result).assertEqual(TD1_DOUBLE_EXACT_NEG_VAL);
    });
  });
}

