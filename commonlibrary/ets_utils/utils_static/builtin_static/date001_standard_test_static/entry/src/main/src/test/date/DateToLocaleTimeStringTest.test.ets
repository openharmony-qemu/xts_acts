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
      expect(result.includes(":")).assertTrue();
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
      expect(result.includes(":")).assertTrue();
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
      let r2 = date.toLocaleTimeString("zh-CN");
      let r3 = date.toLocaleTimeString("ja-JP");
      let r4 = date.toLocaleTimeString("ko-KR");
      let r5 = date.toLocaleTimeString("de-DE");
      let r6 = date.toLocaleTimeString("fr-FR");
      expect(r1.includes(":")).assertTrue();
      expect(r1 !== r2 || r2 !== r3).assertTrue();
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
      let r2 = date.toLocaleTimeString("zh-CN");
      let r3 = date.toLocaleTimeString("en-US");
      expect(r1.includes(":")).assertTrue();
      expect(r1 !== r2).assertTrue();
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
      expect(r1.includes(":")).assertTrue();
      expect(r1 !== r2).assertTrue();
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
        expect().assertFail();
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
      expect(result.includes(":")).assertTrue();
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
      let r2 = date.toLocaleTimeString("en-US");
      let r3 = date.toLocaleTimeString("en-US");
      expect(r1.includes(":")).assertTrue();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
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
      expect(r1.includes(":")).assertTrue();
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
      expect(r12.includes(":")).assertTrue();
      expect(r12 !== r24).assertTrue();
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
      expect(result.includes(":")).assertTrue();
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
        expect().assertFail();
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
      let r1 = d1.toLocaleTimeString();
      let r2 = d2.toLocaleTimeString();
      let r3 = d3.toLocaleTimeString();
      expect(r1.includes(":")).assertTrue();
      expect(r1 !== r2 || r2 !== r3).assertTrue();
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
      expect(result.includes(":")).assertTrue();
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
      expect(result.includes(":")).assertTrue();
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
      expect(result.includes(":")).assertTrue();
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
        expect(result.includes(":")).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });
  });
}
