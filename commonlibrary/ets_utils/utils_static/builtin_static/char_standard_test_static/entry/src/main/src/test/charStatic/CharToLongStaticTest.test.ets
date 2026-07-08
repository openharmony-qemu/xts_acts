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

function charFromCode(code: number): char {
  return Int.toChar(Double.toInt(code));
}

export default function CharToLongStaticTest(): void {
  describe('CharToLongStaticTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_0100
     * @tc.name testCharToLongStatic0001
     * @tc.desc Verify that one char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toLong(c'A');
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_0200
     * @tc.name testCharToLongStatic0002
     * @tc.desc Verify error when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toLong(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_0400
     * @tc.name testCharToLongStatic0004
     * @tc.desc Verify ASCII letter character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toLong(c'A')).assertEqual(65);
      expect(Char.toLong(c'Z')).assertEqual(90);
      expect(Char.toLong(c'a')).assertEqual(97);
      expect(Char.toLong(c'z')).assertEqual(122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_0500
     * @tc.name testCharToLongStatic0005
     * @tc.desc Verify digit character 0-9 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toLong(c'0')).assertEqual(48);
      expect(Char.toLong(c'9')).assertEqual(57);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_0600
     * @tc.name testCharToLongStatic0006
     * @tc.desc Verify special character and space conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toLong(c' ')).assertEqual(32);
      expect(Char.toLong(c'!')).assertEqual(33);
      expect(Char.toLong(c'~')).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_0700
     * @tc.name testCharToLongStatic0007
     * @tc.desc Verify escape character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toLong(c'\u0000')).assertEqual(0);
      expect(Char.toLong(c'\n')).assertEqual(10);
      expect(Char.toLong(c'\t')).assertEqual(9);
      expect(Char.toLong(c'\r')).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_0800
     * @tc.name testCharToLongStatic0008
     * @tc.desc Verify char range boundary value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toLong(Char.MIN_VALUE)).assertEqual(0);
      expect(Char.toLong(c'\x7F')).assertEqual(127);
      expect(Char.toLong(Char.MAX_VALUE)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_0900
     * @tc.name testCharToLongStatic0009
     * @tc.desc Verify error when passing non-char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toLong(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
      try {
        const result = Char.toLong(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_1000
     * @tc.name testCharToLongStatic0010
     * @tc.desc Verify char minimum value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toLong(Char.MIN_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_1100
     * @tc.name testCharToLongStatic0011
     * @tc.desc Verify ASCII and extended ASCII boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toLong(c'\x7F')).assertEqual(127);
      expect(Char.toLong(c'\x80')).assertEqual(128);
      expect(Char.toLong(c'\xFF')).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_1200
     * @tc.name testCharToLongStatic0012
     * @tc.desc Verify char maximum value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toLong(Char.MAX_VALUE);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_1300
     * @tc.name testCharToLongStatic0013
     * @tc.desc Verify return value is long type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toLong(c'A');
      expect(typeof result === "number" || typeof result === "long").assertTrue();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_1400
     * @tc.name testCharToLongStatic0014
     * @tc.desc Verify ASCII character correct conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.toLong(ch)).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_1500
     * @tc.name testCharToLongStatic0015
     * @tc.desc Verify uppercase letter conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toLong(c'A')).assertEqual(65);
      expect(Char.toLong(c'B')).assertEqual(66);
      expect(Char.toLong(c'Z')).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_1600
     * @tc.name testCharToLongStatic0016
     * @tc.desc Verify lowercase letter conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toLong(c'a')).assertEqual(97);
      expect(Char.toLong(c'b')).assertEqual(98);
      expect(Char.toLong(c'z')).assertEqual(122);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_1800
     * @tc.name testCharToLongStatic0018
     * @tc.desc Verify control character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toLong(c'\u0000')).assertEqual(0);
      expect(Char.toLong(c'\n')).assertEqual(10);
      expect(Char.toLong(c'\t')).assertEqual(9);
      expect(Char.toLong(c'\r')).assertEqual(13);
      expect(Char.toLong(c' ')).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_1900
     * @tc.name testCharToLongStatic0019
     * @tc.desc Verify Unicode character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toLong(c'中')).assertEqual(20013);
      expect(Char.toLong(c'あ')).assertEqual(12354);
      expect(Char.toLong(c'가')).assertEqual(44032);
      expect(Char.toLong(Char.HIGH_SURROGATE_MIN)).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_2000
     * @tc.name testCharToLongStatic0020
     * @tc.desc Verify null character converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toLong(c'\u0000');
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_2200
     * @tc.name testCharToLongStatic0022
     * @tc.desc Verify return value is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toLong(c'A');
      expect(typeof result === "number" || typeof result === "long").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_2300
     * @tc.name testCharToLongStatic0023
     * @tc.desc Verify return value is an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toLong(c'A');
      expect(Number.isInteger(result)).assertTrue();
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_2400
     * @tc.name testCharToLongStatic0024
     * @tc.desc Verify char to long is always non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toLong(Char.MAX_VALUE);
      expect(result >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_2500
     * @tc.name testCharToLongStatic0025
     * @tc.desc Verify char conversion result is within safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toLong(Char.MAX_VALUE);
      expect(result <= Number.MAX_SAFE_INTEGER).assertTrue();
      expect(Number.isSafeInteger(result)).assertTrue();
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_2900
     * @tc.name testCharToLongStatic0029
     * @tc.desc Verify extended ASCII character 128-255 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i < 256; i++) {
        const ch = charFromCode(i);
        expect(Char.toLong(ch)).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_3000
     * @tc.name testCharToLongStatic0030
     * @tc.desc Verify BMP character 0-65535 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'\u4E00', c'\u4E8C', c'\u4E09'];
      const expected = [0x4E00, 0x4E8C, 0x4E09];
      for (let idx = 0; idx < testChars.length; idx++) {
        expect(Char.toLong(testChars[idx])).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_3100
     * @tc.name testCharToLongStatic0031
     * @tc.desc Verify all possible char values 0-65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\u007F', c'\u0080', c'\u00FF', c'\u0100', c'\u7FFF', c'\u8000', c'\uFFFF'];
      const expectedVals = [0, 127, 128, 255, 256, 0x7FFF, 0x8000, 0xFFFF];
      for (let idx = 0; idx < sampleChars.length; idx++) {
        expect(Char.toLong(sampleChars[idx])).assertEqual(expectedVals[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_3200
     * @tc.name testCharToLongStatic0032
     * @tc.desc Verify multiple conversions return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.toLong(c'A')).assertEqual(65);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_3300
     * @tc.name testCharToLongStatic0033
     * @tc.desc Verify error thrown when passing wrong type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toLong(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_3400
     * @tc.name testCharToLongStatic0034
     * @tc.desc Verify error thrown when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toLong(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_3600
     * @tc.name testCharToLongStatic0036
     * @tc.desc Verify passing illegal parameter enters catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toLong(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_3700
     * @tc.name testCharToLongStatic0037
     * @tc.desc Verify finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.toLong(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_4000
     * @tc.name testCharToLongStatic0040
     * @tc.desc Verify Char instance also has toLong method without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const instanceResult = c.toLong();
      const staticResult = Char.toLong(c'A');
      expect(typeof instanceResult === "number" || typeof instanceResult === "long").assertTrue();
      expect(typeof staticResult === "number" || typeof staticResult === "long").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_4100
     * @tc.name testCharToLongStatic0041
     * @tc.desc Verify toLong is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.toLong(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_4200
     * @tc.name testCharToLongStatic0042
     * @tc.desc Verify static method requires parameter, instance method does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const staticResult = Char.toLong(c'A');
      const instanceResult = c.toLong();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_4300
     * @tc.name testCharToLongStatic0043
     * @tc.desc Verify same character returns same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(Char.toLong(c'A')).assertEqual(c.toLong());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_4400
     * @tc.name testCharToLongStatic0044
     * @tc.desc Verify long range is much larger than byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'\x80';
      const byteResult = Char.toByte(ch);
      const longResult = Char.toLong(ch);
      expect(byteResult === -128 || byteResult === 128).assertTrue();
      expect(longResult).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_4500
     * @tc.name testCharToLongStatic0045
     * @tc.desc Verify values greater than 127 overflow in byte but normal in long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x80', c'\xFF'];          // 128, 255
      const expected = [128, 255];
      for (let idx = 0; idx < samples.length; idx++) {
        const byteResult = Char.toByte(samples[idx]);
        const longResult = Char.toLong(samples[idx]);
        expect(longResult).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_4600
     * @tc.name testCharToLongStatic0046
     * @tc.desc Verify long range is larger than short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'\u8000';
      const shortResult = Char.toShort(ch);
      const longResult = Char.toLong(ch);
      expect(longResult).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_4700
     * @tc.name testCharToLongStatic0047
     * @tc.desc Verify values greater than 32767 may overflow in short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'\u8000';                     // 32768
      const longResult = Char.toLong(ch);
      expect(longResult).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_4800
     * @tc.name testCharToLongStatic0048
     * @tc.desc Verify long and int return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x00', c'\x80', c'\xFF'];   // 0, 128, 255
      for (const ch of samples) {
        expect(Char.toLong(ch)).assertEqual(Char.toInt(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_4900
     * @tc.name testCharToLongStatic0049
     * @tc.desc Verify consistency across entire char range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\u007F', c'\u0080', c'\u00FF', c'\u0100', c'\u7FFF', c'\u8000', c'\uFFFF'];
      for (const ch of sampleChars) {
        expect(Char.toLong(ch)).assertEqual(Char.toInt(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_5000
     * @tc.name testCharToLongStatic0050
     * @tc.desc Verify static method can convert any char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toLong(c'A')).assertEqual(65);
      const c = new Char(c'A');
      expect(c.toLong()).assertEqual(65);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_5300
     * @tc.name testCharToLongStatic0053
     * @tc.desc Verify BMP character 0-65535 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'\u4E00', c'\u4E8C', c'\u4E09', c'\u4E5D', c'\u4E94'];
      const expected = [0x4E00, 0x4E8C, 0x4E09, 0x4E5D, 0x4E94];
      for (let idx = 0; idx < testChars.length; idx++) {
        expect(Char.toLong(testChars[idx])).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_5400
     * @tc.name testCharToLongStatic0054
     * @tc.desc Verify all possible char values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\u007F', c'\u0080', c'\u00FF', c'\u0100', c'\u7FFF', c'\u8000', c'\uFFFF'];
      const expected = [0, 127, 128, 255, 256, 0x7FFF, 0x8000, 0xFFFF];
      for (let idx = 0; idx < sampleChars.length; idx++) {
        expect(Char.toLong(sampleChars[idx])).assertEqual(expected[idx]);
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_5700
     * @tc.name testCharToLongStatic0057
     * @tc.desc Verify high surrogate character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toLong(Char.HIGH_SURROGATE_MIN);
      expect(result1).assertEqual(0xD800);
      const result2 = Char.toLong(Char.HIGH_SURROGATE_MAX);
      expect(result2).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_5800
     * @tc.name testCharToLongStatic0058
     * @tc.desc Verify low surrogate character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toLong(Char.LOW_SURROGATE_MIN);
      expect(result1).assertEqual(0xDC00);
      const result2 = Char.toLong(Char.LOW_SURROGATE_MAX);
      expect(result2).assertEqual(0xDFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_5900
     * @tc.name testCharToLongStatic0059
     * @tc.desc Verify multiple calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toLong(c'A');
      const result2 = Char.toLong(c'A');
      const result3 = Char.toLong(c'A');
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_6000
     * @tc.name testCharToLongStatic0060
     * @tc.desc Verify no precision loss across entire char range 0-65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\u0000', c'\uFFFF'];
      const expected = [0, 65535];
      for (let idx = 0; idx < samples.length; idx++) {
        const result = Char.toLong(samples[idx]);
        expect(result).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_6100
     * @tc.name testCharToLongStatic0061
     * @tc.desc Verify boundary value precise conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toLong(Char.MIN_VALUE)).assertEqual(0);
      expect(Char.toLong(Char.MAX_VALUE)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_6200
     * @tc.name testCharToLongStatic0062
     * @tc.desc Verify long can represent larger values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toLong(Char.MAX_VALUE);
      expect(typeof result === "number" || typeof result === "long").assertTrue();
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_6300
     * @tc.name testCharToLongStatic0063
     * @tc.desc Verify toLong return value can be used in calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toLong(c'A') + 1;
      expect(result).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_6400
     * @tc.name testCharToLongStatic0064
     * @tc.desc Verify multiple conversion combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longValue = Char.toLong(c'A');
      const intValue = Char.toInt(c'A');
      expect(longValue).assertEqual(intValue);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_6600
     * @tc.name testCharToLongStatic0066
     * @tc.desc Verify batch conversion of different characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 256; i++) {
        const ch = charFromCode(i);
        expect(Char.toLong(ch)).assertEqual(i);
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_6900
     * @tc.name testCharToLongStatic0069
     * @tc.desc Verify all char values are within long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toLong(Char.MAX_VALUE);
      expect(result > 0).assertTrue();
      expect(Number.isSafeInteger(result)).assertTrue();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_7100
     * @tc.name testCharToLongStatic0071
     * @tc.desc Verify long value stored as Number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longValue = Char.toLong(c'A');
      expect(typeof longValue === "number" || typeof longValue === "long").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGSTATICTEST_7200
     * @tc.name testCharToLongStatic0072
     * @tc.desc Verify ASCII character various conversion methods produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLongStatic0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.toLong(ch)).assertEqual(Char.toInt(ch));
        expect(Char.toLong(ch)).assertEqual(Char.toShort(ch));
      }
    });
  });
}
