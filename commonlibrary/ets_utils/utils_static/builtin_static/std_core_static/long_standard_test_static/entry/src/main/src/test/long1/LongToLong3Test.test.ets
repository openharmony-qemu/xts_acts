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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function longToLong3Test(): void {
  describe('LongToLong3Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_0100
     * @tc.name testLongToLong3_001
     * @tc.desc Verify toLong converts zero value 0x0 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toLong(0x0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_0200
     * @tc.name testLongToLong3_002
     * @tc.desc Verify toLong converts smallest positive value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toLong(0x1)).assertEqual(0x1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_0300
     * @tc.name testLongToLong3_003
     * @tc.desc Verify toLong converts byte max value 0xFF to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toLong(0xff)).assertEqual(0xff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_0400
     * @tc.name testLongToLong3_004
     * @tc.desc Verify toLong converts short max value 0xFFFF to 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toLong(0xffff)).assertEqual(0xffff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_0500
     * @tc.name testLongToLong3_005
     * @tc.desc Verify toLong converts int max value 0x7FFFFFFF to 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toLong(0x7fffffff)).assertEqual(0x7fffffff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_0600
     * @tc.name testLongToLong3_006
     * @tc.desc Verify toLong converts int min overflow value 0x80000000 to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toLong(0x80000000)).assertEqual(0x80000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_0700
     * @tc.name testLongToLong3_007
     * @tc.desc Verify toLong converts negative boundary value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toLong(-1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_0800
     * @tc.name testLongToLong3_008
     * @tc.desc Verify toLong converts value beyond int32 range 0x100000000 to 4294967296
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toLong(0x100000000)).assertEqual(0x100000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_0900
     * @tc.name testLongToLong3_009
     * @tc.desc Verify toLong converts negative value -987654321
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toLong(-987654321)).assertEqual(-987654321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_1000
     * @tc.name testLongToLong3_010
     * @tc.desc Verify toLong converts large positive value 1000000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toLong(1000000001)).assertEqual(1000000001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_1100
     * @tc.name testLongToLong3_011
     * @tc.desc Verify bitwise AND on toLong result returns 0xF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Long.toLong(0xff) & 0xf;
      expect(result).assertEqual(0xf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_1200
     * @tc.name testLongToLong3_012
     * @tc.desc Verify bitwise OR on toLong result returns 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Long.toLong(0xf) | 0xf0;
      expect(result).assertEqual(0xff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_1300
     * @tc.name testLongToLong3_013
     * @tc.desc Verify toLong converts byte max boundary 0x7F to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(0x7f);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_1400
     * @tc.name testLongToLong3_014
     * @tc.desc Verify toLong converts byte sign flip boundary 0x80 to 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(0x80);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_1500
     * @tc.name testLongToLong3_015
     * @tc.desc Verify toLong converts short max boundary 0x7FFF to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(0x7fff);
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_1600
     * @tc.name testLongToLong3_016
     * @tc.desc Verify toLong converts short sign flip boundary 0x8000 to 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(0x8000);
      expect(result).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_1700
     * @tc.name testLongToLong3_017
     * @tc.desc Verify toLong does not mutate original Long value (Long(42))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l: Long = new Long(42);
      const orig: long = l.toLong();
      l.toLong();
      expect(l.toLong()).assertEqual(orig);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_1800
     * @tc.name testLongToLong3_018
     * @tc.desc Verify toLong does not mutate Long.MAX_VALUE value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l: Long = new Long(Long.MAX_VALUE);
      l.toLong();
      expect(l.equals(new Long(Long.MAX_VALUE))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG3_1900
     * @tc.name testLongToLong3_019
     * @tc.desc Verify toLong does not mutate Long.MIN_VALUE verified by compareTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLong3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l: Long = new Long(Long.MIN_VALUE);
      l.toLong();
      expect(l.compareTo(new Long(Long.MIN_VALUE))).assertEqual(0);
    });
  });
}
