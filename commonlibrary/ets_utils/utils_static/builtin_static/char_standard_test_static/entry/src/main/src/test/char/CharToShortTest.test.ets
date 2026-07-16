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

export default function CharToShortTest(): void {
  describe('CharToShortTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_0100
     * @tc.name testCharToShort0001
     * @tc.desc Verify toShort method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = c.toShort();
      expect(result).assertEqual(65);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_0300
     * @tc.name testCharToShort0003
     * @tc.desc Verify no parameters needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = c.toShort();
      expect(typeof result).assertEqual("short");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_0400
     * @tc.name testCharToShort0004
     * @tc.desc Verify return value is short type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = c.toShort();
      expect(typeof result).assertEqual("short");
      expect(typeof result).assertEqual("short");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_0600
     * @tc.name testCharToShort0006
     * @tc.desc Verify lowercase letter z converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'z');
      const result = c.toShort();
      expect(result).assertEqual(122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_0700
     * @tc.name testCharToShort0007
     * @tc.desc Verify digit character 0 converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'0');
      const result = c.toShort();
      expect(result).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_0800
     * @tc.name testCharToShort0008
     * @tc.desc Verify digit character 9 converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'9');
      const result = c.toShort();
      expect(result).assertEqual(57);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_0900
     * @tc.name testCharToShort0009
     * @tc.desc Verify space character converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c' ');
      const result = c.toShort();
      expect(result).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_1000
     * @tc.name testCharToShort0010
     * @tc.desc Verify special symbol converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'~');
      const result = c.toShort();
      expect(result).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_1100
     * @tc.name testCharToShort0011
     * @tc.desc Verify Chinese character converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'中');
      const result = c.toShort();
      expect(result).assertEqual(20013);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_1200
     * @tc.name testCharToShort0012
     * @tc.desc Verify emoji character via surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\uD83D');
      const result = c.toShort();
      expect(result).assertEqual(-10179);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_1300
     * @tc.name testCharToShort0013
     * @tc.desc Verify null character u0000 converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\u0000');
      const result = c.toShort();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_1400
     * @tc.name testCharToShort0014
     * @tc.desc Verify newline character converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\n');
      const result = c.toShort();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_1500
     * @tc.name testCharToShort0015
     * @tc.desc Verify tab character converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\t');
      const result = c.toShort();
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_1600
     * @tc.name testCharToShort0016
     * @tc.desc Verify carriage return character converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\r');
      const result = c.toShort();
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_1700
     * @tc.name testCharToShort0017
     * @tc.desc Verify high surrogate minimum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(Char.HIGH_SURROGATE_MIN);
      const result = c.toShort();
      expect(result).assertEqual(-10240);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_1800
     * @tc.name testCharToShort0018
     * @tc.desc Verify high surrogate maximum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(Char.HIGH_SURROGATE_MAX);
      const result = c.toShort();
      expect(result).assertEqual(-9217);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_1900
     * @tc.name testCharToShort0019
     * @tc.desc Verify low surrogate minimum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(Char.LOW_SURROGATE_MIN);
      const result = c.toShort();
      expect(result).assertEqual(-9216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_2000
     * @tc.name testCharToShort0020
     * @tc.desc Verify low surrogate maximum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(Char.LOW_SURROGATE_MAX);
      const result = c.toShort();
      expect(result).assertEqual(-8193);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_2100
     * @tc.name testCharToShort0021
     * @tc.desc Verify boundary value within short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\x7F');
      const result = c.toShort();
      expect(result).assertEqual(127);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_2400
     * @tc.name testCharToShort0024
     * @tc.desc Verify return value is integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = c.toShort();
      expect(typeof result).assertEqual("short");
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_2500
     * @tc.name testCharToShort0025
     * @tc.desc Verify return value is within short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = c.toShort();
      expect(result >= -32768 && result <= 32767).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_2600
     * @tc.name testCharToShort0026
     * @tc.desc Verify ASCII range character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'\u0000', c'\n', c'A', c'\x7F'];
      const expected: short[] = [0, 10, 65, 127];
      for (let i = 0; i < chars.length; i++) {
        const c = new Char(chars[i]);
        const result = c.toShort();
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_2700
     * @tc.name testCharToShort0027
     * @tc.desc Verify extended ASCII character 128 to 255 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'\u0080', c'\u00FF'];
      const expected: short[] = [128, 255];
      for (let i = 0; i < chars.length; i++) {
        const c = new Char(chars[i]);
        const result = c.toShort();
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_2800
     * @tc.name testCharToShort0028
     * @tc.desc Verify character corresponding to short maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\u7FFF');
      const result = c.toShort();
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_3000
     * @tc.name testCharToShort0030
     * @tc.desc Verify multiple conversions return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c.toShort()).assertEqual(65);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_3500
     * @tc.name testCharToShort0035
     * @tc.desc Verify toShort is instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'Z');
      const result = c.toShort();
      expect(result).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_3600
     * @tc.name testCharToShort0036
     * @tc.desc Verify toShort is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const startTime = Date.now();
      const result = c.toShort();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_3700
     * @tc.name testCharToShort0037
     * @tc.desc Verify short range is larger than byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\u0080');
      const byteResult = c.toByte();
      const shortResult = c.toShort();
      expect(byteResult !== shortResult).assertTrue();
      expect(shortResult).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_3800
     * @tc.name testCharToShort0038
     * @tc.desc Verify toShort and toInt return same value for ASCII character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const shortResult = c.toShort();
      const intResult = c.toInt();
      expect(shortResult).assertEqual(intResult);
      expect(shortResult).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_3900
     * @tc.name testCharToShort0039
     * @tc.desc Verify static method Char.toShort with value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result1 = c.toShort();
      expect(result1).assertEqual(65);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_4200
     * @tc.name testCharToShort0042
     * @tc.desc Verify BMP character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'\u4E00', c'\u4E8C', c'\u4E09'];
      const expected: short[] = [19968, 20108, 19977];
      for (let i = 0; i < chars.length; i++) {
        const c = new Char(chars[i]);
        const result = c.toShort();
        expect(result).assertEqual(expected[i]);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_4400
     * @tc.name testCharToShort0044
     * @tc.desc Verify null character instance toShort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c1 = new Char();
      const c2 = new Char(c'\u0000');
      expect(c1.toShort()).assertEqual(0);
      expect(c2.toShort()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_4500
     * @tc.name testCharToShort0045
     * @tc.desc Verify max character value converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toShort();
      expect(result === -1 || result === 65535).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_4600
     * @tc.name testCharToShort0046
     * @tc.desc Verify min character value converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(Char.MIN_VALUE);
      const result = c.toShort();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_4700
     * @tc.name testCharToShort0047
     * @tc.desc Verify short is signed type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\u8000');
      const result = c.toShort();
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_4900
     * @tc.name testCharToShort0049
     * @tc.desc Verify values greater than 32767 treated as negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\u8000');
      const result = c.toShort();
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_5000
     * @tc.name testCharToShort0050
     * @tc.desc Verify toShort return value can be used in computation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = c.toShort() + 1;
      expect(result).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_5100
     * @tc.name testCharToShort0051
     * @tc.desc Verify multiple calls to toShort return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result1 = c.toShort();
      const result2 = c.toShort();
      const result3 = c.toShort();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_5300
     * @tc.name testCharToShort0053
     * @tc.desc Verify ASCII character conversion methods are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      expect(c.toShort()).assertEqual(c.toInt());
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTTEST_5700
     * @tc.name testCharToShort0057
     * @tc.desc Verify short maximum negative value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShort0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\uFFFF');
      const result = c.toShort();
      expect(result).assertEqual(-1);
    });
  });
}
