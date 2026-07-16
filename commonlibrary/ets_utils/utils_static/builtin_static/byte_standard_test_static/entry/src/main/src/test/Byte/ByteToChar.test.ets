'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function ByteToCharTest(): void {
  describe("ByteToCharTest", () => {
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
     * @tc.number    SUB_BYTE_TOCHAR_TEST_0100
     * @tc.name      testToCharNoArguments0001
     * @tc.desc      Verify toChar works without parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharNoArguments0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(65 as byte);
        const result = b.toChar();
        expect(result).assertEqual(c'A');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_0300
     * @tc.name      testToCharIsNoArgMethod0003
     * @tc.desc      Verify toChar is a no-argument method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharIsNoArgMethod0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(97 as byte);
        expect(b.toChar()).assertEqual(c'a');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_0400
     * @tc.name      testToCharReturnType0004
     * @tc.desc      Verify return type is string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharReturnType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(65 as byte);
        const result = b.toChar();
        expect(result.toInt()).assertEqual(65);
        expect(result).assertEqual(c'A');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_0500
     * @tc.name      testToCharUppercaseLetters0005
     * @tc.desc      Verify uppercase A-Z conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharUppercaseLetters0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(65 as byte);
        const b2 = new Byte(90 as byte);
        expect(b1.toChar()).assertEqual(c'A');
        expect(b2.toChar()).assertEqual(c'Z');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_0600
     * @tc.name      testToCharLowercaseLetters0006
     * @tc.desc      Verify lowercase a-z conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharLowercaseLetters0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(97 as byte);
        const b2 = new Byte(122 as byte);
        expect(b1.toChar()).assertEqual(c'a');
        expect(b2.toChar()).assertEqual(c'z');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_0700
     * @tc.name      testToCharDigitValues0007
     * @tc.desc      Verify digit 0-9 conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharDigitValues0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(48 as byte);
        const b2 = new Byte(57 as byte);
        expect(b1.toChar()).assertEqual(c'0');
        expect(b2.toChar()).assertEqual(c'9');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_0800
     * @tc.name      testToCharControlCharacters0008
     * @tc.desc      Verify control characters conversion (null, tab, newline, carriage return)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharControlCharacters0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bNull = new Byte(0 as byte);
        const bTab = new Byte(9 as byte);
        const bNewline = new Byte(10 as byte);
        const bCR = new Byte(13 as byte);
        expect(bNull.toChar()).assertEqual(c'\u0000');
        expect(bTab.toChar()).assertEqual(c'\t');
        expect(bNewline.toChar()).assertEqual(c'\n');
        expect(bCR.toChar()).assertEqual(c'\r');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_1000
     * @tc.name      testToCharMaxValue0010
     * @tc.desc      Verify byte max value conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharMaxValue0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(127 as byte);
        expect(b.toChar()).assertEqual(c'\u007F');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_1100
     * @tc.name      testToCharMinValue0011
     * @tc.desc      Verify byte min value conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharMinValue0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-128 as byte);
        const result = b.toChar();
        expect(result.toInt()).assertEqual(65408);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_1200
     * @tc.name      testToCharExtendedAscii0012
     * @tc.desc      Verify extended ASCII values conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharExtendedAscii0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-128 as byte);
        const b2 = new Byte(-1 as byte);
        const c1 = b1.toChar();
        const c2 = b2.toChar();
        expect(c1.toInt()).assertEqual(65408);
        expect(c2.toInt()).assertEqual(65535);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_1300
     * @tc.name      testToCharTypeIsString0013
     * @tc.desc      Verify return type is string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharTypeIsString0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(65 as byte);
        const result = b.toChar();
        expect(result.toInt()).assertEqual(65);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_1400
     * @tc.name      testToCharAssignToChar0014
     * @tc.desc      Verify result can be char type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharAssignToChar0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const result: char = b.toChar();
        expect(result).assertEqual(c'X');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_1500
     * @tc.name      testToCharLengthOne0015
     * @tc.desc      Verify char length is 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharLengthOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(65 as byte);
        const result = b.toChar();
        expect(result).assertEqual(65);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_1600
     * @tc.name      testToCharMultipleCalls0016
     * @tc.desc      Verify consistent results across calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharMultipleCalls0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(75 as byte);
        const r1 = b.toChar();
        const r2 = b.toChar();
        const r3 = b.toChar();
        expect(r1).assertEqual(r2);
        expect(r2).assertEqual(r3);
        expect(r1).assertEqual(c'K');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_1700
     * @tc.name      testToCharDifferentInstances0017
     * @tc.desc      Verify different instances return independent values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharDifferentInstances0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(65 as byte);
        const b2 = new Byte(66 as byte);
        const b3 = new Byte(67 as byte);
        expect(b1.toChar()).assertEqual(c'A');
        expect(b2.toChar()).assertEqual(c'B');
        expect(b3.toChar()).assertEqual(c'C');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_1800
     * @tc.name      testToCharDoesNotModifyOriginal0018
     * @tc.desc      Verify original byte value unchanged
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharDoesNotModifyOriginal0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const c1 = b.toChar();
        const c2 = b.toChar();
        expect(c1).assertEqual(c2);
        expect(c1).assertEqual(c'X');
        expect(b.toByte()).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_2000
     * @tc.name      testToCharSpecialSymbols0020
     * @tc.desc      Verify space and symbols conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharSpecialSymbols0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bSpace = new Byte(32 as byte);
        const bExcl = new Byte(33 as byte);
        const bQuest = new Byte(63 as byte);
        expect(bSpace.toChar()).assertEqual(c' ');
        expect(bExcl.toChar()).assertEqual(c'!');
        expect(bQuest.toChar()).assertEqual(c'?');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_2300
     * @tc.name      testToCharLatin1Compatibility0023
     * @tc.desc      Verify Latin-1 extended range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharLatin1Compatibility0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = -128 as Byte;
        const b2: Byte = -1 as Byte;
        const c1 = b1.toChar();
        const c2 = b2.toChar();
        expect(c1.toInt()).assertEqual(65408);
        expect(c2.toInt()).assertEqual(65535);
        expect(c1.toInt() >= 0 && c1.toInt() <= 255 || c1.toInt() >= 65280).assertTrue();
        expect(c2.toInt() >= 0 && c2.toInt() <= 255 || c2.toInt() >= 65280).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_2400
     * @tc.name      testToCharSingleParamThrows0024
     * @tc.desc      Verify single parameter returns expected result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharSingleParamThrows0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: Byte = new Byte(65 as byte);
        const result: char = b.toChar();
        expect(result).assertEqual(c'A');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_2600
     * @tc.name      testToCharNullInstance0026
     * @tc.desc      Verify null instance handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharNullInstance0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte | null = null;
        try {
          b!.toChar();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('NullPointerError');
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_2700
     * @tc.name      testToCharUndefinedInstance0027
     * @tc.desc      Verify undefined instance handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharUndefinedInstance0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte | undefined = undefined;
        try {
          b!.toChar();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('NullPointerError');
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_2800
     * @tc.name      testToCharLiteralSyntax0028
     * @tc.desc      Verify char literal with c prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharLiteralSyntax0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(65 as byte);
        const result = b.toChar();
        const c1: char = c'A';
        expect(result).assertEqual(c1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_2900
     * @tc.name      testToCharEscapeChars0029
     * @tc.desc      Verify escape sequence char support
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharEscapeChars0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(10 as byte);
        const b2 = new Byte(9 as byte);
        const b3 = new Byte(127 as byte);
        expect(b1.toChar()).assertEqual(c'\n');
        expect(b2.toChar()).assertEqual(c'\t');
        expect(b3.toChar()).assertEqual(c'\x7F');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_3000
     * @tc.name      testToCharVsToString0030
     * @tc.desc      Compare toChar and toString results
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharVsToString0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: Byte = 65 as Byte;
        const ch = b.toChar();
        const str = b.toString();
        expect(ch).assertEqual(c'A');
        expect(str).assertEqual("65");
        expect(str.length).assertEqual(2);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_3100
     * @tc.name      testCharToByteConversion0031
     * @tc.desc      Verify char can convert back to byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharToByteConversion0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = 88 as Byte;
        const ch = b1.toChar();
        expect(ch).assertEqual(c'X');
        expect(ch.toInt()).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_3200
     * @tc.name      testToCharInstanceVsStatic0032
     * @tc.desc      Compare instance and static toChar
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharInstanceVsStatic0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(77 as byte);
        const res1 = b.toChar();
        const res2 = Byte.toChar(77 as byte);
        expect(res1).assertEqual(res2);
        expect(res1).assertEqual(c'M');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_3400
     * @tc.name      testToCharCallable0034
     * @tc.desc      Verify toChar can be invoked
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharCallable0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(65 as byte);
        const result = b.toChar();
        expect(result).assertEqual(c'A');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_3600
     * @tc.name      testToCharSingleCharHandling0036
     * @tc.desc      Verify char handling operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharSingleCharHandling0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(72 as byte);
        const ch = b.toChar();
        const upper = ch.toUpperCase();
        expect(ch).assertEqual(c'H');
        expect(upper).assertEqual(c'H');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_3700
     * @tc.name      testToCharStringConcat0037
     * @tc.desc      Verify char string concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharStringConcat0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = 72 as Byte;
        const b2: Byte = 73 as Byte;
        const ch1 = b1.toChar();
        const ch2 = b2.toChar();
        expect(ch1).assertEqual(c'H');
        expect(ch2).assertEqual(c'I');
        const concat: string = ch1.toString() + ch2.toString();
        expect(concat).assertEqual("HI");
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_3800
     * @tc.name      testByteToCharArray0038
     * @tc.desc      Convert byte array to char array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToCharArray0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [
          72 as Byte,
          69 as Byte,
          76 as Byte,
          76 as Byte,
          79 as Byte
        ];
        const chars: char[] = bytes.map(b => b.toChar());
        const s = chars.join('');
        expect(s).assertEqual("HELLO");
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_3900
     * @tc.name      testByteSequenceToString0039
     * @tc.desc      Build string from byte sequence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSequenceToString0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [
          65 as Byte,
          66 as Byte,
          67 as Byte
        ];
        let s = '';
        for (const b of bytes) {
          s += b.toChar();
        }
        expect(s).assertEqual("ABC");
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_4000
     * @tc.name      testToCharComparison0040
     * @tc.desc      Verify char comparison operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharComparison0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(65 as byte);
        const b2 = new Byte(97 as byte);
        expect(b1.toChar() < b2.toChar()).assertTrue();
        expect(b1.toChar()).assertEqual(c'A');
        expect(b2.toChar()).assertEqual(c'a');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_4100
     * @tc.name      testToCharCaseConversion0041
     * @tc.desc      Verify char case conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharCaseConversion0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(97 as byte);
        const lower = b.toChar();
        const upper = lower.toUpperCase();
        expect(lower).assertEqual(c'a');
        expect(upper).assertEqual(c'A');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_4200
     * @tc.name      testToCharFullPrintableRange0042
     * @tc.desc      Full printable ASCII validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharFullPrintableRange0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = 32; i <= 126; i++) {
          const b: Byte = Int.toByte(i);
          const ch = b.toChar();
          expect(ch.toInt()).assertEqual(i);
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_4300
     * @tc.name      testToCharLetterRanges0043
     * @tc.desc      Verify uppercase and lowercase ranges
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharLetterRanges0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = 65; i <= 90; i++) {
          const b: Byte = Int.toByte(i);
          const ch = b.toChar();
          expect(ch >= c'A' && ch <= c'Z').assertTrue();
        }
        for (let i = 97; i <= 122; i++) {
          const b: Byte = Int.toByte(i);
          const ch = b.toChar();
          expect(ch >= c'a' && ch <= c'z').assertTrue();
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_4400
     * @tc.name      testToCharRepeatedConversion0044
     * @tc.desc      Verify consistent conversion in loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharRepeatedConversion0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const c1 = b.toChar();
        const c2 = b.toChar();
        const c3 = b.toChar();
        expect(c1).assertEqual(c2);
        expect(c2).assertEqual(c3);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_4500
     * @tc.name      testToCharRoundTrip0045
     * @tc.desc      Verify byte-char-byte round trip integrity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharRoundTrip0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = Int.toByte(90);
        const ch = b1.toChar();
        const b2: Byte = Int.toByte(90);
        expect(b2.toChar()).assertEqual(ch);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_4600
     * @tc.name      testToCharHighFrequencyCalls0046
     * @tc.desc      Verify stability under high frequency calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharHighFrequencyCalls0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(65 as byte);
        for (let i = 0; i < 10000; i++) {
          const res = b.toChar();
          expect(res).assertEqual(c'A');
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_4700
     * @tc.name      testToCharLargeArrayConversion0047
     * @tc.desc      Convert large byte array to char array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharLargeArrayConversion0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [];
        for (let i = 0; i < 1000; i++) {
          bytes.push(Int.toByte(65 + (i % 26)));
        }
        const chars: char[] = bytes.map(b => b.toChar());
        expect(chars.length).assertEqual(1000);
        expect(chars[0]).assertEqual(c'A');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_4800
     * @tc.name      testToCharAsciiStandard0048
     * @tc.desc      Verify ASCII standard compliance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharAsciiStandard0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bDigit = new Byte(48 as byte);
        const bUpper = new Byte(65 as byte);
        const bLower = new Byte(97 as byte);
        expect(bDigit.toChar()).assertEqual(c'0');
        expect(bUpper.toChar()).assertEqual(c'A');
        expect(bLower.toChar()).assertEqual(c'a');
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOCHAR_TEST_4900
     * @tc.name      testToCharCrossPlatform0049
     * @tc.desc      Verify cross-platform consistency
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToCharCrossPlatform0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: Byte = Int.toByte(90);
        const res = b.toChar();
        expect(res).assertEqual(c'Z');
      }
    );
  });
}
