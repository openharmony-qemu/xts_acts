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

export default function ByteStaticToCharTest(): void {
  describe("ByteStaticToCharTest", () => {
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
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_0100
     * @tc.name      testStaticToCharWithArgument0001
     * @tc.desc      Verify static toChar works with a byte parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharWithArgument0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toChar(65 as byte);
        expect(result.toInt()).assertEqual(65);
        expect(result).assertEqual(c'A');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_1400
     * @tc.name      testStaticToCharAssignToChar0014
     * @tc.desc      Verify static result can be char type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharAssignToChar0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result: char = Byte.toChar(88 as byte);
        expect(result).assertEqual(c'X');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_1500
     * @tc.name      testStaticToCharLengthOne0015
     * @tc.desc      Verify static char length is 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharLengthOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toChar(65 as byte);
        expect(result).assertEqual(c'A');
        expect(result.toString().length).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_1600
     * @tc.name      testStaticToCharMultipleCalls0016
     * @tc.desc      Verify consistent results across static calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharMultipleCalls0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const r1 = Byte.toChar(75 as byte);
        const r2 = Byte.toChar(75 as byte);
        const r3 = Byte.toChar(75 as byte);
        expect(r1).assertEqual(r2);
        expect(r2).assertEqual(r3);
        expect(r1).assertEqual(c'K');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_1700
     * @tc.name      testStaticToCharDifferentValues0017
     * @tc.desc      Verify different values return independent static results
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharDifferentValues0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toChar(65 as byte)).assertEqual(c'A');
        expect(Byte.toChar(66 as byte)).assertEqual(c'B');
        expect(Byte.toChar(67 as byte)).assertEqual(c'C');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_1800
     * @tc.name      testStaticToCharDoesNotModifyOriginal0018
     * @tc.desc      Verify static method has no side effect
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharDoesNotModifyOriginal0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const c1 = Byte.toChar(88 as byte);
        const c2 = Byte.toChar(88 as byte);
        expect(c1).assertEqual(c2);
        expect(c1).assertEqual(c'X');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_2000
     * @tc.name      testStaticToCharSpecialSymbols0020
     * @tc.desc      Verify static space and symbols conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharSpecialSymbols0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toChar(32 as byte)).assertEqual(c' ');
        expect(Byte.toChar(33 as byte)).assertEqual(c'!');
        expect(Byte.toChar(63 as byte)).assertEqual(c'?');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_2100
     * @tc.name      testStaticToCharCommonControlChars0021
     * @tc.desc      Verify static tab, newline, carriage return
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharCommonControlChars0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toChar(9 as byte)).assertEqual(c'\t');
        expect(Byte.toChar(10 as byte)).assertEqual(c'\n');
        expect(Byte.toChar(13 as byte)).assertEqual(c'\r');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_2300
     * @tc.name      testStaticToCharLatin1Compatibility0023
     * @tc.desc      Verify static Latin-1 extended range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharLatin1Compatibility0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const c1 = Byte.toChar(-128 as byte);
        const c2 = Byte.toChar(-1 as byte);
        expect(c1.toInt()).assertEqual(65408);
        expect(c2.toInt()).assertEqual(65535);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_2400
     * @tc.name      testStaticToCharSingleParamThrows0024
     * @tc.desc      Verify static single parameter returns expected result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharSingleParamThrows0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result: char = Byte.toChar(65 as byte);
        expect(result).assertEqual(c'A');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_2500
     * @tc.name      testStaticToCharMultiParamThrows0025
     * @tc.desc      Verify static multiple parameters returns expected result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharMultiParamThrows0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result: char = Byte.toChar(66 as byte);
        expect(result).assertEqual(c'B');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_2800
     * @tc.name      testStaticToCharLiteralSyntax0028
     * @tc.desc      Verify static char literal with c prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharLiteralSyntax0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toChar(65 as byte);
        const c1: char = c'A';
        expect(result).assertEqual(c1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_2900
     * @tc.name      testStaticToCharEscapeChars0029
     * @tc.desc      Verify static escape sequence char support
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharEscapeChars0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toChar(10 as byte)).assertEqual(c'\n');
        expect(Byte.toChar(9 as byte)).assertEqual(c'\t');
        expect(Byte.toChar(127 as byte)).assertEqual(c'\x7F');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_3000
     * @tc.name      testStaticToCharVsToString0030
     * @tc.desc      Compare static toChar and toString results
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharVsToString0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const ch = Byte.toChar(65 as byte);
        const str = Byte.toString(65 as byte);
        expect(ch).assertEqual(c'A');
        expect(str).assertEqual("65");
        expect(str.length).assertEqual(2);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_3100
     * @tc.name      testStaticCharToByteConversion0031
     * @tc.desc      Verify static char can convert back to byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticCharToByteConversion0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const ch = Byte.toChar(88 as byte);
        expect(ch).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_3400
     * @tc.name      testStaticToCharCallable0034
     * @tc.desc      Verify static toChar can be invoked
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharCallable0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toChar(65 as byte);
        expect(result).assertEqual(c'A');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_3600
     * @tc.name      testStaticToCharSingleCharHandling0036
     * @tc.desc      Verify static char handling operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharSingleCharHandling0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const ch = Byte.toChar(104 as byte);
        const upper = ch.toUpperCase();
        expect(ch).assertEqual(c'h');
        expect(upper).assertEqual(c'H');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_3700
     * @tc.name      testStaticToCharStringConcat0037
     * @tc.desc      Verify static char string concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharStringConcat0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const ch1 = Byte.toChar(72 as byte);
        const ch2 = Byte.toChar(73 as byte);
        expect(ch1).assertEqual(c'H');
        expect(ch2).assertEqual(c'I');
        const concat: string = ch1.toString() + ch2.toString();
        expect(concat).assertEqual("HI");
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_3800
     * @tc.name      testStaticByteToCharArray0038
     * @tc.desc      Convert static byte array to char array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticByteToCharArray0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: byte[] = [
          72 as byte,
          69 as byte,
          76 as byte,
          76 as byte,
          79 as byte
        ];
        let s: string = '';
        for (let i = 0; i < bytes.length; i++) {
          s += Byte.toChar(bytes[i]).toString();
        }
        expect(s).assertEqual("HELLO");
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_3900
     * @tc.name      testStaticByteSequenceToString0039
     * @tc.desc      Build string from static byte sequence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticByteSequenceToString0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [
          65 as Byte,
          66 as Byte,
          67 as Byte
        ];
        let s = '';
        for (const b of bytes) {
          s += Byte.toChar(b);
        }
        expect(s).assertEqual("ABC");
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_4000
     * @tc.name      testStaticToCharComparison0040
     * @tc.desc      Verify static char comparison operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharComparison0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toChar(65 as byte) < Byte.toChar(97 as byte)).assertTrue();
        expect(Byte.toChar(65 as byte)).assertEqual(c'A');
        expect(Byte.toChar(97 as byte)).assertEqual(c'a');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_4100
     * @tc.name      testStaticToCharCaseConversion0041
     * @tc.desc      Verify static char case conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharCaseConversion0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const lower = Byte.toChar(97 as byte);
        const upper = lower.toUpperCase();
        expect(lower).assertEqual(c'a');
        expect(upper).assertEqual(c'A');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_4200
     * @tc.name      testStaticToCharFullPrintableRange0042
     * @tc.desc      Full static printable ASCII validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharFullPrintableRange0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = 32; i <= 126; i++) {
          const ch = Byte.toChar(Int.toByte(i));
          expect(ch.toInt()).assertEqual(i);
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_4300
     * @tc.name      testStaticToCharLetterRanges0043
     * @tc.desc      Verify static uppercase and lowercase ranges
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharLetterRanges0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = 65; i <= 90; i++) {
          const ch = Byte.toChar(Int.toByte(i));
          expect(ch >= c'A' && ch <= c'Z').assertTrue();
        }
        for (let i = 97; i <= 122; i++) {
          const ch = Byte.toChar(Int.toByte(i));
          expect(ch >= c'a' && ch <= c'z').assertTrue();
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_4400
     * @tc.name      testStaticToCharRepeatedConversion0044
     * @tc.desc      Verify static toChar repeated conversion returns same char value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharRepeatedConversion0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const c1 = Byte.toChar(88 as byte);
        const c2 = Byte.toChar(88 as byte);
        const c3 = Byte.toChar(88 as byte);
        expect(c1).assertEqual(c2);
        expect(c2).assertEqual(c3);
        expect(c1).assertEqual(c'X');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_4600
     * @tc.name      testStaticToCharHighFrequencyCalls0046
     * @tc.desc      Verify stability under static high frequency calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharHighFrequencyCalls0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = 0; i < 10000; i++) {
          const res = Byte.toChar(65 as byte);
          expect(res).assertEqual(c'A');
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_4700
     * @tc.name      testStaticToCharLargeArrayConversion0047
     * @tc.desc      Convert large static byte array to char array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharLargeArrayConversion0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [];
        for (let i = 0; i < 1000; i++) {
          bytes.push(Int.toByte(65 + (i % 26)));
        }
        const chars: char[] = bytes.map(b => Byte.toChar(b));
        expect(chars.length).assertEqual(1000);
        expect(chars[0]).assertEqual(c'A');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_4800
     * @tc.name      testStaticToCharAsciiStandard0048
     * @tc.desc      Verify static ASCII standard compliance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharAsciiStandard0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toChar(48 as byte)).assertEqual(c'0');
        expect(Byte.toChar(65 as byte)).assertEqual(c'A');
        expect(Byte.toChar(97 as byte)).assertEqual(c'a');
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOCHAR_4900
     * @tc.name      testStaticToCharCrossPlatform0049
     * @tc.desc      Verify static cross-platform consistency
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToCharCrossPlatform0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const res = Byte.toChar(90 as byte);
        expect(res).assertEqual(c'Z');
      }
    );
  });
}
