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
  describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongCrossTypeAddTest(): void {
  describe('LongCrossTypeAddTest', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const CTA_INT_0: int = 0;
    const CTA_INT_127: int = 127;
    const CTA_INT_32767: int = 32767;
    const CTA_INT_MAX: int = 2147483647;

    const CTA_L_FROM_TRUNCATED_FLOAT_0: long = 0;
    const CTA_L_FROM_TRUNCATED_FLOAT_1: long = 1;
    const CTA_L_FROM_TRUNCATED_FLOAT_HALF: long = 0;
    const CTA_L_FROM_TRUNCATED_DOUBLE_0: long = 0;
    const CTA_L_FROM_TRUNCATED_DOUBLE_1: long = 1;
    const CTA_L_FROM_TRUNCATED_DOUBLE_LARGE: long = 1000000000000000000;
    const CTA_L_FROM_CHAR_A: long = 65;
    const CTA_L_FROM_CHAR_0: long = 48;

    const CTA_L_0: long = 0;
    const CTA_L_1: long = 1;
    const CTA_L_2: long = 2;
    const CTA_L_10: long = 10;

    const CTA_STR_0: string = "0";
    const CTA_STR_1: string = "1";
    const CTA_STR_2: string = "2";
    const CTA_STR_65: string = "65";
    const CTA_STR_66: string = "66";
    const CTA_STR_127: string = "127";
    const CTA_STR_480: string = "480";
    const CTA_STR_32767: string = "32767";
    const CTA_STR_MAX: string = "2147483647";
    const CTA_STR_DOUBLE_LARGE: string = "1000000000000000000";

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_0100
     * @tc.name testLongCrossAdd001
     * @tc.desc Verify Long(int 0) add Long(long 0) returns "0" (int-to-long widening identity)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_INT_0).add(new Long(CTA_L_0));
      expect(result.toString()).assertEqual(CTA_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_0200
     * @tc.name testLongCrossAdd002
     * @tc.desc Verify Long(int 127) add Long(long 0) preserves byte-range value "127"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_INT_127).add(new Long(CTA_L_0));
      expect(result.toString()).assertEqual(CTA_STR_127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_0300
     * @tc.name testLongCrossAdd003
     * @tc.desc Verify Long(int 0) add Long(Long.MIN_VALUE) equals Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_INT_0).add(new Long(Long.MIN_VALUE));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_0400
     * @tc.name testLongCrossAdd004
     * @tc.desc Verify Long(int 32767) add Long(long 0) preserves short-range value "32767"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_INT_32767).add(new Long(CTA_L_0));
      expect(result.toString()).assertEqual(CTA_STR_32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_0500
     * @tc.name testLongCrossAdd005
     * @tc.desc Verify Long(int MAX) add Long(long 0) preserves int max value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_INT_MAX).add(new Long(CTA_L_0));
      expect(result.toString()).assertEqual(CTA_STR_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_0600
     * @tc.name testLongCrossAdd006
     * @tc.desc Verify Long(pre-truncated float 0.0 as long 0) add Long(0) returns "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_L_FROM_TRUNCATED_FLOAT_0).add(new Long(CTA_L_0));
      expect(result.toString()).assertEqual(CTA_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_0700
     * @tc.name testLongCrossAdd007
     * @tc.desc Verify Long(pre-truncated float 1.0 as long 1) add Long(1) returns "2"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_L_FROM_TRUNCATED_FLOAT_1).add(new Long(CTA_L_1));
      expect(result.toString()).assertEqual(CTA_STR_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_0800
     * @tc.name testLongCrossAdd008
     * @tc.desc Verify Long(pre-truncated float 0.5 as long 0) add Long(1) returns "1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_L_FROM_TRUNCATED_FLOAT_HALF).add(new Long(CTA_L_1));
      expect(result.toString()).assertEqual(CTA_STR_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_0900
     * @tc.name testLongCrossAdd009
     * @tc.desc Verify Long(pre-truncated double 0.0 as long 0) add Long(0) returns "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_L_FROM_TRUNCATED_DOUBLE_0).add(new Long(CTA_L_0));
      expect(result.toString()).assertEqual(CTA_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_1000
     * @tc.name testLongCrossAdd010
     * @tc.desc Verify Long(pre-truncated double 1.0 as long 1) add Long(1) returns "2"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_L_FROM_TRUNCATED_DOUBLE_1).add(new Long(CTA_L_1));
      expect(result.toString()).assertEqual(CTA_STR_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_1100
     * @tc.name testLongCrossAdd011
     * @tc.desc Verify Long(pre-truncated double large as long) add Long(0) preserves large magnitude
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_L_FROM_TRUNCATED_DOUBLE_LARGE).add(new Long(CTA_L_0));
      expect(result.toString()).assertEqual(CTA_STR_DOUBLE_LARGE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_1200
     * @tc.name testLongCrossAdd012
     * @tc.desc Verify Long(char 'A' code 65) add Long(0) returns "65"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_L_FROM_CHAR_A).add(new Long(CTA_L_0));
      expect(result.toString()).assertEqual(CTA_STR_65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_1300
     * @tc.name testLongCrossAdd013
     * @tc.desc Verify Long(char 'A' code 65) add Long(1) returns "66"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_L_FROM_CHAR_A).add(new Long(CTA_L_1));
      expect(result.toString()).assertEqual(CTA_STR_66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_1400
     * @tc.name testLongCrossAdd014
     * @tc.desc Verify cross-type multiplication: Long(int 127) mul Long(0) returns "0" (zero product)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_INT_127).mul(new Long(CTA_L_0));
      expect(result.toString()).assertEqual(CTA_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_1500
     * @tc.name testLongCrossAdd015
     * @tc.desc Verify cross-type multiplication: Long(int 127) mul Long(1) returns "127" (multiplicative identity)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_INT_127).mul(new Long(CTA_L_1));
      expect(result.toString()).assertEqual(CTA_STR_127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_1600
     * @tc.name testLongCrossAdd016
     * @tc.desc Verify cross-type multiplication: Long(int MAX) mul Long(Long.MAX_VALUE) matches modular long product
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CTA_INT_MAX).mul(new Long(Long.MAX_VALUE));
      const expected: long = (CTA_INT_MAX as long) * Long.MAX_VALUE;
      expect(result.toLong()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_1700
     * @tc.name testLongCrossAdd017
     * @tc.desc Verify cross-type multiplication: Long(pre-truncated float 1.0 as long 1) mul Long(2) returns "2"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTA_L_FROM_TRUNCATED_FLOAT_1);
      const result: Long = left.mul(new Long(CTA_L_2));
      expect(result.toString()).assertEqual(CTA_STR_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_ADD_1800
     * @tc.name testLongCrossAdd018
     * @tc.desc Verify cross-type multiplication: Long(char-sourced long 48) mul Long(10) returns "480"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossAdd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(CTA_L_FROM_CHAR_0);
      const result: Long = left.mul(new Long(CTA_L_10));
      expect(result.toString()).assertEqual(CTA_STR_480);
    });
  });
}
