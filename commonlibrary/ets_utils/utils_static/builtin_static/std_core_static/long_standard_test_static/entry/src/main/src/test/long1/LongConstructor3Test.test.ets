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

export default function longConstructor3Test(): void {
  describe('LongConstructor3Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_0100
     * @tc.name testLongConstructor3_001
     * @tc.desc Verify default Long toString(35) returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long();
      expect(v.toString(35)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_0200
     * @tc.name testLongConstructor3_002
     * @tc.desc Verify default Long toString(36) returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long();
      expect(v.toString(36)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_0300
     * @tc.name testLongConstructor3_003
     * @tc.desc Verify toString with radix 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long();
      try {
        v.toString(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_0400
     * @tc.name testLongConstructor3_004
     * @tc.desc Verify Long.toString(0) static returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toString(0)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_0500
     * @tc.name testLongConstructor3_005
     * @tc.desc Verify two default Long objects are equal via equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long();
      const b: Long = new Long();
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_0600
     * @tc.name testLongConstructor3_006
     * @tc.desc Verify default Long.equals("0") returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long();
      expect(v.equals("0")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_0700
     * @tc.name testLongConstructor3_007
     * @tc.desc Verify default Long.equals(0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long();
      expect(v.equals(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_0800
     * @tc.name testLongConstructor3_008
     * @tc.desc Verify default Long(0) is not equal to Long(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long();
      expect(v.equals(new Long(1))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_0900
     * @tc.name testLongConstructor3_009
     * @tc.desc Verify default Long(0) is not equal to Long(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long();
      expect(v.equals(new Long(-1))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_1000
     * @tc.name testLongConstructor3_010
     * @tc.desc Verify default Long(0) is not equal to Long(MAX_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long();
      expect(v.equals(new Long(Long.MAX_VALUE))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_1100
     * @tc.name testLongConstructor3_011
     * @tc.desc Verify 0 + Long.MIN_VALUE equals Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long();
      expect(v.add(new Long(Long.MIN_VALUE)).toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_1200
     * @tc.name testLongConstructor3_012
     * @tc.desc Verify default Long constructor creates value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long();
      const b: Long = new Long();
      expect(a.toLong()).assertEqual(0);
      expect(b.toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_1300
     * @tc.name testLongConstructor3_013
     * @tc.desc Verify API does not mutate original Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long();
      expect(v.sub(new Long(1)).add(new Long(1)).toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_1400
     * @tc.name testLongConstructor3_014
     * @tc.desc Verify Long(35).toString(36) returns 'z'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(35);
      expect(v.toString(36)).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_1500
     * @tc.name testLongConstructor3_015
     * @tc.desc Verify Long(-1).toString(2) returns 64-bit two's complement string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(-1);
      expect(v.toString(2)).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_1600
     * @tc.name testLongConstructor3_016
     * @tc.desc Verify two Long(0) objects are equal via equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(0);
      let v2: Long = new Long(0);
      expect(v1.equals(v2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_1700
     * @tc.name testLongConstructor3_017
     * @tc.desc Verify two Long(42) objects are equal via equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(42);
      let v2: Long = new Long(42);
      expect(v1.equals(v2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_1800
     * @tc.name testLongConstructor3_018
     * @tc.desc Verify two Long(-1) objects are equal via equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(-1);
      let v2: Long = new Long(-1);
      expect(v1.equals(v2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_1900
     * @tc.name testLongConstructor3_019
     * @tc.desc Verify Long(42) is not equal to Long(-42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(42);
      let v2: Long = new Long(-42);
      expect(v1.equals(v2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_2000
     * @tc.name testLongConstructor3_020
     * @tc.desc Verify Long(97).toChar() equals 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(97);
      let r: char = v.toChar();
      expect(r.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_2100
     * @tc.name testLongConstructor3_021
     * @tc.desc Verify Long(65535).toChar() equals '\xFFFF'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(65535);
      let r: char = v.toChar();
      expect(r.toString()).assertEqual("￿");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_2200
     * @tc.name testLongConstructor3_022
     * @tc.desc Verify toString with radix 1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(42);
      try {
        v.toString(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_2300
     * @tc.name testLongConstructor3_023
     * @tc.desc Verify toString(radix=37) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(42);
      try {
        v.toString(37);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_2400
     * @tc.name testLongConstructor3_024
     * @tc.desc Verify toString(radix=0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(255);
      try {
        v.toString(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_2500
     * @tc.name testLongConstructor3_025
     * @tc.desc Verify Long(-10000000000).toString() returns '-10000000000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(-10000000000);
      expect(v.toString()).assertEqual("-10000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_2600
     * @tc.name testLongConstructor3_026
     * @tc.desc Verify Long(127).toString() returns '127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(127);
      expect(v.toString()).assertEqual("127");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_2700
     * @tc.name testLongConstructor3_027
     * @tc.desc Verify default Long().equals(Long(0)) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Long();
      const v2 = new Long(0);
      expect(v1.equals(v2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_2800
     * @tc.name testLongConstructor3_028
     * @tc.desc Verify Long(42) is not equal to Long(43)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Long(42);
      const v2 = new Long(43);
      expect(v1.equals(v2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_2900
     * @tc.name testLongConstructor3_029
     * @tc.desc Verify two Long(MAX_VALUE) objects are equal via equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Long(9223372036854775807);
      const v2 = new Long(9223372036854775807);
      expect(v1.equals(v2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_3000
     * @tc.name testLongConstructor3_030
     * @tc.desc Verify two Long(MIN_VALUE) objects are equal via equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Long(Long.MIN_VALUE);
      const v2 = new Long(Long.MIN_VALUE);
      expect(v1.equals(v2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_3100
     * @tc.name testLongConstructor3_031
     * @tc.desc Verify compareTo returns less than 0 for MIN_VALUE vs -9223372036854775807
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Long(Long.MIN_VALUE);
      const v2 = new Long(-9223372036854775807);
      expect(v1.compareTo(v2)).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_3200
     * @tc.name testLongConstructor3_032
     * @tc.desc Verify compareTo returns 0 for two equal Long(MIN_VALUE) objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Long(Long.MIN_VALUE);
      const v2 = new Long(Long.MIN_VALUE);
      expect(v1.compareTo(v2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR3_3300
     * @tc.name testLongConstructor3_033
     * @tc.desc Verify Long(4294967295).toLong() returns 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongConstructor3_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(4294967295);
      expect(v.toLong()).assertEqual(4294967295);
    });
  });
}
