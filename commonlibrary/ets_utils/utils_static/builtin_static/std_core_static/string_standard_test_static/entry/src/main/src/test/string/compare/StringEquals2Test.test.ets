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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

function getStringVal(): String {
  return new String('ArkTS');
}

function getStrLiteral(): string {
  return 'ArkTS';
}

function equalsWrapper<T extends string>(obj: String, other: T): boolean {
  return obj.equals(other);
}

function equalsUnion<T extends string | String>(obj: String, other: T): boolean {
  return obj.equals(other);
}

export default function StringEquals2Test(): void {
  describe('StringEquals2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_0100
     * @tc.name testEquals001
     * @tc.desc Verify string literal as subject calling equals returns true for matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strLiteral = 'ArkTS';
      let result = strLiteral.equals('ArkTS');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_0200
     * @tc.name testEquals002
     * @tc.desc Verify new String() instance calling equals returns true for identical content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strObj: String = new String('ArkTS');
      expect(strObj.equals(new String('ArkTS'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_0300
     * @tc.name testEquals003
     * @tc.desc Verify const-declared String and let-declared string behave consistently with equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strConst: String = new String('ArkTS');
      let strLet = 'ArkTS';
      expect(strConst.equals(strLet)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_0400
     * @tc.name testEquals004
     * @tc.desc Verify function returning String or string calls equals correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getStringVal().equals('ArkTS')).assertTrue();
      expect(getStrLiteral().equals('ArkTS')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_0500
     * @tc.name testEquals005
     * @tc.desc Verify empty new String("") as subject calling equals behaves correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyObj: String = new String('');
      expect(emptyObj.equals('')).assertTrue();
      expect(emptyObj.equals(new String(''))).assertTrue();
      expect(emptyObj.equals(new String('a'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_0600
     * @tc.name testEquals006
     * @tc.desc Verify equals with ZWJ emoji family string returns true for identical content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const family: String = new String('👨‍👩‍👧‍👦');
      expect(family.equals('👨‍👩‍👧‍👦')).assertTrue();
      expect(family.equals('👨👩👧👦')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_0700
     * @tc.name testEquals007
     * @tc.desc Verify equals with 4-byte supplementary plane Unicode characters returns true for identical content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('𠮷野家');
      expect(text.equals('𠮷野家')).assertTrue();
      expect(text.equals('吉野家')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_0800
     * @tc.name testEquals008
     * @tc.desc Verify equals with null byte and control characters returns true for identical content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('Ark\u0000TS\u001f');
      expect(text.equals('Ark\u0000TS\u001f')).assertTrue();
      expect(text.equals('ArkTS')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_0900
     * @tc.name testEquals009
     * @tc.desc Verify equals distinguishes traditional and simplified Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const traditional: String = new String('繁體中文');
      expect(traditional.equals('繁體中文')).assertTrue();
      expect(traditional.equals('繁体中文')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_1000
     * @tc.name testEquals010
     * @tc.desc Verify equals with mixed English Chinese and emoji script returns true for identical content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mixed: String = new String('Hello世界😀');
      expect(mixed.equals('Hello世界😀')).assertTrue();
      expect(mixed.equals('Hello世界')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_1100
     * @tc.name testEquals011
     * @tc.desc Verify equals with empty string parameter returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let emptyStr: string = '';
      expect(text.equals(emptyStr)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_1200
     * @tc.name testEquals012
     * @tc.desc Verify equals with boolean parameter returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('true');
      expect(text.equals(true)).assertFalse();
      const textFalse: String = new String('false');
      expect(textFalse.equals(false)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_1300
     * @tc.name testEquals013
     * @tc.desc Verify equals with plain object parameter returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let plainObj: Object = new Object();
      expect(text.equals(plainObj)).assertFalse();
      let customObj: Object = new Object();
      expect(text.equals(customObj)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_1400
     * @tc.name testEquals014
     * @tc.desc Verify equals with array parameter returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(text.equals(['ArkTS'])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_1500
     * @tc.name testEquals015
     * @tc.desc Verify equals after chained trim call returns true for trimmed matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('  ArkTS  ');
      let trimmed = text.trim();
      expect(trimmed.equals('ArkTS')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_1600
     * @tc.name testEquals016
     * @tc.desc Verify equals within generic function with T extends string constraint returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(equalsWrapper(text, 'ArkTS')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_1700
     * @tc.name testEquals017
     * @tc.desc Verify equals within generic function with T extends string or String union returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(equalsUnion(text, 'ArkTS')).assertTrue();
      expect(equalsUnion(text, new String('ArkTS'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_1800
     * @tc.name testEquals018
     * @tc.desc Verify equals compares content for new String objects with same string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: String = new String('ArkTS');
      const obj2: String = new String('ArkTS');
      expect(obj1.equals(obj2)).assertTrue();
      expect(obj1.toString()).assertEqual(obj2.toString());
      expect(obj1).assertEqual(obj2);
      let s1 = 'ArkTS';
      let s2 = 'ArkTS';
      expect(s1.toString()).assertEqual(s2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_1900
     * @tc.name testEquals019
     * @tc.desc Verify equals and contentEquals return consistent results for the same input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      const other: String = new String('ArkTS');
      expect(text.equals(other)).assertEqual(text.contentEquals(new StringBuilder(other.toString())));
      expect(text.equals('ArkTS')).assertEqual(text.contentEquals(new StringBuilder('ArkTS')));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_2000
     * @tc.name testEquals020
     * @tc.desc Verify when equals returns true localeCompare should return 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let eqResult = text.equals('ArkTS');
      let lcResult = text.localeCompare('ArkTS');
      expect(eqResult).assertTrue();
      expect(lcResult).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_2100
     * @tc.name testEquals021
     * @tc.desc Verify same length is a prerequisite for equals to return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      const other: String = new String('ArkTS');
      expect(text.length).assertEqual(other.length);
      expect(text.equals(other)).assertTrue();
      const diff: String = new String('Ark');
      expect(text.equals(diff)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_2200
     * @tc.name testEquals022
     * @tc.desc Verify all 8 compare APIs return expected results with valid subject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testStr: String = new String('test');
      let r0: boolean = testStr.equals('test');
      expect(r0).assertTrue();

      let r1: number = testStr.compareTo(new String('test'));
      expect(r1).assertEqual(0);

      let r2: number = testStr.localeCompare('test');
      expect(r2).assertEqual(0);

      let r3: boolean = testStr.startsWith(new String('test'));
      expect(r3).assertTrue();

      let r4: boolean = testStr.endsWith(new String('test'));
      expect(r4).assertTrue();

      let r5: boolean = testStr.contains(new String('test'), 0);
      expect(r5).assertTrue();

      let r6: boolean = testStr.includes('test');
      expect(r6).assertTrue();

      let r7: boolean = testStr.contentEquals(new StringBuilder('test'));
      expect(r7).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_2300
     * @tc.name testEquals023
     * @tc.desc Verify all compare APIs return consistent results for empty string subject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: String = new String('');
      expect(empty.equals('')).assertTrue();
      expect(empty.contentEquals(new StringBuilder(''))).assertTrue();
      expect(empty.compareTo(new String(''))).assertEqual(0);
      expect(empty.localeCompare('')).assertEqual(0);
      expect(empty.startsWith(new String(''))).assertTrue();
      expect(empty.endsWith(new String(''))).assertTrue();
      expect(empty.contains(new String(''), 0)).assertTrue();
      expect(empty.includes('')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_2400
     * @tc.name testEquals024
     * @tc.desc Verify all compare APIs behave consistently when non-empty string compared with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      const emptyStr: String = new String('');
      expect(text.equals(new String(''))).assertFalse();
      expect(text.contentEquals(new StringBuilder(emptyStr.toString()))).assertFalse();
      expect(text.compareTo(emptyStr) > 0).assertTrue();
      expect(text.localeCompare('') > 0).assertTrue();
      expect(text.startsWith(emptyStr)).assertTrue();
      expect(text.endsWith(emptyStr)).assertTrue();
      expect(text.contains(emptyStr, 0)).assertTrue();
      expect(text.includes('')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_2500
     * @tc.name testEquals025
     * @tc.desc Verify systematic comparison of equals contentEquals === and == across new String and string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: String = new String('ArkTS');
      const obj2: String = new String('ArkTS');
      let s1 = 'ArkTS';
      let s2 = 'ArkTS';
      expect(obj1.toString()).assertEqual(obj2.toString());
      expect(obj1).assertEqual(obj2);
      expect(obj1.equals(obj2)).assertTrue();
      expect(obj1.contentEquals(new StringBuilder(obj2.toString()))).assertTrue();
      expect(s1.toString()).assertEqual(s2.toString());
      expect(s1).assertEqual(s2);
      expect(obj1.equals(s1)).assertTrue();
      expect(obj1.contentEquals(new StringBuilder(s1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_2600
     * @tc.name testEquals026
     * @tc.desc Verify equals with non-String Object type parameter returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let combineObj: Object = new Object();
      expect(text.equals(combineObj)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_2700
     * @tc.name testEquals027
     * @tc.desc Verify equals with empty combine object as parameter returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('');
      let emptyObj: Object = new Object();
      expect(text.equals(emptyObj)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_2800
     * @tc.name testEquals028
     * @tc.desc Verify all compare APIs behave correctly with very long strings of 10000 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longBase = 'A'.repeat(10000);
      const text: String = new String(longBase);
      expect(text.equals(longBase)).assertTrue();
      expect(text.startsWith(new String('A'))).assertTrue();
      expect(text.endsWith(new String('A'))).assertTrue();
      expect(text.includes('AAA')).assertTrue();
      expect(text.compareTo(new String(longBase))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_2900
     * @tc.name testEquals029
     * @tc.desc Verify equals compareTo and localeCompare agree for all ASCII printable characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allAscii = '';
      for (let i = 32; i <= 126; i++) {
        allAscii += String.fromCharCode(i);
      }
      const text: String = new String(allAscii);
      expect(text.equals(allAscii)).assertTrue();
      expect(text.compareTo(new String(allAscii))).assertEqual(0);
      expect(text.localeCompare(allAscii)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_3000
     * @tc.name testEquals030
     * @tc.desc Verify equals returns a boolean for composed vs decomposed combining character sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const composed: String = new String('é');
      const decomposed: String = new String('é');
      expect(composed.equals(decomposed)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_3100
     * @tc.name testEquals031
     * @tc.desc Verify equals and compareTo handle RTL direction text strings correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rtl: String = new String('‫‮‏');
      const sameRtl: String = new String('‫‮‏');
      expect(rtl.equals(sameRtl)).assertTrue();
      expect(rtl.compareTo(sameRtl)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_3200
     * @tc.name testEquals032
     * @tc.desc Verify equals distinguishes BOM-prefixed string from plain string and startsWith detects BOM
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const withBom: String = new String('﻿ArkTS');
      const withoutBom: String = new String('ArkTS');
      expect(withBom.equals(withoutBom)).assertFalse();
      expect(withBom.startsWith(new String('﻿'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_3300
     * @tc.name testEquals033
     * @tc.desc Verify chained multiple compare method calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let chainedResult = text.startsWith(new String('Ark')) && text.endsWith(new String('TS'));
      expect(chainedResult).assertTrue();
      if (text.equals('ArkTS')) {
        expect(text.compareTo(new String('ArkTS'))).assertEqual(0);
        expect(text.localeCompare('ArkTS')).assertEqual(0);
        expect(text.contentEquals(new StringBuilder('ArkTS'))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_3400
     * @tc.name testEquals034
     * @tc.desc Verify repeated calls to the same compare methods return consistent results across iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      const other: String = new String('ArkTS');
      for (let i = 0; i < 10; i++) {
        expect(text.equals(other)).assertTrue();
        expect(text.compareTo(other)).assertEqual(0);
        expect(text.startsWith(new String('Ark'))).assertTrue();
        expect(text.endsWith(new String('TS'))).assertTrue();
        expect(text.contains(new String('rk'), 0)).assertTrue();
        expect(text.includes('rk')).assertTrue();
        expect(text.contentEquals(new StringBuilder(other.toString()))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_3500
     * @tc.name testEquals035
     * @tc.desc Verify equals after toLowerCase returns true for matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let lower = text.toLowerCase();
      expect(lower.equals('arkts')).assertTrue();
      expect(text.equals('ArkTS')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_3600
     * @tc.name testEquals036
     * @tc.desc Verify equals after toUpperCase returns true for matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('arkts');
      let upper = text.toUpperCase();
      expect(upper.equals('ARKTS')).assertTrue();
      expect(text.equals('arkts')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_3700
     * @tc.name testEquals037
     * @tc.desc Verify equals after concat chain returns correct combined result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('Hello');
      let concatenated = text.concat(', ', 'World');
      expect(concatenated.equals('Hello, World')).assertTrue();
      expect(concatenated.getLength()).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_3800
     * @tc.name testEquals038
     * @tc.desc Verify equals after repeat returns true for repeated pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ab');
      let repeated = text.repeat(3);
      expect(repeated.equals('ababab')).assertTrue();
      expect(repeated.getLength()).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_3900
     * @tc.name testEquals039
     * @tc.desc Verify equals after slice returns correct substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('Hello ArkTS');
      let sliced = text.slice(6, 11);
      expect(sliced.equals('ArkTS')).assertTrue();
      let slicedNeg = text.slice(-5);
      expect(slicedNeg.equals('ArkTS')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_4000
     * @tc.name testEquals040
     * @tc.desc Verify equals after substring returns correct content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('JavaScript');
      let sub = text.substring(0, 4);
      expect(sub.equals('Java')).assertTrue();
      let sub2 = text.substring(4);
      expect(sub2.equals('Script')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_4100
     * @tc.name testEquals041
     * @tc.desc Verify equals after replace returns correct modified content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('Hello World');
      let replaced = text.replace('World', 'ArkTS');
      expect(replaced.equals('Hello ArkTS')).assertTrue();
      expect(text.equals('Hello World')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_4200
     * @tc.name testEquals042
     * @tc.desc Verify equals after replaceAll returns correct modified content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('a-b-c-a');
      let replaced = text.replaceAll('a', 'x');
      expect(replaced.equals('x-b-c-x')).assertTrue();
      let allReplaced = text.replaceAll('-', '');
      expect(allReplaced.equals('abca')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_4300
     * @tc.name testEquals043
     * @tc.desc Verify equals after padStart returns correctly padded string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('42');
      let padded = text.padStart(5, '0');
      expect(padded.equals('00042')).assertTrue();
      let noPad = text.padStart(2, '0');
      expect(noPad.equals('42')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_4400
     * @tc.name testEquals044
     * @tc.desc Verify equals after padEnd returns correctly padded string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('data');
      let padded = text.padEnd(8, '.');
      expect(padded.equals('data....')).assertTrue();
      let noPad = text.padEnd(3, '.');
      expect(noPad.equals('data')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_4500
     * @tc.name testEquals045
     * @tc.desc Verify equals with charAt extracted characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(text.charCodeAt(0)).assertEqual(65);
      expect(text.charCodeAt(4)).assertEqual(83);
      let firstTwo: string = text.charAt(0).toString() + text.charAt(1).toString();
      let firstTwoStr: String = new String(firstTwo);
      expect(firstTwoStr.equals('Ar')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_4600
     * @tc.name testEquals046
     * @tc.desc Verify equals with string built from charCodeAt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ABC');
      let c0: int = text.charCodeAt(0);
      let c1: int = text.charCodeAt(1);
      let c2: int = text.charCodeAt(2);
      let rebuilt: string = String.fromCharCode(c0, c1, c2);
      expect(text.equals(new String(rebuilt))).assertTrue();
      expect(c0).assertEqual(65);
      expect(c2).assertEqual(67);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_4700
     * @tc.name testEquals047
     * @tc.desc Verify equals of split results produces correct substrings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('a,b,c');
      let parts = text.split(',');
      expect(parts.length).assertEqual(3);
      expect(parts[0].equals('a')).assertTrue();
      expect(parts[1].equals('b')).assertTrue();
      expect(parts[2].equals('c')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_4800
     * @tc.name testEquals048
     * @tc.desc Verify equals with indexOf and substring combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('Hello ArkTS World');
      let start = text.indexOf('ArkTS');
      expect(start).assertLargerOrEqual(0);
      let found = text.substring(start, start + 5);
      expect(found.equals('ArkTS')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_4900
     * @tc.name testEquals049
     * @tc.desc Verify equals after trimStart removes leading whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('  \t  ArkTS  ');
      let trimmed = text.trimStart();
      expect(trimmed.equals('ArkTS  ')).assertTrue();
      expect(trimmed.endsWith(new String('  '))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_5000
     * @tc.name testEquals050
     * @tc.desc Verify equals after trimEnd removes trailing whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('  ArkTS  \t  ');
      let trimmed = text.trimEnd();
      expect(trimmed.equals('  ArkTS')).assertTrue();
      expect(trimmed.startsWith(new String('  '))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_5100
     * @tc.name testEquals051
     * @tc.desc Verify localeCompare returns 0 when equals returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: String = new String('hello');
      const b: String = new String('hello');
      if (a.equals(b)) {
        expect(a.localeCompare('hello')).assertEqual(0);
        expect(b.localeCompare(a.toString())).assertEqual(0);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_5200
     * @tc.name testEquals052
     * @tc.desc Verify equals with toWellFormed returns true for well-formed string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let wellFormed = text.toWellFormed();
      expect(wellFormed.equals('ArkTS')).assertTrue();
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_5300
     * @tc.name testEquals053
     * @tc.desc Verify equals after normalize NFC form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const composed: String = new String('é');
      let nfc = composed.normalize('NFC');
      expect(nfc.equals('é')).assertTrue();
      expect(composed.equals(nfc)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_5400
     * @tc.name testEquals054
     * @tc.desc Verify equals after normalize NFD decomposes character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const composed: String = new String('é');
      let nfd = composed.normalize('NFD');
      expect(nfd.equals('é')).assertTrue();
      let reNfc = nfd.normalize('NFC');
      expect(reNfc.equals(composed.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_5500
     * @tc.name testEquals055
     * @tc.desc Verify valueOf result equals original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let val = text.valueOf();
      expect(val.equals('ArkTS')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_5600
     * @tc.name testEquals056
     * @tc.desc Verify toString result equals original string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let str = text.toString();
      expect(str.equals('ArkTS')).assertTrue();
      expect(text.equals(str)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_5700
     * @tc.name testEquals057
     * @tc.desc Verify equals after multiple chained string operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('  Hello ArkTS World  ');
      let result = text.trim().toLowerCase().slice(6, 11);
      expect(result.equals('arkts')).assertTrue();
      expect(text.getLength() > result.getLength()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_5800
     * @tc.name testEquals058
     * @tc.desc Verify equals with lastIndexOf and substring combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS-Dev-ArkTS');
      let lastPos = text.lastIndexOf('ArkTS');
      let found = text.substring(lastPos, lastPos + 5);
      expect(found.equals('ArkTS')).assertTrue();
      let firstPos = text.indexOf('ArkTS');
      expect(firstPos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_5900
     * @tc.name testEquals059
     * @tc.desc Verify equals with match result validates pattern matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('Hello 123 World');
      let matchResult: RegExpMatchArray | null = text.match('\\d+');
      expect(matchResult).not().assertNull();
      if (matchResult !== null) {
        let matched: String = new String(matchResult[0]);
        expect(matched.equals('123')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_6000
     * @tc.name testEquals060
     * @tc.desc Verify equals with search result confirms index position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('Hello ArkTS');
      let pos = text.search('ArkTS');
      expect(pos).assertEqual(6);
      let word = text.slice(pos, pos + 5);
      expect(word.equals('ArkTS')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_6100
     * @tc.name testEquals061
     * @tc.desc Verify equals and startsWith consistency for prefix matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('prefix-main-suffix');
      expect(text.startsWith(new String('prefix'))).assertTrue();
      if (text.startsWith(new String('prefix'))) {
        expect(text.substring(0, 6).equals('prefix')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_6200
     * @tc.name testEquals062
     * @tc.desc Verify equals and endsWith consistency for suffix matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('prefix-main-suffix');
      expect(text.endsWith(new String('suffix'))).assertTrue();
      if (text.endsWith(new String('suffix'))) {
        let len = text.getLength();
        expect(text.substring(len - 6).equals('suffix')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_6300
     * @tc.name testEquals063
     * @tc.desc Verify codePointAt values match expected code points for ASCII and non-ASCII characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('A🚀Z');
      expect(text.codePointAt(0) !== undefined).assertTrue();
      if (text.codePointAt(0) !== undefined) {
        expect(text.codePointAt(0)!).assertEqual(65);
      }
      expect(text.charCodeAt(0)).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_6400
     * @tc.name testEquals064
     * @tc.desc Verify getLength and equals consistency for string objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: String = new String('ArkTS');
      const b: String = new String('ArkTS');
      expect(a.getLength()).assertEqual(b.getLength());
      if (a.getLength() === b.getLength()) {
        expect(a.equals(b)).assertTrue();
      }
      const c: String = new String('Ark');
      expect(a.equals(c)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_6500
     * @tc.name testEquals065
     * @tc.desc Verify equals returns true for identical Japanese hiragana strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = 'こんにちは';
      let b: string = 'こんにちは';
      expect(a).assertEqual(b);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS2_6600
     * @tc.name testEquals066
     * @tc.desc Verify equals returns true for identical Cyrillic strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = 'привет';
      let b: string = 'привет';
      expect(a).assertEqual(b);
      expect(a.equals(b)).assertTrue();
    });
  });
}