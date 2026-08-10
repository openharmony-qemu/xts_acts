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

export default function longCompareTo1Test(): void {
  describe('LongCompareTo1Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARETO1_0100
     * @tc.name testLongCompareTo1_001
     * @tc.desc Verify compareTo returns 0 for equal Long.MIN_VALUE operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongCompareTo1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MIN_VALUE);
      const b: Long = new Long(Long.MIN_VALUE);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARETO1_0200
     * @tc.name testLongCompareTo1_002
     * @tc.desc Verify compareTo returns 1 when zero compares greater than Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongCompareTo1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(Long.MIN_VALUE);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARETO1_0300
     * @tc.name testLongCompareTo1_003
     * @tc.desc Verify compareTo returns 1 when MAX_VALUE-1 compares greater than Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongCompareTo1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(9223372036854775806).compareTo(new Long(Long.MIN_VALUE));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARETO1_0400
     * @tc.name testLongCompareTo1_004
     * @tc.desc Verify compareTo does not mutate original Long operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongCompareTo1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(-5);
      const b = new Long(-3);
      a.compareTo(b);
      const unchanged = a.compareTo(new Long(-5));
      expect(unchanged).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARETO1_0500
     * @tc.name testLongCompareTo1_005
     * @tc.desc Verify compareTo returns consistent results for boundary operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongCompareTo1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(9223372036854775807);
      const b = new Long(Long.MIN_VALUE);
      const r1 = a.compareTo(b);
      const r2 = a.compareTo(b);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARETO1_0600
     * @tc.name testLongCompareTo1_006
     * @tc.desc Verify compareTo returns consistent results for opposite sign operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongCompareTo1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(-9999);
      const b = new Long(9999);
      const r1 = a.compareTo(b);
      const r2 = a.compareTo(b);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARETO1_0700
     * @tc.name testLongCompareTo1_007
     * @tc.desc Verify compareTo antisymmetry for boundary operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongCompareTo1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(Long.MIN_VALUE);
      const b = new Long(9223372036854775807);
      const ab = a.compareTo(b);
      const ba = b.compareTo(a);
      expect(ab).assertEqual(-ba);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARETO1_0800
     * @tc.name testLongCompareTo1_008
     * @tc.desc Verify compareTo antisymmetry for adjacent negative operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongCompareTo1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(-9999);
      const b = new Long(-9998);
      const ab = a.compareTo(b);
      const ba = b.compareTo(a);
      expect(ab).assertEqual(-ba);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARETO1_0900
     * @tc.name testLongCompareTo1_009
     * @tc.desc Verify compareTo returns -1 for negative Long versus positive Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongCompareTo1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(-1);
      let b: Long = new Long(-(-1));
      let result: int = a.compareTo(b);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARETO1_1000
     * @tc.name testLongCompareTo1_010
     * @tc.desc Verify compareTo returns 1 for int boundary operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongCompareTo1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(2147483647);
      let b: Long = new Long(-2147483648);
      let result: int = a.compareTo(b);
      expect(result).assertEqual(1);
    });
  });
}
