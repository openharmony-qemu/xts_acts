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

export default function LongIsGreaterEqualThanTest(): void {
  describe('LongIsGreaterEqualThanTest', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const GE_NEG_10: long = -10;
    const GE_NEG_5: long = -5;
    const GE_NEG_3: long = -3;
    const GE_0: long = 0;
    const GE_1: long = 1;
    const GE_3: long = 3;
    const GE_4: long = 4;
    const GE_5: long = 5;
    const GE_10: long = 10;
    const GE_42: long = 42;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_0100
     * @tc.name testLongIsGreaterEqualThan001
     * @tc.desc Verify 5 >= 4 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GE_5).isGreaterEqualThan(new Long(GE_4));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_0200
     * @tc.name testLongIsGreaterEqualThan002
     * @tc.desc Verify 5 >= 5 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GE_5).isGreaterEqualThan(new Long(GE_5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_0300
     * @tc.name testLongIsGreaterEqualThan003
     * @tc.desc Verify 3 >= 5 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GE_3).isGreaterEqualThan(new Long(GE_5));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_0400
     * @tc.name testLongIsGreaterEqualThan004
     * @tc.desc Verify positive >= negative returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GE_10).isGreaterEqualThan(new Long(GE_NEG_5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_0500
     * @tc.name testLongIsGreaterEqualThan005
     * @tc.desc Verify negative >= positive returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GE_NEG_5).isGreaterEqualThan(new Long(GE_10));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_0600
     * @tc.name testLongIsGreaterEqualThan006
     * @tc.desc Verify equal negatives -5 >= -5 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GE_NEG_5).isGreaterEqualThan(new Long(GE_NEG_5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_0700
     * @tc.name testLongIsGreaterEqualThan007
     * @tc.desc Verify 0 >= 0 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GE_0).isGreaterEqualThan(new Long(GE_0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_0800
     * @tc.name testLongIsGreaterEqualThan008
     * @tc.desc Verify -3 >= 0 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GE_NEG_3).isGreaterEqualThan(new Long(GE_0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_0900
     * @tc.name testLongIsGreaterEqualThan009
     * @tc.desc Verify 0 >= -3 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GE_0).isGreaterEqualThan(new Long(GE_NEG_3));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_1000
     * @tc.name testLongIsGreaterEqualThan010
     * @tc.desc Verify -3 >= -10 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GE_NEG_3).isGreaterEqualThan(new Long(GE_NEG_10));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_1100
     * @tc.name testLongIsGreaterEqualThan011
     * @tc.desc Verify -10 >= -3 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GE_NEG_10).isGreaterEqualThan(new Long(GE_NEG_3));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_1200
     * @tc.name testLongIsGreaterEqualThan012
     * @tc.desc Verify 0 >= 1 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GE_0).isGreaterEqualThan(new Long(GE_1));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_1300
     * @tc.name testLongIsGreaterEqualThan013
     * @tc.desc Verify 1 >= 0 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GE_1).isGreaterEqualThan(new Long(GE_0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_1400
     * @tc.name testLongIsGreaterEqualThan014
     * @tc.desc Verify self comparison (value >= value) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(GE_42);
      const result: boolean = value.isGreaterEqualThan(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_1500
     * @tc.name testLongIsGreaterEqualThan015
     * @tc.desc Verify default constructor (new Long() >= new Long()) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long().isGreaterEqualThan(new Long());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_1600
     * @tc.name testLongIsGreaterEqualThan016
     * @tc.desc Verify MAX_VALUE >= MIN_VALUE returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(Long.MAX_VALUE).isGreaterEqualThan(new Long(Long.MIN_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_1700
     * @tc.name testLongIsGreaterEqualThan017
     * @tc.desc Verify MAX_VALUE >= MAX_VALUE returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(Long.MAX_VALUE).isGreaterEqualThan(new Long(Long.MAX_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_1800
     * @tc.name testLongIsGreaterEqualThan018
     * @tc.desc Verify MIN_VALUE >= MIN_VALUE returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(Long.MIN_VALUE).isGreaterEqualThan(new Long(Long.MIN_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN_1900
     * @tc.name testLongIsGreaterEqualThan019
     * @tc.desc Verify antisymmetry: when a != b, exactly one of a >= b and b >= a holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(10 as long);
      const b: Long = new Long(5 as long);
      const aGeqB: boolean = a.isGreaterEqualThan(b);
      const bGeqA: boolean = b.isGreaterEqualThan(a);
      expect(aGeqB).assertTrue();
      expect(bGeqA).assertFalse();
    });

  });
}
