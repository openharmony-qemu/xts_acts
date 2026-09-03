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

function getStr(): string {
  return "\uDC00";
}

function makeWellFormed<T extends string>(s: T): string {
  return s.toWellFormed();
}

export default function StringToWellFormed2Test(): void {
  describe('StringToWellFormed2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_0100
     * @tc.name testToWellFormed001
     * @tc.desc Verify string literal toWellFormed returns unchanged for ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Hello".toWellFormed()).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_0200
     * @tc.name testToWellFormed002
     * @tc.desc Verify new String instance with isolated surrogate toWellFormed returns replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new String("\uD800").toWellFormed()).assertEqual("�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_0300
     * @tc.name testToWellFormed003
     * @tc.desc Verify const isolated high surrogate toWellFormed returns replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = "\uD800";
      expect(s.toWellFormed()).assertEqual("�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_0400
     * @tc.name testToWellFormed004
     * @tc.desc Verify function return value with isolated surrogate toWellFormed returns replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getStr().toWellFormed()).assertEqual("�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_0500
     * @tc.name testToWellFormed005
     * @tc.desc Verify toWellFormed replaces isolated surrogate with replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strVal: string = "a\uD800b";
      expect(strVal.toWellFormed()).assertEqual("a�b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_0600
     * @tc.name testToWellFormed006
     * @tc.desc Verify skin-tone emoji toWellFormed remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("👍🏻".toWellFormed()).assertEqual("👍🏻");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_0700
     * @tc.name testToWellFormed007
     * @tc.desc Verify ZWJ family emoji toWellFormed remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("👨‍👩‍👧".toWellFormed()).assertEqual("👨‍👩‍👧");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_0800
     * @tc.name testToWellFormed008
     * @tc.desc Verify replacement character itself toWellFormed remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("�".toWellFormed()).assertEqual("�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_0900
     * @tc.name testToWellFormed009
     * @tc.desc Verify isolated high and low surrogates toWellFormed each replaced with replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("\uD800".toWellFormed()).assertEqual("�");
      expect("\uDC00".toWellFormed()).assertEqual("�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_1000
     * @tc.name testToWellFormed010
     * @tc.desc Verify consecutive multiple high surrogates each replaced with replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "\uD800\uD800\uD800".toWellFormed();
      expect(r).assertEqual("���");
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_1100
     * @tc.name testToWellFormed011
     * @tc.desc Verify consecutive multiple low surrogates each replaced with replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "\uDC00\uDC00\uDC00".toWellFormed();
      expect(r).assertEqual("���");
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_1200
     * @tc.name testToWellFormed012
     * @tc.desc Verify mixed text toWellFormed replaces only isolated surrogates and keeps legal chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "a\uD800b😀c\uDC00d".toWellFormed();
      expect(r).assertEqual("a�b😀c�d");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_1300
     * @tc.name testToWellFormed013
     * @tc.desc Verify empty string toWellFormed returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "".toWellFormed();
      expect(r).assertEqual("");
      expect(r.indexOf('a')).assertEqual(-1);
      expect(r.startsWith('')).assertTrue();
      expect(r.endsWith('')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_1400
     * @tc.name testToWellFormed014
     * @tc.desc Verify generic function with T extends string calls toWellFormed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(makeWellFormed("Hello")).assertEqual("Hello");
      expect(makeWellFormed("\uD800")).assertEqual("�");
      expect(makeWellFormed("😀")).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_1500
     * @tc.name testToWellFormed015
     * @tc.desc Verify toWellFormed return typeof is string and length verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "\uD800".toWellFormed();
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_1600
     * @tc.name testToWellFormed016
     * @tc.desc Verify toWellFormed result charCodeAt returns 0xFFFD for replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "\uD800".toWellFormed();
      expect(r.charCodeAt(0)).assertEqual(0xFFFD);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_1700
     * @tc.name testToWellFormed017
     * @tc.desc Verify toWellFormed result always isWellFormed returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("\uD800".toWellFormed().isWellFormed()).assertTrue();
      expect("a\uDC00b".toWellFormed().isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_1800
     * @tc.name testToWellFormed018
     * @tc.desc Verify original string immutability after toWellFormed call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "\uD800";
      let converted: string = original.toWellFormed();
      expect(converted.isWellFormed()).assertTrue();
      expect(original).assertEqual("\uD800");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_1900
     * @tc.name testToWellFormed019
     * @tc.desc Verify toWellFormed is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let once: string = "\uD800".toWellFormed();
      let twice: string = once.toWellFormed();
      expect(once).assertEqual(twice);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_2000
     * @tc.name testToWellFormed020
     * @tc.desc Verify toWellFormed codePointAt returns 0xFFFD for replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: int | undefined = "\uD800".toWellFormed().codePointAt(0);
      expect(r).assertEqual(0xFFFD);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_2100
     * @tc.name testToWellFormed021
     * @tc.desc Verify isolated high surrogate replaced by U+FFFD preserves length 1 before and after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let before: number = "\uD800".length;
      let after: number = "\uD800".toWellFormed().length;
      expect(before).assertEqual(1);
      expect(after).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_2200
     * @tc.name testToWellFormed022
     * @tc.desc Verify toWellFormed on string|String union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string | String = "hello";
      let result: string = str.toWellFormed();
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_2300
     * @tc.name testToWellFormed023
     * @tc.desc Verify String instance toWellFormed returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("hello");
      let result: string = str.toWellFormed();
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_2400
     * @tc.name testToWellFormed024
     * @tc.desc Verify toWellFormed then trim post-chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "  hello  ";
      let result: string = str.toWellFormed().trim();
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_2500
     * @tc.name testToWellFormed025
     * @tc.desc Verify toWellFormed on pure numbers unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "12345";
      expect(str.toWellFormed()).assertEqual("12345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_2600
     * @tc.name testToWellFormed026
     * @tc.desc Verify toWellFormed on single lone high surrogate replaced with U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bad: string = "\uD800";
      let result: string = bad.toWellFormed();
      expect(result.length).assertEqual(1);
      expect(result.charCodeAt(0)).assertEqual(0xFFFD);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_2700
     * @tc.name testToWellFormed027
     * @tc.desc Verify toWellFormed does not mutate original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "hello";
      str.toWellFormed();
      expect(str).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_2800
     * @tc.name testToWellFormed028
     * @tc.desc Verify toWellFormed with concatenation expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ("he" + "llo").toWellFormed();
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_2900
     * @tc.name testToWellFormed029
     * @tc.desc Verify toWellFormed + isWellFormed roundtrip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "hello\uD800world";
      let fixed: string = str.toWellFormed();
      expect(fixed.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_3000
     * @tc.name testToWellFormed030
     * @tc.desc Verify toWellFormed() replaces lone high surrogate with U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let broken: string = "A\uD83DB";
      expect(broken.isWellFormed()).assertFalse();
      let fixed: string = broken.toWellFormed();
      expect(fixed.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED2_3100
     * @tc.name testToWellFormed031
     * @tc.desc Verify toWellFormed() replaces lone low surrogate with U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToWellFormed031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let broken: string = "A\uDE89B";
      expect(broken.isWellFormed()).assertFalse();
      let fixed: string = broken.toWellFormed();
      expect(fixed.isWellFormed()).assertTrue();
    });

    });
}