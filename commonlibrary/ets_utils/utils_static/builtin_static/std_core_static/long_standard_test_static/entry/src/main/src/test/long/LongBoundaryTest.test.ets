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

export default function LongBoundaryTest(): void {
  describe('LongBoundaryTest', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

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
    const B_NEG_2: long = -2;

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
     * @tc.desc Verify Long.MAX_VALUE * 2 overflows to -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MAX).mul(new Long(B_2));
      expect(result.toLong()).assertEqual(B_NEG_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_0400
     * @tc.name testLongBoundary004
     * @tc.desc Verify Long.MIN_VALUE * 2 overflows to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MIN).mul(new Long(B_2));
      expect(result.toLong()).assertEqual(B_0);
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
      expect(result.toLong()).assertEqual(B_0);
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
      expect(result.toLong()).assertEqual(B_0);
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
      expect(result.toLong()).assertEqual(B_MIN);
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
      expect(result.toLong()).assertEqual(B_MAX);
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
      expect(result.toLong()).assertEqual(B_0);
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
      expect(result.toLong()).assertEqual(B_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_1500
     * @tc.name testLongBoundary015
     * @tc.desc Verify (HALF_MAX + 1) * 2 overflows to Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const halfMaxPlus1: long = B_HALF_MAX + B_1;
      const result: Long = new Long(halfMaxPlus1).mul(new Long(B_2));
      expect(result.toString()).assertEqual(B_STR_MIN);
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
      expect(result.toLong()).assertEqual(B_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_2100
     * @tc.name testLongBoundary021
     * @tc.desc Verify boundary chain: Long.MAX_VALUE.add(1).div(1) wraps to Long.MIN_VALUE then identity-divides
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MAX).add(new Long(B_1)).div(new Long(B_1));
      expect(result.toString()).assertEqual(B_STR_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_2200
     * @tc.name testLongBoundary022
     * @tc.desc Verify boundary chain: Long.MAX_VALUE.add(1).mul(1) wraps then identity-multiplies to MIN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MAX).add(new Long(B_1)).mul(new Long(B_1));
      expect(result.toString()).assertEqual(B_STR_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_2300
     * @tc.name testLongBoundary023
     * @tc.desc Verify boundary chain: Long.MAX_VALUE.add(1).sub(1) wraps then subtracts back to MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MAX).add(new Long(B_1)).sub(new Long(B_1));
      expect(result.toString()).assertEqual(B_STR_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_2400
     * @tc.name testLongBoundary024
     * @tc.desc Verify boundary chain: Long.MAX_VALUE.add(1).toLong() returns Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Long(B_MAX).add(new Long(B_1)).toLong();
      expect(result).assertEqual(B_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_2500
     * @tc.name testLongBoundary025
     * @tc.desc Verify boundary chain: Long.MAX_VALUE.add(1).compareTo(MIN) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(B_MAX).add(new Long(B_1)).compareTo(new Long(B_MIN));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_2600
     * @tc.name testLongBoundary026
     * @tc.desc Verify boundary chain: Long.MAX_VALUE.add(1).equals(new Long(MIN)) is true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(B_MAX).add(new Long(B_1)).equals(new Long(B_MIN));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_2700
     * @tc.name testLongBoundary027
     * @tc.desc Verify boundary chain: Long.MAX_VALUE.add(1).isLessThan(0) is true after sign flip via overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(B_MAX).add(new Long(B_1)).isLessThan(new Long(B_0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_2800
     * @tc.name testLongBoundary028
     * @tc.desc Verify boundary chain: Long.MIN_VALUE.sub(1).div(-1) underflows to MAX then divides to -MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MIN).sub(new Long(B_1)).div(new Long(B_NEG_1));
      expect(result.toString()).assertEqual(B_STR_NEG_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_2900
     * @tc.name testLongBoundary029
     * @tc.desc Verify boundary chain: Long.MIN_VALUE.sub(1).mul(-1) underflows to MAX then sign-flips to -MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_MIN).sub(new Long(B_1)).mul(new Long(B_NEG_1));
      expect(result.toString()).assertEqual(B_STR_NEG_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOUNDARY_3000
     * @tc.name testLongBoundary030
     * @tc.desc Verify boundary chain: ((MAX/2)*2).add(1) reaches Long.MAX_VALUE without overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongBoundary030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(B_HALF_MAX).mul(new Long(B_2)).add(new Long(B_1));
      expect(result.toString()).assertEqual(B_STR_MAX);
    });
  });
}
