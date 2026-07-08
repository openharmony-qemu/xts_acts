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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function DateToLocaleStringTest(): void {
  describe('DateToLocaleStringTest', () => {
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
     * @tc.number SUB_DATE_TO_LCL_STRNG_0100
     * @tc.name testDateToLocaleString0001
     * @tc.desc Verify toLocaleString with no arguments uses default locale and format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString();
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_0200
     * @tc.name testDateToLocaleString0002
     * @tc.desc Verify toLocaleString with only locales parameter, omitting options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString("en-US");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_0300
     * @tc.name testDateToLocaleString0003
     * @tc.desc Verify toLocaleString with undefined locales and only options parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString();
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_0400
     * @tc.name testDateToLocaleString0004
     * @tc.desc Verify toLocaleString with both locales and options parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString("zh-CN");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_0500
     * @tc.name testDateToLocaleString0005
     * @tc.desc Verify toLocaleString with extra arguments are ignored without affecting result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString("en-US");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_0800
     * @tc.name testDateToLocaleString0008
     * @tc.desc Verify toLocaleString with Japanese locale tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString("ja-JP");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_0900
     * @tc.name testDateToLocaleString0009
     * @tc.desc Verify toLocaleString with Korean locale tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString("ko-KR");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_1000
     * @tc.name testDateToLocaleString0010
     * @tc.desc Verify toLocaleString with German locale tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString("de-DE");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_1100
     * @tc.name testDateToLocaleString0011
     * @tc.desc Verify toLocaleString with French locale tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString("fr-FR");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_1300
     * @tc.name testDateToLocaleString0013
     * @tc.desc Verify toLocaleString with Russian locale tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString("ru-RU");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_1400
     * @tc.name testDateToLocaleString0014
     * @tc.desc Verify toLocaleString with language-only tag without region code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString("en");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_2000
     * @tc.name testDateToLocaleString0020
     * @tc.desc Verify toLocaleString with empty string locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date(0);
        let result = date.toLocaleString("");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_4300
     * @tc.name testDateToLocaleString0043
     * @tc.desc Verify toLocaleString without arguments returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 0, 15, 10, 30, 0);
      let result = date.toLocaleString();
      expect(result.includes("2026")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_4400
     * @tc.name testDateToLocaleString0044
     * @tc.desc Verify toLocaleString returns locale-specific formatted strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let enResult = date.toLocaleString("en-US");
      let zhResult = date.toLocaleString("zh-CN");
      let jaResult = date.toLocaleString("ja-JP");
      expect(enResult.includes("1970")).assertTrue();
      expect(enResult !== zhResult || zhResult !== jaResult).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_4500
     * @tc.name testDateToLocaleString0045
     * @tc.desc Verify toLocaleString produces different results with different options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let fullResult = date.toLocaleString("en-US");
      let shortResult = date.toLocaleString("zh-CN");
      expect(fullResult !== shortResult).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_4700
     * @tc.name testDateToLocaleString0047
     * @tc.desc Verify toLocaleString with current time return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.toLocaleString("en-US");
      expect(result.includes(date.getFullYear().toString())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_4800
     * @tc.name testDateToLocaleString0048
     * @tc.desc Verify toLocaleString with far future date return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2099, 11, 31, 23, 59, 59);
      let result = date.toLocaleString("en-US");
      expect(result.includes("2099")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_4900
     * @tc.name testDateToLocaleString0049
     * @tc.desc Verify toLocaleString with far past date return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1900, 0, 1, 0, 0, 0);
      let result = date.toLocaleString("en-US");
      expect(result.includes("1900")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_5000
     * @tc.name testDateToLocaleString0050
     * @tc.desc Verify same timestamp Date objects return identical formatted strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(0);
      const date2 = new Date(0);
      let result1 = date1.toLocaleString("en-US");
      let result2 = date2.toLocaleString("en-US");
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_5100
     * @tc.name testDateToLocaleString0051
     * @tc.desc Verify toLocaleString with invalid NaN date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date("invalid");
        let result = date.toLocaleString("en-US");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_5200
     * @tc.name testDateToLocaleString0052
     * @tc.desc Verify toLocaleString return type is String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString("en-US");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_5400
     * @tc.name testDateToLocaleString0054
     * @tc.desc Verify toLocaleString return value supports string operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString("en-US");
      let sub = result.substring(0, 5);
      expect(sub.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_5600
     * @tc.name testDateToLocaleString0056
     * @tc.desc Verify toLocaleString with maximum timestamp date formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(8640000000000000);
      let result = date.toLocaleString("en-US");
      expect(result.includes("275760")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_5700
     * @tc.name testDateToLocaleString0057
     * @tc.desc Verify toLocaleString correctly formats leap year February 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 1, 29);
      let result = date.toLocaleString("en-US");
      expect(result.indexOf("Feb") >= 0 || result.indexOf("2") >= 0).assertTrue();
      expect(result.indexOf("29") >= 0 || result.indexOf("2024") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_5800
     * @tc.name testDateToLocaleString0058
     * @tc.desc Verify toLocaleString correctly formats midnight time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 0, 1, 0, 0, 0);
      let result = date.toLocaleString("en-US");
      expect(result.includes("2026")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_5900
     * @tc.name testDateToLocaleString0059
     * @tc.desc Verify toLocaleString correctly formats end of day 23:59:59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 11, 31, 23, 59, 59);
      let result = date.toLocaleString("en-US");
      expect(result.includes("2026")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_6200
     * @tc.name testDateToLocaleString0062
     * @tc.desc Verify toLocaleString returns non-empty result or catches RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result: string = "";
      try {
        result = date.toLocaleString("en-US");
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_6400
     * @tc.name testDateToLocaleString0064
     * @tc.desc Verify finally block always executes regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toLocaleString("en-US");
      expect(result.includes("1970")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_6500
     * @tc.name testDateToLocaleString0065
     * @tc.desc Verify toLocaleString with NaN date does not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date("invalid-date-string");
        let result = date.toLocaleString("en-US");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_6700
     * @tc.name testDateToLocaleString0067
     * @tc.desc Verify overridden toLocaleString returns String consistent with base toString behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let toLocaleResult = date.toLocaleString("en-US");
      let toStringResult = date.toString();
      expect(toLocaleResult !== toStringResult).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_6800
     * @tc.name testDateToLocaleString0068
     * @tc.desc Verify overridden method can be called through Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 4, 9, 12, 0, 0);
      let result = date.toLocaleString("zh-CN");
      expect(result.includes("2026")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_6900
     * @tc.name testDateToLocaleString0069
     * @tc.desc Verify Date toLocaleString demonstrates correct polymorphic behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let enResult = date.toLocaleString("en-US");
      let zhResult = date.toLocaleString("zh-CN");
      expect(enResult.includes("1970")).assertTrue();
      expect(enResult !== zhResult).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_7000
     * @tc.name testDateToLocaleString0070
     * @tc.desc Verify different formatting results between en-US and zh-CN for same date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 0, 15, 10, 30, 0);
      let enResult = date.toLocaleString("en-US");
      let zhResult = date.toLocaleString("zh-CN");
      expect(enResult !== zhResult).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_7100
     * @tc.name testDateToLocaleString0071
     * @tc.desc Verify different output formats for hour12 true versus false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 0, 1, 15, 30, 0);
      let result12 = date.toLocaleString("en-US");
      let result24 = date.toLocaleString("zh-CN");
      expect(result12.includes("2026")).assertTrue();
      expect(result12 !== result24).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_7200
     * @tc.name testDateToLocaleString0072
     * @tc.desc Verify same Date object returns consistent results across multiple toLocaleString calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result1 = date.toLocaleString("en-US");
      let result2 = date.toLocaleString("en-US");
      let result3 = date.toLocaleString("en-US");
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_STRNG_7300
     * @tc.name testDateToLocaleString0073
     * @tc.desc Verify two Date instances with same timestamp produce identical formatted output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleString0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const timestamp = 1700000000000;
      const date1 = new Date(timestamp);
      const date2 = new Date(timestamp);
      let result1 = date1.toLocaleString("en-US");
      let result2 = date2.toLocaleString("en-US");
      expect(result1).assertEqual(result2);
    });

  });
}
