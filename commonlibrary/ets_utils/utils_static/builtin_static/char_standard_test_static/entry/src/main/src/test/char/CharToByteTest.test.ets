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

export default function CharToByteTest():void {
  describe('CharToByteTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_0100
     * @tc.name testCharToByte0001
     * @tc.desc Verify toByte method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0001' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toByte();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_0200
     * @tc.name testCharToByte0002
     * @tc.desc Verify toByte() can be called with no arguments and returns a valid result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toByte();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_0300
     * @tc.name testCharToByte0003
     * @tc.desc Verify toByte requires no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toByte();
      expect(typeof result === "number" || typeof result === "byte" || typeof result === "int").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_0400
     * @tc.name testCharToByte0004
     * @tc.desc Verify return value is byte type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toByte();
      expect(typeof result === "number" || typeof result === "byte" || typeof result === "int").assertTrue();
      expect(Number.isInteger(result)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_0600
     * @tc.name testCharToByte0006
     * @tc.desc Verify lowercase letter a converts to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'a');
      const result = c.toByte();
      expect(result).assertEqual(97);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_0700
     * @tc.name testCharToByte0007
     * @tc.desc Verify digit character 0 converts to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'0');
      const result = c.toByte();
      expect(result).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_0800
     * @tc.name testCharToByte0008
     * @tc.desc Verify digit character 9 converts to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'9');
      const result = c.toByte();
      expect(result).assertEqual(57);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_0900
     * @tc.name testCharToByte0009
     * @tc.desc Verify space character converts to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c' ');
      const result = c.toByte();
      expect(result).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_1000
     * @tc.name testCharToByte0010
     * @tc.desc Verify special symbol converts to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'@');
      const result = c.toByte();
      expect(result).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_1100
     * @tc.name testCharToByte0011
     * @tc.desc Lossy narrowing: U+4E2D ('中') -> low 8 bits = 0x2D (45)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'中');
      const result = c.toByte();
      expect(result === 45).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_1200
     * @tc.name testCharToByte0012
     * @tc.desc Verify null character u0000 converts to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\u0000');
      const result = c.toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_1300
     * @tc.name testCharToByte0013
     * @tc.desc Verify newline character converts to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\n');
      const result = c.toByte();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_1400
     * @tc.name testCharToByte0014
     * @tc.desc Verify tab character converts to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\t');
      const result = c.toByte();
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_1500
     * @tc.name testCharToByte0015
     * @tc.desc Verify carriage return character converts to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\r');
      const result = c.toByte();
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_1600
     * @tc.name testCharToByte0016
     * @tc.desc Verify high surrogate character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.HIGH_SURROGATE_MIN); // 0xD800 = 55296
      const result = c.toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_1700
     * @tc.name testCharToByte0017
     * @tc.desc Verify low surrogate character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.LOW_SURROGATE_MIN); // 0xDC00 = 56320
      const result = c.toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_1800
     * @tc.name testCharToByte0018
     * @tc.desc Verify maximum character within byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\x7F');
      const result = c.toByte();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_1900
     * @tc.name testCharToByte0019
     * @tc.desc Verify positive value exceeding byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\x80'); // 128
      const result = c.toByte();
      expect(result).assertEqual(-128);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_2100
     * @tc.name testCharToByte0021
     * @tc.desc Verify return value is an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toByte();
      expect(Number.isInteger(result)).assertTrue();
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_2200
     * @tc.name testCharToByte0022
     * @tc.desc Verify return value is within byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toByte();
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_2300
     * @tc.name testCharToByte0023
     * @tc.desc Verify ASCII range character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0023' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x00', c'A', c'\x7F'];
      const expectedValues = [0, 65, 127];
      for (let i = 0; i < samples.length; i++) {
        const c = new Char(samples[i]);
        const result = c.toByte();
        expect(result).assertEqual(expectedValues[i]);
      }
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_2600
     * @tc.name testCharToByte0026
     * @tc.desc Verify multiple conversions return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c.toByte()).assertEqual(65);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_3000
     * @tc.name testCharToByte0030
     * @tc.desc Verify toByte() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'A');
        const result = c.toByte();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_3200
     * @tc.name testCharToByte0032
     * @tc.desc Verify Char.toByte() can be called statically and returns a numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0032' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toByte(c'A');
      expect(result !== undefined && result !== null).assertTrue();
      expect(typeof result === "number" || typeof result === "byte" || typeof result === "int").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_3300
     * @tc.name testCharToByte0033
     * @tc.desc Verify toByte is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const startTime = Date.now();
      const result = c.toByte();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_3400
     * @tc.name testCharToByte0034
     * @tc.desc Verify toByte returns byte and toInt returns int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const byteResult = c.toByte();
      const intResult = c.toInt();
      expect(typeof byteResult === "number" || typeof byteResult === "byte" || typeof byteResult === "int").assertTrue();
      expect(typeof intResult === "number" || typeof intResult === "byte" || typeof intResult === "int").assertTrue();
      expect(byteResult).assertEqual(intResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_3500
     * @tc.name testCharToByte0035
     * @tc.desc Verify ASCII character conversion values are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.toByte()).assertEqual(c.toInt());
      expect(c.toByte()).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_3600
     * @tc.name testCharToByte0036
     * @tc.desc Verify byte range is smaller than short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\x80');
      const byteResult = c.toByte();
      const shortResult = c.toShort();
      expect(shortResult).assertEqual(128);
      expect(byteResult === -128 || byteResult === 128).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_3700
     * @tc.name testCharToByte0037
     * @tc.desc Verify static method Char.toByte(value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.toByte();
      const result2 = Char.toByte(c.toChar());
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_3800
     * @tc.name testCharToByte0038
     * @tc.desc Verify ASCII characters 0-127 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        const result = c.toByte();
        expect(result).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_3900
     * @tc.name testCharToByte0039
     * @tc.desc Verify extended ASCII character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i < 256; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        const result = c.toByte();
        expect(result).assertEqual(i - 256);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_4000
     * @tc.name testCharToByte0040
     * @tc.desc Verify Unicode character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\u03A8');
      const result = c.toByte();
      expect(result).assertEqual(-88);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_4200
     * @tc.name testCharToByte0042
     * @tc.desc Verify null character instance toByte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char();
      const c2 = new Char(c'\u0000');
      expect(c1.toByte()).assertEqual(0);
      expect(c2.toByte()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_4300
     * @tc.name testCharToByte0043
     * @tc.desc Verify maximum character value to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE); // 65535
      const result = c.toByte();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_4400
     * @tc.name testCharToByte0044
     * @tc.desc Verify minimum character value to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MIN_VALUE);
      const result = c.toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_4500
     * @tc.name testCharToByte0045
     * @tc.desc Verify value exceeding byte range is truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\u0100'); // 256
      const result = c.toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_4600
     * @tc.name testCharToByte0046
     * @tc.desc Verify byte is a signed type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x80', c'\xC0', c'\xFF'];
      for (const ch of samples) {
        const c = new Char(ch);
        const result = c.toByte();
        const unsignedVal = c.toInt();
        const signedValue = unsignedVal - 256;
        expect(result === unsignedVal || result === signedValue).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_4700
     * @tc.name testCharToByte0047
     * @tc.desc Verify toByte return value can participate in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toByte() + 1;
      expect(result).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOBYTETEST_4800
     * @tc.name testCharToByte0048
     * @tc.desc Verify multiple calls to toByte return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToByte0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.toByte();
      const result2 = c.toByte();
      const result3 = c.toByte();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });
  });
}
