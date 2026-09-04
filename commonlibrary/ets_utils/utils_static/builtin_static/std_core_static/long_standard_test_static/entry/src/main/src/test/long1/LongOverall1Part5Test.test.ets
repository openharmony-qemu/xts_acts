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

export default function longOverall1Part5Test(): void {
  describe('LongOverall1Part5Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART5_0100
     * @tc.name testLongOverall1Part5_001
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven not ordered before or equal to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part5_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(0);
      expect(a.isLessEqualThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART5_0200
     * @tc.name testLongOverall1Part5_002
     * @tc.desc Verify zero not ordered after zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part5_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(0);
      expect(a.isGreaterThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART5_0300
     * @tc.name testLongOverall1Part5_003
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven ordered after zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part5_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(0);
      expect(a.isGreaterThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART5_0400
     * @tc.name testLongOverall1Part5_004
     * @tc.desc Verify zero not ordered after two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part5_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(2147483647);
      expect(a.isGreaterThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART5_0500
     * @tc.name testLongOverall1Part5_005
     * @tc.desc Verify zero ordered after or equal to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part5_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(0);
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART5_0600
     * @tc.name testLongOverall1Part5_006
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven ordered after or equal to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part5_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(0);
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART5_0700
     * @tc.name testLongOverall1Part5_007
     * @tc.desc Verify zero not ordered after or equal to two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part5_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(2147483647);
      expect(a.isGreaterEqualThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART5_0800
     * @tc.name testLongOverall1Part5_008
     * @tc.desc Verify binary string 0 parsed as Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part5_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: long = Long.parseInt("0", 2);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART5_0900
     * @tc.name testLongOverall1Part5_009
     * @tc.desc Verify decimal string 2147483647 parsed as Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part5_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: long = Long.parseInt("2147483647", 10);
      expect(r).assertEqual(2147483647);
    });
  });
}
