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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongIsLessThanTest(): void {
  describe('LongIsLessThanTest', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const LT_NEG_100: long = -100;
    const LT_NEG_10: long = -10;
    const LT_NEG_5: long = -5;
    const LT_NEG_3: long = -3;
    const LT_NEG_2: long = -2;
    const LT_NEG_1: long = -1;
    const LT_0: long = 0;
    const LT_1: long = 1;
    const LT_2: long = 2;
    const LT_3: long = 3;
    const LT_4: long = 4;
    const LT_42: long = 42;
    const LT_100: long = 100;
    const LT_LARGE1: long = 100000000000;
    const LT_LARGE2: long = 200000000000;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_0100
     * @tc.name testLongIsLessThan001
     * @tc.desc Verify 3 < 4 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_3).isLessThan(new Long(LT_4));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_0200
     * @tc.name testLongIsLessThan002
     * @tc.desc Verify 4 < 3 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_4).isLessThan(new Long(LT_3));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_0300
     * @tc.name testLongIsLessThan003
     * @tc.desc Verify equal values 3 < 3 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_3).isLessThan(new Long(LT_3));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_0400
     * @tc.name testLongIsLessThan004
     * @tc.desc Verify -10 < -3 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_NEG_10).isLessThan(new Long(LT_NEG_3));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_0500
     * @tc.name testLongIsLessThan005
     * @tc.desc Verify -3 < -10 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_NEG_3).isLessThan(new Long(LT_NEG_10));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_0600
     * @tc.name testLongIsLessThan006
     * @tc.desc Verify equal negatives -5 < -5 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_NEG_5).isLessThan(new Long(LT_NEG_5));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_0700
     * @tc.name testLongIsLessThan007
     * @tc.desc Verify 0 < 1 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_0).isLessThan(new Long(LT_1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_0800
     * @tc.name testLongIsLessThan008
     * @tc.desc Verify 0 < -1 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_0).isLessThan(new Long(LT_NEG_1));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_0900
     * @tc.name testLongIsLessThan009
     * @tc.desc Verify 1 < 0 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_1).isLessThan(new Long(LT_0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_1000
     * @tc.name testLongIsLessThan010
     * @tc.desc Verify -1 < 0 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_NEG_1).isLessThan(new Long(LT_0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_1100
     * @tc.name testLongIsLessThan011
     * @tc.desc Verify 0 < 0 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_0).isLessThan(new Long(LT_0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_1200
     * @tc.name testLongIsLessThan012
     * @tc.desc Verify -100 < 100 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_NEG_100).isLessThan(new Long(LT_100));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_1300
     * @tc.name testLongIsLessThan013
     * @tc.desc Verify 100 < -100 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_100).isLessThan(new Long(LT_NEG_100));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_1400
     * @tc.name testLongIsLessThan014
     * @tc.desc Verify 100000000000 < 200000000000 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_LARGE1).isLessThan(new Long(LT_LARGE2));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_1500
     * @tc.name testLongIsLessThan015
     * @tc.desc Verify 200000000000 < 100000000000 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_LARGE2).isLessThan(new Long(LT_LARGE1));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_1600
     * @tc.name testLongIsLessThan016
     * @tc.desc Verify adjacent 1 < 2 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_1).isLessThan(new Long(LT_2));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_1700
     * @tc.name testLongIsLessThan017
     * @tc.desc Verify adjacent -2 < -1 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_NEG_2).isLessThan(new Long(LT_NEG_1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_1800
     * @tc.name testLongIsLessThan018
     * @tc.desc Verify adjacent -1 < -2 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LT_NEG_1).isLessThan(new Long(LT_NEG_2));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_1900
     * @tc.name testLongIsLessThan019
     * @tc.desc Verify MIN_VALUE < MAX_VALUE returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(Long.MIN_VALUE).isLessThan(new Long(Long.MAX_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN_2000
     * @tc.name testLongIsLessThan020
     * @tc.desc Verify self comparison (value < value) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LT_42);
      const result: boolean = value.isLessThan(value);
      expect(result).assertFalse();
    });
  });
}
