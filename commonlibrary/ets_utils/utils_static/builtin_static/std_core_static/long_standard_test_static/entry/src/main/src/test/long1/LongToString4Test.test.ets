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

export default function longToString4Test(): void {
  describe('LongToString4Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSTRING4_0100
     * @tc.name testLongToString4_001
     * @tc.desc Verify toString() converts multi-digit positive Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToString4_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = Long.toString(987654321098765432);
      expect(result).assertEqual('987654321098765432');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSTRING4_0200
     * @tc.name testLongToString4_002
     * @tc.desc Verify toString() converts multi-digit negative Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToString4_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = Long.toString(-987654321098765432);
      expect(result).assertEqual('-987654321098765432');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSTRING4_0300
     * @tc.name testLongToString4_003
     * @tc.desc Verify toString() converts Long.MAX_VALUE to digit string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToString4_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = Long.toString(Long.MAX_VALUE);
      expect(s.indexOf('922337')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSTRING4_0400
     * @tc.name testLongToString4_004
     * @tc.desc Verify toString() converts negative value to signed string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToString4_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = Long.toString(-999);
      expect(s1).assertEqual('-999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSTRING4_0500
     * @tc.name testLongToString4_005
     * @tc.desc Verify toString() returns digits-only string without scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToString4_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = Long.toString(1000000);
      expect(s).assertEqual('1000000');
      expect(s.indexOf('e')).assertEqual(-1);
      expect(s.indexOf('E')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSTRING4_0600
     * @tc.name testLongToString4_006
     * @tc.desc Verify toString() of MIN_VALUE+1 equals negative of MAX_VALUE string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToString4_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxStr: string = Long.toString(Long.MAX_VALUE);
      let minPlus1Str: string = Long.toString(Long.MIN_VALUE + 1);
      expect(minPlus1Str).assertEqual('-' + maxStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSTRING4_0700
     * @tc.name testLongToString4_007
     * @tc.desc Verify toString() of negative value minus sign equals positive string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToString4_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toString(-128).substring(1)).assertEqual(Long.toString(128));
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSTRING4_0800
     * @tc.name testLongToString4_008
     * @tc.desc Verify toString() converts 19-digit positive Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToString4_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = Long.toString(5000000000000000000);
      expect(r).assertEqual('5000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSTRING4_0900
     * @tc.name testLongToString4_009
     * @tc.desc Verify toString() converts 10-digit positive Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToString4_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = Long.toString(1234567890);
      expect(r).assertEqual('1234567890');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSTRING4_1000
     * @tc.name testLongToString4_010
     * @tc.desc Verify static Long.toString() converts Long.MAX_VALUE to exact string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToString4_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = Long.toString(Long.MAX_VALUE);
      expect(r1).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSTRING4_1100
     * @tc.name testLongToString4_011
     * @tc.desc Verify static Long.toString() converts zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToString4_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = Long.toString(0);
      expect(r1).assertEqual('0');
    });

  });
}
