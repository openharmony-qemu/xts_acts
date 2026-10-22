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
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function shortToCharTest(): void {
  describe('ShortToCharTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0100
     * @tc.name testShortToChar_merged1
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toChar, including boundary values, type conversion, containers and references, constructor forms, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect('' + Short.toChar(Int.toShort(0x2000))).assertEqual('\u2000');
        expect('' + Short.toChar(Int.toShort(0x206F))).assertEqual('\u206F');
        expect('' + Short.toChar(Int.toShort(0x257F))).assertEqual('\u257F');
        expect('' + Short.toChar(Int.toShort(0x3040))).assertEqual('\u3040');
        expect('' + Short.toChar(Int.toShort(0x309F))).assertEqual('\u309F');
        expect('' + Short.toChar(Int.toShort(0x2700))).assertEqual('\u2700');
        expect('' + Short.toChar(Int.toShort(0x27BF))).assertEqual('\u27BF');
      }

      {
        let maxBoundaryValue: short = Short.MAX_VALUE;
        let actualResult: char = Short.toChar(maxBoundaryValue);
        expect(actualResult).assertEqual(c'\u7FFF');
      }

      {
        let minBoundaryValue: short = Short.MIN_VALUE;
        let actualResult: char = Short.toChar(minBoundaryValue);
        expect(actualResult).assertEqual(c'\u8000');
      }

      {
        let distinctUnits: Set<int> = new Set<int>();
        for (let offset: int = 0; offset < 256; offset++) {
          let value: short = Int.toShort(Short.MIN_VALUE + offset);
          let codeUnit: int = ('' + Short.toChar(value)).charCodeAt(0);
          distinctUnits.add(codeUnit);
        }
        expect(distinctUnits.size).assertEqual(256);
        expect(distinctUnits.has(0x8000)).assertTrue();
        expect(distinctUnits.has(0x80FF)).assertTrue();
      }

      {
        let boxed: Short = new Short(Short.MAX_VALUE);
        let instanceResult: char = boxed.toChar();
        expect(instanceResult).assertEqual(c'\u7FFF');
        expect(boxed.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let boundaryVals: short[] = [Short.MIN_VALUE, Int.toShort(Short.MIN_VALUE + 1), Int.toShort(Short.MIN_VALUE + 2)];
        let expectedChars: char[] = [c'\u8000', c'\u8001', c'\u8002'];
        for (let i: int = 0; i < 3; i++) {
          let staticResult: char = Short.toChar(boundaryVals[i]);
          let boxed: Short = new Short(boundaryVals[i]);
          let instanceResult: char = boxed.toChar();
          expect(staticResult).assertEqual(expectedChars[i]);
          expect(instanceResult).assertEqual(expectedChars[i]);
          expect(staticResult).assertEqual(instanceResult);
          expect(boxed.toShort()).assertEqual(boundaryVals[i]);
        }
      }

      {
        let boxed: Short = new Short(32766 as short);
        let instanceResult: char = boxed.toChar();
        let staticResult: char = Short.toChar(32766 as short);
        expect(instanceResult).assertEqual(c'\u7FFE');
        expect(staticResult).assertEqual(c'\u7FFE');
        expect(instanceResult).assertEqual(staticResult);
        expect(boxed.toShort()).assertEqual(32766 as short);
      }

      {
        let cnCode: Short = new Short(20013 as short);
        let cnChar: char = cnCode.toChar();
        expect(cnChar).assertEqual(c'\u4E2D');
  
        let jpCode: Short = new Short(12354 as short);
        let jpChar: char = jpCode.toChar();
        expect(jpChar).assertEqual(c'\u3042');
  
        let maxChar: char = Short.toChar(new Short(32767 as short));
        let minChar: char = Short.toChar(new Short(-32768 as short));
        expect(maxChar).assertEqual(c'\u7FFF');
        expect(minChar).assertEqual(c'\u8000');
      }

      {
        let maxVal: int = Short.MAX_VALUE;
        for (let offset: int = 0; offset < 10; offset++) {
          let val: short = Int.toShort(maxVal - offset);
          let actual: string = '' + Short.toChar(val);
          let expected: string = String.fromCharCode(maxVal - offset);
          expect(actual).assertEqual(expected);
        }
        expect(Short.toChar(Short.MAX_VALUE)).assertEqual(c'\u7FFF');
        expect(Short.toChar(Int.toShort(Short.MAX_VALUE - 9))).assertEqual(c'\u7FF6');
      }

      {
        let maxChar: char = Short.toChar(Short.MAX_VALUE);
        let minChar: char = Short.toChar(Short.MIN_VALUE);
        expect(maxChar).assertEqual(c'\u7FFF');
        expect(minChar).assertEqual(c'\u8000');
        let maxUnsigned: int = Short.MAX_VALUE & 0xFFFF;
        let minUnsigned: int = Short.MIN_VALUE & 0xFFFF;
        expect(minUnsigned - maxUnsigned).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0200
     * @tc.name testShortToChar_merged2
     * @tc.desc BoundaryOverflow / CrossTypeRoundTrip: covers 10 merged test points for Short.toChar, including type conversion, containers and references, boundary values, zero values, and wrapping.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(Short.toChar(0x0000 as short)).assertEqual(c'\u0000');
        expect(Short.toChar((-1) as short)).assertEqual(c'\uFFFF');
        expect(Short.toChar(0x00FF as short)).assertEqual(c'\u00FF');
        expect(Short.toChar((-256) as short)).assertEqual(c'\uFF00');
        expect(Short.toChar((-1) as short)).assertEqual(c'\uFFFF');
      }

      {
        let encrypt = (ch: string): string => {
          let code: int = ch.charCodeAt(0);
          if (code >= 65 && code <= 90) {
            let shifted: int = ((code - 65 + 1) % 26) + 65;
            return '' + Short.toChar(Int.toShort(shifted));
          }
          if (code >= 97 && code <= 122) {
            let shifted: int = ((code - 97 + 1) % 26) + 97;
            return '' + Short.toChar(Int.toShort(shifted));
          }
          return ch;
        };
        expect(encrypt('A')).assertEqual('B');
        expect(encrypt('Z')).assertEqual('A');
        expect(encrypt('a')).assertEqual('b');
        expect(encrypt('z')).assertEqual('a');
      }

      {
        let sFF: Short = new Short(0xFF as short);
        expect(('' + sFF.toChar()).charCodeAt(0)).assertEqual(0xFF);
        let s100: Short = new Short(Int.toShort(0x100));
        expect(('' + s100.toChar()).charCodeAt(0)).assertEqual(0x100);
        let sFFF: Short = new Short(Int.toShort(0xFFF));
        expect(('' + sFFF.toChar()).charCodeAt(0)).assertEqual(0xFFF);
        let s1000: Short = new Short(Int.toShort(0x1000));
        expect(('' + s1000.toChar()).charCodeAt(0)).assertEqual(0x1000);
      }

      {
        for (let letterIndex: int = 0; letterIndex < 26; letterIndex++) {
          let upperChar: char = Short.toChar(Int.toShort(65 + letterIndex));
          let lowerChar: char = Short.toChar(Int.toShort(97 + letterIndex));
          expect(('' + lowerChar).charCodeAt(0) - ('' + upperChar).charCodeAt(0)).assertEqual(32);
        }
        expect(Short.toChar(65 as short)).assertEqual(c'A');
        expect(Short.toChar(97 as short)).assertEqual(c'a');
      }

      {
        let inputValues: short[] = [
          Int.toShort(0x2013),
          Int.toShort(0x2014),
          Int.toShort(0x2018),
          Int.toShort(0x201C),
          Int.toShort(0x2026)
        ];
        let expectedValues: string[] = ['\u2013', '\u2014', '\u2018', '\u201C', '\u2026'];
        for (let caseIndex: int = 0; caseIndex < inputValues.length; caseIndex++) {
          let actualChar: char = Short.toChar(inputValues[caseIndex]);
          expect('' + actualChar).assertEqual(expectedValues[caseIndex]);
        }
        expect(('' + Short.toChar(Int.toShort(0x2026))).charCodeAt(0)).assertEqual(0x2026);
      }

      {
        let inputValues: short[] = [
          Int.toShort(0x0430),
          Int.toShort(0x0431),
          Int.toShort(0x0432),
          Int.toShort(0x044F)
        ];
        let expectedValues: string[] = ['\u0430', '\u0431', '\u0432', '\u044F'];
        for (let caseIndex: int = 0; caseIndex < inputValues.length; caseIndex++) {
          expect('' + Short.toChar(inputValues[caseIndex])).assertEqual(expectedValues[caseIndex]);
        }
      }

      {
        let zeroValue: short = 0 as short;
        let nulChar: char = Short.toChar(zeroValue);
        expect(nulChar).assertEqual(c'\u0000');
        expect(('' + nulChar).charCodeAt(0)).assertEqual(0);
        let roundTrip: short = Char.toShort(nulChar);
        expect(Short.toInt(roundTrip)).assertEqual(0);
      }

      {
        for (let codePoint: int = 0x2200; codePoint <= 0x2211; codePoint++) {
          let actualChar: char = Short.toChar(Int.toShort(codePoint));
          expect(('' + actualChar).charCodeAt(0)).assertEqual(codePoint);
          expect('' + actualChar).assertEqual(String.fromCharCode(codePoint));
        }
      }

      {
        let prevCodeUnit: int = ('' + Short.toChar(Short.MIN_VALUE)).charCodeAt(0);
        let step: int = 64;
        for (let value: int = Short.MIN_VALUE + step; value < 0; value += step) {
          let codeUnit: int = ('' + Short.toChar(Int.toShort(value))).charCodeAt(0);
          expect(codeUnit > prevCodeUnit).assertTrue();
          prevCodeUnit = codeUnit;
        }
        expect(('' + Short.toChar(Int.toShort(-1))).charCodeAt(0)).assertEqual(0xFFFF);
      }

      {
        let inputValues: short[] = [
          0x00 as short,
          0x09 as short,
          0x0A as short,
          0x1F as short
        ];
        let expectedValues: char[] = [
          c'\u0000',
          c'\u0009',
          c'\u000A',
          c'\u001F'
        ];
        let caseCount: int = 4;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: char = Short.toChar(inputValues[caseIndex]);
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0300
     * @tc.name testShortToChar_merged3
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toChar, including type conversion, containers and references, zero values, idempotence, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let inputValues: short[] = [
          0x0080 as short,
          0x00A5 as short,
          0x2605 as short,
          0x30A2 as short,
          0x4E2D as short
        ];
        let expectedValues: char[] = [
          c'\u0080',
          c'\u00A5',
          c'\u2605',
          c'\u30A2',
          c'\u4E2D'
        ];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: char = Short.toChar(inputValues[caseIndex]);
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }

      {
        let inputValues: short[] = [65 as short, Int.toShort(0x4E2D), 0 as short];
        let expectedValues: string[] = ['\u0041', '\u4E2D', '\u0000'];
        for (let caseIndex: int = 0; caseIndex < inputValues.length; caseIndex++) {
          let firstResult: char = Short.toChar(inputValues[caseIndex]);
          let secondResult: char = Short.toChar(inputValues[caseIndex]);
          let thirdResult: char = Short.toChar(inputValues[caseIndex]);
          expect('' + firstResult).assertEqual(expectedValues[caseIndex]);
          expect('' + secondResult).assertEqual(expectedValues[caseIndex]);
          expect('' + thirdResult).assertEqual(expectedValues[caseIndex]);
          expect(firstResult).assertEqual(secondResult);
          expect(secondResult).assertEqual(thirdResult);
        }
      }

      {
        let inputValue: short = 0x2605 as short;
        let boxedValue: Short = new Short(inputValue);
        let staticResult: char = Short.toChar(inputValue);
        let instanceResult: char = boxedValue.toChar();
        expect(staticResult).assertEqual(c'\u2605');
        expect(instanceResult).assertEqual(c'\u2605');
        expect(staticResult).assertEqual(instanceResult);
      }

      {
        let targetValue: short = 65 as short;
        let interleavedValue: short = 48 as short;
        let baselineResult: char = Short.toChar(targetValue);
        let interleavedResult: char = Short.toChar(interleavedValue);
        let afterResult: char = Short.toChar(targetValue);
        expect(baselineResult).assertEqual(c'A');
        expect(interleavedResult).assertEqual(c'0');
        expect(afterResult).assertEqual(c'A');
        expect(baselineResult).assertEqual(afterResult);
      }

      {
        let inputValues: short[] = [
          97 as short, 98 as short, 99 as short, 100 as short, 101 as short,
          102 as short, 103 as short, 104 as short, 105 as short, 106 as short,
          107 as short, 108 as short, 109 as short, 110 as short, 111 as short,
          112 as short, 113 as short, 114 as short, 115 as short, 116 as short,
          117 as short, 118 as short, 119 as short, 120 as short, 121 as short, 122 as short
        ];
        let expectedValues: char[] = [
          c'a', c'b', c'c', c'd', c'e', c'f', c'g', c'h', c'i', c'j',
          c'k', c'l', c'm', c'n', c'o', c'p', c'q', c'r', c's', c't',
          c'u', c'v', c'w', c'x', c'y', c'z'
        ];
        let count: int = 26;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toChar(inputValues[i])).assertEqual(expectedValues[i]);
        }
      }

      {
        let cyrillicCodes: short[] = [];
        let cyrillicChars: string[] = [];
        let startCode: int = 0x0410;
        let endCode: int = 0x042F;
        for (let code: int = startCode; code <= endCode; code++) {
          cyrillicCodes.push(Int.toShort(code));
          cyrillicChars.push(String.fromCharCode(code));
        }
        for (let i: int = 0; i < cyrillicCodes.length; i++) {
          let actual: string = '' + Short.toChar(cyrillicCodes[i]);
          expect(actual).assertEqual(cyrillicChars[i]);
        }
        expect(cyrillicCodes.length).assertEqual(32);
        expect(Short.toChar(cyrillicCodes[0])).assertEqual(c'\u0410');
        expect(Short.toChar(cyrillicCodes[31])).assertEqual(c'\u042F');
      }

      {
        let testVals: short[] = [(-1) as short, (-2) as short, (-5) as short, (-100) as short, (-256) as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let boxed: Short = new Short(testVals[i]);
          let instanceResult: char = boxed.toChar();
          let staticResult: char = Short.toChar(testVals[i]);
          expect(instanceResult).assertEqual(staticResult);
          expect(boxed.toShort()).assertEqual(testVals[i]);
        }
      }

      {
        let parsedA: short = Short.parseInt('65', 10);
        let parsedBang: short = Short.parseInt('33', 10);
        let resultA: char = Short.toChar(parsedA);
        let resultBang: char = Short.toChar(parsedBang);
        expect(resultA).assertEqual(c'A');
        expect(resultBang).assertEqual(c'!');
      }

      {
        let power: int = 1;
        for (let exp: int = 0; exp <= 14; exp++) {
          let val: short = Int.toShort(power);
          let ch: char = Short.toChar(val);
          let expectedStr: string = String.fromCharCode(power);
          expect('' + ch).assertEqual(expectedStr);
          power = power * 2;
        }
        expect(Short.toChar(1 as short)).assertEqual(c'\u0001');
        expect(Short.toChar(16384 as short)).assertEqual(c'\u4000');
      }

      {
        let boxedA: Short = new Short(65 as short);
        let boxedDigit: Short = new Short(49 as short);
        let boxedSpace: Short = new Short(32 as short);
        let boxedCjk: Short = new Short(0x4E2D as short);
        expect(boxedA.toChar()).assertEqual(c'A');
        expect(boxedDigit.toChar()).assertEqual(c'1');
        expect(boxedSpace.toChar()).assertEqual(c' ');
        expect(boxedCjk.toChar()).assertEqual(c'\u4E2D');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0400
     * @tc.name testShortToChar_merged4
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toChar, including type conversion, containers and references, sign handling, bitwise operations, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let charValue1: char = Short.toChar(0x00A9 as short);
        expect(charValue1).assertEqual(c'\u00A9');
        let charValue2: char = Short.toChar(0x00AE as short);
        expect(charValue2).assertEqual(c'\u00AE');
        let charValue3: char = Short.toChar(0x5000 as short);
        expect(charValue3).assertEqual(c'\u5000');
        let charValue4: char = Short.toChar(0x4E00 as short);
        expect(charValue4).assertEqual(c'\u4E00');
      }

      {
        let mismatchCount: int = 0;
        let step: int = 256;
        for (let value: int = 0; value <= Short.MAX_VALUE; value += step) {
          let lowCode: int = ('' + Short.toChar(Int.toShort(value))).charCodeAt(0);
          let highCode: int = ('' + Short.toChar(Int.toShort(value ^ 0x8000))).charCodeAt(0);
          if (highCode !== (lowCode ^ 0x8000)) {
            mismatchCount++;
          }
        }
        expect(mismatchCount).assertEqual(0);
      }

      {
        let puaCodes: int[] = [0xE000, 0xE123, 0xF000, 0xF8FF];
        let count: int = puaCodes.length;
        for (let i: int = 0; i < count; i++) {
          let code: int = puaCodes[i];
          let val: short = Int.toShort(code);
          let boxed: Short = new Short(val);
          let instanceResult: string = '' + boxed.toChar();
          let staticResult: string = '' + Short.toChar(val);
          let expectedChar: string = String.fromCharCode(code);
          expect(instanceResult).assertEqual(expectedChar);
          expect(staticResult).assertEqual(expectedChar);
          expect(instanceResult).assertEqual(staticResult);
        }
        expect('' + Short.toChar(Int.toShort(0xE000))).assertEqual('\uE000');
        expect('' + Short.toChar(Int.toShort(0xF8FF))).assertEqual('\uF8FF');
      }

      {
        let inputVals: short[] = [(-1) as short, (-128) as short, (-256) as short, (-32768) as short];
        let expectedChars: char[] = [c'\uFFFF', c'\uFF80', c'\uFF00', c'\u8000'];
        let count: int = 4;
        for (let i: int = 0; i < count; i++) {
          let result: char = Short.toChar(inputVals[i]);
          expect(result).assertEqual(expectedChars[i]);
        }
      }

      {
        let neg64: Short = new Short(-64 as short);
        let neg512: Short = new Short(-512 as short);
        let neg1024: Short = new Short(-1024 as short);
  
        expect(('' + neg64.toChar()).charCodeAt(0)).assertEqual(0xFFC0);
        expect(('' + neg512.toChar()).charCodeAt(0)).assertEqual(0xFE00);
        expect(('' + neg1024.toChar()).charCodeAt(0)).assertEqual(0xFC00);
      }

      {
        let codes: Short[] = [
          new Short(72 as short), new Short(101 as short), new Short(108 as short),
          new Short(108 as short), new Short(111 as short)
        ];
  
        let message: string = '';
        for (let code of codes) {
          message += code.toChar();
        }
        expect(message).assertEqual('Hello');
  
        let decoded: int[] = [];
        for (let i: int = 0; i < message.length; i++) {
          decoded.push(message.charCodeAt(i));
        }
        expect(decoded[0]).assertEqual(72);
        expect(decoded[4]).assertEqual(111);
  
        for (let i: int = 0; i < codes.length; i++) {
          expect(new Short(Double.toShort(decoded[i])).equals(codes[i])).assertTrue();
        }
      }

      {
        let caretLabel = (code: int): string => {
          let offset: int;
          if (code === 127) {
            offset = code - 64;
          } else {
            offset = code + 64;
          }
          return '^' + Short.toChar(Int.toShort(offset));
        };
        expect(caretLabel(0)).assertEqual('^@');
        expect(caretLabel(1)).assertEqual('^A');
        expect(caretLabel(3)).assertEqual('^C');
        expect(caretLabel(9)).assertEqual('^I');
        expect(caretLabel(26)).assertEqual('^Z');
        expect(caretLabel(31)).assertEqual('^_');
        expect(caretLabel(127)).assertEqual('^?');
        expect(caretLabel(0).charCodeAt(0)).assertEqual(94);
        expect(caretLabel(127).length).assertEqual(2);
      }

      {
        let charMap: Map<int, string> = new Map<int, string>();
  
        let symbolCodes: int[] = [0x41, 0x61, 0x30, 0x4E2D, 0x3042, 0xAC00];
        let symbolChars: string[] = ['A', 'a', '0', '\u4E2D', '\u3042', '\uAC00'];
  
        for (let i: int = 0; i < symbolCodes.length; i++) {
          let code: int = symbolCodes[i];
          let expected: string = symbolChars[i];
          let s: Short = new Short(Int.toShort(code));
          let ch: string = '' + s.toChar();
          charMap.set(code, ch);
          expect(ch).assertEqual(expected);
        }
  
        expect(charMap.get(0x41)).assertEqual('A');
        expect(charMap.get(0x4E2D)).assertEqual('中');
        expect(charMap.has(0x9999)).assertFalse();
      }

      {
        let rawCodes: int[] = [65, 66, 65, 67, 66, 68, 69];
  
        let charSet: Set<string> = new Set<string>();
        for (let code of rawCodes) {
          charSet.add('' + new Short(Int.toShort(code)).toChar());
        }
  
        expect(charSet.size).assertEqual(5);
  
        let chars: string[] = [];
        charSet.forEach((ch): void => { chars.push(ch); });
        chars.sort();
  
        expect(chars[0]).assertEqual('A');
        expect(chars[4]).assertEqual('E');
  
        let sumDouble: double = 0.0;
        for (let ch of chars) {
          sumDouble += ch.charCodeAt(0);
        }
        let avgCode: double = sumDouble / chars.length;
        expect(avgCode).assertEqual(67.0);
      }

      {
        let expectedChars: char[] = [
          c'\u0000', c'\u0100', c'\u0200', c'\u0300', c'\u0400',
          c'\u0500', c'\u0600', c'\u0700', c'\u0800', c'\u0900',
          c'\u0A00', c'\u0B00', c'\u0C00', c'\u0D00', c'\u0E00',
          c'\u0F00', c'\u1000', c'\u1100', c'\u1200', c'\u1300',
          c'\u1400', c'\u1500', c'\u1600', c'\u1700', c'\u1800',
          c'\u1900', c'\u1A00', c'\u1B00', c'\u1C00', c'\u1D00',
          c'\u1E00', c'\u1F00'
        ];
        for (let block: int = 0; block < 32; block++) {
          let val: short = Int.toShort(block * 256);
          expect(Short.toChar(val)).assertEqual(expectedChars[block]);
        }
        expect(Short.toChar(Int.toShort(0))).assertEqual(c'\u0000');
        expect(Short.toChar((-256) as short)).assertEqual(c'\uFF00');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0500
     * @tc.name testShortToChar_merged5
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toChar, including type conversion, containers and references, equality consistency, constructor forms, and algebraic properties.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let val: short = 0x4E2D as short;
        let instanceA: Short = new Short(val);
        let instanceB: Short = new Short(val);
        let charA: char = instanceA.toChar();
        let charB: char = instanceB.toChar();
        expect(charA).assertEqual(charB);
        expect(charA).assertEqual(c'\u4E2D');
        expect(Short.toChar(val)).assertEqual(charA);
        expect(Short.toChar(val)).assertEqual(charB);
      }

      {
        expect(Short.toChar(0x101 as short)).assertEqual(c'\u0101');
        expect(Short.toChar(0x2020 as short)).assertEqual(c'\u2020');
        expect(Short.toChar(0x4040 as short)).assertEqual(c'\u4040');
        expect(Short.toChar(0x7F7F as short)).assertEqual(c'\u7F7F');
        expect(Short.toChar((-256) as short)).assertEqual(c'\uFF00');
      }

      {
        let testVals: short[] = [
          0 as short, 32 as short, 65 as short, 0x4E2D as short,
          0x7FFF as short, (-1) as short, Short.MIN_VALUE
        ];
        for (let val of testVals) {
          let ch: char = Short.toChar(val);
          let asStr: string = '' + ch;
          expect(asStr.length).assertEqual(1);
        }
      }

      {
        let startVal: int = 0x4E00;
        let count: int = 10;
        for (let offset: int = 0; offset < count; offset++) {
          let val: short = Int.toShort(startVal + offset);
          let actual: string = '' + Short.toChar(val);
          let expected: string = String.fromCharCode(startVal + offset);
          expect(actual).assertEqual(expected);
        }
        expect(Short.toChar(Int.toShort(0x4E00))).assertEqual(c'\u4E00');
        expect(Short.toChar(Int.toShort(0x4E09))).assertEqual(c'\u4E09');
      }

      {
        let expected: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
        let actual: string = '';
        for (let v: int = 0; v < 64; v++) {
          let code: int = 0;
          if (v < 26) {
            code = 65 + v;
          } else if (v < 52) {
            code = 97 + (v - 26);
          } else if (v < 62) {
            code = 48 + (v - 52);
          } else if (v == 62) {
            code = 43;
          } else {
            code = 47;
          }
          actual += Short.toChar(Int.toShort(code));
        }
        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(64);
        expect(actual[62]).assertEqual('+');
        expect(actual[63]).assertEqual('/');
      }

      {
        let asciiVal: Short = new Short(65 as short);
        let unicodeVal: Short = new Short(0x4E2D as short);
        let selected: Short = (asciiVal.toShort() > 0) ? asciiVal : unicodeVal;
        expect(selected.toChar()).assertEqual(c'A');
        let selected2: Short = (unicodeVal.toShort() < 0) ? asciiVal : unicodeVal;
        expect(selected2.toChar()).assertEqual(c'\u4E2D');
      }

      {
        let original: Short = new Short(0x2605 as short);
        let originalChar: char = original.toChar();
        let fromInstance: Short = new Short(original.toShort());
        expect(fromInstance.toChar()).assertEqual(originalChar);
        expect(fromInstance.toChar()).assertEqual(c'\u2605');
        expect(original.equals(fromInstance)).assertTrue();
      }

      {
        let names: Map<string, string> = new Map<string, string>();
        let codes: short[] = [65 as short, 66 as short, 67 as short];
        for (let code of codes) {
          let ch: char = Short.toChar(code);
          let key: string = '' + ch;
          names.set(key, 'Letter ' + key);
        }
        expect(names.get('A')).assertEqual('Letter A');
        expect(names.get('B')).assertEqual('Letter B');
        expect(names.get('C')).assertEqual('Letter C');
      }

      {
        let shortStore: Short[] = [];
        let expectedStrs: string[] = [];
        let inputs: int[] = [72, 101, 108, 108, 111];
        for (let code of inputs) {
          let s: Short = new Short(Int.toShort(code));
          shortStore.push(s);
          expectedStrs.push(String.fromCharCode(code));
        }
        for (let i: int = 0; i < shortStore.length; i++) {
          expect('' + shortStore[i].toChar()).assertEqual(expectedStrs[i]);
        }
      }

      {
        let plaintext: string = 'HELLO';
        let ciphertext: string = '';
        for (let i: int = 0; i < plaintext.length; i++) {
          let code: int = plaintext.charCodeAt(i);
          let shifted: int = ((code - 65 + 13) % 26) + 65;
          let shiftedShort: Short = new Short(Int.toShort(shifted));
          ciphertext += shiftedShort.toChar();
        }
        expect(ciphertext).assertEqual('URYYB');
        for (let i: int = 0; i < ciphertext.length; i++) {
          let code: int = ciphertext.charCodeAt(i);
          let shifted: int = ((code - 65 + 13) % 26) + 65;
          let shiftedShort: Short = new Short(Int.toShort(shifted));
          let decoded: string = '' + shiftedShort.toChar();
          expect(decoded).assertEqual(plaintext[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0600
     * @tc.name testShortToChar_merged6
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toChar, including type conversion, comparison and ordering, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let word: string = 'cab';
        let codes: int[] = [];
        for (let i: int = 0; i < word.length; i++) {
          codes.push(word.charCodeAt(i));
        }
  
        for (let i: int = 0; i < codes.length; i++) {
          for (let j: int = i + 1; j < codes.length; j++) {
            if (codes[j] < codes[i]) {
              let tmp: int = codes[i];
              codes[i] = codes[j];
              codes[j] = tmp;
            }
          }
        }
        let sorted: string = '';
        for (let i: int = 0; i < codes.length; i++) {
          sorted += Short.toChar(Double.toShort(codes[i]));
        }
        expect(sorted).assertEqual('abc');
        for (let i: int = 0; i + 1 < sorted.length; i++) {
          expect(sorted.charCodeAt(i) < sorted.charCodeAt(i + 1)).assertTrue();
        }
      }

      {
        let vowels: string = 'AEIOU';
        let testLetters: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        let vowelCount: int = 0;
        let consonantCount: int = 0;
        for (let i: int = 0; i < testLetters.length; i++) {
          let code: int = testLetters.charCodeAt(i);
          let s: Short = new Short(Int.toShort(code));
          let ch: char = s.toChar();
          let isVowel: boolean = vowels.indexOf(ch) >= 0;
          if (isVowel) {
            vowelCount++;
          } else {
            consonantCount++;
          }
        }
        expect(vowelCount).assertEqual(5);
        expect(consonantCount).assertEqual(21);
      }

      {
        let columns: string[] = [];
        for (let code: int = 65; code <= 90; code++) {
          let s: Short = new Short(Int.toShort(code));
          columns.push('' + s.toChar());
        }
        expect(columns.length).assertEqual(26);
        expect(columns[0]).assertEqual('A');
        expect(columns[25]).assertEqual('Z');
        expect(columns[0] + columns[1]).assertEqual('AB');
        let a: string = '' + Short.toChar(65 as short);
        let doubleLetter: string = a + a;
        expect(doubleLetter).assertEqual('AA');
      }

      {
        let text: string = 'Hello世界World';
        let freq: Map<string, int> = new Map<string, int>();
        for (let i: int = 0; i < text.length; i++) {
          let code: int = text.charCodeAt(i);
          let s: Short = new Short(Int.toShort(code));
          let ch: char = s.toChar();
          let key: string = '' + ch;
          let prev: int = 0;
          if (freq.has(key)) {
            let fetched: int | undefined = freq.get(key);
            if (fetched !== undefined) {
              prev = fetched;
            }
          }
          freq.set(key, prev + 1);
        }
        expect(freq.get('l')).assertEqual(3);
        expect(freq.get('o')).assertEqual(2);
        expect(freq.get('世')).assertEqual(1);
        expect(freq.get('界')).assertEqual(1);
      }

      {
        let natoLookup: Map<string, string> = new Map<string, string>();
        let natoWords: string[] = ['Alpha', 'Bravo', 'Charlie', 'Delta', 'Echo'];
        for (let word of natoWords) {
          let firstCode: int = word.charCodeAt(0);
          let s: Short = new Short(Int.toShort(firstCode));
          natoLookup.set('' + s.toChar(), word);
        }
        expect(natoLookup.get('A')).assertEqual('Alpha');
        expect(natoLookup.get('B')).assertEqual('Bravo');
        expect(natoLookup.get('C')).assertEqual('Charlie');
        expect(natoLookup.get('D')).assertEqual('Delta');
        expect(natoLookup.get('E')).assertEqual('Echo');
      }

      {
        let classify = (code: int): string => {
          if (code >= 0x0041 && code <= 0x007A) return 'ASCII';
          if (code >= 0x0391 && code <= 0x03A9) return 'Greek';
          if (code >= 0x0410 && code <= 0x042F) return 'Cyrillic';
          if (code >= 0x4E00 && code <= 0x9FFF) return 'CJK';
          if (code >= 0x30A0 && code <= 0x30FF) return 'Katakana';
          return 'Other';
        };
        expect(classify(('' + Short.toChar(Int.toShort(0x0041))).charCodeAt(0))).assertEqual('ASCII');
        expect(classify(('' + Short.toChar(Int.toShort(0x0391))).charCodeAt(0))).assertEqual('Greek');
        expect(classify(('' + Short.toChar(Int.toShort(0x0410))).charCodeAt(0))).assertEqual('Cyrillic');
        expect(classify(('' + Short.toChar(Int.toShort(0x4E2D))).charCodeAt(0))).assertEqual('CJK');
        expect(classify(('' + Short.toChar(Int.toShort(0x30A2))).charCodeAt(0))).assertEqual('Katakana');
      }

      {
        let grid: string[] = [];
        for (let row: int = 2; row <= 7; row++) {
          let line: string = '';
          for (let col: int = 0; col <= 15; col++) {
            let code: int = row * 16 + col;
            let s: Short = new Short(Int.toShort(code));
            line += s.toChar();
          }
          grid.push(line);
        }
        expect(grid.length).assertEqual(6);
        expect(grid[0].charCodeAt(0)).assertEqual(32);
        expect(grid[0][0]).assertEqual(' ');
        expect(grid[4].charCodeAt(0)).assertEqual(96);
        expect(grid[4][0]).assertEqual('`');
      }

      {
        let palindrome: string = 'ABBA';
        let isPalin: boolean = true;
        for (let i: int = 0; i < palindrome.length; i++) {
          let leftCode: int = palindrome.charCodeAt(i);
          let rightCode: int = palindrome.charCodeAt(palindrome.length - 1 - i);
          let leftS: Short = new Short(Int.toShort(leftCode));
          let rightS: Short = new Short(Int.toShort(rightCode));
          if (leftS.toChar() !== rightS.toChar()) {
            isPalin = false;
          }
        }
        expect(isPalin).assertTrue();
        let nonPalin: string = 'ABCD';
        let isNonPalin: boolean = true;
        for (let i: int = 0; i < nonPalin.length; i++) {
          let leftCode: int = nonPalin.charCodeAt(i);
          let rightCode: int = nonPalin.charCodeAt(nonPalin.length - 1 - i);
          let leftS: Short = new Short(Int.toShort(leftCode));
          let rightS: Short = new Short(Int.toShort(rightCode));
          if (leftS.toChar() !== rightS.toChar()) {
            isNonPalin = false;
          }
        }
        expect(isNonPalin).assertFalse();
      }

      {
        let step: int = 4096;
        let mismatchCount: int = 0;
        let minVal: int = Short.MIN_VALUE;
        let maxVal: int = Short.MAX_VALUE;
        for (let val: int = minVal; val <= maxVal; val += step) {
          let s: short = Int.toShort(val);
          let ch: char = Short.toChar(s);
          let expected: string = String.fromCharCode(val & 0xFFFF);
          if (('' + ch) !== expected) {
            mismatchCount++;
          }
        }
        expect(mismatchCount).assertEqual(0);
      }

      {
        let delValue: short = 127 as short;
        let delChar: char = Short.toChar(delValue);
        let delCode: int = ('' + delChar).charCodeAt(0);
        expect(delCode).assertEqual(0x7F);
        expect(delCode - ('' + Short.toChar(126 as short)).charCodeAt(0)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0700
     * @tc.name testShortToChar_merged7
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toChar, including type conversion, positive values, containers and references, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let sohValue: short = 0x0001 as short;
        let sohChar: char = Short.toChar(sohValue);
        expect(sohChar).assertEqual(c'\u0001');
        let sohCode: int = ('' + sohChar).charCodeAt(0);
        let nulCode: int = ('' + Short.toChar(0 as short)).charCodeAt(0);
        expect(sohCode - nulCode).assertEqual(1);
      }

      {
        let mismatchCount: int = 0;
        for (let code: int = 0; code <= 127; code++) {
          let val: short = Int.toShort(code);
          let ch: char = Short.toChar(val);
          let expected: string = String.fromCharCode(code);
          let chStr: string = '' + ch;
          if (chStr !== expected) {
            mismatchCount++;
          }
        }
        expect(mismatchCount).assertEqual(0);
      }

      {
        let startCode: int = 0x0080;
        let endCode: int = 0x00FF;
        let mismatchCount: int = 0;
        for (let code: int = startCode; code <= endCode; code++) {
          let val: short = Int.toShort(code);
          let ch: char = Short.toChar(val);
          let expected: string = String.fromCharCode(code);
          let chStr: string = '' + ch;
          if (chStr !== expected) {
            mismatchCount++;
          }
        }
        expect(mismatchCount).assertEqual(0);
      }

      {
        let anchor: int = 0x4E00;
        let anchorChar: char = Short.toChar(Int.toShort(anchor));
        expect('' + anchorChar).assertEqual(String.fromCharCode(anchor));
        let mismatchCount: int = 0;
        for (let offset: int = 0; offset < 3; offset++) {
          let codeUnit: int = ('' + Short.toChar(Int.toShort(anchor + offset))).charCodeAt(0);
          if (codeUnit !== anchor + offset) {
            mismatchCount++;
          }
        }
        expect(mismatchCount).assertEqual(0);
      }

      {
        let surrogateStart: int = 55296;
        let surrogateEnd: int = 57343;
        for (let code: int = surrogateStart; code <= surrogateEnd; code++) {
          let val: short = Int.toShort(code);
          let actual: string = '' + Short.toChar(val);
          let expected: string = String.fromCharCode(code);
          expect(actual).assertEqual(expected);
        }
        expect('' + Short.toChar(Int.toShort(surrogateStart))).assertEqual(String.fromCharCode(surrogateStart));
        expect('' + Short.toChar(Int.toShort(surrogateEnd))).assertEqual(String.fromCharCode(surrogateEnd));
      }

      {
        expect(('' + Short.toChar((-3) as short)).charCodeAt(0)).assertEqual(0xFFFD);
        expect(('' + Short.toChar((-257) as short)).charCodeAt(0)).assertEqual(0xFEFF);
      }

      {
        let prevCodeUnit: int = ('' + Short.toChar(Int.toShort(0))).charCodeAt(0);
        let step: int = 1024;
        for (let value: int = step; value <= Short.MAX_VALUE; value += step) {
          let codeUnit: int = ('' + Short.toChar(Int.toShort(value))).charCodeAt(0);
          expect(codeUnit > prevCodeUnit).assertTrue();
          prevCodeUnit = codeUnit;
        }
        expect(('' + Short.toChar(Short.MAX_VALUE)).charCodeAt(0)).assertEqual(0x7FFF);
      }

      {
        let testVals: short[] = [0 as short, 65 as short, (-1) as short, Short.MAX_VALUE, Short.MIN_VALUE, 0x4E2D as short];
        for (let val of testVals) {
          let ch: char = Short.toChar(val);
          let chStr: string = '' + ch;
          let codePoint: int = chStr.charCodeAt(0);
          let expectedCode: int = Short.toInt(val) & 0xFFFF;
          expect(codePoint).assertEqual(expectedCode);
        }
      }

      {
        let mismatchCount: int = 0;
        for (let i: int = 0; i < 1000; i++) {
          let rawVal: int = i * 67 % 65536;
          let val: short = Int.toShort(rawVal);
          let boxed: Short = new Short(val);
          let instanceResult: char = boxed.toChar();
          let staticResult: char = Short.toChar(val);
          if (instanceResult !== staticResult) {
            mismatchCount++;
          }
        }
        expect(mismatchCount).assertEqual(0);
      }

      {
        let base: short = 64 as short;
        let addOne: short = Int.toShort(base + 1);
        let addTwo: short = Int.toShort(base + 2);
        let addThree: short = Int.toShort(base + 3);
        expect(Short.toChar(addOne)).assertEqual(c'A');
        expect(Short.toChar(addTwo)).assertEqual(c'B');
        expect(Short.toChar(addThree)).assertEqual(c'C');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0800
     * @tc.name testShortToChar_merged8
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toChar, including type conversion, business scenarios, containers and references, constructor forms, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let inlineResult: char = Short.toChar(65 as short);
        let variableVal: short = 65 as short;
        let variableResult: char = Short.toChar(variableVal);
        expect(inlineResult).assertEqual(c'A');
        expect(variableResult).assertEqual(c'A');
        expect(inlineResult).assertEqual(variableResult);
      }

      {
        let originalChars: char[] = [c'A', c'z', c'\u4E2D', c'\u2605', c'\uFFFF'];
        for (let ch of originalChars) {
          let chStr: string = '' + ch;
          let code: int = chStr.charCodeAt(0);
          let s: Short = new Short(Int.toShort(code));
          expect(s.toChar()).assertEqual(ch);
        }
      }

      {
        let pattern: string = '';
        for (let i: int = 0; i < 5; i++) {
          let code: int = (i * i) % 26 + 65;
          pattern += Short.toChar(Int.toShort(code));
        }
        expect(pattern).assertEqual('ABEJQ');
        expect(pattern.charCodeAt(0)).assertEqual(65);
        expect(pattern.charCodeAt(1)).assertEqual(66);
        expect(pattern.charCodeAt(2)).assertEqual(69);
        expect(pattern.charCodeAt(3)).assertEqual(74);
        expect(pattern.charCodeAt(4)).assertEqual(81);
      }

      {
        let addResult: char = Short.toChar(Int.toShort(0x4E00 + 0x002D));
        expect(addResult).assertEqual(c'\u4E2D');
        let subResult: char = Short.toChar(Int.toShort(0x4E2D - 0x002D));
        expect(subResult).assertEqual(c'\u4E00');
        let mulVal: short = Int.toShort(0x41 * 2);
        let mulResult: char = Short.toChar(mulVal);
        expect(mulResult).assertEqual(c'\u0082');
        let divVal: short = Int.toShort(130 / 2);
        let divResult: char = Short.toChar(divVal);
        expect(divResult).assertEqual(c'A');
      }

      {
        let classifyChar = (ch: string): string => {
          let code: int = ch.charCodeAt(0);
          if (code <= 0x007F) return 'ASCII';
          if (code <= 0x00FF) return 'Latin1';
          if (code >= 0x4E00 && code <= 0x9FFF) return 'CJK';
          return 'Other';
        };
        let asciiCh: string = '' + Short.toChar(65 as short);
        let latin1Ch: string = '' + Short.toChar(0x00E9 as short);
        let cjkCh: string = '' + Short.toChar(0x4E2D as short);
        expect(classifyChar(asciiCh)).assertEqual('ASCII');
        expect(classifyChar(latin1Ch)).assertEqual('Latin1');
        expect(classifyChar(cjkCh)).assertEqual('CJK');
      }

      {
        let caesarEncrypt = (ch: string, key: int): string => {
          let code: int = ch.charCodeAt(0);
          let shifted: int = ((code + key) % 65536);
          return '' + Short.toChar(Int.toShort(shifted));
        };
        expect(caesarEncrypt('A', 3)).assertEqual('D');
        expect(caesarEncrypt('Z', 1)).assertEqual('[');
        expect(caesarEncrypt('a', 3)).assertEqual('d');
      }

      {
        let esc: char = Short.toChar(0x1B as short);
        let bracket: char = Short.toChar(0x5B as short);
        let mCode: char = Short.toChar(0x6D as short);
        let escStr: string = '' + esc;
        expect(escStr.charCodeAt(0)).assertEqual(0x1B);
        expect(bracket).assertEqual(c'[');
        expect(mCode).assertEqual(c'm');
        let ansiSeq: string = '' + esc + bracket + '31' + mCode;
        expect(ansiSeq.charCodeAt(0)).assertEqual(0x1B);
        expect(ansiSeq.charCodeAt(1)).assertEqual(0x5B);
      }

      {
        let buf: string = '';
        for (let code: int = 72; code <= 76; code++) {
          buf += Short.toChar(Int.toShort(code));
        }
        expect(buf).assertEqual('HIJKL');
        expect(buf.length).assertEqual(5);
        expect(buf.charCodeAt(0)).assertEqual(72);
        expect(buf.charCodeAt(4)).assertEqual(76);
      }

      {
        let highSurrogate: short = Int.toShort(55296);
        let lowSurrogate: short = Int.toShort(56320);
        let highChar: char = Short.toChar(highSurrogate);
        let lowChar: char = Short.toChar(lowSurrogate);
        expect('' + highChar).assertEqual(String.fromCharCode(55296));
        expect('' + lowChar).assertEqual(String.fromCharCode(56320));
        let highStr: string = '' + highChar;
        let lowStr: string = '' + lowChar;
        expect(highStr.charCodeAt(0)).assertEqual(55296);
        expect(lowStr.charCodeAt(0)).assertEqual(56320);
      }

      {
        let freq: Map<string, int> = new Map<string, int>();
        let rawCodes: short[] = [65 as short, 66 as short, 65 as short, 67 as short, 66 as short];
        for (let val of rawCodes) {
          let key: string = '' + Short.toChar(val);
          let prev: int = 0;
          let fetched: int | undefined = freq.get(key);
          if (fetched !== undefined) {
            prev = fetched;
          }
          freq.set(key, prev + 1);
        }
        expect(freq.get('A')).assertEqual(2);
        expect(freq.get('B')).assertEqual(2);
        expect(freq.get('C')).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0900
     * @tc.name testShortToChar_merged9
     * @tc.desc CrossTypeRoundTrip / RadixConversion: covers 10 merged test points for Short.toChar, including type conversion, business scenarios, containers and references, round-trip conversion, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let classify = (ch: char): string => {
          let code: int = ('' + ch).charCodeAt(0);
          if (code >= 65 && code <= 90) return 'UPPER';
          if (code >= 97 && code <= 122) return 'LOWER';
          if (code >= 48 && code <= 57) return 'DIGIT';
          return 'OTHER';
        };
        expect(classify(Short.toChar(65 as short))).assertEqual('UPPER');
        expect(classify(Short.toChar(97 as short))).assertEqual('LOWER');
        expect(classify(Short.toChar(48 as short))).assertEqual('DIGIT');
        expect(classify(Short.toChar(32 as short))).assertEqual('OTHER');
      }

      {
        let printableStart: int = 0x21;
        let printableEnd: int = 0x7E;
        for (let code: int = printableStart; code <= printableEnd; code++) {
          let ch: char = Short.toChar(Int.toShort(code));
          let chStr: string = '' + ch;
          expect(chStr.charCodeAt(0)).assertEqual(code);
          expect(chStr.length).assertEqual(1);
        }
        expect(Short.toChar(0x21 as short)).assertEqual(c'!');
        expect(Short.toChar(0x7E as short)).assertEqual(c'~');
      }

      {
        let toRoman = (n: int): string => {
          let vals: int[] = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
          let syms: string[] = ['M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I'];
          let result: string = '';
          for (let i: int = 0; i < vals.length; i++) {
            while (n >= vals[i]) {
              result += syms[i];
              n -= vals[i];
            }
          }
          return result;
        };
        let one: string = toRoman(1);
        let four: string = toRoman(4);
        let nine: string = toRoman(9);
        expect(one).assertEqual('I');
        expect(four).assertEqual('IV');
        expect(nine).assertEqual('IX');
        let charI: char = Short.toChar(Int.toShort(73));
        expect(charI).assertEqual(c'I');
        let charV: char = Short.toChar(Int.toShort(86));
        expect(charV).assertEqual(c'V');
        let charX: char = Short.toChar(Int.toShort(88));
        expect(charX).assertEqual(c'X');
      }

      {
        let failCount: int = 0;
        for (let code: int = 0; code <= 127; code++) {
          let sv: short = Int.toShort(code);
          let ch: char = Short.toChar(sv);
          let restored: short = Char.toShort(ch);
          if (Short.toInt(restored) !== code) {
            failCount++;
          }
        }
        expect(failCount).assertEqual(0);
      }

      {
        let failCount: int = 0;
        for (let code: int = 0xFF00; code <= 0xFFFF; code++) {
          let sv: short = Int.toShort(code);
          let ch: char = Short.toChar(sv);
          let restored: short = Char.toShort(ch);
          if (Short.toInt(restored) !== Short.toInt(Int.toShort(code))) {
            failCount++;
          }
        }
        expect(failCount).assertEqual(0);
      }

      {
        for (let block: int = 1; block <= 12; block++) {
          let code: int = block * 256;
          let shortVal: short = Int.toShort(code);
          let s: Short = new Short(shortVal);
          let ch: char = s.toChar();
          let expectedCode: int = block * 256;
          expect(('' + ch).charCodeAt(0)).assertEqual(expectedCode);
        }
      }

      {
        let asciiUpperValue: short = 65 as short;
        let asciiDigitValue: short = 48 as short;
        let unicodeCjkValue: short = 0x4E2D as short;
        let asciiUpperResult: char = Short.toChar(asciiUpperValue);
        let asciiDigitResult: char = Short.toChar(asciiDigitValue);
        let unicodeCjkResult: char = Short.toChar(unicodeCjkValue);
        expect(asciiUpperResult).assertEqual(c'A');
        expect(asciiDigitResult).assertEqual(c'0');
        expect(unicodeCjkResult).assertEqual(c'\u4E2D');
      }

      {
        let enclosedStart: int = 0x2460;
        let enclosedEnd: int = 0x2469;
        let codes: short[] = [];
        let expectedStrs: string[] = [];
        for (let code: int = enclosedStart; code <= enclosedEnd; code++) {
          codes.push(Int.toShort(code));
          expectedStrs.push(String.fromCharCode(code));
        }
        let count: int = codes.length;
        expect(count).assertEqual(10);
        for (let i: int = 0; i < count; i++) {
          let boxed: Short = new Short(codes[i]);
          let instanceResult: string = '' + boxed.toChar();
          let staticResult: string = '' + Short.toChar(codes[i]);
          expect(instanceResult).assertEqual(expectedStrs[i]);
          expect(staticResult).assertEqual(expectedStrs[i]);
          expect(instanceResult).assertEqual(staticResult);
          expect(boxed.toShort()).assertEqual(codes[i]);
        }
        expect('' + Short.toChar(codes[0])).assertEqual('\u2460');
        expect('' + Short.toChar(codes[9])).assertEqual('\u2469');
      }

      {
        let fromBin: short = Short.parseInt('1000001', 2);
        let fromOct: short = Short.parseInt('101', 8);
        let fromDec: short = Short.parseInt('65', 10);
        let fromHex: short = Short.parseInt('41', 16);
        expect(Short.toChar(fromBin)).assertEqual(c'A');
        expect(Short.toChar(fromOct)).assertEqual(c'A');
        expect(Short.toChar(fromDec)).assertEqual(c'A');
        expect(Short.toChar(fromHex)).assertEqual(c'A');
      }

      {
        let original: Short = new Short(0x4E2D as short);
        let originalChar: char = original.toChar();
        let decimalString: string = original.toString(10);
        let parsedBack: short = Short.parseInt(decimalString, 10);
        let recreated: Short = new Short(parsedBack);
        expect(recreated.toChar()).assertEqual(originalChar);
        expect(recreated.toChar()).assertEqual(c'\u4E2D');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_1000
     * @tc.name testShortToChar_merged10
     * @tc.desc RadixConversion / Idempotent: covers 10 merged test points for Short.toChar, including type conversion, radix conversion, fractions and rounding, equality consistency, and business scenarios.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let fromDecCJK: short = Short.parseInt('20013', 10);
        expect(Short.toChar(fromDecCJK)).assertEqual(c'\u4E2D');
        let fromHexKatakana: short = Short.parseInt('30A2', 16);
        expect(Short.toChar(fromHexKatakana)).assertEqual(c'\u30A2');
        let fromDecSymbol: short = Short.parseInt('169', 10);
        expect(Short.toChar(fromDecSymbol)).assertEqual(c'\u00A9');
        let fromHexCyrillic: short = Short.parseInt('41F', 16);
        expect(Short.toChar(fromHexCyrillic)).assertEqual(c'\u041F');
      }

      {
        let hexDigits: string = '0123456789ABCDEF';
        for (let i: int = 0; i < hexDigits.length; i++) {
          let val: short = Int.toShort(hexDigits.charCodeAt(i));
          expect('' + Short.toChar(val)).assertEqual(hexDigits[i]);
        }
        expect(Short.toChar(48 as short)).assertEqual(c'0');
        expect(Short.toChar(65 as short)).assertEqual(c'A');
        expect(Short.toChar(70 as short)).assertEqual(c'F');
      }

      {
        let percentEncode = (code: int): string => {
          let toHexChar = (n: int): char => {
            if (n < 10) {
              return Short.toChar(Int.toShort(48 + n));
            }
            return Short.toChar(Int.toShort(55 + n));
          };
          return '%' + toHexChar((code >> 12) & 0xF) + toHexChar((code >> 8) & 0xF) +
                 toHexChar((code >> 4) & 0xF) + toHexChar(code & 0xF);
        };
        expect(percentEncode(32)).assertEqual('%0020');
        expect(percentEncode(0x4E2D)).assertEqual('%4E2D');
      }

      {
        let testVals: short[] = [0x0000 as short, 0x00FF as short, 0x7FFF as short];
        let compVals: short[] = [(-1) as short, (-256) as short, Short.MIN_VALUE];
        for (let i: int = 0; i < testVals.length; i++) {
          let val: short = testVals[i];
          let complement: short = compVals[i];
          let chOrig: char = Short.toChar(val);
          let chComp: char = Short.toChar(complement);
          let codeOrig: int = val & 0xFFFF;
          let codeComp: int = complement & 0xFFFF;
          expect(codeOrig + codeComp).assertEqual(0xFFFF);
          expect('' + chOrig).assertEqual(String.fromCharCode(codeOrig));
          expect('' + chComp).assertEqual(String.fromCharCode(codeComp));
        }
      }

      {
        let digits: string = '12345';
        let encoded: string = '';
        for (let i: int = 0; i < digits.length; i++) {
          let digit: int = digits.charCodeAt(i) - 48;
          let marker: int = 65 + digit;
          let s: Short = new Short(Int.toShort(marker));
          encoded += s.toChar();
        }
        expect(encoded).assertEqual('BCDEF');
        for (let i: int = 0; i < encoded.length; i++) {
          let recovered: int = encoded.charCodeAt(i) - 65;
          expect(recovered).assertEqual(i + 1);
        }
      }

      {
        let checkDigit = (isbn9: string): char => {
          let weightedSum: int = 0;
          for (let i: int = 0; i < 9; i++) {
            let digit: int = isbn9.charCodeAt(i) - 48;
            weightedSum += (i + 1) * digit;
          }
          let checkValue: int = weightedSum % 11;
          if (checkValue == 10) {
            return c'X';
          }
          return Short.toChar(Int.toShort(48 + checkValue));
        };
        expect(checkDigit('030640615')).assertEqual(c'2');
        expect(checkDigit('080442957')).assertEqual(c'X');
        expect(checkDigit('000000000')).assertEqual(c'0');
        expect(Short.toChar(48 as short)).assertEqual(c'0');
        expect(Short.toChar(57 as short)).assertEqual(c'9');
      }

      {
        let digitToChar = (digit: int): char => {
          return Short.toChar(Int.toShort(0x30 + digit));
        };
        expect(digitToChar(0)).assertEqual(c'0');
        expect(digitToChar(5)).assertEqual(c'5');
        expect(digitToChar(9)).assertEqual(c'9');
        let display: string = '';
        for (let d: int = 0; d < 10; d++) {
          display += digitToChar(d);
        }
        expect(display).assertEqual('0123456789');
      }

      {
        let fromLiteral: Short = new Short(65 as short);
        let fromParseDec: Short = new Short(Short.parseInt('65', 10));
        let fromParseHex: Short = new Short(Short.parseInt('41', 16));
        let fromIntToShort: Short = new Short(Int.toShort(65));
        let expectedChar: char = c'A';
        expect(fromLiteral.toChar()).assertEqual(expectedChar);
        expect(fromParseDec.toChar()).assertEqual(expectedChar);
        expect(fromParseHex.toChar()).assertEqual(expectedChar);
        expect(fromIntToShort.toChar()).assertEqual(expectedChar);
        expect(fromLiteral.toShort()).assertEqual(65 as short);
        expect(fromParseDec.toShort()).assertEqual(65 as short);
        expect(fromParseHex.toShort()).assertEqual(65 as short);
        expect(fromIntToShort.toShort()).assertEqual(65 as short);
      }

      {
        for (let code: int = 48; code <= 57; code++) {
          let s: Short = new Short(Int.toShort(code));
          let actual: string = '' + s.toChar();
          let expected: string = String.fromCharCode(code);
          expect(actual).assertEqual(expected);
        }
  
        let upperA: Short = new Short(65 as short);
        expect(upperA.toChar()).assertEqual(c'A');
        let upperZ: Short = new Short(90 as short);
        expect(upperZ.toChar()).assertEqual(c'Z');
        let lowerA: Short = new Short(97 as short);
        expect(lowerA.toChar()).assertEqual(c'a');
      }

      {
        let originalValue: Short = new Short(Int.toShort(0x41));
  
        let charResult: char = originalValue.toChar();
        expect(charResult).assertEqual(c'A');
  
        let charCode: int = originalValue.toInt();
        let backToShort: Short = new Short(Int.toShort(charCode));
  
        expect(backToShort.toInt()).assertEqual(65);
        expect(backToShort.equals(originalValue)).assertTrue();
  
        let hexDisplay: string = backToShort.toString(16);
        expect(hexDisplay).assertEqual("41");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_1100
     * @tc.name testShortToChar_merged11
     * @tc.desc Idempotent / BusinessScenario: covers 10 merged test points for Short.toChar, including business scenarios, containers and references, equality consistency, type conversion, and round-trip conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let testVals: short[] = [65 as short, 90 as short, 48 as short, 0x4E2D as short, 0x30A2 as short];
        for (let i: int = 0; i < testVals.length; i++) {
          let s: Short = new Short(testVals[i]);
          let ch: char = s.toChar();
          let chStr: string = '' + ch;
          let codePoint: int = chStr.charCodeAt(0);
          let reconstructed: short = Double.toShort(codePoint);
          expect(reconstructed).assertEqual(testVals[i]);
        }
      }

      {
        let samples: Short[] = [
          new Short(32 as short), new Short(65 as short), new Short(122 as short),
          new Short(0x4E2D as short), new Short(0x30A2 as short), new Short((-1) as short)
        ];
        for (let s of samples) {
          let ch: char = s.toChar();
          let code: int = s.toInt();
          let unsignedCode: int = code & 0xFFFF;
          let expectedStr: string = String.fromCharCode(unsignedCode);
          expect('' + ch).assertEqual(expectedStr);
        }
      }

      {
        let mismatchCount: int = 0;
        for (let sample: int = 0; sample <= 0xFFFF; sample += 8192) {
          let val: short = Int.toShort(sample);
          let boxed: Short = new Short(val);
          let instanceResult: char = boxed.toChar();
          let staticResult: char = Short.toChar(val);
          if (instanceResult !== staticResult) {
            mismatchCount++;
          }
          expect(boxed.toShort()).assertEqual(val);
        }
        expect(mismatchCount).assertEqual(0);
      }

      {
        let morseTable: string[] = ['.-', '-...', '-.-.', '-..', '.'];
        let lookup = (index: int): string => {
          return morseTable[index];
        };
        let idx0: short = 0 as short;
        let idx1: short = 1 as short;
        let idx4: short = 4 as short;
        let ch0: char = Short.toChar(Int.toShort(65 + idx0));
        let ch1: char = Short.toChar(Int.toShort(65 + idx1));
        let ch4: char = Short.toChar(Int.toShort(65 + idx4));
        expect(lookup(0)).assertEqual('.-');
        expect(lookup(1)).assertEqual('-...');
        expect(lookup(4)).assertEqual('.');
        expect(ch0).assertEqual(c'A');
        expect(ch1).assertEqual(c'B');
        expect(ch4).assertEqual(c'E');
      }

      {
        let table: string = '';
        for (let code: int = 0x20; code <= 0x7E; code++) {
          let val: short = Int.toShort(code);
          table += Short.toChar(val);
        }
        expect(table.length).assertEqual(95);
        expect(table.charCodeAt(0)).assertEqual(0x20);
        expect(table.charCodeAt(94)).assertEqual(0x7E);
      }

      {
        let qrChars: string = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ $%*+-./:';
        for (let i: int = 0; i < qrChars.length; i++) {
          let val: short = Int.toShort(qrChars.charCodeAt(i));
          expect('' + Short.toChar(val)).assertEqual(qrChars[i]);
        }
        expect(Short.toChar(Int.toShort(48))).assertEqual(c'0');
        expect(Short.toChar(Int.toShort(65))).assertEqual(c'A');
      }

      {
        expect(Short.toChar(0x1E as short)).assertEqual(c'\u001E');
        expect(Short.toChar(0x30 as short)).assertEqual(c'\u0030');
        expect(Short.toChar(0x2E as short)).assertEqual(c'\u002E');
        expect(Short.toChar(65 as short)).assertEqual(c'A');
      }

      {
        let brailleBase: int = 0x2800;
        let braille0: short = Int.toShort(brailleBase);
        let braille1: short = Int.toShort(brailleBase + 1);
        let braille10: short = Int.toShort(brailleBase + 10);
        expect(Short.toChar(braille0)).assertEqual(c'\u2800');
        expect(Short.toChar(braille1)).assertEqual(c'\u2801');
        expect(Short.toChar(braille10)).assertEqual(c'\u280A');
      }

      {
        let glyphMap: Map<short, char> = new Map<short, char>();
        let glyph1: short = 65 as short;
        let glyph2: short = 0x4E2D as short;
        let glyph3: short = 0x30A2 as short;
        glyphMap.set(glyph1, Short.toChar(glyph1));
        glyphMap.set(glyph2, Short.toChar(glyph2));
        glyphMap.set(glyph3, Short.toChar(glyph3));
        expect(glyphMap.get(glyph1)).assertEqual(c'A');
        expect(glyphMap.get(glyph2)).assertEqual(c'\u4E2D');
        expect(glyphMap.get(glyph3)).assertEqual(c'\u30A2');
      }

      {
        expect(Short.toChar(0x0A as short)).assertEqual(c'\u000A');
        expect(Short.toChar(0x09 as short)).assertEqual(c'\u0009');
        expect(Short.toChar(0x0D as short)).assertEqual(c'\u000D');
        expect(Short.toChar(0x5C as short)).assertEqual(c'\u005C');
        let newline: string = '' + Short.toChar(0x0A as short);
        let tab: string = '' + Short.toChar(0x09 as short);
        let cr: string = '' + Short.toChar(0x0D as short);
        expect(newline.charCodeAt(0)).assertEqual(0x0A);
        expect(tab.charCodeAt(0)).assertEqual(0x09);
        expect(cr.charCodeAt(0)).assertEqual(0x0D);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_1200
     * @tc.name testShortToChar_merged12
     * @tc.desc BusinessScenario: covers 2 merged test points for Short.toChar, including business scenarios and containers and references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar_merged12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let midiToNoteName = (midi: int): string => {
          let noteIndex: int = midi % 12;
          let baseLetterCodes: int[] = [67, 67, 68, 68, 69, 70, 70, 71, 71, 65, 65, 66];
          let noteShort: Short = new Short(Int.toShort(baseLetterCodes[noteIndex]));
          return '' + noteShort.toChar();
        };
        expect(midiToNoteName(60)).assertEqual('C');
        expect(midiToNoteName(62)).assertEqual('D');
        expect(midiToNoteName(64)).assertEqual('E');
        expect(midiToNoteName(67)).assertEqual('G');
      }

      {
        let pieceCodes: short[] = [0x2654 as short, 0x2655 as short, 0x265A as short, 0x265B as short];
        let pieceSymbols: string[] = ['\u2654', '\u2655', '\u265A', '\u265B'];
        for (let i: int = 0; i < pieceCodes.length; i++) {
          expect('' + Short.toChar(pieceCodes[i])).assertEqual(pieceSymbols[i]);
        }
      }
    });

  });
}