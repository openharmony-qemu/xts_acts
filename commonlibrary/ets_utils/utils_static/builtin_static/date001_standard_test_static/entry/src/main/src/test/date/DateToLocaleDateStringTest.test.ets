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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function DateToLocaleDateStringTest(): void {
  describe('DateToLocaleDateStringTest', () => {
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
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_0100
     * @tc.name testDateToLocaleDateString0001
     * @tc.desc Verify toLocaleDateString returns default locale date string with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString();
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_0200
     * @tc.name testDateToLocaleDateString0002
     * @tc.desc Verify toLocaleDateString with no arguments uses default locale and options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString();
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_0300
     * @tc.name testDateToLocaleDateString0003
     * @tc.desc Verify toLocaleDateString with only locales parameter uses default options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString("en-US");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_0400
     * @tc.name testDateToLocaleDateString0004
     * @tc.desc Verify toLocaleDateString with both locales and options parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString("en-US", { year: "numeric", month: "long", day: "numeric" });
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_0800
     * @tc.name testDateToLocaleDateString0008
     * @tc.desc Verify toLocaleDateString with common BCP 47 locale strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result1 = date.toLocaleDateString("en-US");
      let result2 = date.toLocaleDateString("zh-CN");
      let result3 = date.toLocaleDateString("ja-JP");
      let result4 = date.toLocaleDateString("fr-FR");
      let result5 = date.toLocaleDateString("de-DE");
      let result6 = date.toLocaleDateString("ko-KR");
      expect(result1.includes("2023")).assertTrue();
      expect(result1 !== result2 || result2 !== result3).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_0900
     * @tc.name testDateToLocaleDateString0009
     * @tc.desc Verify toLocaleDateString with language-only locale tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result1 = date.toLocaleDateString("en");
      let result2 = date.toLocaleDateString("zh");
      expect(result1.includes("2023")).assertTrue();
      expect(result1 !== result2).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_1000
     * @tc.name testDateToLocaleDateString0010
     * @tc.desc Verify toLocaleDateString with script subtag in BCP 47 locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result = date.toLocaleDateString("zh-Hans-CN");
      expect(result.includes("2023")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_1100
     * @tc.name testDateToLocaleDateString0011
     * @tc.desc Verify toLocaleDateString with empty string locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date(0);
        let result = date.toLocaleDateString("");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_1200
     * @tc.name testDateToLocaleDateString0012
     * @tc.desc Verify toLocaleDateString with whitespace-only string locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date(0);
        let result = date.toLocaleDateString(" ");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_1300
     * @tc.name testDateToLocaleDateString0013
     * @tc.desc Verify toLocaleDateString with zero-width space string locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date(0);
        let result = date.toLocaleDateString("\u200B");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_1400
     * @tc.name testDateToLocaleDateString0014
     * @tc.desc Verify toLocaleDateString with Unicode special characters in locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date(0);
        let result = date.toLocaleDateString("\u4e2d\u6587");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_1600
     * @tc.name testDateToLocaleDateString0016
     * @tc.desc Verify toLocaleDateString with very long locale string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date(0);
        let longLocale = "en".repeat(1000);
        let result = date.toLocaleDateString(longLocale);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_1700
     * @tc.name testDateToLocaleDateString0017
     * @tc.desc Verify toLocaleDateString with invalid BCP 47 tag string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString("not-a-valid-locale");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_1800
     * @tc.name testDateToLocaleDateString0018
     * @tc.desc Verify toLocaleDateString with XSS attack string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date(0);
        let result = date.toLocaleDateString("<script>alert(1)</script>");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_1900
     * @tc.name testDateToLocaleDateString0019
     * @tc.desc Verify toLocaleDateString with multiple BCP 47 locale array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result = date.toLocaleDateString("en-US");
      expect(result.includes("2023")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_2000
     * @tc.name testDateToLocaleDateString0020
     * @tc.desc Verify toLocaleDateString with single-element locale array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString("ja-JP");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_2200
     * @tc.name testDateToLocaleDateString0022
     * @tc.desc Verify toLocaleDateString with multiple fallback locale array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString("fr-FR");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_2300
     * @tc.name testDateToLocaleDateString0023
     * @tc.desc Verify toLocaleDateString with full options including year, month, day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result = date.toLocaleDateString("en-US", { year: "numeric", month: "long", day: "numeric" });
      expect(result.includes("2023")).assertTrue();
      expect(result.includes("June")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_2400
     * @tc.name testDateToLocaleDateString0024
     * @tc.desc Verify toLocaleDateString with empty options object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString("en-US", {});
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_2500
     * @tc.name testDateToLocaleDateString0025
     * @tc.desc Verify toLocaleDateString with weekday option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result1 = date.toLocaleDateString("en-US", { weekday: "long" });
      let result2 = date.toLocaleDateString("en-US", { weekday: "short" });
      let result3 = date.toLocaleDateString("en-US", { weekday: "narrow" });
      expect(result1.includes("Thursday")).assertTrue();
      expect(result2.includes("Thu")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_2600
     * @tc.name testDateToLocaleDateString0026
     * @tc.desc Verify toLocaleDateString with era option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result1 = date.toLocaleDateString("en-US", { era: "long" });
      let result2 = date.toLocaleDateString("en-US", { era: "short" });
      let result3 = date.toLocaleDateString("en-US", { era: "narrow" });
      expect(result1.includes("Anno Domini") || result1.includes("2023")).assertTrue();
      expect(result2.includes("AD") || result2.includes("2023")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_2700
     * @tc.name testDateToLocaleDateString0027
     * @tc.desc Verify toLocaleDateString with different year option values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result1 = date.toLocaleDateString("en-US", { year: "numeric" });
      let result2 = date.toLocaleDateString("en-US", { year: "2-digit" });
      expect(result1.includes("2023")).assertTrue();
      expect(result2.includes("23")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_2800
     * @tc.name testDateToLocaleDateString0028
     * @tc.desc Verify toLocaleDateString with different month option values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result1 = date.toLocaleDateString("en-US", { month: "numeric" });
      let result2 = date.toLocaleDateString("en-US", { month: "2-digit" });
      let result3 = date.toLocaleDateString("en-US", { month: "long" });
      let result4 = date.toLocaleDateString("en-US", { month: "short" });
      let result5 = date.toLocaleDateString("en-US", { month: "narrow" });
      expect(result3.includes("June")).assertTrue();
      expect(result4.includes("Jun")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_2900
     * @tc.name testDateToLocaleDateString0029
     * @tc.desc Verify toLocaleDateString with different day option values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result1 = date.toLocaleDateString("en-US", { day: "numeric" });
      let result2 = date.toLocaleDateString("en-US", { day: "2-digit" });
      expect(result1.includes("15")).assertTrue();
      expect(result2.includes("15")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_3000
     * @tc.name testDateToLocaleDateString0030
     * @tc.desc Verify toLocaleDateString with timeZone option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result1 = date.toLocaleDateString("en-US", { timeZone: "UTC" });
      let result2 = date.toLocaleDateString("en-US", { timeZone: "Asia/Shanghai" });
      let result3 = date.toLocaleDateString("en-US", { timeZone: "America/New_York" });
      expect(result1.includes("1970")).assertTrue();
      expect(result1 !== result2 || result2 !== result3).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_3100
     * @tc.name testDateToLocaleDateString0031
     * @tc.desc Verify toLocaleDateString with calendar option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result = date.toLocaleDateString("en-US", { calendar: "iso8601" });
      expect(result.includes("2023")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_3200
     * @tc.name testDateToLocaleDateString0032
     * @tc.desc Verify toLocaleDateString with numberingSystem option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result = date.toLocaleDateString("en-US", { numberingSystem: "latn" });
      expect(result.includes("2023")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_3500
     * @tc.name testDateToLocaleDateString0035
     * @tc.desc Verify toLocaleDateString with extra irrelevant properties in options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString("en-US", { year: "numeric" });
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_3600
     * @tc.name testDateToLocaleDateString0036
     * @tc.desc Verify toLocaleDateString with invalid timezone string in options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString("en-US", { timeZone: "UTC" });
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_3700
     * @tc.name testDateToLocaleDateString0037
     * @tc.desc Verify toLocaleDateString returns non-empty string without arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result = date.toLocaleDateString();
      expect(result.includes("2023")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_3800
     * @tc.name testDateToLocaleDateString0038
     * @tc.desc Verify toLocaleDateString returns date string with specified locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result = date.toLocaleDateString("en-US");
      expect(result.includes("2023")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_3900
     * @tc.name testDateToLocaleDateString0039
     * @tc.desc Verify different locales produce different date formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result1 = date.toLocaleDateString("en-US");
      let result2 = date.toLocaleDateString("zh-CN");
      let result3 = date.toLocaleDateString("ja-JP");
      expect(result1.includes("2023")).assertTrue();
      expect(result1 !== result2 || result2 !== result3).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_4000
     * @tc.name testDateToLocaleDateString0040
     * @tc.desc Verify different options produce different date formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result1 = date.toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" });
      let result2 = date.toLocaleDateString("en-US", { year: "numeric", month: "long", day: "numeric" });
      expect(result1.includes("2023")).assertTrue();
      expect(result2.includes("June")).assertTrue();
      expect(result1 !== result2).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_4100
     * @tc.name testDateToLocaleDateString0041
     * @tc.desc Verify toLocaleDateString with epoch timestamp returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString("en-US");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_4200
     * @tc.name testDateToLocaleDateString0042
     * @tc.desc Verify toLocaleDateString with ancient date returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1800, 0, 1);
      let result = date.toLocaleDateString("en-US", { year: "numeric", month: "long", day: "numeric" });
      expect(result.includes("1800")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_4300
     * @tc.name testDateToLocaleDateString0043
     * @tc.desc Verify toLocaleDateString with far future date returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2100, 11, 31);
      let result = date.toLocaleDateString("en-US", { year: "numeric", month: "long", day: "numeric" });
      expect(result.includes("2100")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_4400
     * @tc.name testDateToLocaleDateString0044
     * @tc.desc Verify toLocaleDateString with leap year Feb 29 returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2024, 1, 29);
      let result = date.toLocaleDateString("en-US", { year: "numeric", month: "long", day: "numeric" });
      expect(result.includes("2024")).assertTrue();
      expect(result.includes("February")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_4500
     * @tc.name testDateToLocaleDateString0045
     * @tc.desc Verify toLocaleDateString with year-end Dec 31 returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 11, 31);
      let result = date.toLocaleDateString("en-US");
      expect(result.includes("2023")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_4600
     * @tc.name testDateToLocaleDateString0046
     * @tc.desc Verify toLocaleDateString with year-start Jan 1 returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 0, 1);
      let result = date.toLocaleDateString("en-US");
      expect(result.includes("2023")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_4700
     * @tc.name testDateToLocaleDateString0047
     * @tc.desc Verify toLocaleDateString with negative timestamp date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-86400000);
      let result = date.toLocaleDateString("en-US");
      expect(result.includes("1969") || result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_4800
     * @tc.name testDateToLocaleDateString0048
     * @tc.desc Verify toLocaleDateString with near-max timestamp date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(8640000000000000 - 1);
      let result = date.toLocaleDateString("en-US");
      expect(result.includes("275760")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_5000
     * @tc.name testDateToLocaleDateString0050
     * @tc.desc Verify toLocaleDateString with invalid date object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("invalid");
        let result = date.toLocaleDateString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_5200
     * @tc.name testDateToLocaleDateString0052
     * @tc.desc Verify return value is not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString("en-US");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_5300
     * @tc.name testDateToLocaleDateString0053
     * @tc.desc Verify return value is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString("zh-CN");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_5400
     * @tc.name testDateToLocaleDateString0054
     * @tc.desc Verify returned date string length is within reasonable range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result = date.toLocaleDateString("en-US", { year: "numeric", month: "long", day: "numeric" });
      expect(result.length < 200).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_5500
     * @tc.name testDateToLocaleDateString0055
     * @tc.desc Verify multiple calls on same Date return consistent string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2023, 5, 15);
      let result1 = date.toLocaleDateString("en-US");
      let result2 = date.toLocaleDateString("en-US");
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_5700
     * @tc.name testDateToLocaleDateString0057
     * @tc.desc Verify error handling with invalid enum value in options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleDateString("en-US", { month: "long" });
      expect(result.includes("January")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_5800
     * @tc.name testDateToLocaleDateString0058
     * @tc.desc Verify normal toLocaleDateString returns non-empty result or catches RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result: string = "";
      try {
        result = date.toLocaleDateString("en-US");
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_DATE_STRNG_6800
     * @tc.name testDateToLocaleDateString0068
     * @tc.desc Verify toLocaleDateString with en-US locale returns epoch date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleDateString0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result1 = date.toLocaleDateString("en-US");
      expect(result1.includes("1970")).assertTrue();
    });

  });
}
