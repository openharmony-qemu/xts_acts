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

export default function StringPadStartTest(): void {
  describe('StringPadStartTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0100
     * @tc.name testPadStart001
     * @tc.desc Verify padStart() pads ASCII string to target length with single char at beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padStart(3, "0");
      expect(result).assertEqual("00A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0200
     * @tc.name testPadStart002
     * @tc.desc Verify padStart() when target equals length returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: string = text.padStart(3, "0");
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0300
     * @tc.name testPadStart003
     * @tc.desc Verify padStart() when targetLength is shorter than string returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: string = text.padStart(3, "0");
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0400
     * @tc.name testPadStart004
     * @tc.desc Verify padStart() with default space padding when padString omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padStart(3);
      expect(result).assertEqual("  A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0500
     * @tc.name testPadStart005
     * @tc.desc Verify padStart() with emoji pad string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("B");
      let result: string = text.padStart(3, "😀");
      expect(result).assertEqual("😀B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0600
     * @tc.name testPadStart006
     * @tc.desc Verify padStart() with CJK Unicode BMP pad string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      let result: string = text.padStart(3, "中");
      expect(result).assertEqual("中中X");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0700
     * @tc.name testPadStart007
     * @tc.desc Verify padStart() with GBK Chinese text pads correctly at start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文");
      let result: string = text.padStart(4, "！");
      expect(result).assertEqual("！！中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0800
     * @tc.name testPadStart008
     * @tc.desc Verify padStart() with multi-char pad string repeats correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padStart(4, "bc");
      expect(result).assertEqual("bcbA");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0900
     * @tc.name testPadStart009
     * @tc.desc Verify padStart() with dynamic targetLength and padString variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Y");
      let target: int = 5;
      let pad: string = "*";
      let result: string = text.padStart(target, pad);
      expect(result).assertEqual("****Y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1000
     * @tc.name testPadStart010
     * @tc.desc Verify padStart() with negative targetLength returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let result: string = text.padStart(-1, "0");
      expect(result).assertEqual("ab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1100
     * @tc.name testPadStart011
     * @tc.desc Verify padStart() with targetLength 0 returns original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: string = text.padStart(0, "X");
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1200
     * @tc.name testPadStart012
     * @tc.desc Verify padStart() truncates long padString to fit target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padStart(4, "BCDEFG");
      expect(result).assertEqual("BCDA");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1300
     * @tc.name testPadStart013
     * @tc.desc Verify padStart() for number zero-padding pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("42");
      let result: string = text.padStart(5, "0");
      expect(result).assertEqual("00042");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1400
     * @tc.name testPadStart014
     * @tc.desc Verify padStart() combined with toLowerCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HELLO");
      let result: string = text.toLowerCase().padStart(8, ".");
      expect(result).assertEqual("...hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1500
     * @tc.name testPadStart015
     * @tc.desc Verify padStart() result ends with original string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("data");
      let result: string = text.padStart(10, ".");
      let suffix: string = result.substring(result.length - 4);
      expect(suffix).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1600
     * @tc.name testPadStart016
     * @tc.desc Verify padStart() on empty string creates padding-only result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: string = text.padStart(3, "*");
      expect(result).assertEqual("***");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1700
     * @tc.name testPadStart017
     * @tc.desc Verify padStart() result length equals targetLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: string = text.padStart(5, "0");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1800
     * @tc.name testPadStart018
     * @tc.desc Verify padStart() does not modify original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: string = text.padStart(5, "0");
      expect(text.toString()).assertEqual("AB");
      expect(result).assertEqual("000AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1900
     * @tc.name testPadStart019
     * @tc.desc Verify padStart() with large targetLength does not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: string = text.padStart(10000, "0");
      expect(result.length).assertEqual(10000);
      expect(result.startsWith("0".repeat(9995))).assertTrue();
      expect(result.endsWith("Hello")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_2000
     * @tc.name testPadStart020
     * @tc.desc Verify padStart() for fixed-width number formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new String("7");
      let formatted: string = num.padStart(3, "0");
      expect(formatted).assertEqual("007");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_2100
     * @tc.name testPadStart021
     * @tc.desc Verify padStart() for right-aligned text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("right");
      let aligned: string = text.padStart(10);
      expect(aligned).assertEqual("     right");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_2200
     * @tc.name testPadStart022
     * @tc.desc Verify padStart() with default space padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("x");
      let result: string = text.padStart(3);
      expect(result).assertEqual("  x");
    });
  });
}
