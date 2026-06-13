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
import {
  L_0,
  L_1,
  L_10,
  L_100,
  L_2,
  L_200,
  L_3,
  L_4,
  L_5,
  L_6,
  L_7,
  L_NEG_100,
  L_NEG_200,
  L_NEG_50,
  S_0,
  S_10,
  S_100,
  S_14,
  S_300,
  S_50,
  S_6,
  S_LONG_MAX,
  S_NEG_1,
  S_NEG_300,
  SLEEP_MS,
} from './LongTestConstants';

export default function LongAddTest(): void {
  describe('LongAddTest', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(SLEEP_MS);
    });

    afterEach(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0100
     * @tc.name testLongAdd001
     * @tc.desc Verify basic add with small single-digit Long values and carry-over
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(L_6).add(new Long(L_4));
      expect(result.toString()).assertEqual(S_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0200
     * @tc.name testLongAdd002
     * @tc.desc Verify multi-digit positive plus positive Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(L_100).add(new Long(L_200));
      expect(result.toString()).assertEqual(S_300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0300
     * @tc.name testLongAdd003
     * @tc.desc Verify positive plus negative Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(L_100).add(new Long(L_NEG_50));
      expect(result.toString()).assertEqual(S_50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0400
     * @tc.name testLongAdd004
     * @tc.desc Verify negative plus negative Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(L_NEG_100).add(new Long(L_NEG_200));
      expect(result.toString()).assertEqual(S_NEG_300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0500
     * @tc.name testLongAdd005
     * @tc.desc Verify add with zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(L_100).add(new Long(L_0));
      expect(result.toString()).assertEqual(S_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0600
     * @tc.name testLongAdd006
     * @tc.desc Verify add of equal positive values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(L_5).add(new Long(L_5));
      expect(result.toString()).assertEqual(S_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0700
     * @tc.name testLongAdd007
     * @tc.desc Verify add of inverse values results in zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(L_5).add(new Long(-L_5));
      expect(result.toString()).assertEqual(S_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0800
     * @tc.name testLongAdd008
     * @tc.desc Verify MIN_VALUE plus -1 overflows to MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE);
      const result: Long = value.add(new Long(-L_1));
      expect(result.toString()).assertEqual(S_LONG_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0900
     * @tc.name testLongAdd009
     * @tc.desc Verify MAX_VALUE plus MIN_VALUE equals -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).add(new Long(Long.MIN_VALUE));
      expect(result.toString()).assertEqual(S_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1000
     * @tc.name testLongAdd010
     * @tc.desc Verify chained add operations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(L_1).add(new Long(L_2)).add(new Long(L_3));
      expect(result.toString()).assertEqual(S_6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1100
     * @tc.name testLongAdd011
     * @tc.desc Verify add result toString: 3 + 7 = "10"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(L_3).add(new Long(L_7));
      expect(result.toString()).assertEqual(S_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1200
     * @tc.name testLongAdd012
     * @tc.desc Verify add returns a new instance, not the same object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Long = new Long(L_5);
      const result: Long = original.add(new Long(L_3));
      expect(result !== original).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1300
     * @tc.name testLongAdd013
     * @tc.desc Verify default constructor Long add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long().add(new Long(L_10));
      expect(result.toString()).assertEqual(S_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1400
     * @tc.name testLongAdd014
     * @tc.desc Verify add with itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(L_7);
      const result: Long = value.add(value);
      expect(result.toString()).assertEqual(S_14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1500
     * @tc.name testLongAdd015
     * @tc.desc Verify zero plus zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(L_0).add(new Long(L_0));
      expect(result.toString()).assertEqual(S_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1600
     * @tc.name testLongAdd016
     * @tc.desc Verify boundary add: Long.MAX_VALUE + 1 wraps to Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).add(new Long(L_1));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1700
     * @tc.name testLongAdd017
     * @tc.desc Verify boundary add: Long.MAX_VALUE + Long.MAX_VALUE = -2 (twos-complement wrap)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).add(new Long(Long.MAX_VALUE));
      expect(result.toLong()).assertEqual(-2 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1800
     * @tc.name testLongAdd018
     * @tc.desc Verify boundary add: Long.MIN_VALUE + Long.MIN_VALUE = 0 (twos-complement wrap)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MIN_VALUE).add(new Long(Long.MIN_VALUE));
      expect(result.toLong()).assertEqual(L_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1900
     * @tc.name testLongAdd019
     * @tc.desc Verify boundary add: Long.MAX_VALUE + 100 wraps via twos-complement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).add(new Long(L_100));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE + 99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_2000
     * @tc.name testLongAdd020
     * @tc.desc Verify add accepts a Long instance built from another Long (parameter form)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(L_100);
      const b: Long = new Long(a);
      const result: Long = a.add(b);
      expect(result.toLong()).assertEqual(L_200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_2100
     * @tc.name testLongAdd021
     * @tc.desc Verify add with literal Long values produced by inline numeric literals
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(123 as long).add(new Long(456 as long));
      expect(result.toLong()).assertEqual(579 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_2200
     * @tc.name testLongAdd022
     * @tc.desc Verify add behavior is consistent with primitive long + operator at boundary (MAX-1) + 1 = MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: long = Long.MAX_VALUE - 1;
      const b: long = 1 as long;
      const primitive: long = a + b;
      const result: Long = new Long(a).add(new Long(b));
      expect(result.toLong()).assertEqual(primitive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_2300
     * @tc.name testLongAdd023
     * @tc.desc Verify add behavior is consistent with primitive long + operator for negatives: (-100)+(-200) = -300
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const primitive: long = L_NEG_100 + L_NEG_200;
      const result: Long = new Long(L_NEG_100).add(new Long(L_NEG_200));
      expect(result.toLong()).assertEqual(primitive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_2400
     * @tc.name testLongAdd024
     * @tc.desc Verify alias-safe self add: Long.MAX_VALUE instance added with itself wraps to -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MAX_VALUE);
      const result: Long = value.add(value);
      expect(result.toLong()).assertEqual(-2 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_2500
     * @tc.name testLongAdd025
     * @tc.desc Verify alias-safe self add: Long.MIN_VALUE instance added with itself wraps to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE);
      const result: Long = value.add(value);
      expect(result.toLong()).assertEqual(L_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_2600
     * @tc.name testLongAdd026
     * @tc.desc Verify Long.MAX_VALUE + (-Long.MAX_VALUE) equals 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negMax: long = -Long.MAX_VALUE;
      const result: Long = new Long(Long.MAX_VALUE).add(new Long(negMax));
      expect(result.toLong()).assertEqual(L_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_2700
     * @tc.name testLongAdd027
     * @tc.desc Verify add commutativity: a.add(b) equals b.add(a)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(L_5);
      const b: Long = new Long(L_3);
      const ab: Long = a.add(b);
      const ba: Long = b.add(a);
      expect(ab.toLong()).assertEqual(ba.toLong());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_2800
     * @tc.name testLongAdd028
     * @tc.desc Verify boundary identity: Long.MIN_VALUE + 0 equals Long.MIN_VALUE (no wrap)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MIN_VALUE).add(new Long(L_0));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_2900
     * @tc.name testLongAdd029
     * @tc.desc Verify boundary identity: Long.MAX_VALUE + 0 equals Long.MAX_VALUE (no wrap)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).add(new Long(L_0));
      expect(result.toLong()).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_3000
     * @tc.name testLongAdd030
     * @tc.desc Verify near-boundary non-wrapping add: Long.MIN_VALUE + 1 equals Long.MIN_VALUE + 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: long = Long.MIN_VALUE + 1;
      const result: Long = new Long(Long.MIN_VALUE).add(new Long(L_1));
      expect(result.toLong()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_3100
     * @tc.name testLongAdd031
     * @tc.desc Verify near-boundary negative add: Long.MAX_VALUE + (-100) equals Long.MAX_VALUE - 100 (no wrap)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: long = Long.MAX_VALUE - 100;
      const result: Long = new Long(Long.MAX_VALUE).add(new Long(L_NEG_100));
      expect(result.toLong()).assertEqual(expected);
    });
  });
}
