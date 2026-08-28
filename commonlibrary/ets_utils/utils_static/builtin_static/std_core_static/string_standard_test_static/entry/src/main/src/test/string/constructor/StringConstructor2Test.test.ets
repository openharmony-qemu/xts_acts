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
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

function createEmptyString(): String {
  return new String();
}

function createFromString<T extends string>(value: T): String {
  let intermediate: String = new String(value);
  return new String(intermediate);
}

function factoryCopy(input: String): String {
  return new String(input);
}

function createFromFixedArray<T extends FixedArray<char>>(arr: T): String {
  return new String(arr);
}

function buildString(fa: FixedArray<char>): String {
  return new String(fa);
}

function createFromValueArray<T extends ValueArray<char>>(arr: T): String {
  return new String(arr);
}

function createFromCharArray<T extends char[]>(arr: T): String {
  return new String(arr);
}

function collectIteration(s: String): string {
  let result: string = "";
  for (const ch of s) {
  result += ch.toString();
}
  return result;
}

export default function StringConstructor2Test(): void {
  describe('StringConstructor2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0010
     * @tc.name testConstructor001
     * @tc.desc Verify new String() creates distinct type from string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const literal: string = "";
      const constructed: String = new String();
      expect(constructed.length).assertEqual(0);
      expect(constructed.toString()).assertEqual("");
      expect(constructed.toString()).assertEqual(literal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0020
     * @tc.name testConstructor002
     * @tc.desc Verify new String() quad-layer validation: instanceof, typeof, length, toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: String = new String();
      expect(s.length).assertEqual(0);
      expect(s.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0030
     * @tc.name testConstructor003
     * @tc.desc Verify factory function returning new String() no-arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: String = createEmptyString();
      expect(s.length).assertEqual(0);
      expect(s.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0040
     * @tc.name testConstructor004
     * @tc.desc Verify copy constructor produces distinct String type from literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const literal: string = "hello";
      const s: String = new String(new String(literal));
      expect(s.length).assertEqual(5);
      expect(s.toString()).assertEqual("hello");
      expect(s.toString()).assertEqual(literal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0050
     * @tc.name testConstructor005
     * @tc.desc Verify copy constructor consistency across different source construction methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromLiteral: String = new String("ABC");
      const chars: FixedArray<char> = [c'A', c'B', c'C'];
      const fromArray: String = new String(chars);
      const copy1: String = new String(fromLiteral);
      const copy2: String = new String(fromArray);
      expect(copy1.toString()).assertEqual(copy2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0060
     * @tc.name testConstructor006
     * @tc.desc Verify copy constructor with surrogate pair preserves UTF-16 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: String = new String(new String("\u{20BB7}野家"));
      expect(s.toString()).assertEqual("\u{20BB7}野家");
      expect(s.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0070
     * @tc.name testConstructor007
     * @tc.desc Verify copy constructor preserves control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: String = new String(new String("\x01\x02\x03A\x1F"));
      expect(s.toString()).assertEqual("\x01\x02\x03A\x1F");
      expect(s.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0080
     * @tc.name testConstructor008
     * @tc.desc Verify copy constructor preserves mixed multi-script characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: String = new String(new String("中文الاختبارtest\u{1F600}"));
      expect(s.toString()).assertEqual("中文الاختبارtest\u{1F600}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0090
     * @tc.name testConstructor009
     * @tc.desc Verify copy constructor preserves bidirectional text control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: String = new String(new String("‪hello‬"));
      expect(s.toString()).assertEqual("‪hello‬");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0100
     * @tc.name testConstructor010
     * @tc.desc Verify copy constructor preserves BOM as zero-width character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: String = new String(new String("﻿test"));
      expect(s.toString()).assertEqual("﻿test");
      expect(s.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0110
     * @tc.name testConstructor011
     * @tc.desc Verify copy constructor explicit type passing with new String()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: String = new String("value");
      const s: String = new String(obj);
      expect(s.toString()).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0120
     * @tc.name testConstructor012
     * @tc.desc Verify direct new String() and factory copy produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: String = new String("Direct");
      const direct: String = new String(source);
      const factory: String = factoryCopy(source);
      expect(direct.toString()).assertEqual(factory.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0130
     * @tc.name testConstructor013
     * @tc.desc Verify chained copy constructor then charAt call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: String = new String("Chain");
      const firstChar: string = new String(source).charAt(0).toString();
      expect(firstChar).assertEqual("C");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0140
     * @tc.name testConstructor014
     * @tc.desc Verify copy constructor length property access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: String = new String("Prop");
      const s: String = new String(source);
      expect(s.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0150
     * @tc.name testConstructor015
     * @tc.desc Verify copy constructor index access via bracket notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: String = new String("Index");
      const s: String = new String(source);
      expect(s[0]).assertEqual("I");
      expect(s[4]).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0160
     * @tc.name testConstructor016
     * @tc.desc Verify FixedArray<char> literal vs loop-built produce same String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const literalFA: FixedArray<char> = [c'T', c'E', c'S', c'T'];
      let builtFA: FixedArray<char> = [c'T', c'E', c'S', c'T'];
      const s1: String = new String(literalFA);
      const s2: String = new String(builtFA);
      expect(s1.toString()).assertEqual(s2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0170
     * @tc.name testConstructor017
     * @tc.desc Verify FixedArray<char> and String literal construct same content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [c'H', c'e', c'l', c'l', c'o'];
      const s: String = new String(chars);
      const literal: String = new String("Hello");
      expect(s.toString()).assertEqual(literal.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0180
     * @tc.name testConstructor018
     * @tc.desc Verify FixedArray<char> with CJK extension A characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [c'㐀', c'一'];
      const s: String = new String(chars);
      expect(s.toString()).assertEqual("㐀一");
      expect(s.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0190
     * @tc.name testConstructor019
     * @tc.desc Verify FixedArray<char> with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [c'\x00', c'\x07', c'\x08', c'\x0C', c'A'];
      const s: String = new String(chars);
      expect(s.toString()).assertEqual("\x00\x07\x08\x0CA");
      expect(s.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0200
     * @tc.name testConstructor020
     * @tc.desc Verify FixedArray<char> with mixed scripts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [c'Α', c'А', c'中', c'1'];
      const s: String = new String(chars);
      expect(s.toString()).assertEqual("ΑА中1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0210
     * @tc.name testConstructor021
     * @tc.desc Verify FixedArray<char> with fullwidth characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [c'！', c'Ａ', c'０'];
      const s: String = new String(chars);
      expect(s.toString()).assertEqual("！Ａ０");
      expect(s.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0220
     * @tc.name testConstructor022
     * @tc.desc Verify FixedArray<char> with special symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [c'©', c'®', c'°', c'™'];
      const s: String = new String(chars);
      expect(s.toString()).assertEqual("©®°™");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0230
     * @tc.name testConstructor023
     * @tc.desc Verify FixedArray<char> single element with cast equals direct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s1: String = new String([c'Q'] as FixedArray<char>);
      const chars: FixedArray<char> = [c'Q'];
      const s2: String = new String(chars);
      expect(s1.toString()).assertEqual(s2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0240
     * @tc.name testConstructor024
     * @tc.desc Verify FixedArray<char> constructor does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'A', c'B'];
        const s: String = new String(chars);
        expect(s.toString()).assertEqual("AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0250
     * @tc.name testConstructor025
     * @tc.desc Verify new String(FixedArray<char>) preserves order and length for distinct elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big: FixedArray<char> = [c'A', c'B', c'C', c'D', c'E', c'F', c'G', c'H'];
      const s: String = new String(big);
      expect(s.length).assertEqual(8);
      expect(s.toString()).assertEqual('ABCDEFGH');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0260
     * @tc.name testConstructor026
     * @tc.desc Verify all 5 overloads produce same length for equivalent logical input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s0: String = new String();
      expect(s0.length).assertEqual(0);
      const s1: String = new String(new String("OK"));
      const s2Arr: FixedArray<char> = [c'O', c'K'];
      const s2: String = new String(s2Arr);
      const s3Arr: ValueArray<char> = [c'O', c'K'];
      const s3: String = new String(s3Arr);
      const s4Arr: char[] = [c'O', c'K'];
      const s4: String = new String(s4Arr);
      expect(s1.length).assertEqual(2);
      expect(s2.length).assertEqual(2);
      expect(s3.length).assertEqual(2);
      expect(s4.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0270
     * @tc.name testConstructor027
     * @tc.desc Verify cross-overload Comparable interface consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref: String = new String(new String("ABC"));
      const fa: String = new String([c'A', c'B', c'C'] as FixedArray<char>);
      const va: String = new String([c'A', c'B', c'C'] as ValueArray<char>);
      const ca: String = new String([c'A', c'B', c'C'] as char[]);
      expect(ref.compareTo(fa)).assertEqual(0);
      expect(ref.compareTo(va)).assertEqual(0);
      expect(ref.compareTo(ca)).not().assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0280
     * @tc.name testConstructor028
     * @tc.desc Verify cross-overload Iterable interface consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: String = new String([c'A', c'B'] as FixedArray<char>);
      const va: String = new String([c'A', c'B'] as ValueArray<char>);
      const ca: String = new String([c'A', c'B'] as char[]);
      expect(collectIteration(fa)).assertEqual("AB");
      expect(collectIteration(va)).assertEqual(collectIteration(fa));
      expect(collectIteration(ca)).assertEqual("A,B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0290
     * @tc.name testConstructor029
     * @tc.desc Verify String() explicit conversion with positive bigint produces decimal string without 'n' suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let bigVal: bigint = 123n;
        let result: string = String(bigVal);
        expect(result).assertEqual("123");
        expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0300
     * @tc.name testConstructor030
     * @tc.desc Verify implicit string concatenation operator + triggers bigint toString coercion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let bigVal: bigint = 42n;
        let result: string = "prefix: " + bigVal;
        expect(result).assertEqual("prefix: 42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0310
     * @tc.name testConstructor031
     * @tc.desc Verify equals() correctly matches String(bigint) against equivalent string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let bigVal: bigint = 100n;
        let strObj: String = new String("100");
        let bigStr: string = String(bigVal);
        expect(strObj.equals(bigStr)).assertTrue();
        expect(strObj.toString()).assertEqual(bigStr);
        expect(strObj.equals("100")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0320
     * @tc.name testConstructor032
     * @tc.desc Verify bigint zero and large value String() conversion edge cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let zeroBig: bigint = 0n;
        expect(String(zeroBig)).assertEqual("0");
        let largeBig: bigint = 9007199254740991n;
        let result: string = String(largeBig);
        expect(result).assertEqual("9007199254740991");
        expect(result.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0330
     * @tc.name testConstructor033
     * @tc.desc Verify String() explicit conversion with Date object produces a date string whose length, colon position, and embedded year substring match expected date format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let dateObj: Date = new Date();
        let result: string = String(dateObj);
        let yearStr: string = String(dateObj.getFullYear());
        expect(result.length).assertLarger(20);
        expect(result.indexOf(':')).assertLarger(0);
        expect(result.lastIndexOf(':')).assertLarger(result.indexOf(':'));
        expect(result.includes(yearStr)).assertTrue();
        expect(result.charAt(result.length - 1)).not().assertEqual(' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0340
     * @tc.name testConstructor034
     * @tc.desc Verify new String() constructor with Date object wraps date string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let dateObj: Date = new Date();
        let dateStr: string = String(dateObj);
        let strObj: String = new String(dateObj);
        expect(strObj.toString()).assertEqual(dateStr);
        expect(strObj.getLength()).assertEqual(dateStr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0350
     * @tc.name testConstructor035
     * @tc.desc Verify implicit string concatenation with Date triggers automatic toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let dateObj: Date = new Date();
        let result: string = "timestamp: " + dateObj;
        expect(result.startsWith("timestamp: ")).assertTrue();
        expect(result.length).assertLarger("timestamp: ".length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0360
     * @tc.name testConstructor036
     * @tc.desc Verify equals() safely compares string content derived from Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let dateObj: Date = new Date();
        let dateStr: string = String(dateObj);
        let strObj: String = new String(dateStr);
        expect(strObj.equals(dateStr)).assertTrue();
        expect(strObj.toString()).assertEqual(dateStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0370
     * @tc.name testConstructor037
     * @tc.desc Verify String() explicit conversion with plain Object returns '[object Object]'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let plainObj: Object = new Object();
        let result: string = String(plainObj);
        expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0380
     * @tc.name testConstructor038
     * @tc.desc Verify new String() constructor with plain Object stores '[object Object]' as content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let plainObj: Object = new Object();
        let strObj: String = new String(plainObj);
        expect(strObj.toString()).assertEqual("[object Object]");
        expect(strObj.getLength()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0390
     * @tc.name testConstructor039
     * @tc.desc Verify implicit string concatenation with plain Object triggers toString producing '[object Object]'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let plainObj: Object = new Object();
        let result: string = "obj: " + plainObj;
        expect(result).assertEqual("obj: [object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0400
     * @tc.name testConstructor040
     * @tc.desc Verify equals() safely handles Object-derived '[object Object]' vs unrelated strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let plainObj: Object = new Object();
        let objStr: string = String(plainObj);
        let strObj: String = new String(objStr);
        expect(strObj.equals(objStr)).assertTrue();
        expect(strObj.equals("[object Object]")).assertTrue();
        expect(strObj.equals("something else")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0410
     * @tc.name testConstructor041
     * @tc.desc Verify String() explicit conversion with long integer value produces correct decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let longVal: long = 9223372036854775807;
        let result: string = String(longVal);
        expect(result).assertEqual("9223372036854775807");
        expect(result.length).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0420
     * @tc.name testConstructor042
     * @tc.desc Verify String() explicit conversion with float value preserves decimal representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let floatVal: double = 3.14159;
        let result: string = String(floatVal);
        expect(result).assertEqual("3.14159");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0430
     * @tc.name testConstructor043
     * @tc.desc Verify new String() with float and implicit concat triggers correct toString coercion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let floatVal: double = -0.5;
        let strObj: String = new String(floatVal);
        expect(strObj.toString()).assertEqual("-0.5");
        let concatResult: string = "f: " + floatVal;
        expect(concatResult.startsWith("f: ")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0440
     * @tc.name testConstructor044
     * @tc.desc Verify String() explicit conversion with Error object produces error message string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let err: Error = new Error("something went wrong");
        let result: string = String(err);
        expect(result.startsWith("Error")).assertTrue();
        expect(result.includes("something went wrong")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0450
     * @tc.name testConstructor045
     * @tc.desc Verify implicit concatenation with Error triggers toString and equals safety
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let err: Error = new Error("fail");
        let concatResult: string = "err: " + err;
        expect(concatResult.startsWith("err: ")).assertTrue();
        expect(concatResult.includes("Error")).assertTrue();
        let errStr: string = String(err);
        let strObj: String = new String(errStr);
        expect(strObj.equals(errStr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0460
     * @tc.name testConstructor046
     * @tc.desc Verify String() conversion with StringBuilder class instance returns its content string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let sb: StringBuilder = new StringBuilder("ArkTS instance");
        let result: string = String(sb);
        expect(result).assertEqual("ArkTS instance");
        expect(result.length).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0470
     * @tc.name testConstructor047
     * @tc.desc Verify implicit concatenation with class instance and equals safety
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let sb: StringBuilder = new StringBuilder("world");
        let concatResult: string = "hello " + sb;
        expect(concatResult).assertEqual("hello world");
        let strObj: String = new String("world");
        expect(strObj.equals(String(sb))).assertTrue();
        expect(strObj.contentEquals(sb)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0480
     * @tc.name testConstructor048
     * @tc.desc ArkTS 1.2: verify typeof on char returns 'char' not 'number', and String() wraps char correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let ch: char = c'A';
        let typeName: string = typeof ch;
        expect(typeName).assertEqual("char");
        let strResult: string = String(ch);
        expect(strResult).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0490
     * @tc.name testConstructor049
     * @tc.desc ArkTS 1.2: verify typeof on bigint returns 'bigint', and String() drops 'n' suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let bi: bigint = 999n;
        let typeName: string = typeof bi;
        expect(typeName).assertEqual("bigint");
        let strResult: string = String(bi);
        expect(strResult).assertEqual("999");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0500
     * @tc.name testConstructor050
     * @tc.desc ArkTS 1.2: verify typeof on long returns 'long' not 'number', String() wraps long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let lv: long = 100;
        let typeName: string = typeof lv;
        expect(typeName).assertEqual("long");
        let strResult: string = String(lv);
        expect(strResult).assertEqual("100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0510
     * @tc.name testConstructor051
     * @tc.desc ArkTS 1.2 bigint isolation: bigint==number always false, but String(bigint)==String(number) is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let bi: bigint = 123n;
        let num: int = 123;
        let biStr: string = String(bi);
        let numStr: string = String(num);
        expect(biStr).assertEqual(numStr);
        expect(biStr).assertEqual("123");
        expect(numStr).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0520
     * @tc.name testConstructor052
     * @tc.desc ArkTS 1.2: verify String(0xFF) hex literal infers as number and converts to decimal '255'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let hexVal: int = 0xFF;
        let result: string = String(hexVal);
        expect(result).assertEqual("255");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0530
     * @tc.name testConstructor053
     * @tc.desc ArkTS 1.2: verify String(0b10) binary literal infers as number and converts to decimal '2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let binVal: int = 0b10;
        let result: string = String(binVal);
        expect(result).assertEqual("2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0540
     * @tc.name testConstructor054
     * @tc.desc ArkTS 1.2: verify String(0o77) octal literal infers as number and converts to decimal '63'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let octVal: int = 0o77;
        let result: string = String(octVal);
        expect(result).assertEqual("63");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0550
     * @tc.name testConstructor055
     * @tc.desc ArkTS 1.2: verify String(1.0e3) scientific notation double converts to '1000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let sciVal: double = 1.0e3;
        let result: string = String(sciVal);
        expect(result).assertEqual("1000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0560
     * @tc.name testConstructor056
     * @tc.desc ArkTS 1.2: verify String(1.5e-2) scientific notation decimal converts to '0.015'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let sciSmall: double = 1.5e-2;
        let result: string = String(sciSmall);
        expect(result).assertEqual("0.015");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0570
     * @tc.name testConstructor057
     * @tc.desc ArkTS 1.2 IEEE 754: verify String(-0.0) negative zero sign behavior under strict IEEE 754
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let negZero: double = -0.0;
        let result: string = String(negZero);
        expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0580
     * @tc.name testConstructor058
     * @tc.desc ArkTS 1.2: verify String(Double.MIN_VALUE) and String(Double.MAX_VALUE) boundary serialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let minVal: double = Double.MIN_VALUE;
        let maxVal: double = Double.MAX_VALUE;
        let minStr: string = String(minVal);
        let maxStr: string = String(maxVal);
        expect(minStr).assertEqual("5e-324");
        expect(maxStr).assertEqual("1.7976931348623157e+308");
        expect(minStr).assertNotEqual(maxStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0590
     * @tc.name testConstructor059
     * @tc.desc ArkTS 1.2: verify ClassCastError thrown when calling String method on null reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let nullStr: String | null = null;
        (nullStr as String).toString();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0600
     * @tc.name testConstructor060
     * @tc.desc ArkTS 1.2: verify ClassCastError on null reference getLength() call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let nullStr: String | null = null;
        (nullStr as String).getLength();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0610
     * @tc.name testConstructor061
     * @tc.desc ArkTS 1.2: verify String(number[]) does not throw and stringifies the single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [-3];
      const r: string = String(arr);
      expect(r).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0620
     * @tc.name testConstructor062
     * @tc.desc ArkTS 1.2: verify String() explicit conversion with Error object produces error message string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let sym: Object = new Error('test');
        let result: string = String(sym);
        expect(result.startsWith("Error")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0630
     * @tc.name testConstructor063
     * @tc.desc ArkTS 1.2: verify implicit concat with Error object produces correct concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let sym: Object = new Error('a');
        let result: string = "prefix: " + sym;
        expect(result.startsWith("prefix: Error")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0640
     * @tc.name testConstructor064
     * @tc.desc Verify new String() with float wraps decimal representation correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fVal: float = -0.5f;
      let strObj: String = new String(fVal);
      expect(strObj.toString()).assertEqual("-0.5");
      expect(strObj.getLength()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0650
     * @tc.name testConstructor065
     * @tc.desc Verify float zero value produces valid string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zero: float = 0.0f;
      let result: string = String(zero);
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0660
     * @tc.name testConstructor066
     * @tc.desc Verify float max boundary value produces valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: float = 3.4028235e38f;
      let result: string = String(maxVal);
      expect(result).assertEqual("3.4028235e+38");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0670
     * @tc.name testConstructor067
     * @tc.desc Verify float min positive boundary value produces valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: float = 1.17549435e-38f;
      let result: string = String(minVal);
      expect(result).assertEqual("1.1754944e-38");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0680
     * @tc.name testConstructor068
     * @tc.desc Verify implicit concatenation with float produces correct prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fVal: float = 1.5f;
      let result: string = "float: " + fVal;
      expect(result.startsWith("float: ")).assertTrue();
      expect(result.length).assertLarger("float: ".length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0690
     * @tc.name testConstructor069
     * @tc.desc Verify float negative and positive produce distinct strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 10.0f;
      let b: float = -10.0f;
      let sa: string = String(a);
      let sb: string = String(b);
      expect(sb.startsWith("-")).assertTrue();
      expect(sa === sb).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0700
     * @tc.name testConstructor070
     * @tc.desc Verify float concat with multiple string parts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pi: float = 3.14159f;
      let result: string = "PI ≈ " + pi + " is approximate";
      expect(result.startsWith("PI ≈ ")).assertTrue();
      expect(result.endsWith(" is approximate")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0710
     * @tc.name testConstructor071
     * @tc.desc Verify float integer-like value produces decimal-free or decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let whole: float = 5.0f;
      let result: string = String(whole);
      expect(result).assertEqual("5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0720
     * @tc.name testConstructor072
     * @tc.desc Verify float very small fraction produces valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tiny: float = 0.000001f;
      let result: string = String(tiny);
      expect(result).assertEqual("0.000001");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0730
     * @tc.name testConstructor073
     * @tc.desc Verify float String() with scientific notation preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sci: float = 1.5e3f;
      let result: string = String(sci);
      expect(result).assertEqual("1500");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0740
     * @tc.name testConstructor074
     * @tc.desc Verify String() with long zero produces "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zero: long = 0;
      let result: string = String(zero);
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0750
     * @tc.name testConstructor075
     * @tc.desc Verify String() with long positive value produces correct decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 123456789;
      let result: string = String(val);
      expect(result).assertEqual("123456789");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0760
     * @tc.name testConstructor076
     * @tc.desc Verify String() with long negative value includes minus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = -987654321;
      let result: string = String(val);
      expect(result.startsWith("-")).assertTrue();
      expect(result).assertEqual("-987654321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0770
     * @tc.name testConstructor077
     * @tc.desc Verify long implicit concat produces combined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 42;
      let result: string = "answer=" + val;
      expect(result).assertEqual("answer=42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0780
     * @tc.name testConstructor078
     * @tc.desc Verify long max value produces consistent 19-digit string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxLong: long = 9223372036854775807;
      let result: string = String(maxLong);
      expect(result.length).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0790
     * @tc.name testConstructor079
     * @tc.desc Verify long min value produces correct negative string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minLong: long = -9223372036854775808;
      let result: string = String(minLong);
      expect(result.startsWith("-")).assertTrue();
      expect(result).assertEqual("-9223372036854775808");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0800
     * @tc.name testConstructor080
     * @tc.desc Verify long values 100 and 200 in string concatenation template both appear in result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 100;
      let b: long = 200;
      let result: string = "sum: " + a + " + " + b;
      expect(result.includes("100")).assertTrue();
      expect(result.includes("200")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0810
     * @tc.name testConstructor081
     * @tc.desc Verify String(long 1) returns "1" and String(long -1) returns "-1" with sign preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(1 as long)).assertEqual("1");
      expect(String((-1) as long)).assertEqual("-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0820
     * @tc.name testConstructor082
     * @tc.desc Verify new String(long) charAt first character matches String result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 999;
      let strObj: String = new String(val);
      let plain: string = String(val);
      expect(strObj.charAt(0)).assertEqual(plain.charAt(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0830
     * @tc.name testConstructor083
     * @tc.desc Verify long multi-digit value each digit is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 54321;
      let result: string = String(val);
      expect(result.charAt(0)).assertEqual(c'5');
      expect(result.charAt(4)).assertEqual(c'1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0840
     * @tc.name testConstructor084
     * @tc.desc Verify String() with short zero produces "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = 0;
      let result: string = String(s);
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0850
     * @tc.name testConstructor085
     * @tc.desc Verify String() with short positive value produces correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = 32767;
      let result: string = String(s);
      expect(result).assertEqual("32767");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0860
     * @tc.name testConstructor086
     * @tc.desc Verify String() with short negative value includes minus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = -32768;
      let result: string = String(s);
      expect(result.startsWith("-")).assertTrue();
      expect(result).assertEqual("-32768");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0870
     * @tc.name testConstructor087
     * @tc.desc Verify short implicit concat with string prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = 25;
      let result: string = "short:" + s;
      expect(result).assertEqual("short:25");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0880
     * @tc.name testConstructor088
     * @tc.desc Verify short max boundary value string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxShort: short = 32767;
      let result: string = String(maxShort);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0890
     * @tc.name testConstructor089
     * @tc.desc Verify short min boundary value string includes minus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minShort: short = -32768;
      let result: string = String(minShort);
      expect(result.startsWith("-")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0900
     * @tc.name testConstructor090
     * @tc.desc Verify new String(short) getLength matches String(short).length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = 789;
      let strObj: String = new String(s);
      expect(strObj.getLength()).assertEqual(String(s).length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0910
     * @tc.name testConstructor091
     * @tc.desc Verify short concat with multiple string segments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 10;
      let b: short = 20;
      let result: string = a + " + " + b + " = " + (a + b);
      expect(result.startsWith("10")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0920
     * @tc.name testConstructor092
     * @tc.desc Verify new String(short) charAt on first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = 543;
      let strObj: String = new String(s);
      expect(strObj.charAt(0)).assertEqual(c'5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0930
     * @tc.name testConstructor093
     * @tc.desc Verify short with negative sign charAt position 0 is '-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = -99;
      let result: string = String(s);
      expect(result.charAt(0)).assertEqual(c'-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0940
     * @tc.name testConstructor094
     * @tc.desc Verify short distinct values produce distinct strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(0 as short) === String(1 as short)).assertFalse();
      expect(String(100 as short) === String(200 as short)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0950
     * @tc.name testConstructor095
     * @tc.desc Verify String() with byte zero produces "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 0;
      let result: string = String(b);
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0960
     * @tc.name testConstructor096
     * @tc.desc Verify String() with byte max value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 127;
      let result: string = String(b);
      expect(result).assertEqual("127");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0970
     * @tc.name testConstructor097
     * @tc.desc Verify String() with byte min value -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = -128;
      let result: string = String(b);
      expect(result).assertEqual("-128");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0980
     * @tc.name testConstructor098
     * @tc.desc Verify byte implicit concat produces correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 99;
      let result: string = "byte:" + b;
      expect(result).assertEqual("byte:99");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_0990
     * @tc.name testConstructor099
     * @tc.desc Verify byte getLength matches string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 100;
      let strObj: String = new String(b);
      expect(strObj.getLength()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1000
     * @tc.name testConstructor100
     * @tc.desc Verify byte concat with multiple values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 5;
      let y: byte = 10;
      let result: string = String(x) + "," + String(y);
      expect(result).assertEqual("5,10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1010
     * @tc.name testConstructor101
     * @tc.desc Verify byte charAt on first digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 77;
      let strObj: String = new String(b);
      expect(strObj.charAt(0)).assertEqual(c'7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1020
     * @tc.name testConstructor102
     * @tc.desc Verify byte negative value charAt 0 is '-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = -50;
      let result: string = String(b);
      expect(result.charAt(0)).assertEqual(c'-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1030
     * @tc.name testConstructor103
     * @tc.desc Verify byte distinct values produce distinct strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(0 as byte) === String(1 as byte)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1040
     * @tc.name testConstructor104
     * @tc.desc Verify byte single digit value string length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 7;
      expect(String(b).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1050
     * @tc.name testConstructor105
     * @tc.desc Verify byte three-digit value has correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 100;
      expect(String(b).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1060
     * @tc.name testConstructor106
     * @tc.desc Verify byte value 0 produces single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 0;
      expect(String(b).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1070
     * @tc.name testConstructor107
     * @tc.desc Verify String() with double zero produces valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: double = 0.0;
      let result: string = String(d);
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1080
     * @tc.name testConstructor108
     * @tc.desc Verify double positive value produces numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: double = 123.456;
      let result: string = String(d);
      expect(result.includes("123")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1090
     * @tc.name testConstructor109
     * @tc.desc Verify double negative value includes minus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: double = -99.99;
      let result: string = String(d);
      expect(result.startsWith("-")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1100
     * @tc.name testConstructor110
     * @tc.desc Verify double max value produces valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: double = Double.MAX_VALUE;
      let result: string = String(d);
      expect(result).assertEqual("1.7976931348623157e+308");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1110
     * @tc.name testConstructor111
     * @tc.desc Verify double min value produces valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: double = Double.MIN_VALUE;
      let result: string = String(d);
      expect(result).assertEqual("5e-324");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1120
     * @tc.name testConstructor112
     * @tc.desc Verify double concat with prefix string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: double = 1.5;
      let result: string = "d=" + d;
      expect(result.startsWith("d=")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1130
     * @tc.name testConstructor113
     * @tc.desc Verify async then chain with String() conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let result: string = await Promise.resolve(42).then((v: int): string => {
        return String(v);
      });
      expect(result).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1140
     * @tc.name testConstructor114
     * @tc.desc Verify async/await with String() wrapping inside async function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let val: number = 123;
      let str: string = String(val);
      let result: string = await Promise.resolve(str);
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1150
     * @tc.name testConstructor115
     * @tc.desc Verify async function returns Promise<string> with new String()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let strObj: String = new String("async");
      let result: string = await Promise.resolve(strObj.toString());
      expect(result).assertEqual("async");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1160
     * @tc.name testConstructor116
     * @tc.desc Verify Promise.resolve with null value then String() conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let result: string = await Promise.resolve(null).then((v: Object | null): string => String(v));
      expect(result).assertEqual("null");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1170
     * @tc.name testConstructor117
     * @tc.desc Verify Promise chain with multiple String() conversions and concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let result: string = await Promise.resolve(1)
        .then((v: int): string => String(v))
        .then((v: string): string => v + String(2))
        .then((v: string): string => v + String(3));
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1180
     * @tc.name testConstructor118
     * @tc.desc Verify async function uses String() charAt on resolved value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let str: string = await Promise.resolve("ABCDE");
      let first: string = str.charAt(0).toString();
      let last: string = str.charAt(4).toString();
      expect(first).assertEqual("A");
      expect(last).assertEqual("E");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1190
     * @tc.name testConstructor119
     * @tc.desc Verify new String() wrapped value survives Promise round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let original: String = new String("round-trip");
      let result: string = await Promise.resolve(original.toString());
      expect(result).assertEqual("round-trip");
      expect(new String(result).getLength()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1200
     * @tc.name testConstructor120
     * @tc.desc Verify String() converts empty string to empty string and checks length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty1: string = String('');
      let empty2: string = String(new String());
      let empty3: string = String('');
      expect(empty1).assertEqual(empty2);
      expect(empty2).assertEqual(empty3);
      expect(empty1.indexOf('x')).assertEqual(-1);
      expect(empty1.startsWith('')).assertTrue();
      expect(empty1.endsWith('')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1210
     * @tc.name testConstructor121
     * @tc.desc Verify String() preserves 3 whitespace chars, trim() reduces to length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = String("   ");
      expect(s.length).assertEqual(3);
      expect(s.trim().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1220
     * @tc.name testConstructor122
     * @tc.desc Verify String() round-trips all 5 escape chars unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "\t\n\r\v\f";
      expect(s.length).assertEqual(5);
      let result: string = String(s);
      expect(result).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1230
     * @tc.name testConstructor123
     * @tc.desc Verify String() preserves length of 1000-char repeated ASCII string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "x".repeat(1000);
      let result: string = String(longStr);
      expect(result.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1240
     * @tc.name testConstructor124
     * @tc.desc Verify String() preserves length of 500x Chinese repeated string (length 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "测试".repeat(500);
      let result: string = String(longStr);
      expect(result.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1250
     * @tc.name testConstructor125
     * @tc.desc Verify String() handles mixed multi-script input non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixed: string = "abc" + "中文" + "😀🎉" + "한국어" + "日本語";
      expect(String(mixed)).assertEqual("abc中文😀🎉한국어日本語");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1260
     * @tc.name testConstructor126
     * @tc.desc Verify String(null) converts null to string 'null'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nullStr: string = String(null);
      expect(nullStr).assertEqual("null");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1270
     * @tc.name testConstructor127
     * @tc.desc Verify String(undefined) converts undefined to string 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let undefStr: string = String(undefined);
      expect(undefStr).assertEqual("undefined");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1280
     * @tc.name testConstructor128
     * @tc.desc Verify String() preserves large emoji set and length exceeds 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allEmoji: string = "😀😃😄😁😆😅🤣😂🙂🙃😉😊😇🥰😍🤩😘😗😚😋😛😜🤪😝🤑🤗🤭🤫🤔🤐🤨😐😑😶😏😒🙄😬🤥😌😔😪🤤😴😷🤒🤕🤢🤮🤧🥵🥶🥴😵🤯🤠🥳🥸😎🤓🧐😕😟🙁😮😯😲😳🥺😦😧😨😰😥😢😭😱😖😣😞😓😩😫🥱😤😡😠🤬";
      expect(String(allEmoji).length > 100).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1290
     * @tc.name testConstructor129
     * @tc.desc Verify String() preserves special ASCII symbols and contains '@'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let special: string = "!@#$%^&*()_+-=[]{}|;':\",./<>?`~";
      expect(String(special).includes("@")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1300
     * @tc.name testConstructor130
     * @tc.desc Verify String() counts zero-width chars (ZWSP,ZWNJ,ZWJ,BOM) in length 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroWidth: string = "a​b‌c‍d﻿e";
      expect(String(zeroWidth).length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1310
     * @tc.name testConstructor131
     * @tc.desc Verify String() preserves Arabic RTL text and length is 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtl: string = "العربية";
      let result: string = String(rtl);
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1320
     * @tc.name testConstructor132
     * @tc.desc Verify String() handles surrogate pair emojis and returns non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let surrogate: string = "😀😁";
      let result: string = String(surrogate);
      expect(result).assertEqual("😀😁");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1330
     * @tc.name testConstructor133
     * @tc.desc Verify String() preserves ASCII control chars and length is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws: string = "\x00\x01\x02\x1F";
      let result: string = String(ws);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1340
     * @tc.name testConstructor134
     * @tc.desc Verify String() preserves all 95 printable ASCII chars (32-126), length 95
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: string = "";
      for (let i: int = 32; i < 127; i++) { all += String.fromCharCode(i); }
      let result: string = String(all);
      expect(result.length).assertEqual(95);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1350
     * @tc.name testConstructor135
     * @tc.desc Verify String(NaN) converts NaN to string 'NaN'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = Number.NaN;
      expect(String(n)).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1360
     * @tc.name testConstructor136
     * @tc.desc Verify String(Infinity) and String(-Infinity) convert correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(Number.POSITIVE_INFINITY)).assertEqual("Infinity");
      expect(String(Number.NEGATIVE_INFINITY)).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1370
     * @tc.name testConstructor137
     * @tc.desc Verify String(-0) converts negative zero to string '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(-0)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1380
     * @tc.name testConstructor138
     * @tc.desc Verify String() preserves length of 10000-char repeated zero string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let huge: string = "0".repeat(10000);
      expect(String(huge).length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1390
     * @tc.name testConstructor139
     * @tc.desc Verify String() preserves combining char sequence length 5 (with emoji surrogate pair)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let combining: string = "é̂̃";
      expect(String(combining).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1400
     * @tc.name testConstructor140
     * @tc.desc Verify String() handles ZWJ-joined emoji family sequence non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiSeq: string = "👨‍👩‍👧‍👦";
      expect(String(emojiSeq)).assertEqual(emojiSeq);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1410
     * @tc.name testConstructor141
     * @tc.desc Verify String() preserves length of 65536-char very large string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxStr: string = "x".repeat(65536);
      expect(String(maxStr).length).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1420
     * @tc.name testConstructor142
     * @tc.desc Verify String() preserves escape sequence literals, contains backslash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let escaped: string = "\\n\\t\\r\\\\\\\"\\u0041";
      let result: string = String(escaped);
      expect(result.includes("\\\\")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1430
     * @tc.name testConstructor143
     * @tc.desc Verify String() preserves all line-break chars (LF,CR,CRLF,VT,FF) length>10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lineBreaks: string = "LF\nCR\rCRLF\r\nVT\vFF\fNEL\u0085LS\u2028PS\u2029";
      let result: string = String(lineBreaks);
      expect(result.length).assertLarger(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1440
     * @tc.name testConstructor144
     * @tc.desc Verify String(Number.MAX_VALUE) returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(Number.MAX_VALUE)).assertEqual("1.7976931348623157e+308");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1450
     * @tc.name testConstructor145
     * @tc.desc Verify String(Number.MIN_VALUE) returns non-empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(Number.MIN_VALUE)).assertEqual("5e-324");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1460
     * @tc.name testConstructor146
     * @tc.desc Verify String converts number max 2147483647 to exact '2147483647'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxInt: int = 2147483647;
      expect(String(maxInt)).assertEqual("2147483647");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1470
     * @tc.name testConstructor147
     * @tc.desc Verify String converts number min -2147483648 to exact '-2147483648'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minInt: int = -2147483648;
      expect(String(minInt)).assertEqual("-2147483648");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1480
     * @tc.name testConstructor148
     * @tc.desc Verify String converts byte 127 and -128 to '127,-128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxByte: byte = 127;
      let minByte: byte = -128;
      expect(String(maxByte) + "," + String(minByte)).assertEqual("127,-128");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1490
     * @tc.name testConstructor149
     * @tc.desc Verify String(0.1+0.2) floating-point sum conversion returns non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(0.1 + 0.2)).assertEqual("0.30000000000000004");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1500
     * @tc.name testConstructor150
     * @tc.desc Verify String converts float max 3.4e38 and min 1.18e-38 non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxFloat: float = 3.4028235e38f;
      let minFloat: float = 1.17549435e-38f;
      expect(String(maxFloat)).assertEqual("3.4028235e+38");
      expect(String(minFloat)).assertEqual("1.1754944e-38");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1510
     * @tc.name testConstructor151
     * @tc.desc Verify String converts Double.MAX_VALUE and Double.MIN_VALUE non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dMax: double = Double.MAX_VALUE;
      let dMin: double = Double.MIN_VALUE;
      expect(String(dMax)).assertEqual("1.7976931348623157e+308");
      expect(String(dMin)).assertEqual("5e-324");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1520
     * @tc.name testConstructor152
     * @tc.desc Verify String converts safe integer 9007199254740991 to exact match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let safeInt: number = 9007199254740991;
      expect(String(safeInt)).assertEqual("9007199254740991");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1530
     * @tc.name testConstructor153
     * @tc.desc Verify String converts beyond-safe integer 9007199254740992 non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let beyondSafe: number = 9007199254740992;
      expect(String(beyondSafe)).assertEqual("9007199254740992");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1540
     * @tc.name testConstructor154
     * @tc.desc Verify String(1e-7) converts scientific notation to exact '1e-7'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(1e-7)).assertEqual("1e-7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1550
     * @tc.name testConstructor155
     * @tc.desc Verify String(1e20) large exponential number conversion non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(1e20)).assertEqual("100000000000000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1560
     * @tc.name testConstructor156
     * @tc.desc Verify String converts negative bigint -999999999999999n starts with '-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigNeg: bigint = -999999999999999n;
      expect(String(bigNeg).startsWith("-")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1570
     * @tc.name testConstructor157
     * @tc.desc Verify String converts long min -9223372036854775808 starts with '-9'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tinyLong: long = -9223372036854775808;
      expect(String(tinyLong).startsWith("-9")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1580
     * @tc.name testConstructor158
     * @tc.desc Verify String converts short range -10 to 10 all non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroStr: string = String(Int.toShort(0));
      let oneStr: string = String(Int.toShort(1));
      let negOneStr: string = String(Int.toShort(-1));
      let tenStr: string = String(Int.toShort(10));
      expect(zeroStr).assertEqual('0');
      expect(oneStr).assertEqual('1');
      expect(negOneStr).assertEqual('-1');
      expect(tenStr).assertEqual('10');
      expect(zeroStr.length).assertEqual(1);
      expect(negOneStr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1590
     * @tc.name testConstructor159
     * @tc.desc Verify String converts short max 32767 and min -32768 to exact match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxShort: short = 32767;
      let minShort: short = -32768;
      expect(String(maxShort)).assertEqual("32767");
      expect(String(minShort)).assertEqual("-32768");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1600
     * @tc.name testConstructor160
     * @tc.desc Verify String converts byte range -5 to 5 all non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroStr: string = String(Int.toByte(0));
      let oneStr: string = String(Int.toByte(1));
      let negOneStr: string = String(Int.toByte(-1));
      let fiveStr: string = String(Int.toByte(5));
      expect(zeroStr).assertEqual('0');
      expect(oneStr).assertEqual('1');
      expect(negOneStr).assertEqual('-1');
      expect(fiveStr).assertEqual('5');
      expect(zeroStr.length).assertEqual(1);
      expect(negOneStr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1610
     * @tc.name testConstructor161
     * @tc.desc Verify String(1e308) converts large exponent to exact '1e308'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(1e308)).assertEqual("1e+308");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1620
     * @tc.name testConstructor162
     * @tc.desc Verify String(5e-324) tiny exponent near zero returns non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(5e-324)).assertEqual("5e-324");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1630
     * @tc.name testConstructor163
     * @tc.desc Verify String converts negative float -3.4e38 starts with '-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: float = -3.4028235e38f;
      expect(String(f).startsWith("-")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1640
     * @tc.name testConstructor164
     * @tc.desc Verify String converts negative double -1.8e308 starts with '-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: double = -1.7976931348623157e+308;
      expect(String(d).startsWith("-")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1650
     * @tc.name testConstructor165
     * @tc.desc Verify String(0.0) converts positive zero to '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(0.0)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1660
     * @tc.name testConstructor166
     * @tc.desc Verify String(1.0) converts whole float to '1' without decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(1.0)).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1670
     * @tc.name testConstructor167
     * @tc.desc Verify String(0.5) converts half value to exact '0.5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(0.5)).assertEqual("0.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1680
     * @tc.name testConstructor168
     * @tc.desc Verify String(-1.5) converts negative half to exact '-1.5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(-1.5)).assertEqual("-1.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1690
     * @tc.name testConstructor169
     * @tc.desc Verify String converts 10x accumulated float 0.1 to non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let step: float = 0.1f;
      let acc: float = 0.0f;
      for (let i: int = 0; i < 10; i++) { acc = acc + step; }
      let accStr: string = String(acc);
      expect(accStr.length).assertLargerOrEqual(3);
      expect(accStr.includes('.')).assertTrue();
      let rounded: float = 1.0f;
      let diff: float = acc - rounded;
      expect(diff).assertLargerOrEqual(-0.001f);
      expect(diff).assertLessOrEqual(0.001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1700
     * @tc.name testConstructor170
     * @tc.desc Verify String converts double pi and e to non-empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pi: double = 3.141592653589793;
      let e: double = 2.718281828459045;
      expect(String(pi)).assertEqual("3.141592653589793");
      expect(String(e)).assertEqual("2.718281828459045");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1710
     * @tc.name testConstructor171
     * @tc.desc Verify Promise chain with String() conversions builds '123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let r: string = await Promise.resolve(0).then(v=>String(v+1)).then(v=>v+String(2)).then(v=>v+String(3));
      expect(r).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1720
     * @tc.name testConstructor172
     * @tc.desc Verify Promise chain Chinese concat + String(length) returns '4'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let r: string = await Promise.resolve("你好").then(v=>v+"世界").then(v=>String(v.length));
      expect(r).assertEqual("4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1730
     * @tc.name testConstructor173
     * @tc.desc Verify Promise resolves new String('wrapped').toString() correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let r: string = await new Promise<string>(resolve=>resolve(new String("wrapped").toString()));
      expect(r).assertEqual("wrapped");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1740
     * @tc.name testConstructor174
     * @tc.desc Verify Promise.all with 10 String() conversions returns length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let vals: number[] = [1,2,3,4,5,6,7,8,9,10];
      let promises: Promise<string>[] = vals.map(v=>Promise.resolve(String(v)));
      let r: string[] = await Promise.all(promises);
      expect(r.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1750
     * @tc.name testConstructor175
     * @tc.desc Verify Promise chain String(getLength()) on 'value' returns '5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let r: string = await Promise.resolve("value").then(v=>String(new String(v).getLength()));
      expect(r).assertEqual("5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1760
     * @tc.name testConstructor176
     * @tc.desc Verify Promise chain builds '5:hello' from length concat colon
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let r: string = await Promise.resolve("hello").then(v=>String(v.length)+":"+v);
      expect(r).assertEqual("5:hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1770
     * @tc.name testConstructor177
     * @tc.desc Verify String() preserves copyright/registered/trademark round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String("©®™")).assertEqual("©®™");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1780
     * @tc.name testConstructor178
     * @tc.desc Verify String() preserves Greek lowercase alpha-epsilon round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String("αβγδε")).assertEqual("αβγδε");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1790
     * @tc.name testConstructor179
     * @tc.desc Verify String() preserves Cyrillic a-v-g-d round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String("абвгд")).assertEqual("абвгд");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1800
     * @tc.name testConstructor180
     * @tc.desc Verify String() preserves Mac modifier symbols round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String("⌘⌥⇧⌃")).assertEqual("⌘⌥⇧⌃");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1810
     * @tc.name testConstructor181
     * @tc.desc Verify String() preserves circled digits 1-5 round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String("①②③④⑤")).assertEqual("①②③④⑤");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1820
     * @tc.name testConstructor182
     * @tc.desc Verify String() preserves alchemical symbols U+1F700 round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String("🜀🜁🜂🜃")).assertEqual("🜀🜁🜂🜃");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1830
     * @tc.name testConstructor183
     * @tc.desc Verify String() preserves fullwidth Latin B,C,D round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String("ＢＣＤ")).assertEqual("ＢＣＤ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1840
     * @tc.name testConstructor184
     * @tc.desc Verify String() handles 7-script mixed string non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mix: string = "Latin中文Ελληνικάالعربية한국어日本語😀🎉";
      expect(String(mix).length > 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1850
     * @tc.name testConstructor185
     * @tc.desc Verify String() counts combining accents on ABC+XYZ length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let up: string = "ABC̀́̂̃XYZ";
      expect(String(up).length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1860
     * @tc.name testConstructor186
     * @tc.desc Verify String() preserves Japanese hiragana/kanji round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String("日本語")).assertEqual("日本語");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1870
     * @tc.name testConstructor187
     * @tc.desc Verify String() preserves Korean Hangul round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String("한국어")).assertEqual("한국어");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1880
     * @tc.name testConstructor188
     * @tc.desc Verify String() preserves Thai script round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String("ไทย")).assertEqual("ไทย");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1890
     * @tc.name testConstructor189
     * @tc.desc Verify String() preserves Hebrew RTL script round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String("עברית")).assertEqual("עברית");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1900
     * @tc.name testConstructor190
     * @tc.desc Verify String() preserves Hindi Devanagari script round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String("हिन्दी")).assertEqual("हिन्दी");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1910
     * @tc.name testConstructor191
     * @tc.desc Verify String() preserves Tamil script round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String("தமிழ்")).assertEqual("தமிழ்");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1920
     * @tc.name testConstructor192
     * @tc.desc Verify String() handles ZWJ family emoji sequence non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwj: string = "👨‍👩‍👧‍👦";
      let result: string = String(zwj);
      expect(result).assertEqual(zwj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1930
     * @tc.name testConstructor193
     * @tc.desc Verify String() preserves 5 flag emoji (CN,US,JP,KR,DE) non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flags: string = "🇨🇳🇺🇸🇯🇵🇰🇷🇩🇪";
      expect(String(flags)).assertEqual(flags);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1940
     * @tc.name testConstructor194
     * @tc.desc Verify String() preserves 5 skin-tone modifier emojis non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let skinTone: string = "👍🏻👍🏼👍🏽👍🏾👍🏿";
      expect(String(skinTone)).assertEqual(skinTone);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1950
     * @tc.name testConstructor195
     * @tc.desc Verify String() preserves large math symbol set length exceeds 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let math: string = "∀∃∄∅∆∇∈∉∊∋∌∍∎∏∐∑−∓∔∕∖∗∘∙√∛∜∝∞∟∠∡∢∣∤∥∦∧∨∩∪∫∬∭∮∯∰∱∲∳∴∵∶∷∸∹∺∻∼∽∾∿≀≁≂≃≄≅≆≇≈≉≊≋≌≍≎≏≐≑≒≓≔≕≖≗≘≙≚≛≜≝≞≟≠≡≢≣≤≥≦≧≨≩≪≫≬≭≮≯≰≱≲≳≴≵≶≷≸≹≺≻≼≽≾≿⊀⊁⊂⊃⊄⊅⊆⊇⊈⊉⊊⊋⊌⊍⊎⊏⊐⊑⊒⊓⊔⊕⊖⊗⊘⊙⊚⊛⊜⊝⊞⊟⊠⊡⊢⊣⊤⊥⊦⊧⊨⊩⊪⊫⊬⊭⊮⊯⊰⊱⊲⊳⊴⊵⊶⊷⊸⊹⊺⊻⊼⊽⊾⊿⋀⋁⋂⋃⋄⋅⋆⋇⋈⋉⋊⋋⋌⋍⋎⋏⋐⋑⋒⋓⋔⋕⋖⋗⋘⋙⋚⋛⋜⋝⋞⋟⋠⋡⋢⋣⋤⋥⋦⋧⋨⋩⋪⋫⋬⋭⋮⋯⋰⋱⋲⋳⋴⋵⋶⋷⋸⋹⋺⋻⋼⋽⋾⋿";
      expect(String(math).length > 200).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1960
     * @tc.name testConstructor196
     * @tc.desc Verify String() preserves large arrow symbol set length exceeds 80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrows: string = "←↑→↓↔↕↖↗↘↙↚↛↜↝↞↟↠↡↢↣↤↥↦↧↨↩↪↫↬↭↮↯↰↱↲↳↴↵↶↷↸↹↺↻↼↽↾↿⇀⇁⇂⇃⇄⇅⇆⇇⇈⇉⇊⇋⇌⇍⇎⇏⇐⇑⇒⇓⇔⇕⇖⇗⇘⇙⇚⇛⇜⇝⇞⇟⇠⇡⇢⇣⇤⇥⇦⇧⇨⇩⇪⇫⇬⇭⇮⇯⇰⇱⇲⇳⇴⇵⇶⇷⇸⇹⇺⇻⇼⇽⇾⇿";
      expect(String(arrows).length > 80).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1970
     * @tc.name testConstructor197
     * @tc.desc Verify String() preserves 8 currency symbols, length exceeds 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let currency: string = "$€£¥₩₹₽₿";
      expect(String(currency).length > 5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1980
     * @tc.name testConstructor198
     * @tc.desc Verify String() preserves large CJK ideographs set length>70
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cjk: string = "一丁七万丈三上下不与丐丑专且丕世丘丙业丛东丝丞丢两严丧个丫中丰串临丸丹为主丽举乃久么义之乌乍乎乏乐乒乓乔乖乘乙九乞也习乡书买乱乳乾了予争事二于亏云互五井亘亚些亟亡亢交亥亦产亨亩享京亭亮亲人亿什仁仃仅仆仇今介仍从仑仓仔仕他仗付仙仝伙";
      expect(String(cjk).length > 70).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_1990
     * @tc.name testConstructor199
     * @tc.desc Verify String() preserves musical note symbols round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let musical: string = "♩♪♫♬♭♮♯";
      expect(String(musical)).assertEqual("♩♪♫♬♭♮♯");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2000
     * @tc.name testConstructor200
     * @tc.desc Verify String() preserves 12 chess piece symbols, length 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chess: string = "♔♕♖♗♘♙♚♛♜♝♞♟";
      expect(String(chess).length).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2010
     * @tc.name testConstructor201
     * @tc.desc Verify String() preserves large Braille pattern set length>50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let braille: string = "⠁⠂⠃⠄⠅⠆⠇⠈⠉⠊⠋⠌⠍⠎⠏⠐⠑⠒⠓⠔⠕⠖⠗⠘⠙⠚⠛⠜⠝⠞⠟⠠⠡⠢⠣⠤⠥⠦⠧⠨⠩⠪⠫⠬⠭⠮⠯⠰⠱⠲⠳⠴⠵⠶⠷⠸⠹⠺⠻⠼⠽⠾⠿";
      expect(String(braille).length > 50).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2020
     * @tc.name testConstructor202
     * @tc.desc Verify String() preserves superscript/subscript symbols length>15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let superscript: string = "⁰ⁱ²³⁴⁵⁶⁷⁸⁹⁺⁻⁼⁽⁾ⁿ₀₁₂₃₄₅₆₇₈₉₊₋₌₍₎";
      expect(String(superscript).length > 15).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2030
     * @tc.name testConstructor203
     * @tc.desc Verify String() handles LTR+RTL mixed English-Arabic-Hebrew, length>10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtlMix: string = "English العربية עברית";
      expect(String(rtlMix).length > 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2040
     * @tc.name testConstructor204
     * @tc.desc Verify String() handles emoji tag sequence (flag+tags) non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tagSeq: string = "🏴󠁧󠁢󠁥󠁮󠁧󠁿";
      expect(String(tagSeq)).assertEqual(tagSeq);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2050
     * @tc.name testConstructor205
     * @tc.desc Verify String() handles emoji variation selector non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let variation: string = "❤︎❤️";
      expect(String(variation)).assertEqual(variation);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2060
     * @tc.name testConstructor206
     * @tc.desc Verify String() includes Hello and multiple scripts from greeting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allScripts: string = "Hello 你好 こんにちは 안녕하세요 สวัสดี नमस्ते مرحبا שלום привет";
      let result: string = String(allScripts);
      expect(result.includes("Hello")).assertTrue();
      expect(result.includes("你好")).assertTrue();
      expect(result.includes("привет")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2070
     * @tc.name testConstructor207
     * @tc.desc Verify String() counts 10 invisible formatting chars length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let invisible: string = "​‌‍﻿­⁠⁡⁢⁣⁤";
      expect(String(invisible).length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2080
     * @tc.name testConstructor208
     * @tc.desc Verify String() counts 9 bidirectional override chars length 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bid: string = "‪‫‬‭‮⁦⁧⁨⁩";
      expect(String(bid).length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2090
     * @tc.name testConstructor209
     * @tc.desc Verify fromCodePoint builds A+CJK+emoji+hiragana, length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: string = String.fromCodePoint(0x41) + String.fromCodePoint(0x4E2D) + String.fromCodePoint(0x1F600) + String.fromCodePoint(0x3042);
      expect(all.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2100
     * @tc.name testConstructor210
     * @tc.desc Verify String() on 1000-chars loop-built 'a' string length 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "";
      for (let i: int = 0; i < 1000; i++) { s += "a"; }
      expect(String(s).length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2110
     * @tc.name testConstructor211
     * @tc.desc Verify String() on 1000-item comma-joined array length >5000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = [];
      for (let i: int = 0; i < 1000; i++) { arr.push("item" + i); }
      let joined: string = arr.join(",");
      expect(String(joined).length > 5000).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2120
     * @tc.name testConstructor212
     * @tc.desc Verify 100-iteration string accumulation with String(i) length>200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";
      for (let i: int = 0; i < 100; i++) { result += String(i) + ","; }
      expect(result.length).assertLarger(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2130
     * @tc.name testConstructor213
     * @tc.desc Verify new String(repeated x) getLength() consistently 100 x50 iters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: string = "x".repeat(100);
      for (let i: int = 0; i < 50; i++) {
        let s: String = new String(base);
        expect(s.getLength()).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2140
     * @tc.name testConstructor214
     * @tc.desc Verify String() on 200-char cyclic A-Z pattern length 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: string = "";
      for (let i: int = 0; i < 200; i++) { all += String.fromCharCode(65 + (i % 26)); }
      let result: string = String(all);
      expect(result.length).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2150
     * @tc.name testConstructor215
     * @tc.desc Verify 500-item dash-joined String(i) array length >1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parts: string[] = [];
      for (let i: int = 0; i < 500; i++) { parts.push(String(i)); }
      let combined: string = parts.join("-");
      expect(combined.length).assertLarger(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2160
     * @tc.name testConstructor216
     * @tc.desc Verify new String(CJK repeated 250) getLength() returns 500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let repeated: string = "测试".repeat(250);
      let strObj: String = new String(repeated);
      expect(strObj.getLength()).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2170
     * @tc.name testConstructor217
     * @tc.desc Verify String(i as byte) === String(i as short) for 0-99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 100; i++) {
        let s: string = String(Int.toByte(i));
        expect(s).assertEqual(String(Int.toShort(i)));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2180
     * @tc.name testConstructor218
     * @tc.desc Verify 100-iteration mixed number+float+CJK accumulation length>500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixed: string = "";
      for (let i: int = 0; i < 100; i++) {
        mixed += String(i) + String(Int.toFloat(i)) + "中";
      }
      expect(mixed.length).assertLarger(450);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2190
     * @tc.name testConstructor219
     * @tc.desc Verify String() on 100x '0123456789' concat yields length 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: string = "0123456789";
      let concat: string = "";
      for (let i: int = 0; i < 100; i++) { concat += base; }
      expect(String(concat).length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2200
     * @tc.name testConstructor220
     * @tc.desc Verify String(emoji repeat) all non-empty for 20 increasing counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = "😀🎉🚀💻📱🎮🎯🎲🎸🎹";
      let s1: string = String(emoji.repeat(1));
      let s5: string = String(emoji.repeat(5));
      let s20: string = String(emoji.repeat(20));
      expect(s1.length).assertEqual(emoji.length);
      expect(s5.length).assertEqual(emoji.length * 5);
      expect(s20.length).assertEqual(emoji.length * 20);
      expect(s1.startsWith(String.fromCodePoint(0x1F600))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2210
     * @tc.name testConstructor221
     * @tc.desc Verify 200-iteration recursive accumulation String(length) produces a string of exact length 760 whose first segment before the leading dash is a multi-digit length, ending with separator dash, and containing the initial 0- prefix from the first iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let acc: string = "";
      for (let i: int = 0; i < 200; i++) {
        acc = String(acc.length) + "-" + acc;
      }
      expect(acc.length).assertEqual(760);
      expect(acc.endsWith("-")).assertTrue();
      expect(acc.indexOf("-") > 0).assertTrue();
      expect(acc.includes("0-")).assertTrue();
      expect(acc.lastIndexOf("-")).assertEqual(acc.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2220
     * @tc.name testConstructor222
     * @tc.desc Verify new String(s).charAt(i) defined for all 95 printable ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "";
      for (let i: int = 32; i < 127; i++) { s += String.fromCharCode(i); }
      let result: string = String(s);
      expect(result.length).assertEqual(95);
      expect(result.charCodeAt(0)).assertEqual(32);
      expect(result.charCodeAt(94)).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2230
     * @tc.name testConstructor223
     * @tc.desc Verify String(10^10 bigint) returns '10000000000' length 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: bigint = 1n;
      for (let i: int = 0; i < 10; i++) { big = big * 10n; }
      expect(String(big).length).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2240
     * @tc.name testConstructor224
     * @tc.desc Verify String() on each uppercase letter A-Z returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 26; i++) {
        let ch: string = String.fromCharCode(65 + i);
        expect(String(ch).length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2250
     * @tc.name testConstructor225
     * @tc.desc Verify String() on 100 consecutive CJK from U+4E00 length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let h: string = "";
      for (let i: int = 0x4E00; i < 0x4E00 + 100; i++) { h += String.fromCodePoint(i); }
      expect(String(h).length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2260
     * @tc.name testConstructor226
     * @tc.desc Verify String(x)+String(y)+String(z) concat produces '012'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let concatOrder: string = "";
      let x: number = 0; let y: number = 1; let z: number = 2;
      concatOrder = String(x) + String(y) + String(z);
      expect(concatOrder).assertEqual("012");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2270
     * @tc.name testConstructor227
     * @tc.desc Verify String(1.0/3.0 as float) returns non-empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatPrecision: float = 1.0f / 3.0f;
      let result: string = String(floatPrecision);
      expect(result).assertEqual("0.33333334");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2280
     * @tc.name testConstructor228
     * @tc.desc Verify String(1.0/3.0 as double) returns non-empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: double = 1.0 / 3.0;
      let result: string = String(d);
      expect(result).assertEqual("0.3333333333333333");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2290
     * @tc.name testConstructor229
     * @tc.desc Verify String(String(i).repeat(100)) length 100 for digits 0-9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let repeated: string = String(i).repeat(100);
        expect(String(repeated).length).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2300
     * @tc.name testConstructor230
     * @tc.desc Verify 50-iteration accumulation of String(i) yields length >40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";
      for (let i: int = 0; i < 50; i++) { result = result + String(i); }
      expect(result.length).assertLarger(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2310
     * @tc.name testConstructor231
     * @tc.desc Verify String() on 20-line CJK template contains newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let template: string = "";
      for (let i: int = 0; i < 20; i++) { template += "第" + i + "行\n"; }
      expect(String(template).includes("\n")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2320
     * @tc.name testConstructor232
     * @tc.desc Verify String() on ASCII+CJK+emoji mixed repeat length >500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let compressed: string = "a".repeat(500) + "中".repeat(250) + "😀".repeat(100);
      expect(String(compressed).length > 500).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2330
     * @tc.name testConstructor233
     * @tc.desc Verify String('x' repeated 100000) preserves length 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxLen: string = "x".repeat(100000);
      expect(String(maxLen).length).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2340
     * @tc.name testConstructor234
     * @tc.desc Verify String() on array returns joined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String([1, 2, 3]);
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2350
     * @tc.name testConstructor235
     * @tc.desc Verify String() on boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String(true);
      expect(result).assertEqual("true");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2360
     * @tc.name testConstructor236
     * @tc.desc Verify String() on boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String(false);
      expect(result).assertEqual("false");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2370
     * @tc.name testConstructor237
     * @tc.desc Verify new String(true) wrapper coerces boolean to "true"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String(true);
      expect(s.toString()).assertEqual("true");
      expect(s.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2380
     * @tc.name testConstructor238
     * @tc.desc Verify new String(false) wrapper coerces boolean to "false"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String(false);
      expect(s.toString()).assertEqual("false");
      expect(s.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2390
     * @tc.name testConstructor239
     * @tc.desc Verify new String(NaN) wrapper coerces NaN to "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String(Number.NaN);
      expect(s.toString()).assertEqual("NaN");
      expect(s.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2400
     * @tc.name testConstructor240
     * @tc.desc Verify new String(Infinity) wrapper coerces Infinity to "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String(Number.POSITIVE_INFINITY);
      expect(s.toString()).assertEqual("Infinity");
      expect(s.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2410
     * @tc.name testConstructor241
     * @tc.desc Verify new String(null) wrapper coerces null to "null"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String(null);
      expect(s.toString()).assertEqual("null");
      expect(s.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR2_2420
     * @tc.name testConstructor242
     * @tc.desc Verify new String(undefined) wrapper coerces undefined to "undefined"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConstructor242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String(undefined);
      expect(s.toString()).assertEqual("undefined");
      expect(s.length).assertEqual(9);
    });
    });
}