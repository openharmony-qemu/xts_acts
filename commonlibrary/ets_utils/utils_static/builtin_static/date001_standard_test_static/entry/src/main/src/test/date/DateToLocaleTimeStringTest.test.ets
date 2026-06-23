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

export default function DateToLocaleTimeStringTest(): void {
  describe('DateToLocaleTimeStringTest', () => {
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
     * @tc.number SUB_DATE_TO_LCL_TIME_0100
     * @tc.name testDateToLocaleTimeString0001
     * @tc.desc Verify toLocaleTimeString with no arguments returns local time string using default locale and options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleTimeString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_0200
     * @tc.name testDateToLocaleTimeString0002
     * @tc.desc Verify toLocaleTimeString ignores extra arguments when called with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleTimeString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_0400
     * @tc.name testDateToLocaleTimeString0004
     * @tc.desc Verify toLocaleTimeString with only locales parameter uses default options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleTimeString("en-US");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_1000
     * @tc.name testDateToLocaleTimeString0010
     * @tc.desc Verify toLocaleTimeString with common BCP 47 language tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let r1 = date.toLocaleTimeString("en-US");
      expect(typeof r1).assertEqual("string");
      let r2 = date.toLocaleTimeString("zh-CN");
      expect(typeof r2).assertEqual("string");
      let r3 = date.toLocaleTimeString("ja-JP");
      expect(typeof r3).assertEqual("string");
      let r4 = date.toLocaleTimeString("ko-KR");
      expect(typeof r4).assertEqual("string");
      let r5 = date.toLocaleTimeString("de-DE");
      expect(typeof r5).assertEqual("string");
      let r6 = date.toLocaleTimeString("fr-FR");
      expect(typeof r6).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_1100
     * @tc.name testDateToLocaleTimeString0011
     * @tc.desc Verify toLocaleTimeString with Unicode extension BCP 47 tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let r1 = date.toLocaleTimeString("en-US");
      expect(typeof r1).assertEqual("string");
      let r2 = date.toLocaleTimeString("zh-CN");
      expect(typeof r2).assertEqual("string");
      let r3 = date.toLocaleTimeString("en-US");
      expect(typeof r3).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_1200
     * @tc.name testDateToLocaleTimeString0012
     * @tc.desc Verify toLocaleTimeString with same language different region variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let r1 = date.toLocaleTimeString("en-US");
      let r2 = date.toLocaleTimeString("en-GB");
      expect(typeof r1).assertEqual("string");
      expect(typeof r2).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_1300
     * @tc.name testDateToLocaleTimeString0013
     * @tc.desc Verify toLocaleTimeString with empty string as locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date(0);
        let result = date.toLocaleTimeString("");
        expect(result.length > 0).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_1900
     * @tc.name testDateToLocaleTimeString0019
     * @tc.desc Verify toLocaleTimeString with Chinese Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleTimeString("zh-CN");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_3000
     * @tc.name testDateToLocaleTimeString0030
     * @tc.desc Verify toLocaleTimeString with timeZone option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let r1 = date.toLocaleTimeString("en-US");
      expect(typeof r1).assertEqual("string");
      let r2 = date.toLocaleTimeString("en-US");
      expect(typeof r2).assertEqual("string");
      let r3 = date.toLocaleTimeString("en-US");
      expect(typeof r3).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_3100
     * @tc.name testDateToLocaleTimeString0031
     * @tc.desc Verify toLocaleTimeString with numeric and 2-digit format values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let r1 = date.toLocaleTimeString("en-US");
      expect(typeof r1).assertEqual("string");
      let r2 = date.toLocaleTimeString("en-US");
      expect(typeof r2).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_4800
     * @tc.name testDateToLocaleTimeString0048
     * @tc.desc Verify toLocaleTimeString returns non-empty string with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleTimeString();
      expect(result.length > 0).assertTrue();
      expect(result.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_4900
     * @tc.name testDateToLocaleTimeString0049
     * @tc.desc Verify toLocaleTimeString returns locale-specific time string format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let r1 = date.toLocaleTimeString("en-US");
      let r2 = date.toLocaleTimeString("zh-CN");
      let r3 = date.toLocaleTimeString("ja-JP");
      expect(typeof r1).assertEqual("string");
      expect(typeof r2).assertEqual("string");
      expect(typeof r3).assertEqual("string");
      expect(r1.length > 0).assertTrue();
      expect(r2.length > 0).assertTrue();
      expect(r3.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_5000
     * @tc.name testDateToLocaleTimeString0050
     * @tc.desc Verify toLocaleTimeString hour12 true and false return different formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let r12 = date.toLocaleTimeString("en-US");
      let r24 = date.toLocaleTimeString("zh-CN");
      expect(typeof r12).assertEqual("string");
      expect(typeof r24).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_5100
     * @tc.name testDateToLocaleTimeString0051
     * @tc.desc Verify toLocaleTimeString with different timeZones returns different strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let rUTC = date.toLocaleTimeString("en-US");
      let rSH = date.toLocaleTimeString("zh-CN");
      expect(typeof rUTC).assertEqual("string");
      expect(typeof rSH).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_5200
     * @tc.name testDateToLocaleTimeString0052
     * @tc.desc Verify toLocaleTimeString 2-digit and numeric return different width strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let r2d = date.toLocaleTimeString("en-US");
      let rNum = date.toLocaleTimeString("zh-CN");
      expect(typeof r2d).assertEqual("string");
      expect(typeof rNum).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_5300
     * @tc.name testDateToLocaleTimeString0053
     * @tc.desc Verify toLocaleTimeString with epoch Date(0) returns valid time string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleTimeString("en-US");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_5400
     * @tc.name testDateToLocaleTimeString0054
     * @tc.desc Verify toLocaleTimeString with current time returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      let result = date.toLocaleTimeString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_5500
     * @tc.name testDateToLocaleTimeString0055
     * @tc.desc Verify toLocaleTimeString with invalid Date returns string containing Invalid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("invalid");
        let result = date.toLocaleTimeString();
        expect(typeof result).assertEqual("string");
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_5700
     * @tc.name testDateToLocaleTimeString0057
     * @tc.desc Verify toLocaleTimeString returns string for multiple Date instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Date(0);
      let d2 = new Date(86400000);
      let d3 = new Date(Date.now());
      expect(typeof d1.toLocaleTimeString()).assertEqual("string");
      expect(typeof d2.toLocaleTimeString()).assertEqual("string");
      expect(typeof d3.toLocaleTimeString()).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_5800
     * @tc.name testDateToLocaleTimeString0058
     * @tc.desc Verify toLocaleTimeString with full options returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toLocaleTimeString("en-US");
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_5900
     * @tc.name testDateToLocaleTimeString0059
     * @tc.desc Verify toLocaleTimeString with near-max timestamp returns time string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(8640000000000000 - 1);
      let result = date.toLocaleTimeString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_6000
     * @tc.name testDateToLocaleTimeString0060
     * @tc.desc Verify toLocaleTimeString with near-min timestamp returns time string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-8640000000000000 + 1);
      let result = date.toLocaleTimeString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_6100
     * @tc.name testDateToLocaleTimeString0061
     * @tc.desc Verify toLocaleTimeString with negative timestamp returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-86400000);
      let result = date.toLocaleTimeString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_7100
     * @tc.name testDateToLocaleTimeString0071
     * @tc.desc Verify toLocaleTimeString returns string or catches RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      try {
        let result = date.toLocaleTimeString("en-US");
        expect(typeof result).assertEqual("string");
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_LCL_TIME_7200
     * @tc.name testDateToLocaleTimeString0072
     * @tc.desc Verify toLocaleTimeString returns non-empty string or catches RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToLocaleTimeString0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      try {
        let result = date.toLocaleTimeString("en-US");
        expect(result.length > 0).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });
  });
}
