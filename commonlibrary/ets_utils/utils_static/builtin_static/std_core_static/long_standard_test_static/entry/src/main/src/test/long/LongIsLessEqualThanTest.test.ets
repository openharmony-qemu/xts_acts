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

export default function LongIsLessEqualThanTest(): void {
  describe('LongIsLessEqualThanTest', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const LE_NEG_10: long = -10;
    const LE_NEG_5: long = -5;
    const LE_NEG_3: long = -3;
    const LE_NEG_1: long = -1;
    const LE_0: long = 0;
    const LE_1: long = 1;
    const LE_3: long = 3;
    const LE_4: long = 4;
    const LE_5: long = 5;
    const LE_10: long = 10;
    const LE_42: long = 42;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_0100
     * @tc.name testLongIsLessEqualThan001
     * @tc.desc Verify 4 <= 4 returns true for equal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LE_4).isLessEqualThan(new Long(LE_4));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_0200
     * @tc.name testLongIsLessEqualThan002
     * @tc.desc Verify 3 <= 5 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LE_3).isLessEqualThan(new Long(LE_5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_0300
     * @tc.name testLongIsLessEqualThan003
     * @tc.desc Verify 5 <= 3 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LE_5).isLessEqualThan(new Long(LE_3));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_0400
     * @tc.name testLongIsLessEqualThan004
     * @tc.desc Verify negative <= positive returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LE_NEG_5).isLessEqualThan(new Long(LE_10));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_0500
     * @tc.name testLongIsLessEqualThan005
     * @tc.desc Verify equal negatives -10 <= -10 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LE_NEG_10).isLessEqualThan(new Long(LE_NEG_10));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_0600
     * @tc.name testLongIsLessEqualThan006
     * @tc.desc Verify -3 <= -5 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LE_NEG_3).isLessEqualThan(new Long(LE_NEG_5));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_0700
     * @tc.name testLongIsLessEqualThan007
     * @tc.desc Verify 0 <= 0 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LE_0).isLessEqualThan(new Long(LE_0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_0800
     * @tc.name testLongIsLessEqualThan008
     * @tc.desc Verify both default constructors 0 <= 0 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long().isLessEqualThan(new Long());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_0900
     * @tc.name testLongIsLessEqualThan009
     * @tc.desc Verify self comparison returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LE_42);
      const result: boolean = value.isLessEqualThan(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_1000
     * @tc.name testLongIsLessEqualThan010
     * @tc.desc Verify a<=b and b<=a both true when a==b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(LE_5);
      const b: Long = new Long(LE_5);
      expect(a.isLessEqualThan(b)).assertTrue();
      expect(b.isLessEqualThan(a)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_1100
     * @tc.name testLongIsLessEqualThan011
     * @tc.desc Verify 0 <= 1 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LE_0).isLessEqualThan(new Long(LE_1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_1200
     * @tc.name testLongIsLessEqualThan012
     * @tc.desc Verify 0 <= -1 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LE_0).isLessEqualThan(new Long(LE_NEG_1));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_1300
     * @tc.name testLongIsLessEqualThan013
     * @tc.desc Verify -1 <= 0 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LE_NEG_1).isLessEqualThan(new Long(LE_0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_1400
     * @tc.name testLongIsLessEqualThan014
     * @tc.desc Verify 1 <= 0 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LE_1).isLessEqualThan(new Long(LE_0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_1500
     * @tc.name testLongIsLessEqualThan015
     * @tc.desc Verify -10 <= -5 returns true (more negative <= less negative)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(LE_NEG_10).isLessEqualThan(new Long(LE_NEG_5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_1600
     * @tc.name testLongIsLessEqualThan016
     * @tc.desc Verify MIN_VALUE <= MAX_VALUE returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(Long.MIN_VALUE).isLessEqualThan(new Long(Long.MAX_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_1700
     * @tc.name testLongIsLessEqualThan017
     * @tc.desc Verify MAX_VALUE <= MAX_VALUE returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(Long.MAX_VALUE).isLessEqualThan(new Long(Long.MAX_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN_1800
     * @tc.name testLongIsLessEqualThan018
     * @tc.desc Verify MIN_VALUE <= MIN_VALUE returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(Long.MIN_VALUE).isLessEqualThan(new Long(Long.MIN_VALUE));
      expect(result).assertTrue();
    });

  });
}
