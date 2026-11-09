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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from './../Util.test';

function expectParseIntThrows(inputText: string, radix: int, expectedErrorName: string): void {
  try {
    Short.parseInt(inputText, radix);
    expect().assertFail();
  } catch (e) {
    expect(e.name).assertEqual(expectedErrorName);
  }
}

export default function shortParseIntTest(): void {
  describe('ShortParseIntTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0100
     * @tc.name testShortParseInt_merged1
     * @tc.desc BasicValue / BoundaryOverflow: covers 10 merged test points for Short.parseInt, including radix conversion, boundary values, negative values, fractions and rounding, and type conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let positiveText: string = "255";
        let negativeText: string = "-255";
        let decimalRadix: int = 10;
        let expectedPositive: short = 255 as short;
        let expectedNegative: short = (-255) as short;
        let positiveResult: short = Short.parseInt(positiveText, decimalRadix);
        let negativeResult: short = Short.parseInt(negativeText, decimalRadix);
        expect(positiveResult).assertEqual(expectedPositive);
        expect(negativeResult).assertEqual(expectedNegative);
      }

      {
        let parsedNegative: short = Short.parseInt("-42", 10);
        expect(Math.abs(Short.toInt(parsedNegative))).assertEqual(42);
        let deepNegative: short = Short.parseInt("-3000", 10);
        expect(Math.abs(Short.toInt(deepNegative))).assertEqual(3000);
      }

      {
        let a: short = Short.parseInt("5000", 10);
        let sa: Short = new Short(a);
        let l: long = sa.toLong();
        expect(l).assertEqual(5000 as long);
        let maxVal: short = Short.parseInt("32767", 10);
        let sMax: Short = new Short(maxVal);
        expect(sMax.toLong()).assertEqual(32767 as long);
      }

      {
        let zero: Short = new Short(0 as short);
        let pos: short = Short.parseInt("42", 10);
        let sPos: Short = new Short(pos);
        let negated: short = zero.sub(sPos).toShort();
        expect(negated).assertEqual((-42) as short);
        let neg: short = Short.parseInt("-100", 10);
        let sNeg: Short = new Short(neg);
        let negNegated: short = zero.sub(sNeg).toShort();
        expect(negNegated).assertEqual(100 as short);
      }

      {
        let binaryMaxText: string = "111111111111111";
        let base36MaxText: string = "pa7";
        expect(Short.parseInt(binaryMaxText, 2)).assertEqual(Short.MAX_VALUE);
        expect(Short.parseInt(base36MaxText, 36)).assertEqual(Short.MAX_VALUE);
      }

      {
        let decimalBoundaryTexts: string[] = ["-32768", "32767"];
        let parsedMinValue: short = Short.parseInt(decimalBoundaryTexts[0], 10);
        let parsedMaxValue: short = Short.parseInt(decimalBoundaryTexts[1], 10);
        expect(parsedMinValue).assertEqual(Short.MIN_VALUE);
        expect(parsedMaxValue).assertEqual(Short.MAX_VALUE);
        expect(parsedMaxValue > parsedMinValue).assertTrue();
      }

      {
        let okCode: short = Short.parseInt("200", 10);
        let notFoundCode: short = Short.parseInt("404", 10);
        expect(okCode).assertEqual(200 as short);
        expect(notFoundCode).assertEqual(404 as short);
        let isSuccess: boolean = Short.toInt(okCode) >= 200 && Short.toInt(okCode) < 300;
        let isClientErr: boolean = Short.toInt(notFoundCode) >= 400 && Short.toInt(notFoundCode) < 500;
        expect(isSuccess).assertTrue();
        expect(isClientErr).assertTrue();
      }

      {
        let a: short = Short.parseInt("100", 10);
        let sa: Short = new Short(a);
        let b: byte = sa.toByte();
        expect(b).assertEqual(100 as byte);
        let neg: short = Short.parseInt("-1", 10);
        let sNeg: Short = new Short(neg);
        let negByte: byte = sNeg.toByte();
        expect(negByte).assertEqual((-1) as byte);
      }

      {
        let maxDigits: string = "32767";
        let minDigits: string = "32768";
        for (let pad: int = 1; pad <= 12; pad++) {
          let zeros: string = "";
          for (let z: int = 0; z < pad; z++) {
            zeros += "0";
          }
          let paddedMax: string = zeros + maxDigits;
          let paddedMin: string = "-" + zeros + minDigits;
          expect(Short.parseInt(paddedMax, 10)).assertEqual(Short.MAX_VALUE);
          expect(Short.parseInt(paddedMin, 10)).assertEqual(Short.MIN_VALUE);
        }
      }

      {
        let binMin: short = Short.parseInt("-1000000000000000", 2);
        let octMin: short = Short.parseInt("-100000", 8);
        let hexMin: short = Short.parseInt("-8000", 16);
        let base36Min: short = Short.parseInt("-pa8", 36);
        expect(binMin).assertEqual(Short.MIN_VALUE);
        expect(octMin).assertEqual(Short.MIN_VALUE);
        expect(hexMin).assertEqual(Short.MIN_VALUE);
        expect(base36Min).assertEqual(Short.MIN_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0200
     * @tc.name testShortParseInt_merged2
     * @tc.desc ErrorException: covers 10 merged test points for Short.parseInt, including radix conversion, exceptions, business scenarios, overflow, and boundary values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let alphabeticText: string = "abc";
        let decimalRadix: int = 10;
        try {
          Short.parseInt(alphabeticText, decimalRadix);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("FormatError");
        }
      }

      {
        let overMaxText: string = "32768";
        let underMinText: string = "-32769";
        let decimalRadix: int = 10;
        expectParseIntThrows(overMaxText, decimalRadix, "FormatError");
        expectParseIntThrows(underMinText, decimalRadix, "FormatError");
      }

      {
        let maxValidRadix: int = 36;
        expect(Short.parseInt("1", maxValidRadix)).assertEqual(1 as short);
        expectParseIntThrows("1", 37, "ArgumentOutOfRangeError");
      }

      {
        try {
          Short.parseInt("", 10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("FormatError");
        }
      }

      {
        let whitespace: string = String.fromCharCode(32);
        expectParseIntThrows(whitespace, 10, "FormatError");
      }

      {
        let hexPartialText: string = "fg";
        let decimalPartialText: string = "1.5";
        let hexPartialValue: short = Short.parseInt(hexPartialText, 16);
        let decimalPartialValue: short = Short.parseInt(decimalPartialText, 10);
        expect(hexPartialValue).assertEqual(15 as short);
        expect(decimalPartialValue).assertEqual(1 as short);
      }

      {
        let doubleSigned: string = "-" + "+42";
        expectParseIntThrows(doubleSigned, 10, "FormatError");
      }

      {
        let frameCrc: short = Short.parseInt("1d0f", 16);
        let frameType: short = Short.parseInt("02", 16);
        expect(frameCrc).assertEqual(7439 as short);
        expect(frameType).assertEqual(2 as short);
        expect((Short.toInt(frameType) & 1) == 0).assertTrue();
        expect(Short.toInt(frameCrc) > 0).assertTrue();
      }

      {
        let validShort: int[] = [];
        let parseErrors: string[] = [];
  
        validShort.push(Short.parseInt('0', 10));
        validShort.push(Short.parseInt('255', 10));
        validShort.push(Short.parseInt('-1', 10));
        try {
          Short.parseInt('invalid', 10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('FormatError');
        }
        parseErrors.push('invalid');
        validShort.push(Short.parseInt('32767', 10));
        validShort.push(Short.parseInt('-32768', 10));
        try {
          Short.parseInt('99999', 10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('FormatError');
        }
        parseErrors.push('99999');
        try {
          Short.parseInt('', 10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('FormatError');
        }
        parseErrors.push('');
  
        expect(validShort.length).assertEqual(5);
        expect(parseErrors.length).assertEqual(3);
      }

      {
        let configCache: Map<string, Short> = new Map<string, Short>();
  
        configCache.set('timeout', new Short(Short.parseInt('30', 10)));
        configCache.set('port', new Short(Short.parseInt('8080', 10)));
        try {
          Short.parseInt('50000', 10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('FormatError');
        }
  
        expect(configCache.get('timeout')!.toInt()).assertEqual(30);
        expect(configCache.get('port')!.toInt()).assertEqual(8080);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0300
     * @tc.name testShortParseInt_merged3
     * @tc.desc ErrorException / CrossTypeRoundTrip / RadixConversion: covers 10 merged test points for Short.parseInt, including radix conversion, exceptions, business scenarios, sign handling, and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let parsedValues: short[] = [];
  
        parsedValues.push(Short.parseInt("50", 10));
        parsedValues.push(Short.parseInt("200", 10));
        try {
          Short.parseInt("invalid", 10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('FormatError');
        }
        parsedValues.push(Short.parseInt("100", 10));
        try {
          Short.parseInt("err", 10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('FormatError');
        }
        parsedValues.push(Short.parseInt("150", 10));
        expect(parsedValues.length).assertEqual(4);
        let sum: int = 0;
        let minVal: short = Short.MAX_VALUE;
        let maxVal: short = Short.MIN_VALUE;
        for (let v of parsedValues) {
          sum += v;
          if (v < minVal) { minVal = v; }
          if (v > maxVal) { maxVal = v; }
        }
        expect(sum).assertEqual(500);
        expect(minVal).assertEqual(50 as short);
        expect(maxVal).assertEqual(200 as short);
      }

      {
        let binaryText: string = "2";
        let octalText: string = "9";
        let quaternaryText: string = "4";
        expectParseIntThrows(binaryText, 2, "FormatError");
        expectParseIntThrows(octalText, 8, "FormatError");
        expectParseIntThrows(quaternaryText, 4, "FormatError");
      }

      {
        let nonAsciiText: string = String.fromCharCode(0x0661) + String.fromCharCode(0x0662) + String.fromCharCode(0x0663);
        expectParseIntThrows(nonAsciiText, 10, "FormatError");
      }

      {
        let leadingPlus: short = Short.parseInt("  +45", 10);
        expect(leadingPlus).assertEqual(45 as short);
        let leadingMinus: short = Short.parseInt("  -45", 10);
        expect(leadingMinus).assertEqual((-45) as short);
        let multiSpace: short = Short.parseInt("   +7", 10);
        expect(multiSpace).assertEqual(7 as short);
        expectParseIntThrows("+ 45", 10, "FormatError");
        expectParseIntThrows("- 45", 10, "FormatError");
      }

      {
        expectParseIntThrows("-", 2, "FormatError");
        expectParseIntThrows("-", 8, "FormatError");
        expectParseIntThrows("-", 10, "FormatError");
        expectParseIntThrows("-", 16, "FormatError");
        expectParseIntThrows("-", 36, "FormatError");
        expectParseIntThrows("+", 2, "FormatError");
        expectParseIntThrows("+", 8, "FormatError");
        expectParseIntThrows("+", 10, "FormatError");
        expectParseIntThrows("+", 16, "FormatError");
        expectParseIntThrows("+", 36, "FormatError");
      }

      {
        expectParseIntThrows("42", (-1), "ArgumentOutOfRangeError");
        expectParseIntThrows("42", (-8), "ArgumentOutOfRangeError");
        expectParseIntThrows("42", (-16), "ArgumentOutOfRangeError");
        expectParseIntThrows("42", (-36), "ArgumentOutOfRangeError");
        expectParseIntThrows("42", (-100), "ArgumentOutOfRangeError");
      }

      {
        expectParseIntThrows("😀42", 10, "FormatError");
        expect(Short.parseInt("42😀", 10)).assertEqual(42 as short);
        expect(Short.parseInt("12😀34", 10)).assertEqual(12 as short);
        expectParseIntThrows("-😀42", 10, "FormatError");
      }

      {
        let original: short = Short.parseInt("1000", 10);
        let s: Short = new Short(Int.toShort(original));
  
        let computed: Short = s.add(new Short(500 as short));
        expect(computed.toInt()).assertEqual(1500);
  
        let asString: string = computed.toString();
        expect(asString).assertEqual("1500");
  
        let reparsed: short = Short.parseInt(asString, 10);
        expect(reparsed).assertEqual(1500);
  
        let roundtripped: Short = new Short(Int.toShort(reparsed));
        expect(roundtripped.equals(computed)).assertTrue();
      }

      {
        let parsed: short = Short.parseInt("100", 10);
        let intVal: int = Short.toInt(parsed);
        expect(intVal).assertEqual(100);
      }

      {
        let decimalText: string = "789";
        let decimalRadix: int = 10;
        let parsedValue: short = Short.parseInt(decimalText, decimalRadix);
        expect(parsedValue).assertEqual(789 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0400
     * @tc.name testShortParseInt_merged4
     * @tc.desc RadixConversion: covers 10 merged test points for Short.parseInt, including radix conversion, fractions and rounding, business scenarios, equality consistency, and sign handling.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let binaryText: string = "10011";
        let octalText: string = "36";
        let hexText: string = "2a";
        let binaryValue: short = Short.parseInt(binaryText, 2);
        let octalValue: short = Short.parseInt(octalText, 8);
        let hexValue: short = Short.parseInt(hexText, 16);
        expect(binaryValue).assertEqual(19 as short);
        expect(octalValue).assertEqual(30 as short);
        expect(hexValue).assertEqual(42 as short);
      }

      {
        let radixSource: short = Short.parseInt("16", 10);
        let dynamicRadix: int = Short.toInt(radixSource);
        expect(dynamicRadix).assertEqual(16);
        expect(Short.parseInt("ff", dynamicRadix)).assertEqual(255 as short);
        let octalRadix: int = Short.toInt(Short.parseInt("8", 10));
        expect(Short.parseInt("17", octalRadix)).assertEqual(15 as short);
      }

      {
        let decimalText: string = "223";
        let defaultRadix: int = 0;
        let decimalRadix: int = 10;
        let expectedShort: short = 223 as short;
        let defaultRadixResult: short = Short.parseInt(decimalText, defaultRadix);
        let decimalRadixResult: short = Short.parseInt(decimalText, decimalRadix);
        expect(defaultRadixResult).assertEqual(expectedShort);
        expect(defaultRadixResult).assertEqual(decimalRadixResult);
      }

      {
        let packed: short = Short.parseInt("AB", 16);
        let packedValue: int = Short.toInt(packed);
        expect(packedValue).assertEqual(171);
        let highNibble: int = (packedValue >> 4) & 0xF;
        let lowNibble: int = packedValue & 0xF;
        expect(highNibble).assertEqual(10);
        expect(lowNibble).assertEqual(11);
        expect(highNibble * 16 + lowNibble).assertEqual(packedValue);
      }

      {
        let first: short = Short.parseInt("12+34", 10);
        expect(first).assertEqual(12 as short);
        let second: short = Short.parseInt("-12+34", 10);
        expect(second).assertEqual((-12) as short);
        let third: short = Short.parseInt("8+9", 10);
        expect(third).assertEqual(8 as short);
      }

      {
        let singleCharValues: int[] = [];
        for (let digit: int = 0; digit <= 9; digit++) {
          let singleChar: string = String.fromCharCode(48 + digit);
          let parsedDigit: short = Short.parseInt(singleChar, 10);
          singleCharValues.push(Short.toInt(parsedDigit));
        }
        expect(singleCharValues.length).assertEqual(10);
        expect(singleCharValues).assertDeepEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      }

      {
        let band1: short = Short.parseInt("4", 10);
        let band2: short = Short.parseInt("7", 10);
        let multiplier: short = Short.parseInt("3", 10);
        expect(band1).assertEqual(4 as short);
        expect(band2).assertEqual(7 as short);
        expect(multiplier).assertEqual(3 as short);
        let baseValue: int = Short.toInt(band1) * 10 + Short.toInt(band2);
        expect(baseValue).assertEqual(47);
        expect(Short.toInt(band1) >= 0 && Short.toInt(band1) <= 9).assertTrue();
      }

      {
        let result: short = Short.parseInt("-ff", 16);
        expect(result).assertEqual((-255) as short);
      }

      {
        let obdRequestId: short = Short.parseInt("7df", 16);
        let ecuResponseId: short = Short.parseInt("7e8", 16);
        expect(obdRequestId).assertEqual(2015 as short);
        expect(ecuResponseId).assertEqual(2024 as short);
        expect(Short.toInt(obdRequestId) < Short.toInt(ecuResponseId)).assertTrue();
        expect(Short.toInt(obdRequestId) >= 0 && Short.toInt(obdRequestId) <= 2047).assertTrue();
      }

      {
        expect(Short.parseInt("10", 2)).assertEqual(2 as short);
        expect(Short.parseInt("10", 8)).assertEqual(8 as short);
        expect(Short.parseInt("10", 10)).assertEqual(10 as short);
        expect(Short.parseInt("10", 16)).assertEqual(16 as short);
        expect(Short.parseInt("10", 36)).assertEqual(36 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0500
     * @tc.name testShortParseInt_merged5
     * @tc.desc RadixConversion: covers 10 merged test points for Short.parseInt, including radix conversion, business scenarios, fractions and rounding, type conversion, and round-trip conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let cpLatinA: short = Short.parseInt("0041", 16);
        let cpCJK: short = Short.parseInt("4e2d", 16);
        expect(cpLatinA).assertEqual(65 as short);
        expect(cpCJK).assertEqual(20013 as short);
        expect(Short.toInt(cpLatinA) >= 0 && Short.toInt(cpLatinA) <= 65535).assertTrue();
        expect(Short.toInt(cpCJK) >= 0x4e00 && Short.toInt(cpCJK) <= 0x9fff).assertTrue();
      }

      {
        let val42: short = Short.parseInt("42", 10);
        let s42: Short = new Short(val42);
        expect(Short.parseInt(s42.toString(2), 2)).assertEqual(val42);
        let val64: short = Short.parseInt("64", 10);
        let s64: Short = new Short(val64);
        expect(Short.parseInt(s64.toString(8), 8)).assertEqual(val64);
        let val255: short = Short.parseInt("255", 10);
        let s255: Short = new Short(val255);
        expect(Short.parseInt(s255.toString(16), 16)).assertEqual(val255);
      }

      {
        let seg0: short = Short.parseInt("3f", 16);
        let seg1: short = Short.parseInt("06", 16);
        let seg8: short = Short.parseInt("7f", 16);
        expect(seg0).assertEqual(63 as short);
        expect(seg1).assertEqual(6 as short);
        expect(seg8).assertEqual(127 as short);
        expect(Short.toInt(seg0) >= 0 && Short.toInt(seg0) <= 255).assertTrue();
        expect(Short.toInt(seg8)).assertEqual(127);
      }

      {
        let decValue: short = Short.parseInt("12345", 10);
        let hexValue: short = Short.parseInt("7FFF", 16);
        let octalLiteral: Short = new Short(Int.toShort(0o777));
        let binaryLiteral: Short = new Short(Int.toShort(0b1010));
  
        expect(hexValue).assertEqual(Short.MAX_VALUE);
  
        let sum: Short = new Short(Int.toShort(decValue)).add(new Short(100 as short));
        expect(sum.toInt()).assertEqual(12445);
  
        expect(octalLiteral.toInt()).assertEqual(511);
        expect(binaryLiteral.toInt()).assertEqual(10);
      }

      {
        let result: short = Short.parseInt("-0", 10);
        expect(result).assertEqual(0 as short);
      }

      {
        let digitChars: string = "0123456789abcdefghijklmnopqrstuvwxyz";
        for (let radix: int = 2; radix <= 36; radix++) {
          let hundredValue: short = Short.parseInt("100", radix);
          expect(hundredValue).assertEqual(Int.toShort(radix * radix));
          let maxDigit: string = digitChars.substring(radix - 1, radix);
          let maxTwoDigit: string = maxDigit + maxDigit;
          let maxTwoValue: short = Short.parseInt(maxTwoDigit, radix);
          expect(maxTwoValue).assertEqual(Int.toShort(radix * radix - 1));
        }
      }

      {
        expect(Short.parseInt("0", 5)).assertEqual(0 as short);
        expect(Short.parseInt("4", 5)).assertEqual(4 as short);
        expect(Short.parseInt("10", 5)).assertEqual(5 as short);
        expect(Short.parseInt("43", 5)).assertEqual(23 as short);
        expect(Short.parseInt("432", 5)).assertEqual(117 as short);
        expect(Short.parseInt("100", 5)).assertEqual(25 as short);
        expect(Short.parseInt("1000", 5)).assertEqual(125 as short);
        expect(Short.parseInt("-4", 5)).assertEqual((-4) as short);
      }

      {
        expect(Short.parseInt("0", 36)).assertEqual(0 as short);
        expect(Short.parseInt("9", 36)).assertEqual(9 as short);
        expect(Short.parseInt("a", 36)).assertEqual(10 as short);
        expect(Short.parseInt("k", 36)).assertEqual(20 as short);
        expect(Short.parseInt("z", 36)).assertEqual(35 as short);
        expect(Short.parseInt("A", 36)).assertEqual(10 as short);
        expect(Short.parseInt("K", 36)).assertEqual(20 as short);
        expect(Short.parseInt("Z", 36)).assertEqual(35 as short);
        expect(Short.parseInt("10", 36)).assertEqual(36 as short);
      }

      {
        let decimalStrings: string[] = ["1", "9", "99", "999", "9999"];
        for (let i: int = 1; i < decimalStrings.length; i++) {
          let prev: short = Short.parseInt(decimalStrings[i - 1], 10);
          let curr: short = Short.parseInt(decimalStrings[i], 10);
          expect(prev < curr).assertTrue();
        }
        let hexStrings: string[] = ["1", "f", "ff", "fff"];
        for (let i: int = 1; i < hexStrings.length; i++) {
          let prev: short = Short.parseInt(hexStrings[i - 1], 16);
          let curr: short = Short.parseInt(hexStrings[i], 16);
          expect(prev < curr).assertTrue();
        }
        let base36Strings: string[] = ["1", "z", "1z", "zz"];
        for (let i: int = 1; i < base36Strings.length; i++) {
          let prev: short = Short.parseInt(base36Strings[i - 1], 36);
          let curr: short = Short.parseInt(base36Strings[i], 36);
          expect(prev < curr).assertTrue();
        }
        expect(Short.parseInt(decimalStrings[decimalStrings.length - 1], 10)).assertEqual(9999 as short);
        expect(Short.parseInt(hexStrings[hexStrings.length - 1], 16)).assertEqual(4095 as short);
        expect(Short.parseInt(base36Strings[base36Strings.length - 1], 36)).assertEqual(1295 as short);
      }

      {
        expect(Short.parseInt("0x10", 16)).assertEqual(16 as short);
        expect(Short.parseInt("0x10", 10)).assertEqual(0 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0600
     * @tc.name testShortParseInt_merged6
     * @tc.desc RadixConversion / Idempotent / ArithmeticBitwise: covers 10 merged test points for Short.parseInt, including radix conversion, equality consistency, fractions and rounding, business scenarios, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let original: short = Short.parseInt("77", 8);
        expect(original).assertEqual(63 as short);
        let s: Short = new Short(original);
        let octStr: string = s.toString(8);
        let roundTrip: short = Short.parseInt(octStr, 8);
        expect(roundTrip).assertEqual(original);
        let hexVal: short = Short.parseInt("FF", 16);
        let sHex: Short = new Short(hexVal);
        let binStr: string = sHex.toString(2);
        expect(binStr).assertEqual("11111111");
      }

      {
        let wholeDec: short = Short.parseInt("5678", 10);
        let headDec: short = Short.parseInt("56", 10);
        let tailDec: short = Short.parseInt("78", 10);
        expect(wholeDec).assertEqual(Int.toShort(Short.toInt(headDec) * 100 + Short.toInt(tailDec)));
        let wholeHex: short = Short.parseInt("abc", 16);
        let headHex: short = Short.parseInt("a", 16);
        let tailHex: short = Short.parseInt("bc", 16);
        expect(wholeHex).assertEqual(Int.toShort(Short.toInt(headHex) * 256 + Short.toInt(tailHex)));
      }

      {
        let dividend: short = Short.parseInt("100", 10);
        let divisor: short = Short.parseInt("7", 10);
        let dividendInt: int = dividend;
        let divisorInt: int = divisor;
        expect(dividendInt % divisorInt).assertEqual(2);
        let hexDividend: short = Short.parseInt("ff", 16);
        let hexDivisor: short = Short.parseInt("10", 16);
        let hexDividendInt: int = hexDividend;
        let hexDivisorInt: int = hexDivisor;
        expect(hexDividendInt % hexDivisorInt).assertEqual(15);
      }

      {
        let payload: short = Short.parseInt("357", 10);
        let payloadShort: Short = new Short(payload);
        let payloadStr: string = payloadShort.toString();
        let digitSum: int = 0;
        for (let i: int = 0; i < payloadStr.length; i++) {
          let digit: short = Short.parseInt(payloadStr.substring(i, i + 1), 10);
          digitSum += digit;
        }
        expect(digitSum).assertEqual(15);
        expect(digitSum % 10).assertEqual(5);
        let checkDigit: short = Short.parseInt("5", 10);
        expect(digitSum % 10).assertEqual(Short.toInt(checkDigit));
      }

      {
        expect(Short.parseInt("12" + "34", 10)).assertEqual(1234 as short);
        expect(Short.parseInt("-" + "12" + "34", 10)).assertEqual((-1234) as short);
        expect(Short.parseInt("F" + "F", 16)).assertEqual(255 as short);
        expect(Short.parseInt("-" + "F" + "F", 16)).assertEqual((-255) as short);
        expect(Short.parseInt("00" + "7" + "B", 16)).assertEqual(123 as short);
        expect(Short.parseInt("1" + "0" + "1" + "0", 2)).assertEqual(10 as short);
      }

      {
        let decimalText: string = "42";
        let decimalRadix: int = 10;
        let expectedShort: short = 42 as short;
        let firstParsedValue: short = Short.parseInt(decimalText, decimalRadix);
        let secondParsedValue: short = Short.parseInt(decimalText, decimalRadix);
        let thirdParsedValue: short = Short.parseInt(decimalText, decimalRadix);
        expect(firstParsedValue).assertEqual(secondParsedValue);
        expect(secondParsedValue).assertEqual(thirdParsedValue);
        expect(firstParsedValue).assertEqual(expectedShort);
      }

      {
        let lowercaseHexText: string = "1ffe";
        let uppercaseHexText: string = "1FFE";
        let hexRadix: int = 16;
        let expectedShort: short = 8190 as short;
        let lowercaseResult: short = Short.parseInt(lowercaseHexText, hexRadix);
        let uppercaseResult: short = Short.parseInt(uppercaseHexText, hexRadix);
        expect(lowercaseResult).assertEqual(expectedShort);
        expect(uppercaseResult).assertEqual(expectedShort);
        expect(lowercaseResult).assertEqual(uppercaseResult);
      }

      {
        let radices: int[] = [2, 3, 4, 5, 6, 7, 8, 9, 10, 16, 20, 36];
        for (let i: int = 0; i < radices.length; i++) {
          let result: short = Short.parseInt("0", radices[i]);
          expect(result).assertEqual(0 as short);
        }
      }

      {
        let decResult: short = Short.parseInt("15", 10);
        let hexResult: short = Short.parseInt("F", 16);
        let octResult: short = Short.parseInt("17", 8);
        let binResult: short = Short.parseInt("1111", 2);
        expect(decResult).assertEqual(15 as short);
        expect(hexResult).assertEqual(15 as short);
        expect(octResult).assertEqual(15 as short);
        expect(binResult).assertEqual(15 as short);
        expect(decResult).assertEqual(hexResult);
        expect(octResult).assertEqual(binResult);
      }

      {
        let cells: int[] = [1, 2, 3, 4];
        let rowWidth: int = 2;
        let rowIndex: int = Short.toInt(Short.parseInt("1", 10));
        let colIndex: int = Short.toInt(Short.parseInt("0", 10));
        expect(cells[rowIndex * rowWidth + colIndex]).assertEqual(3);
        let zeroRow: int = Short.toInt(Short.parseInt("0", 10));
        let oneCol: int = Short.toInt(Short.parseInt("1", 10));
        expect(cells[zeroRow * rowWidth + oneCol]).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0700
     * @tc.name testShortParseInt_merged7
     * @tc.desc ArithmeticBitwise: covers 10 merged test points for Short.parseInt, including radix conversion, containers and references, saturation and clamping, sign handling, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let record: string = "name=ArKTS";
        let sepIndex: short = Short.parseInt("4", 10);
        expect(record.substring(0, Short.toInt(sepIndex))).assertEqual("name");
        let offset: short = Short.parseInt("5", 10);
        expect(record.substring(Short.toInt(offset))).assertEqual("ArKTS");
      }

      {
        let upperBound: int = 127;
        let lowerBound: int = 0;
        let rawValue: int = Short.toInt(Short.parseInt("200", 10));
        expect(Math.max(lowerBound, Math.min(rawValue, upperBound))).assertEqual(127);
        let lowValue: int = Short.toInt(Short.parseInt("-5", 10));
        expect(Math.max(lowerBound, Math.min(lowValue, upperBound))).assertEqual(0);
        let inRangeValue: int = Short.toInt(Short.parseInt("100", 10));
        expect(Math.max(lowerBound, Math.min(inRangeValue, upperBound))).assertEqual(100);
      }

      {
        let plusSignedText: string = "+123";
        let unsignedText: string = "123";
        let plusResult: short = Short.parseInt(plusSignedText, 10);
        let unsignedResult: short = Short.parseInt(unsignedText, 10);
        expect(plusResult).assertEqual(123 as short);
        expect(plusResult).assertEqual(unsignedResult);
        expect(Short.parseInt("+7", 10)).assertEqual(7 as short);
      }

      {
        let a: short = Short.parseInt("100", 10);
        let b: short = Short.parseInt("50", 10);
        let sa: Short = new Short(a);
        let sb: Short = new Short(b);
        let sum: short = sa.add(sb).toShort();
        expect(sum).assertEqual(150 as short);
      }

      {
        let sizeValue: short = Short.parseInt("4", 10);
        let size: int = Short.toInt(sizeValue);
        let slots: int[] = [7, 8, 9, 10];
        expect(slots.length).assertEqual(size);
        let total: int = 0;
        for (let i: int = 0; i < size; i++) {
          total += slots[i];
        }
        expect(total).assertEqual(34);
      }

      {
        let portValue: short = Short.parseInt("6", 10);
        expect(1 << Short.toInt(portValue)).assertEqual(64);
        let shiftValue: short = Short.parseInt("3", 10);
        expect(Short.toInt(shiftValue) << 2).assertEqual(12);
      }

      {
        let levelValue: short = Short.parseInt("2", 10);
        let category: string = "UNKNOWN";
        switch (Short.toInt(levelValue)) {
          case 1:
            category = "LOW";
            break;
          case 2:
            category = "MEDIUM";
            break;
          case 3:
            category = "HIGH";
            break;
          default:
            break;
        }
        expect(category).assertEqual("MEDIUM");
      }

      {
        let codeMap: Map<int, string> = new Map<int, string>();
        codeMap.set(200, "OK");
        codeMap.set(404, "NOT_FOUND");
        let okCode: short = Short.parseInt("200", 10);
        let notFoundCode: short = Short.parseInt("404", 10);
        expect(codeMap.get(Short.toInt(okCode))).assertEqual("OK");
        expect(codeMap.get(Short.toInt(notFoundCode))).assertEqual("NOT_FOUND");
      }

      {
        let trailingSpaceText: string = "42 ";
        let leadingNewlineText: string = "\n42";
        expect(Short.parseInt(trailingSpaceText, 10)).assertEqual(42 as short);
        expect(Short.parseInt(leadingNewlineText, 10)).assertEqual(42 as short);
      }

      {
        let a: short = Short.parseInt("10", 10);
        let b: short = Short.parseInt("5", 10);
        let c: short = Short.parseInt("3", 10);
        let result: int = (Short.toInt(a) + Short.toInt(b)) * Short.toInt(c);
        expect(result).assertEqual(45);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0800
     * @tc.name testShortParseInt_merged8
     * @tc.desc ArithmeticBitwise: covers 10 merged test points for Short.parseInt, including radix conversion, type conversion, loop accumulation, containers and references, and bitwise operations.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let values: short[] = [Short.parseInt("10", 10), Short.parseInt("20", 10), Short.parseInt("30", 10)];
        let sum: int = 0;
        for (let i: int = 0; i < 3; i++) {
          sum = sum + Short.toInt(values[i]);
        }
        expect(sum).assertEqual(60);
      }

      {
        let byteWord: short = Short.parseInt("258", 10);
        let wordValue: int = Short.toInt(byteWord);
        expect(wordValue).assertEqual(258);
        let swapped: int = ((wordValue & 0xFF) << 8) | ((wordValue >> 8) & 0xFF);
        expect(swapped).assertEqual(513);
      }

      {
        let a: short = Short.parseInt("200", 10);
        let b: short = Short.parseInt("50", 10);
        let sa: Short = new Short(a);
        let sb: Short = new Short(b);
        let diff: short = sa.sub(sb).toShort();
        expect(diff).assertEqual(150 as short);
        expect(sa.sub(sb).toInt()).assertEqual(150);
  
        let c: short = Short.parseInt("-100", 10);
        let sc: Short = new Short(c);
        let diffNeg: short = sa.sub(sc).toShort();
        expect(diffNeg).assertEqual(300 as short);
      }

      {
        let a: short = Short.parseInt("30", 10);
        let b: short = Short.parseInt("5", 10);
        let sa: Short = new Short(a);
        let sb: Short = new Short(b);
        let product: short = sa.mul(sb).toShort();
        expect(product).assertEqual(150 as short);
  
        let c: short = Short.parseInt("-4", 10);
        let sc: Short = new Short(c);
        let negProduct: short = sa.mul(sc).toShort();
        expect(negProduct).assertEqual((-120) as short);
  
        let zeroVal: short = Short.parseInt("0", 10);
        let sz: Short = new Short(zeroVal);
        expect(sa.mul(sz).toInt()).assertEqual(0);
      }

      {
        let a: short = Short.parseInt("100", 10);
        let b: short = Short.parseInt("4", 10);
        let sa: Short = new Short(a);
        let sb: Short = new Short(b);
        let quotient: short = sa.div(sb).toShort();
        expect(quotient).assertEqual(25 as short);
  
        let c: short = Short.parseInt("-5", 10);
        let sc: Short = new Short(c);
        let negQuotient: short = sa.div(sc).toShort();
        expect(negQuotient).assertEqual((-20) as short);
      }

      {
        let small: short = Short.parseInt("50", 10);
        let medium: short = Short.parseInt("100", 10);
        let large: short = Short.parseInt("200", 10);
        let sSmall: Short = new Short(small);
        let sMedium: Short = new Short(medium);
        let sLarge: Short = new Short(large);
        expect(sSmall.compareTo(sMedium) < 0).assertTrue();
        expect(sLarge.compareTo(sMedium) > 0).assertTrue();
        expect(sMedium.compareTo(sMedium)).assertEqual(0);
        expect(sSmall.compareTo(sLarge) < 0).assertTrue();
      }

      {
        let a: short = Short.parseInt("42", 10);
        let b: short = Short.parseInt("42", 10);
        let c: short = Short.parseInt("99", 10);
        let sa: Short = new Short(a);
        let sb: Short = new Short(b);
        let sc: Short = new Short(c);
        expect(sa.equals(sb)).assertTrue();
        expect(sa.equals(sc)).assertFalse();
        expect(sb.equals(sa)).assertTrue();
        let negA: short = Short.parseInt("-42", 10);
        let sNeg: Short = new Short(negA);
        expect(sa.equals(sNeg)).assertFalse();
      }

      {
        let a: short = Short.parseInt("10", 10);
        let b: short = Short.parseInt("20", 10);
        let sa: Short = new Short(a);
        let sb: Short = new Short(b);
        expect(sa.isLessThan(sb)).assertTrue();
        expect(sb.isGreaterThan(sa)).assertTrue();
        expect(sa.isLessThan(sa)).assertFalse();
        expect(sb.isGreaterThan(sb)).assertFalse();
      }

      {
        let a: short = Short.parseInt("65", 10);
        let sa: Short = new Short(a);
        let c: char = sa.toChar();
        expect(c).assertEqual(new Short(65 as short).toChar());
        let zero: short = Short.parseInt("0", 10);
        let sz: Short = new Short(zero);
        expect(sz.toChar()).assertEqual(new Short(0 as short).toChar());
      }

      {
        let a: short = Short.parseInt("100", 10);
        let sa: Short = new Short(a);
        let f: float = sa.toFloat();
        expect(f).assertEqual(100.0);
        let d: double = sa.toDouble();
        expect(d).assertEqual(100.0);
        let neg: short = Short.parseInt("-50", 10);
        let sNeg: Short = new Short(neg);
        expect(sNeg.toFloat()).assertEqual(-50.0);
        expect(sNeg.toDouble()).assertEqual(-50.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0900
     * @tc.name testShortParseInt_merged9
     * @tc.desc ArithmeticBitwise / BatchSampling / BusinessScenario: covers 10 merged test points for Short.parseInt, including radix conversion, loop accumulation, business scenarios, equality consistency, and bitwise operations.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: short = Short.parseInt("15", 10);
        let b: short = Short.parseInt("15", 10);
        let c: short = Short.parseInt("30", 10);
        let sa: Short = new Short(a);
        let sb: Short = new Short(b);
        let sc: Short = new Short(c);
        expect(sa.isLessEqualThan(sb)).assertTrue();
        expect(sa.isGreaterEqualThan(sb)).assertTrue();
        expect(sa.isLessEqualThan(sc)).assertTrue();
        expect(sc.isGreaterEqualThan(sa)).assertTrue();
        expect(sc.isLessEqualThan(sa)).assertFalse();
      }

      {
        let a: short = Short.parseInt("12", 10);
        let b: short = Short.parseInt("10", 10);
        let ai: int = a;
        let bi: int = b;
        let andResult: int = ai & bi;
        expect(andResult).assertEqual(8);
        let orResult: int = ai | bi;
        expect(orResult).assertEqual(14);
        let xorResult: int = ai ^ bi;
        expect(xorResult).assertEqual(6);
      }

      {
        expect(Short.parseInt('\t42', 10)).assertEqual(42 as short);
        expect(Short.parseInt('-7', 10)).assertEqual(-7 as short);
      }

      {
        let firstText: string = "1071";
        let secondText: string = "462";
        let firstValue: int = Short.toInt(Short.parseInt(firstText, 10));
        let secondValue: int = Short.toInt(Short.parseInt(secondText, 10));
        let dividend: int = firstValue;
        let divisor: int = secondValue;
        while (divisor != 0) {
          let remainder: int = dividend % divisor;
          dividend = divisor;
          divisor = remainder;
        }
        expect(dividend).assertEqual(21);
      }

      {
        let startCount: int = Short.toInt(Short.parseInt("5", 10));
        let remaining: int = startCount;
        let steps: int = 0;
        while (remaining > 0) {
          remaining = remaining - 1;
          steps = steps + 1;
        }
        expect(steps).assertEqual(5);
        expect(remaining).assertEqual(0);
      }

      {
        let boundText: string = "5";
        let loopBound: short = Short.parseInt(boundText, 10);
        let count: int = 0;
        let sum: int = 0;
        for (let i: int = 0; i < Short.toInt(loopBound); i++) {
          count++;
          sum += i;
        }
        expect(count).assertEqual(5);
        expect(sum).assertEqual(10);
      }

      {
        let maxRow: int = Short.toInt(Short.parseInt("3", 10));
        let maxColumn: int = Short.toInt(Short.parseInt("4", 10));
        let products: int[] = [];
        for (let row: int = 1; row <= maxRow; row++) {
          for (let column: int = 1; column <= maxColumn; column++) {
            products.push(row * column);
          }
        }
        expect(products.length).assertEqual(12);
        expect(products[0]).assertEqual(1);
        expect(products[11]).assertEqual(12);
      }

      {
        let computedCrcStr: string = "12AB";
        let expectedCrcStr: string = "12AB";
        let computedCrc: short = Short.parseInt(computedCrcStr, 16);
        let expectedCrc: short = Short.parseInt(expectedCrcStr, 16);
        expect(Short.toInt(computedCrc)).assertEqual(0x12AB);
        expect(computedCrc).assertEqual(expectedCrc);
        let crcXor: int = Short.toInt(computedCrc) ^ Short.toInt(expectedCrc);
        expect(crcXor).assertEqual(0);
        let tamperedCrc: short = Short.parseInt("12AC", 16);
        expect(computedCrc === tamperedCrc).assertFalse();
      }

      {
        let utcTime: string = "123519";
        let hoursStr: string = utcTime.substring(0, 2);
        let minutesStr: string = utcTime.substring(2, 4);
        let hours: short = Short.parseInt(hoursStr, 10);
        let minutes: short = Short.parseInt(minutesStr, 10);
  
        expect(hours).assertEqual(12 as short);
        expect(minutes).assertEqual(35 as short);
        expect(Short.toInt(hours) < 24).assertTrue();
        expect(Short.toInt(minutes) < 60).assertTrue();
      }

      {
        let cidrPrefix: short = Short.parseInt("24", 10);
        expect(cidrPrefix).assertEqual(24 as short);
        expect(Short.toInt(cidrPrefix) >= 0 && Short.toInt(cidrPrefix) <= 32).assertTrue();
  
        let usableHosts: int = (1 << (32 - Short.toInt(cidrPrefix))) - 2;
        expect(usableHosts).assertEqual(254);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_1000
     * @tc.name testShortParseInt_merged10
     * @tc.desc BusinessScenario: covers 10 merged test points for Short.parseInt, including business scenarios, radix conversion, containers and references, comparison and ordering, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let pageNumber: short = Short.parseInt("42", 10);
        let pageOffset: short = Short.parseInt("512", 10);
        let pageSize: short = Short.parseInt("4096", 10);
        expect(pageNumber).assertEqual(42 as short);
        expect(pageOffset).assertEqual(512 as short);
        expect(Short.toInt(pageOffset) >= 0 && Short.toInt(pageOffset) < Short.toInt(pageSize)).assertTrue();
  
        let physAddr: int = Short.toInt(pageNumber) * Short.toInt(pageSize) + Short.toInt(pageOffset);
        expect(physAddr).assertEqual(172544);
      }

      {
        let numLines: short = Short.parseInt("256", 10);
        let lineSize: short = Short.parseInt("64", 10);
        let associativity: short = Short.parseInt("4", 10);
        expect(numLines).assertEqual(256 as short);
        expect(lineSize).assertEqual(64 as short);
        expect(associativity).assertEqual(4 as short);
  
        let numSets: int = Short.toInt(numLines) / Short.toInt(associativity);
        expect(numSets).assertEqual(64);
        expect(Short.toInt(numLines) * Short.toInt(lineSize)).assertEqual(16384);
      }

      {
        let twoByteLead: short = Short.parseInt("c3", 16);
        let threeByteLead: short = Short.parseInt("e2", 16);
        let fourByteLead: short = Short.parseInt("f0", 16);
        expect(twoByteLead).assertEqual(195 as short);
        expect(threeByteLead).assertEqual(226 as short);
        expect(fourByteLead).assertEqual(240 as short);
        expect(Short.toInt(twoByteLead) >= 0xc0 && Short.toInt(twoByteLead) <= 0xdf).assertTrue();
        expect(Short.toInt(threeByteLead) >= 0xe0 && Short.toInt(threeByteLead) <= 0xef).assertTrue();
      }

      {
        let transferCount: short = Short.parseInt("1024", 10);
        let burstSize: short = Short.parseInt("16", 10);
        expect(transferCount).assertEqual(1024 as short);
        expect(burstSize).assertEqual(16 as short);
  
        let bs: int = Short.toInt(burstSize);
        expect((bs & (bs - 1)) == 0).assertTrue();
        expect(Short.toInt(transferCount)).assertEqual(1024);
      }

      {
        let vendorId: short = Short.parseInt("046d", 16);
        let productId: short = Short.parseInt("3400", 16);
        expect(vendorId).assertEqual(1133 as short);
        expect(productId).assertEqual(13312 as short);
        expect(Short.toInt(vendorId) > 0).assertTrue();
        expect(Short.toInt(productId) > 0).assertTrue();
        expect(vendorId !== productId).assertTrue();
      }

      {
        let parsed: short;
        let s: Short;
        let inRange: boolean;
  
        parsed = Short.parseInt("1000", 10);
        s = new Short(parsed);
        inRange = s.isGreaterEqualThan(new Short(-32768 as short)) &&
                  s.isLessEqualThan(new Short(32767 as short));
        expect(inRange).assertTrue();
  
        try {
          Short.parseInt("40000", 10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('FormatError');
        }
  
        parsed = Short.parseInt("-1000", 10);
        s = new Short(parsed);
        inRange = s.isGreaterEqualThan(new Short(-32768 as short)) &&
                  s.isLessEqualThan(new Short(32767 as short));
        expect(inRange).assertTrue();
      }

      {
        let rawData: string[] = ['100', '200', '100', '300', '200', '400', '500'];
  
        let uniqueValues: Set<int> = new Set<int>();
        for (let raw of rawData) {
          let parsed: short = Short.parseInt(raw, 10);
          let s: Short = new Short(parsed);
          uniqueValues.add(s.toInt());
        }
  
        expect(uniqueValues.size).assertEqual(5);
  
        let sorted: int[] = [];
        uniqueValues.forEach((v): void => { sorted.push(v); });
        sorted.sort();
  
        let sumDouble: double = 0.0;
        for (let v of sorted) { sumDouble += v; }
        let avgDouble: double = sumDouble / sorted.length;
        expect(avgDouble).assertEqual(300.0);
        expect(sorted[0]).assertEqual(100);
        expect(sorted[4]).assertEqual(500);
      }

      {
        let raw: string = "150";
        let parsed: short = Short.parseInt(raw, 10);
        let threshold: Short = new Short(100 as short);
        let upperBound: Short = new Short(200 as short);
        let inRange: boolean = new Short(parsed).isGreaterEqualThan(threshold) &&
          new Short(parsed).isLessEqualThan(upperBound);
        expect(inRange).assertTrue();
        expect(parsed).assertEqual(150 as short);
      }

      {
        let maxLen: short = Short.parseInt("3", 10);
        let words: string[] = ["a", "bb", "ccc", "dddd", "ee"];
        let accepted: string[] = [];
        for (let w of words) {
          if (w.length <= Short.toInt(maxLen)) {
            accepted.push(w);
          }
        }
        expect(accepted.length).assertEqual(4);
        expect(accepted[0]).assertEqual("a");
        expect(accepted[3]).assertEqual("ee");
      }

      {
        let iterationCount: int = 10000;
        let sum: int = 0;
        for (let i: int = 0; i < iterationCount; i++) {
          let valueStr: string = (i % 200).toString();
          let parsed: short = Short.parseInt(valueStr, 10);
          sum += parsed;
        }
        expect(sum).assertEqual(995000);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_1100
     * @tc.name testShortParseInt_merged11
     * @tc.desc Other: covers 8 merged test points for Short.parseInt, including radix conversion, containers and references, fractions and rounding, type conversion, and loop accumulation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let candidates: string[] = ["7", "11", "13"];
        let selector: int = Short.toInt(Short.parseInt("1", 10));
        let selectedText: string = candidates[selector];
        expect(selectedText).assertEqual("11");
        expect(Short.parseInt(selectedText, 10)).assertEqual(11 as short);
      }

      {
        let weekDays: string[] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        let indexText: string = "4";
        let parsedIndex: short = Short.parseInt(indexText, 10);
        expect(weekDays[Short.toInt(parsedIndex)]).assertEqual("Thu");
        let zeroIndex: short = Short.parseInt("0", 10);
        expect(weekDays[Short.toInt(zeroIndex)]).assertEqual("Sun");
        let threeIndex: short = Short.parseInt("3", 10);
        expect(weekDays[Short.toInt(threeIndex)]).assertEqual("Wed");
      }

      {
        let widths: short[] = [Short.parseInt("10", 10), Short.parseInt("25", 10), Short.parseInt("7", 10)];
        expect(Math.max(Math.max(Short.toInt(widths[0]), Short.toInt(widths[1])), Short.toInt(widths[2]))).assertEqual(25);
        let total: int = Short.toInt(widths[0]) + Short.toInt(widths[1]) + Short.toInt(widths[2]);
        expect(total).assertEqual(42);
      }

      {
        let record: string = "id=2048;";
        let equalsIndex: int = record.indexOf("=");
        let terminatorIndex: int = record.indexOf(";");
        let idText: string = record.substring(equalsIndex + 1, terminatorIndex);
        expect(Short.parseInt(idText, 10)).assertEqual(2048 as short);
        expect(record.substring(0, equalsIndex)).assertEqual("id");
      }

      {
        let numerator: short = Short.parseInt("3", 10);
        let denominator: short = Short.parseInt("4", 10);
        let ratio: double = new Short(numerator).toDouble() / new Short(denominator).toDouble();
        expect(ratio).assertEqual(0.75);
        let halfNumerator: short = Short.parseInt("1", 10);
        let halfDenominator: short = Short.parseInt("2", 10);
        expect(new Short(halfNumerator).toDouble() / new Short(halfDenominator).toDouble()).assertEqual(0.5);
      }

      {
        let firstValue: short = Short.parseInt("11", 10);
        let secondValue: short = Short.parseInt("22", 10);
        let buffer: short = firstValue;
        firstValue = secondValue;
        secondValue = buffer;
        expect(firstValue).assertEqual(22 as short);
        expect(secondValue).assertEqual(11 as short);
        expect(Short.toInt(firstValue) + Short.toInt(secondValue)).assertEqual(33);
      }

      {
        let termIndex: int = Short.toInt(Short.parseInt("10", 10));
        let triangular: int = termIndex * (termIndex + 1) / 2;
        expect(triangular).assertEqual(55);
        let smallTerm: int = Short.toInt(Short.parseInt("7", 10));
        expect(smallTerm * (smallTerm + 1) / 2).assertEqual(28);
      }

      {
        let a: short = Short.parseInt("10", 10);
        let b: short = Short.parseInt("20", 10);
        let c: short = Short.parseInt("3", 10);
        let sa: Short = new Short(a);
        let sb: Short = new Short(b);
        let sc: Short = new Short(c);
        let sum: short = sa.add(sb).toShort();
        let result: short = new Short(sum).mul(sc).toShort();
        expect(result).assertEqual(90 as short);
        let d: short = Short.parseInt("2", 10);
        let sd: Short = new Short(d);
        let finalResult: short = new Short(result).div(sd).toShort();
        expect(finalResult).assertEqual(45 as short);
      }
    });

  });
}