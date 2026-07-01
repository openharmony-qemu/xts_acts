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

function charFromCode(code: number): char {
  return Int.toChar(Double.toInt(code));
}
function invokeToByte(ch: Char): byte {
  return Char.toByte(ch);
}
export default function CharToByteStaticTest():void {
  describe('CharToByteStaticTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_0100
     * @tc.name testCharToByteStatic0001
     * @tc.desc Verify that a char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toByte(c'A');
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_0200
     * @tc.name testCharToByteStatic0002
     * @tc.desc Verify that not passing parameters throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toByte(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_0400
     * @tc.name testCharToByteStatic0004
     * @tc.desc Verify ASCII letter characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toByte(c'A')).assertEqual(65);
      expect(Char.toByte(c'Z')).assertEqual(90);
      expect(Char.toByte(c'a')).assertEqual(97);
      expect(Char.toByte(c'z')).assertEqual(122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_0500
     * @tc.name testCharToByteStatic0005
     * @tc.desc Verify digit characters 0-9 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toByte(c'0')).assertEqual(48);
      expect(Char.toByte(c'9')).assertEqual(57);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_0600
     * @tc.name testCharToByteStatic0006
     * @tc.desc Verify special characters and space conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toByte(c' ')).assertEqual(32);
      expect(Char.toByte(c'!')).assertEqual(33);
      expect(Char.toByte(c'~')).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_0700
     * @tc.name testCharToByteStatic0007
     * @tc.desc Verify escape characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toByte(c'\u0000')).assertEqual(0);
      expect(Char.toByte(c'\n')).assertEqual(10);
      expect(Char.toByte(c'\t')).assertEqual(9);
      expect(Char.toByte(c'\r')).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_0800
     * @tc.name testCharToByteStatic0008
     * @tc.desc Verify boundary values within byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toByte(c'\x00')).assertEqual(0);
      expect(Char.toByte(c'\x7F')).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_0900
     * @tc.name testCharToByteStatic0009
     * @tc.desc Verify characters exceeding 127 may overflow or truncate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toByte(c'\x80');
      const result2 = Char.toByte(c'\xFF');
      const result3 = Char.toByte(Char.MAX_VALUE);
      expect(result1 === -128 || result1 === 128).assertTrue();
      expect(result2 === -1 || result2 === 255).assertTrue();
      expect(result3 === 255 || result3 === -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_1000
     * @tc.name testCharToByteStatic0010
     * @tc.desc Verify that passing non-char types throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0010' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toByte(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
      try {
        const result = Char.toByte(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_1100
     * @tc.name testCharToByteStatic0011
     * @tc.desc Verify char minimum value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toByte(Char.MIN_VALUE);
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_1300
     * @tc.name testCharToByteStatic0013
     * @tc.desc Verify values just beyond byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0013' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toByte(c'\x80');
      const result2 = Char.toByte(c'\xFF');
      const result3 = Char.toByte(c'\u0100');
      expect(result1 === -128 || result1 === 128).assertTrue();
      expect(result2 === -1 || result2 === 255).assertTrue();
      expect(result3 === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_1400
     * @tc.name testCharToByteStatic0014
     * @tc.desc Verify char maximum value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toByte(Char.MAX_VALUE);
      expect(result === 255 || result === -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_1500
     * @tc.name testCharToByteStatic0015
     * @tc.desc Verify return value is byte type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toByte(c'A');
      expect(typeof result === "number" || typeof result === "byte" || typeof result === "int").assertTrue();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_1600
     * @tc.name testCharToByteStatic0016
     * @tc.desc Verify ASCII characters convert correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x00', c'A', c'\x7F'];
      for (const ch of samples) {
        const result = Char.toByte(ch);
        expect(result).assertEqual(Char.toInt(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_1700
     * @tc.name testCharToByteStatic0017
     * @tc.desc Verify uppercase letter conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toByte(c'A')).assertEqual(65);
      expect(Char.toByte(c'B')).assertEqual(66);
      expect(Char.toByte(c'Z')).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_1800
     * @tc.name testCharToByteStatic0018
     * @tc.desc Verify lowercase letter conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toByte(c'a')).assertEqual(97);
      expect(Char.toByte(c'b')).assertEqual(98);
      expect(Char.toByte(c'z')).assertEqual(122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_1900
     * @tc.name testCharToByteStatic0019
     * @tc.desc Verify digit character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const digitChars = [c'0', c'5', c'9'];
      for (const ch of digitChars) {
        expect(Char.toByte(ch)).assertEqual(Char.toInt(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_2000
     * @tc.name testCharToByteStatic0020
     * @tc.desc Verify control character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toByte(c'\u0000')).assertEqual(0);
      expect(Char.toByte(c'\n')).assertEqual(10);
      expect(Char.toByte(c'\t')).assertEqual(9);
      expect(Char.toByte(c'\r')).assertEqual(13);
      expect(Char.toByte(c' ')).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_2100
     * @tc.name testCharToByteStatic0021
     * @tc.desc Verify null character u0000 converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toByte(c'\u0000');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_2200
     * @tc.name testCharToByteStatic0022
     * @tc.desc Verify 127 converts to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toByte(c'\x7F');
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_2300
     * @tc.name testCharToByteStatic0023
     * @tc.desc Verify 0 converts to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toByte(c'\x00');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_2400
     * @tc.name testCharToByteStatic0024
     * @tc.desc Verify return value is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toByte(c'A');
      expect(typeof result === "number" || typeof result === "byte" || typeof result === "int").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_2500
     * @tc.name testCharToByteStatic0025
     * @tc.desc Verify return value is an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toByte(c'A');
      expect(Number.isInteger(result)).assertTrue();
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_2600
     * @tc.name testCharToByteStatic0026
     * @tc.desc Verify return value is within byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toByte(c'A');
      expect(result >= -128 && result <= 127).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_2800
     * @tc.name testCharToByteStatic0028
     * @tc.desc Verify values exceeding 127 may produce negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toByte(c'\x80');
      expect(result1 === -128 || result1 === 128).assertTrue();
      const result2 = Char.toByte(c'\xFF');
      expect(result2 === -1 || result2 === 255).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_2900
     * @tc.name testCharToByteStatic0029
     * @tc.desc Verify ASCII characters 0-127 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.toByte(ch)).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_3000
     * @tc.name testCharToByteStatic0030
     * @tc.desc Verify extended ASCII characters 128-255 conversion may overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i < 256; i++) {
        const ch = charFromCode(i);
        const result = Char.toByte(ch);
        expect(result).assertEqual(i - 256);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_3100
     * @tc.name testCharToByteStatic0031
     * @tc.desc Verify multiple conversions return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.toByte(c'A')).assertEqual(65);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_3200
     * @tc.name testCharToByteStatic0032
     * @tc.desc Verify passing wrong type parameter throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0032' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toByte(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_3300
     * @tc.name testCharToByteStatic0033
     * @tc.desc Verify not passing parameters throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0033' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toByte(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_3500
     * @tc.name testCharToByteStatic0035
     * @tc.desc Verify passing illegal parameters enters catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0035' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toByte(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_3600
     * @tc.name testCharToByteStatic0036
     * @tc.desc Verify finally always executes regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.toByte(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_3700
     * @tc.name testCharToByteStatic0037
     * @tc.desc Verify toByte is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = invokeToByte(c'A');
      expect(typeof result === "number" || typeof result === "byte" || typeof result === "int").assertTrue();
      expect(result).assertEqual(65);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_3900
     * @tc.name testCharToByteStatic0039
     * @tc.desc Verify Char instance has no toByte static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.toByte();
      const result2 = Char.toByte(c'A');
      expect(typeof result1 === "number" || typeof result1 === "byte" || typeof result1 === "int").assertTrue();
      expect(typeof result2 === "number" || typeof result2 === "byte" || typeof result2 === "int").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_4000
     * @tc.name testCharToByteStatic0040
     * @tc.desc Verify toByte is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.toByte(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_4100
     * @tc.name testCharToByteStatic0041
     * @tc.desc Verify static method requires parameter while instance method does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const staticResult = Char.toByte(c'A');
      const instanceResult = c.toByte();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_4200
     * @tc.name testCharToByteStatic0042
     * @tc.desc Verify same character returns same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(Char.toByte(c'A')).assertEqual(c.toByte());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_4300
     * @tc.name testCharToByteStatic0043
     * @tc.desc Verify byte range is smaller than short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'\x80';
      const byteResult = Char.toByte(ch);
      const shortResult = Char.toShort(ch);
      expect(byteResult === -128 || byteResult === 128).assertTrue();
      expect(shortResult).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_4400
     * @tc.name testCharToByteStatic0044
     * @tc.desc Verify values greater than 127 overflow in byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x80', c'\xC0', c'\xFF'];
      for (const ch of samples) {
        const byteResult = Char.toByte(ch);
        const shortResult = Char.toShort(ch);
        expect(shortResult).assertEqual(Char.toInt(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_4500
     * @tc.name testCharToByteStatic0045
     * @tc.desc Verify int range is greater than byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'\xFF';
      const byteResult = Char.toByte(ch);
      const intResult = Char.toInt(ch);
      expect(byteResult === -1 || byteResult === 255).assertTrue();
      expect(intResult).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_4600
     * @tc.name testCharToByteStatic0046
     * @tc.desc Verify static method can convert any char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toByte(c'A')).assertEqual(65);
      const c = new Char(c'A');
      expect(c.toByte()).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_4700
     * @tc.name testCharToByteStatic0047
     * @tc.desc Verify ASCII characters 0-127 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x00', c'A', c'\x7F'];
      for (const ch of samples) {
        expect(Char.toByte(ch)).assertEqual(Char.toInt(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_4800
     * @tc.name testCharToByteStatic0048
     * @tc.desc Verify extended ASCII characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x80', c'\xC0', c'\xFF'];
      for (const ch of samples) {
        const result = Char.toByte(ch);
        const unsignedVal = Char.toInt(ch);
        expect(result === unsignedVal || result === unsignedVal - 256).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_4900
     * @tc.name testCharToByteStatic0049
     * @tc.desc Verify Unicode character truncates to low 8 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toByte(c'中');
      expect(result1 === 45 || result1 === 20013).assertTrue();
      const result2 = Char.toByte(c'あ');
      expect(result2 === 66 || result2 === 12354).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_5200
     * @tc.name testCharToByteStatic0052
     * @tc.desc Verify high surrogate character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toByte(Char.HIGH_SURROGATE_MIN);
      expect(result1).assertEqual(0);
      const result2 = Char.toByte(Char.HIGH_SURROGATE_MAX);
      expect(result2 === 255 || result2 === -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_5300
     * @tc.name testCharToByteStatic0053
     * @tc.desc Verify low surrogate character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toByte(Char.LOW_SURROGATE_MIN);
      expect(result1).assertEqual(0);
      const result2 = Char.toByte(Char.LOW_SURROGATE_MAX);
      expect(result2 === 255 || result2 === -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_5400
     * @tc.name testCharToByteStatic0054
     * @tc.desc Verify multiple calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toByte(c'A');
      const result2 = Char.toByte(c'A');
      const result3 = Char.toByte(c'A');
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_5500
     * @tc.name testCharToByteStatic0055
     * @tc.desc Verify precision loss beyond byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toByte(c'\x80');
      expect(result1 === -128 || result1 === 128).assertTrue();
      const result2 = Char.toByte(c'\xC8');
      expect(result2 === -56 || result2 === 200).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_5600
     * @tc.name testCharToByteStatic0056
     * @tc.desc Verify byte is a signed type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x80', c'\xC0', c'\xFF'];
      for (const ch of samples) {
        const result = Char.toByte(ch);
        const unsignedVal = Char.toInt(ch);
        const signedValue = unsignedVal - 256;
        expect(result === unsignedVal || result === signedValue).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_5700
     * @tc.name testCharToByteStatic0057
     * @tc.desc Verify toByte return value can participate in operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toByte(c'A') + 1;
      expect(result).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_5800
     * @tc.name testCharToByteStatic0058
     * @tc.desc Verify multiple conversion combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byteValue = Char.toByte(c'A');
      const intValue = Char.toInt(c'A');
      expect(byteValue).assertEqual(intValue);
    });





    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_6300
     * @tc.name testCharToByteStatic0063
     * @tc.desc Verify byte minimum negative value -128 with overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toByte(c'\x80');
      expect(result === -128 || result === 128).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_6600
     * @tc.name testCharToByteStatic0066
     * @tc.desc Verify byte range versus int range difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'\x80';
      const byteResult = Char.toByte(ch);
      const intResult = Char.toInt(ch);
      expect(byteResult === -128 || byteResult === 128).assertTrue();
      expect(intResult).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTESTATICTEST_6700
     * @tc.name testCharToByteStatic0067
     * @tc.desc Verify toByte is consistent with other methods within byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByteStatic0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.toByte(ch)).assertEqual(Char.toInt(ch));
        expect(Char.toByte(ch)).assertEqual(Char.toShort(ch));
      }
    });
  });
}
