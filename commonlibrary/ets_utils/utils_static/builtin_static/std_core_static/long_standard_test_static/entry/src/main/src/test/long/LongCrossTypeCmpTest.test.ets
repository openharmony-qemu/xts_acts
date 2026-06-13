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

export default function LongCrossTypeCmpTest(): void {
  describe('LongCrossTypeCmpTest', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const CTC_INT_0: int = 0;
    const CTC_INT_1: int = 1;
    const CTC_INT_127: int = 127;
    const CTC_INT_32767: int = 32767;
    const CTC_INT_MAX: int = 2147483647;
    const CTC_INT_MIN: int = -2147483648;

    const CTC_L_FROM_TRUNCATED_FLOAT_0: long = 0;
    const CTC_L_FROM_TRUNCATED_FLOAT_1: long = 1;
    const CTC_L_FROM_TRUNCATED_FLOAT_HALF: long = 0;
    const CTC_L_FROM_TRUNCATED_DOUBLE_0: long = 0;
    const CTC_L_FROM_TRUNCATED_DOUBLE_1: long = 1;
    const CTC_L_FROM_TRUNCATED_DOUBLE_LARGE: long = 1000000000000000000;
    const CTC_L_FROM_CHAR_A: long = 65;
    const CTC_L_FROM_CHAR_B: long = 66;
    const CTC_L_FROM_CHAR_0: long = 48;

    const CTC_L_0: long = 0;
    const CTC_L_1: long = 1;
    const CTC_L_127: long = 127;
    const CTC_L_32767: long = 32767;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_0100
     * @tc.name testLongCrossCmp001
     * @tc.desc Verify Long(int 0) is not greater than Long(long 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_INT_0);
      const right: Long = new Long(CTC_L_0);
      expect(left.isGreaterThan(right)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_0200
     * @tc.name testLongCrossCmp002
     * @tc.desc Verify Long(int MAX) is greater than Long(long 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_INT_MAX);
      const right: Long = new Long(CTC_L_0);
      expect(left.isGreaterThan(right)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_0300
     * @tc.name testLongCrossCmp003
     * @tc.desc Verify Long(int MIN) is less than Long(long 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_INT_MIN);
      const right: Long = new Long(CTC_L_0);
      expect(left.isLessThan(right)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_0400
     * @tc.name testLongCrossCmp004
     * @tc.desc Verify Long(int 127) equals Long(long 127) via compareTo returning 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_INT_127);
      const right: Long = new Long(CTC_L_127);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_0500
     * @tc.name testLongCrossCmp005
     * @tc.desc Verify Long(int 32767) equals Long(long 32767) via equals()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_INT_32767);
      const right: Long = new Long(CTC_L_32767);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_0600
     * @tc.name testLongCrossCmp006
     * @tc.desc Verify Long(pre-truncated float 0.0 as long 0) is not greater than Long(0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_L_FROM_TRUNCATED_FLOAT_0);
      const right: Long = new Long(CTC_L_0);
      expect(left.isGreaterThan(right)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_0700
     * @tc.name testLongCrossCmp007
     * @tc.desc Verify Long(pre-truncated float 1.0 as long 1) is greater than Long(0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_L_FROM_TRUNCATED_FLOAT_1);
      const right: Long = new Long(CTC_L_0);
      expect(left.isGreaterThan(right)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_0800
     * @tc.name testLongCrossCmp008
     * @tc.desc Verify Long(pre-truncated float 0.5 as long 0 via truncation) equals Long(0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_L_FROM_TRUNCATED_FLOAT_HALF);
      const right: Long = new Long(CTC_L_0);
      expect(left.isGreaterThan(right)).assertFalse();
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_0900
     * @tc.name testLongCrossCmp009
     * @tc.desc Verify Long(pre-truncated double 0.0 as long 0) is not greater than Long(0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_L_FROM_TRUNCATED_DOUBLE_0);
      const right: Long = new Long(CTC_L_0);
      expect(left.isGreaterThan(right)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_1000
     * @tc.name testLongCrossCmp010
     * @tc.desc Verify Long(pre-truncated double 1.0 as long 1) is greater than Long(0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_L_FROM_TRUNCATED_DOUBLE_1);
      const right: Long = new Long(CTC_L_0);
      expect(left.isGreaterThan(right)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_1100
     * @tc.name testLongCrossCmp011
     * @tc.desc Verify Long(pre-truncated double large as long) is greater than Long(1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_L_FROM_TRUNCATED_DOUBLE_LARGE);
      const right: Long = new Long(CTC_L_1);
      expect(left.isGreaterThan(right)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_1200
     * @tc.name testLongCrossCmp012
     * @tc.desc Verify Long(char 'A' code 65) equals Long(65)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_L_FROM_CHAR_A);
      const right: Long = new Long(CTC_L_FROM_CHAR_A);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_1300
     * @tc.name testLongCrossCmp013
     * @tc.desc Verify Long(char 'A' code 65) is less than Long(char 'B' code 66)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_L_FROM_CHAR_A);
      const right: Long = new Long(CTC_L_FROM_CHAR_B);
      expect(left.isLessThan(right)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_1400
     * @tc.name testLongCrossCmp014
     * @tc.desc Verify Long(char '0' code 48) equals Long(48)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_L_FROM_CHAR_0);
      const right: Long = new Long(CTC_L_FROM_CHAR_0);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_1500
     * @tc.name testLongCrossCmp015
     * @tc.desc Verify arithmetic: Long(int 1) sub Long(long 0) returns "1" (int-to-long widening subtract)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_INT_1);
      const result: Long = left.sub(new Long(CTC_L_0));
      expect(result.toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_1600
     * @tc.name testLongCrossCmp016
     * @tc.desc Verify arithmetic: Long(int 0) sub Long(long 1) returns "-1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_INT_0);
      const result: Long = left.sub(new Long(CTC_L_1));
      expect(result.toString()).assertEqual("-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_1700
     * @tc.name testLongCrossCmp017
     * @tc.desc Verify arithmetic: Long(pre-truncated float 1.0 as long 1) sub Long(0) returns "1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_L_FROM_TRUNCATED_FLOAT_1);
      const result: Long = left.sub(new Long(CTC_L_0));
      expect(result.toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_1800
     * @tc.name testLongCrossCmp018
     * @tc.desc Verify arithmetic: Long(pre-truncated double 0.0 as long 0) sub Long(Long.MIN_VALUE) overflows back to Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_L_FROM_TRUNCATED_DOUBLE_0);
      const result: Long = left.sub(new Long(Long.MIN_VALUE));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_1900
     * @tc.name testLongCrossCmp019
     * @tc.desc Verify arithmetic: Long(int 127) div Long(long 1) returns "127" (identity div, int-sourced)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_INT_127);
      const result: Long = left.div(new Long(CTC_L_1));
      expect(result.toString()).assertEqual("127");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_2000
     * @tc.name testLongCrossCmp020
     * @tc.desc Verify arithmetic: Long(int 0) div Long(long 1) returns "0" (zero div, int-sourced)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_INT_0);
      const result: Long = left.div(new Long(CTC_L_1));
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_2100
     * @tc.name testLongCrossCmp021
     * @tc.desc Verify arithmetic: Long(int 127) div Long(Long.MAX_VALUE) returns "0" (divisor larger than dividend)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_INT_127);
      const result: Long = left.div(new Long(Long.MAX_VALUE));
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_2200
     * @tc.name testLongCrossCmp022
     * @tc.desc Verify arithmetic: Long(pre-truncated float 0.5 as long 0) div Long(1) returns "0" (truncation before div)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_L_FROM_TRUNCATED_FLOAT_HALF);
      const result: Long = left.div(new Long(CTC_L_1));
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_2300
     * @tc.name testLongCrossCmp023
     * @tc.desc Verify arithmetic: Long(char 'A' code 65) div Long(1) returns "65" (char-sourced identity div)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_L_FROM_CHAR_A);
      const result: Long = left.div(new Long(CTC_L_1));
      expect(result.toString()).assertEqual("65");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CMP_2400
     * @tc.name testLongCrossCmp024
     * @tc.desc Verify arithmetic: Long(int 0) div Long(Long.MIN_VALUE) returns "0" without throw
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossCmp024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTC_INT_0);
      const result: Long = left.div(new Long(Long.MIN_VALUE));
      expect(result.toString()).assertEqual("0");
    });
  });
}
