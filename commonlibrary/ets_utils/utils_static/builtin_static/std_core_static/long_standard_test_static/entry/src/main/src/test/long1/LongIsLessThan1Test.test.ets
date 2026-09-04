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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function longIsLessThan1Test(): void {
  describe('LongIsLessThan1Test', (): void => {

    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN1_0100
     * @tc.name testLongIsLessThan1_001
     * @tc.desc Verify isLessThan() returns false when this is MAX_VALUE and other is MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MAX_VALUE);
      const b: Long = new Long(Long.MIN_VALUE);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN1_0200
     * @tc.name testLongIsLessThan1_002
     * @tc.desc Verify isLessThan() returns false when other is MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(9223372036854775806);
      const b: Long = new Long(Long.MIN_VALUE);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN1_0300
     * @tc.name testLongIsLessThan1_003
     * @tc.desc Verify isLessThan() returns false for equal negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(-1);
      const b: Long = new Long(-1);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN1_0400
     * @tc.name testLongIsLessThan1_004
     * @tc.desc Verify isLessThan() returns false for negative value compared to MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(-9999999999);
      const b: Long = new Long(Long.MIN_VALUE);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN1_0500
     * @tc.name testLongIsLessThan1_005
     * @tc.desc Verify isLessThan() returns true for adjacent multi-digit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(9999999999);
      const b: Long = new Long(10000000000);
      expect(a.isLessThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN1_0600
     * @tc.name testLongIsLessThan1_006
     * @tc.desc Verify isLessThan() returns true for small positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(5);
      const b: Long = new Long(10);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN1_0700
     * @tc.name testLongIsLessThan1_007
     * @tc.desc Verify isLessThan() returns true when this is zero and other is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(1);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN1_0800
     * @tc.name testLongIsLessThan1_008
     * @tc.desc Verify isLessThan() returns false when this exceeds other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(20000000000);
      let b: Long = new Long(10000000000);
      let result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN1_0900
     * @tc.name testLongIsLessThan1_009
     * @tc.desc Verify isLessThan() returns false when this is MAX_VALUE and other is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(9223372036854775807);
      const b: Long = new Long(-9223372036854775807);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN1_1000
     * @tc.name testLongIsLessThan1_010
     * @tc.desc Verify isLessThan() returns true for default-constructed value compared to positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long();
      const b: Long = new Long(1);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN1_1100
     * @tc.name testLongIsLessThan1_011
     * @tc.desc Verify isLessThan() returns false for default-constructed value compared to negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long();
      const b: Long = new Long(-1);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN1_1200
     * @tc.name testLongIsLessThan1_012
     * @tc.desc Verify isLessThan() returns true at 2^61 precision boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2305843009213693951);
      const b: Long = new Long(2305843009213693952);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSTHAN1_1300
     * @tc.name testLongIsLessThan1_013
     * @tc.desc Verify isLessThan() returns true at 2^60 precision boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessThan1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(1152921504606846975);
      const b: Long = new Long(1152921504606846976);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

  });
}
