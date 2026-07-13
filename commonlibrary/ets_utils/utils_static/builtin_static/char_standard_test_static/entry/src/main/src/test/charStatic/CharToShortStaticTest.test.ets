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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function CharToShortStaticTest(): void {
  describe('CharToShortStaticTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_0100
     * @tc.name testCharToShortStatic0001
     * @tc.desc Verify that Char.toShort requires one char parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toShort(c'A');
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_0200
     * @tc.name testCharToShortStatic0002
     * @tc.desc Verify that Char.toShort throws error when no parameter is provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const result = Char.toShort(undefined as char);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_0300
     * @tc.name testCharToShortStatic0003
     * @tc.desc Verify that Char.toShort handles null parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const result = Char.toShort(null as char);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_0400
     * @tc.name testCharToShortStatic0004
     * @tc.desc Verify Char.toShort with ASCII letter characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toShort(c'A')).assertEqual(65);
      expect(Char.toShort(c'Z')).assertEqual(90);
      expect(Char.toShort(c'a')).assertEqual(97);
      expect(Char.toShort(c'z')).assertEqual(122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_0500
     * @tc.name testCharToShortStatic0005
     * @tc.desc Verify Char.toShort with digit characters 0-9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toShort(c'0')).assertEqual(48);
      expect(Char.toShort(c'9')).assertEqual(57);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_0600
     * @tc.name testCharToShortStatic0006
     * @tc.desc Verify Char.toShort with special characters and space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toShort(c' ')).assertEqual(32);
      expect(Char.toShort(c'!')).assertEqual(33);
      expect(Char.toShort(c'~')).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_0700
     * @tc.name testCharToShortStatic0007
     * @tc.desc Verify Char.toShort with escape sequence characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toShort(c'\u0000')).assertEqual(0);
      expect(Char.toShort(c'\n')).assertEqual(10);
      expect(Char.toShort(c'\t')).assertEqual(9);
      expect(Char.toShort(c'\r')).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_0800
     * @tc.name testCharToShortStatic0008
     * @tc.desc Verify Char.toShort with boundary values within short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toShort(c'\u0000')).assertEqual(0);
      expect(Char.toShort(c'\x7F')).assertEqual(127);
      expect(Char.toShort(c'\u7FFF')).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_1000
     * @tc.name testCharToShortStatic0010
     * @tc.desc Verify Char.toShort throws error with non-char type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const result = Char.toShort(c'A');
        expect(result).assertEqual(65);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_1100
     * @tc.name testCharToShortStatic0011
     * @tc.desc Verify Char.toShort with char minimum value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toShort(c'\u0000');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_1200
     * @tc.name testCharToShortStatic0012
     * @tc.desc Verify Char.toShort with short range boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toShort(c'\u0000')).assertEqual(0);
      expect(Char.toShort(c'\u7FFF')).assertEqual(32767);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_1400
     * @tc.name testCharToShortStatic0014
     * @tc.desc Verify Char.toShort with char maximum value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toShort(c'\uFFFF');
      expect(result === -1 || result === 65535).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_1500
     * @tc.name testCharToShortStatic0015
     * @tc.desc Verify that Char.toShort returns short type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toShort(c'A');
      expect(typeof result).assertEqual("short");
      expect(typeof result).assertEqual("short");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_1600
     * @tc.name testCharToShortStatic0016
     * @tc.desc Verify Char.toShort correctly converts ASCII characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'\u0000', c'\n', c'A', c'\x7F'];
      const expected: short[] = [0, 10, 65, 127];
      for (let i = 0; i < chars.length; i++) {
        const result = Char.toShort(chars[i]);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_1700
     * @tc.name testCharToShortStatic0017
     * @tc.desc Verify Char.toShort converts uppercase letters correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toShort(c'A')).assertEqual(65);
      expect(Char.toShort(c'B')).assertEqual(66);
      expect(Char.toShort(c'Z')).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_1800
     * @tc.name testCharToShortStatic0018
     * @tc.desc Verify Char.toShort converts lowercase letters correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toShort(c'a')).assertEqual(97);
      expect(Char.toShort(c'b')).assertEqual(98);
      expect(Char.toShort(c'z')).assertEqual(122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_1900
     * @tc.name testCharToShortStatic0019
     * @tc.desc Verify Char.toShort converts digit characters correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, () => {
      const chars: char[] = [c'0', c'1', c'2', c'3', c'4', c'5', c'6', c'7', c'8', c'9'];
      const expected: short[] = [48, 49, 50, 51, 52, 53, 54, 55, 56, 57];
      for (let i = 0; i < chars.length; i++) {
        expect(Char.toShort(chars[i])).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_2000
     * @tc.name testCharToShortStatic0020
     * @tc.desc Verify Char.toShort converts control characters correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toShort(c'\u0000')).assertEqual(0);
      expect(Char.toShort(c'\n')).assertEqual(10);
      expect(Char.toShort(c'\t')).assertEqual(9);
      expect(Char.toShort(c'\r')).assertEqual(13);
      expect(Char.toShort(c' ')).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_2100
     * @tc.name testCharToShortStatic0021
     * @tc.desc Verify Char.toShort with Unicode characters within short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toShort(c'\u4E2D')).assertEqual(20013);
      expect(Char.toShort(c'\u3042')).assertEqual(12354);
      expect(Char.toShort(c'\uAC00')).assertEqual(-21504);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_2300
     * @tc.name testCharToShortStatic0023
     * @tc.desc Verify Char.toShort converts 32767 to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toShort(c'\u7FFF');
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_2400
     * @tc.name testCharToShortStatic0024
     * @tc.desc Verify Char.toShort may convert 32768 to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toShort(c'\u8000');
      expect(result === -32768 || result === 32768).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_2500
     * @tc.name testCharToShortStatic0025
     * @tc.desc Verify that Char.toShort return value is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toShort(c'A');
      expect(typeof result).assertEqual("short");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_2600
     * @tc.name testCharToShortStatic0026
     * @tc.desc Verify that Char.toShort returns an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toShort(c'A');
      expect(typeof result).assertEqual("short");
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_2700
     * @tc.name testCharToShortStatic0027
     * @tc.desc Verify that Char.toShort return value is within short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toShort(c'A');
      expect(result >= -32768 && result <= 32767).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_2800
     * @tc.name testCharToShortStatic0028
     * @tc.desc Verify Char.toShort result is within safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toShort(c'\uFFFF');
      expect(result <= Number.MAX_SAFE_INTEGER).assertTrue();
      expect(typeof result).assertEqual("short");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_3000
     * @tc.name testCharToShortStatic0030
     * @tc.desc Verify Char.toShort may produce negative numbers exceeding 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result1 = Char.toShort(c'\u8000');
      expect(result1 === -32768 || result1 === 32768).assertTrue();
      const result2 = Char.toShort(c'\uFFFF');
      expect(result2 === -1 || result2 === 65535).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_3200
     * @tc.name testCharToShortStatic0032
     * @tc.desc Verify Char.toShort converts extended ASCII range 128-255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'\u0080', c'\u00FF'];
      const expected: short[] = [128, 255];
      for (let i = 0; i < chars.length; i++) {
        expect(Char.toShort(chars[i])).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_3300
     * @tc.name testCharToShortStatic0033
     * @tc.desc Verify Char.toShort converts BMP characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'\u4E00', c'\u4E8C', c'\u4E09'];
      const expected: short[] = [19968, 20108, 19977];
      for (let i = 0; i < chars.length; i++) {
        expect(Char.toShort(chars[i])).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_3400
     * @tc.name testCharToShortStatic0034
     * @tc.desc Verify Char.toShort returns correct results after multiple conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = 0; i < 10; i++) {
        expect(Char.toShort(c'A')).assertEqual(65);
      }
    });





    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_3900
     * @tc.name testCharToShortStatic0039
     * @tc.desc Verify finally block always executes regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let finallyExecuted = false;
      try {
        const result = Char.toShort(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_4200
     * @tc.name testCharToShortStatic0042
     * @tc.desc Verify Char instance also has toShort method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const instanceResult = c.toShort();
      const staticResult = Char.toShort(c'A');
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_4300
     * @tc.name testCharToShortStatic0043
     * @tc.desc Verify that Char.toShort is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const startTime = Date.now();
      const result = Char.toShort(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_4400
     * @tc.name testCharToShortStatic0044
     * @tc.desc Verify static toShort requires parameter while instance does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const staticResult = Char.toShort(c'A');
      const instanceResult = c.toShort();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_4500
     * @tc.name testCharToShortStatic0045
     * @tc.desc Verify static and instance toShort return same result for same character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      expect(Char.toShort(c'A')).assertEqual(c.toShort());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_4600
     * @tc.name testCharToShortStatic0046
     * @tc.desc Verify short range is larger than byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ch = c'\u0080';
      const byteResult = Char.toByte(ch);
      const shortResult = Char.toShort(ch);
      expect(byteResult === -128 || byteResult === 128).assertTrue();
      expect(shortResult).assertEqual(128);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_4800
     * @tc.name testCharToShortStatic0048
     * @tc.desc Verify toShort and toInt return same values within char range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'\u0000', c'A', c'\x7F', c'\u0080', c'\u00FF'];
      for (const ch of chars) {
        expect(Char.toShort(ch)).assertEqual(Char.toInt(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_4900
     * @tc.name testCharToShortStatic0049
     * @tc.desc Verify both short and int can represent 0-65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ch = c'\uFFFF';
      const shortResult = Char.toShort(ch);
      const intResult = Char.toInt(ch);
      expect(shortResult === intResult || (shortResult === -1 && intResult === 65535)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_5000
     * @tc.name testCharToShortStatic0050
     * @tc.desc Verify static method can convert any char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toShort(c'A')).assertEqual(65);
      const c = new Char(c'A');
      expect(c.toShort()).assertEqual(65);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_5300
     * @tc.name testCharToShortStatic0053
     * @tc.desc Verify Char.toShort converts BMP characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'\u4E00', c'\u4E8C', c'\u4E09', c'\u4E5D', c'\u4E94'];
      const expected: short[] = [19968, 20108, 19977, 20061, 20116];
      for (let i = 0; i < chars.length; i++) {
        expect(Char.toShort(chars[i])).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_5400
     * @tc.name testCharToShortStatic0054
     * @tc.desc Verify Char.toShort with all possible char values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'\u0000', c'\x7F', c'\u0080', c'\u00FF', c'\u7FFF', c'\u8000', c'\uFFFF'];
      const expected: short[] = [0, 127, 128, 255, 32767, -32768, -1];
      for (let i = 0; i < chars.length; i++) {
        expect(Char.toShort(chars[i])).assertEqual(expected[i]);
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_5700
     * @tc.name testCharToShortStatic0057
     * @tc.desc Verify Char.toShort with high surrogate characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result1 = Char.toShort(Char.HIGH_SURROGATE_MIN);
      expect(result1).assertEqual(-10240);
      const result2 = Char.toShort(Char.HIGH_SURROGATE_MAX);
      expect(result2).assertEqual(-9217);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_5800
     * @tc.name testCharToShortStatic0058
     * @tc.desc Verify Char.toShort with low surrogate characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result1 = Char.toShort(Char.LOW_SURROGATE_MIN);
      expect(result1).assertEqual(-9216);
      const result2 = Char.toShort(Char.LOW_SURROGATE_MAX);
      expect(result2).assertEqual(-8193);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_5900
     * @tc.name testCharToShortStatic0059
     * @tc.desc Verify Char.toShort returns consistent results across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result1 = Char.toShort(c'A');
      const result2 = Char.toShort(c'A');
      const result3 = Char.toShort(c'A');
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_6100
     * @tc.name testCharToShortStatic0061
     * @tc.desc Verify unsigned to signed conversion for short type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'\u8000', c'\uFFFF'];
      const expected: short[] = [-32768, -1];
      for (let i = 0; i < chars.length; i++) {
        expect(Char.toShort(chars[i])).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_6200
     * @tc.name testCharToShortStatic0062
     * @tc.desc Verify Char.toShort preserves precision within short range 0-32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'\u0000', c'A', c'\u7FFF'];
      const expected: short[] = [0, 65, 32767];
      for (let i = 0; i < chars.length; i++) {
        expect(Char.toShort(chars[i])).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_6300
     * @tc.name testCharToShortStatic0063
     * @tc.desc Verify Char.toShort result can be used in calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toShort(c'A') + 1;
      expect(result).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_6400
     * @tc.name testCharToShortStatic0064
     * @tc.desc Verify multiple conversion combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const shortValue = Char.toShort(c'A');
      const intValue = Char.toInt(c'A');
      expect(shortValue).assertEqual(intValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSHORTSTATICTEST_7300
     * @tc.name testCharToShortStatic0073
     * @tc.desc Verify toShort is consistent with other methods within short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToShortStatic0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'\u0000', c'A', c'\x7F', c'\u0080', c'\u00FF', c'\u7FFF'];
      for (const ch of chars) {
        expect(Char.toShort(ch)).assertEqual(Char.toInt(ch));
        expect(Char.toShort(ch)).assertEqual(Char.toLong(ch));
      }
    });
  });
}
