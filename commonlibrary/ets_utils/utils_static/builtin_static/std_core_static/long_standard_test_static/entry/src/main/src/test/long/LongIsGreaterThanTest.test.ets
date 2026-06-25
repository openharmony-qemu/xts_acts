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

export default function LongIsGreaterThanTest(): void {
  describe('LongIsGreaterThanTest', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const GT_NEG_100: long = -100;
    const GT_NEG_10: long = -10;
    const GT_NEG_5: long = -5;
    const GT_NEG_3: long = -3;
    const GT_NEG_2: long = -2;
    const GT_NEG_1: long = -1;
    const GT_0: long = 0;
    const GT_1: long = 1;
    const GT_2: long = 2;
    const GT_4: long = 4;
    const GT_5: long = 5;
    const GT_42: long = 42;
    const GT_100: long = 100;
    const GT_LARGE1: long = 100000000000;
    const GT_LARGE2: long = 200000000000;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_0100
     * @tc.name testLongIsGreaterThan001
     * @tc.desc Verify 5 > 4 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_5).isGreaterThan(new Long(GT_4));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_0200
     * @tc.name testLongIsGreaterThan002
     * @tc.desc Verify 4 > 5 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_4).isGreaterThan(new Long(GT_5));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_0300
     * @tc.name testLongIsGreaterThan003
     * @tc.desc Verify equal values 5 > 5 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_5).isGreaterThan(new Long(GT_5));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_0400
     * @tc.name testLongIsGreaterThan004
     * @tc.desc Verify positive > negative returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_1).isGreaterThan(new Long(GT_NEG_1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_0500
     * @tc.name testLongIsGreaterThan005
     * @tc.desc Verify negative > positive returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_NEG_1).isGreaterThan(new Long(GT_1));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_0600
     * @tc.name testLongIsGreaterThan006
     * @tc.desc Verify -3 > -10 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_NEG_3).isGreaterThan(new Long(GT_NEG_10));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_0700
     * @tc.name testLongIsGreaterThan007
     * @tc.desc Verify -10 > -3 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_NEG_10).isGreaterThan(new Long(GT_NEG_3));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_0800
     * @tc.name testLongIsGreaterThan008
     * @tc.desc Verify equal negatives -5 > -5 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_NEG_5).isGreaterThan(new Long(GT_NEG_5));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_0900
     * @tc.name testLongIsGreaterThan009
     * @tc.desc Verify 1 > 0 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_1).isGreaterThan(new Long(GT_0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_1000
     * @tc.name testLongIsGreaterThan010
     * @tc.desc Verify -1 > 0 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_NEG_1).isGreaterThan(new Long(GT_0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_1100
     * @tc.name testLongIsGreaterThan011
     * @tc.desc Verify 0 > 1 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_0).isGreaterThan(new Long(GT_1));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_1200
     * @tc.name testLongIsGreaterThan012
     * @tc.desc Verify 0 > -1 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_0).isGreaterThan(new Long(GT_NEG_1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_1300
     * @tc.name testLongIsGreaterThan013
     * @tc.desc Verify 0 > 0 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_0).isGreaterThan(new Long(GT_0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_1400
     * @tc.name testLongIsGreaterThan014
     * @tc.desc Verify 100 > -100 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_100).isGreaterThan(new Long(GT_NEG_100));
      expect(result).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_1500
     * @tc.name testLongIsGreaterThan015
     * @tc.desc Verify adjacent 2 > 1 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_2).isGreaterThan(new Long(GT_1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_1600
     * @tc.name testLongIsGreaterThan016
     * @tc.desc Verify -1 > -2 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_NEG_1).isGreaterThan(new Long(GT_NEG_2));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_1700
     * @tc.name testLongIsGreaterThan017
     * @tc.desc Verify -2 > -1 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_NEG_2).isGreaterThan(new Long(GT_NEG_1));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_1800
     * @tc.name testLongIsGreaterThan018
     * @tc.desc Verify 200000000000 > 100000000000 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(GT_LARGE2).isGreaterThan(new Long(GT_LARGE1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_1900
     * @tc.name testLongIsGreaterThan019
     * @tc.desc Verify MAX_VALUE > MIN_VALUE returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(Long.MAX_VALUE).isGreaterThan(new Long(Long.MIN_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN_2000
     * @tc.name testLongIsGreaterThan020
     * @tc.desc Verify self comparison (value > value) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(GT_42);
      const result: boolean = value.isGreaterThan(value);
      expect(result).assertFalse();
    });
  });
}
