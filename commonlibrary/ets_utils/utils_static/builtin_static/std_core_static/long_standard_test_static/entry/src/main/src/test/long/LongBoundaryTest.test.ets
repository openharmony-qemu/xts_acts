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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongBoundaryTest(): void {
  describe('LongBoundaryTest', () => {
    beforeEach(async () => { await Utils.msSleep(30); });

    const B_MAX: long = Long.MAX_VALUE;
    const B_MIN: long = Long.MIN_VALUE;
    const B_0: long = 0;
    const B_1: long = 1;
    const B_2: long = 2;
    const B_NEG_1: long = -1;
    const B_STR_MIN: string = "-9223372036854775808";
    const B_STR_MAX: string = "9223372036854775807";
    const B_STR_NEG_MAX: string = "-9223372036854775807";
    const B_STR_MIN_PLUS_1: string = "-9223372036854775807";
    const B_HALF_MAX: long = 4611686018427387903;
    const B_STR_MAX_MINUS_1: string = "9223372036854775806";

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_0100
     * @tc.name testLongBoundary001
     * @tc.desc Verify Long.MAX_VALUE + 1 overflows to Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MAX).add(new Long(B_1));
      expect(result.toString()).assertEqual(B_STR_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_0200
     * @tc.name testLongBoundary002
     * @tc.desc Verify Long.MIN_VALUE - 1 underflows to Long.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MIN).sub(new Long(B_1));
      expect(result.toString()).assertEqual(B_STR_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_0300
     * @tc.name testLongBoundary003
     * @tc.desc Verify Long.MAX_VALUE * 2 overflows and returns a Long instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MAX).mul(new Long(B_2));
      expect(result instanceof Long).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_0400
     * @tc.name testLongBoundary004
     * @tc.desc Verify Long.MIN_VALUE * 2 overflows and returns a Long instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MIN).mul(new Long(B_2));
      expect(result instanceof Long).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_0500
     * @tc.name testLongBoundary005
     * @tc.desc Verify Long.MIN_VALUE / -1 overflows and returns Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MIN).div(new Long(B_NEG_1));
      expect(result.toString()).assertEqual(B_STR_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_0600
     * @tc.name testLongBoundary006
     * @tc.desc Verify Long.MAX_VALUE / -1 equals negative Long.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MAX).div(new Long(B_NEG_1));
      expect(result.toString()).assertEqual(B_STR_NEG_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_0700
     * @tc.name testLongBoundary007
     * @tc.desc Verify (MAX-1) + 2 overflows to Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxMinus1: long = B_MAX - B_1;
      const result: Long = new Long(maxMinus1).add(new Long(B_2));
      expect(result.toString()).assertEqual(B_STR_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_0800
     * @tc.name testLongBoundary008
     * @tc.desc Verify (MIN+1) - 2 underflow behavior returns expected boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minPlus1: long = B_MIN + B_1;
      const result: Long = new Long(minPlus1).sub(new Long(B_2));
      expect(result.toString()).assertEqual(B_STR_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_0900
     * @tc.name testLongBoundary009
     * @tc.desc Verify 1 / 2 truncates to 0 (integer division toward zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_1).div(new Long(B_2));
      expect(result.toLong() === B_0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_1000
     * @tc.name testLongBoundary010
     * @tc.desc Verify -1 / 2 truncates to 0 (integer division toward zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_NEG_1).div(new Long(B_2));
      expect(result.toLong() === B_0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_1100
     * @tc.name testLongBoundary011
     * @tc.desc Verify Long.MIN_VALUE / 1 identity division returns Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MIN).div(new Long(B_1));
      expect(result.toLong() === B_MIN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_1200
     * @tc.name testLongBoundary012
     * @tc.desc Verify Long.MAX_VALUE / 1 identity division returns Long.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MAX).div(new Long(B_1));
      expect(result.toLong() === B_MAX).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_1300
     * @tc.name testLongBoundary013
     * @tc.desc Verify MAX - MAX equals 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MAX).sub(new Long(B_MAX));
      expect(result.toLong() === B_0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_1400
     * @tc.name testLongBoundary014
     * @tc.desc Verify MIN - MIN equals 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MIN).sub(new Long(B_MIN));
      expect(result.toLong() === B_0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_1500
     * @tc.name testLongBoundary015
     * @tc.desc Verify (MAX/2 + 1) * 2 overflows and returns a Long instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const halfMaxPlus1: long = B_HALF_MAX + B_1;
      const result: Long = new Long(halfMaxPlus1).mul(new Long(B_2));
      expect(result instanceof Long).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_1600
     * @tc.name testLongBoundary016
     * @tc.desc Verify MAX + 1 + 1 double overflows to MIN + 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MAX).add(new Long(B_1)).add(new Long(B_1));
      expect(result.toString()).assertEqual(B_STR_MIN_PLUS_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_1700
     * @tc.name testLongBoundary017
     * @tc.desc Verify MIN - 1 - 1 double underflows to MAX - 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MIN).sub(new Long(B_1)).sub(new Long(B_1));
      expect(result.toString()).assertEqual(B_STR_MAX_MINUS_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_1800
     * @tc.name testLongBoundary018
     * @tc.desc Verify MAX * -1 equals negative MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MAX).mul(new Long(B_NEG_1));
      expect(result.toString()).assertEqual(B_STR_NEG_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_1900
     * @tc.name testLongBoundary019
     * @tc.desc Verify MIN * -1 overflows and returns Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MIN).mul(new Long(B_NEG_1));
      expect(result.toString()).assertEqual(B_STR_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_2000
     * @tc.name testLongBoundary020
     * @tc.desc Verify 0 * MAX equals 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_0).mul(new Long(B_MAX));
      expect(result.toLong() === B_0).assertTrue();
    });
  });
}
