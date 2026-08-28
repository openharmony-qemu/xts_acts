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

function checkWellFormed<T extends string>(s: T): boolean {
  return s.isWellFormed();
}

export default function StringIsWellFormed2Test(): void {
  describe('StringIsWellFormed2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_0100
     * @tc.name testIsWellFormed001
     * @tc.desc Verify string literal isWellFormed returns true for ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Hello".isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_0200
     * @tc.name testIsWellFormed002
     * @tc.desc Verify new String instance isWellFormed returns same as literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new String("Hello").isWellFormed()).assertTrue();
      expect(new String("\uD800").isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_0300
     * @tc.name testIsWellFormed003
     * @tc.desc Verify const and let variables with isolated surrogate return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: string = "\uD800";
      let l: string = "\uD800";
      expect(c.isWellFormed()).assertFalse();
      expect(l.isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_0400
     * @tc.name testIsWellFormed004
     * @tc.desc Verify function return value with isolated surrogate isWellFormed returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getStr().isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_0500
     * @tc.name testIsWellFormed005
     * @tc.desc Verify skin-tone emoji isWellFormed returns true for legal surrogate pair sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("👍🏻".isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_0600
     * @tc.name testIsWellFormed006
     * @tc.desc Verify ZWJ family emoji isWellFormed returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("👨‍👩‍👧".isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_0700
     * @tc.name testIsWellFormed007
     * @tc.desc Verify isolated high surrogate isWellFormed returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("\uD800".isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_0800
     * @tc.name testIsWellFormed008
     * @tc.desc Verify isolated low surrogate isWellFormed returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("\uDC00".isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_0900
     * @tc.name testIsWellFormed009
     * @tc.desc Verify reversed surrogate pair isWellFormed returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("\uDC00\uD800".isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_1000
     * @tc.name testIsWellFormed010
     * @tc.desc Verify mixed legal and isolated surrogate text isWellFormed returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a\uD800b😀c\uDC00d".isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_1100
     * @tc.name testIsWellFormed011
     * @tc.desc Verify paired surrogate followed by isolated high surrogate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("😀\uD800".isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_1200
     * @tc.name testIsWellFormed012
     * @tc.desc Verify toWellFormed result isWellFormed always returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "\uD800".toWellFormed();
      expect(s.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_1300
     * @tc.name testIsWellFormed013
     * @tc.desc Verify generic function with T extends string calls isWellFormed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(checkWellFormed("Hello")).assertTrue();
      expect(checkWellFormed("\uD800")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_1400
     * @tc.name testIsWellFormed014
     * @tc.desc Verify isWellFormed return type is boolean via typeof and truthy checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: boolean = "Hello".isWellFormed();
      expect(r).assertTrue();
      let r2: boolean = "\uD800".isWellFormed();
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_1500
     * @tc.name testIsWellFormed015
     * @tc.desc Verify isWellFormed supports boolean negation and ternary operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!"\uD800".isWellFormed()).assertTrue();
      let r: string = "\uD800".isWellFormed() ? "valid" : "invalid";
      expect(r).assertEqual("invalid");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_1600
     * @tc.name testIsWellFormed016
     * @tc.desc Verify empty string isWellFormed returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("".isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_1700
     * @tc.name testIsWellFormed017
     * @tc.desc Verify replacement character isWellFormed returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("�".isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_1800
     * @tc.name testIsWellFormed018
     * @tc.desc Verify isWellFormed on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "hello";
      let result: boolean = str.isWellFormed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_1900
     * @tc.name testIsWellFormed019
     * @tc.desc Verify isWellFormed on String instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("hello");
      let result: boolean = str.isWellFormed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED2_2000
     * @tc.name testIsWellFormed020
     * @tc.desc Verify isWellFormed on expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsWellFormed020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = ("he"+"llo").isWellFormed();
      expect(result).assertTrue();
    });
  });
}