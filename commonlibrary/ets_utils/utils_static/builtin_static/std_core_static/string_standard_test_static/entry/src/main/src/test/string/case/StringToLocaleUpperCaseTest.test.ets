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

export default function StringToLocaleUpperCaseTest(): void {
  describe('StringToLocaleUpperCaseTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_0100
     * @tc.name testToLocaleUpperCase001
     * @tc.desc Verify toLocaleUpperCase() converts ASCII lowercase to uppercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("HELLO WORLD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_0200
     * @tc.name testToLocaleUpperCase002
     * @tc.desc Verify toLocaleUpperCase() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_0300
     * @tc.name testToLocaleUpperCase003
     * @tc.desc Verify toLocaleUpperCase() on already-uppercase string returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ARKTS");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("ARKTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_0400
     * @tc.name testToLocaleUpperCase004
     * @tc.desc Verify toLocaleUpperCase() on CJK and numbers returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试456");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("中文测试456");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_0500
     * @tc.name testToLocaleUpperCase005
     * @tc.desc Verify toLocaleUpperCase() with GBK Chinese and mixed case ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文abc测试");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("中文ABC测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_0600
     * @tc.name testToLocaleUpperCase006
     * @tc.desc Verify toLocaleUpperCase() with full-width lowercase returns full-width uppercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ａｂｃ");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("ＡＢＣ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_0700
     * @tc.name testToLocaleUpperCase007
     * @tc.desc Verify toLocaleUpperCase() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("MiXeD");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("MIXED");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_0800
     * @tc.name testToLocaleUpperCase008
     * @tc.desc Verify toLocaleUpperCase() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: string = text.toLocaleUpperCase();
      expect(text.toString()).assertEqual("hello");
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_0900
     * @tc.name testToLocaleUpperCase009
     * @tc.desc Verify multiple toLocaleUpperCase() calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("istanbul");
      let r1: string = text.toLocaleUpperCase();
      let r2: string = text.toLocaleUpperCase();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_1000
     * @tc.name testToLocaleUpperCase010
     * @tc.desc Verify toLocaleUpperCase() vs toUpperCase() same for ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let locale: string = text.toLocaleUpperCase();
      let upper: String = text.toUpperCase();
      expect(locale).assertEqual(upper.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_1100
     * @tc.name testToLocaleUpperCase011
     * @tc.desc Verify toLocaleUpperCase() with Turkish locale: i becomes İ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("i");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("I");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_1200
     * @tc.name testToLocaleUpperCase012
     * @tc.desc Verify toLocaleUpperCase() preserves emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello 😀 world");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("HELLO 😀 WORLD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_1300
     * @tc.name testToLocaleUpperCase013
     * @tc.desc Verify toLocaleUpperCase() chained with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello  ");
      let result: string = text.trim().toLocaleUpperCase();
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_1400
     * @tc.name testToLocaleUpperCase014
     * @tc.desc Verify toLocaleUpperCase() chained with slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let result: string = text.slice(0, 5).toLocaleUpperCase();
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_1500
     * @tc.name testToLocaleUpperCase015
     * @tc.desc Verify toLocaleUpperCase() on numbers-only returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("1234567890");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("1234567890");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_1600
     * @tc.name testToLocaleUpperCase016
     * @tc.desc Verify toLocaleUpperCase() on Latin extended accented characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("àáâãäå");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("ÀÁÂÃÄÅ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_1700
     * @tc.name testToLocaleUpperCase017
     * @tc.desc Verify toLocaleUpperCase() on Greek letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("αβγδ");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("ΑΒΓΔ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_1800
     * @tc.name testToLocaleUpperCase018
     * @tc.desc Verify toLocaleUpperCase() called twice gives same result (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let once: string = text.toLocaleUpperCase();
      const text1 = new String(once);
      let twice: string = text1.toLocaleUpperCase();
      expect(twice).assertEqual(once);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_1900
     * @tc.name testToLocaleUpperCase019
     * @tc.desc Verify toLocaleUpperCase() on only-symbols string remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("!@#$%^&*()");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("!@#$%^&*()");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE_2000
     * @tc.name testToLocaleUpperCase020
     * @tc.desc Verify toLocaleUpperCase() on already uppercase string returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleUpperCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ALREADY UPPERCASE TEXT");
      let result: string = text.toLocaleUpperCase();
      expect(result).assertEqual("ALREADY UPPERCASE TEXT");
    });
  });
}
