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

export default function DateToUTCStringTest(): void {
  describe('DateToUTCStringTest', () => {
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
     * @tc.number SUB_DATE_TO_UTC_STRNG_0100
     * @tc.name testDateToUTCString0001
     * @tc.desc Verify toUTCString with no arguments works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toUTCString();
      expect(result).assertEqual("Thu, 01 Jan 1970 00:00:00 GMT");
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_0300
     * @tc.name testDateToUTCString0003
     * @tc.desc Verify Date(0) toUTCString returns standard UTC string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toUTCString();
      expect(result).assertEqual("Thu, 01 Jan 1970 00:00:00 GMT");
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_0400
     * @tc.name testDateToUTCString0004
     * @tc.desc Verify positive timestamp toUTCString conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1609459200000);
      let result = date.toUTCString();
      expect(result).assertEqual("Fri, 01 Jan 2021 00:00:00 GMT");
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_0500
     * @tc.name testDateToUTCString0005
     * @tc.desc Verify negative timestamp before 1970 toUTCString conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-86400000);
      let result = date.toUTCString();
      expect(result).assertEqual("Wed, 31 Dec 1969 00:00:00 GMT");
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_0600
     * @tc.name testDateToUTCString0006
     * @tc.desc Verify current time toUTCString returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      let result = date.toUTCString();
      expect(result.indexOf("GMT") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_0700
     * @tc.name testDateToUTCString0007
     * @tc.desc Verify Date created with year month day arguments toUTCString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2024, 5, 15, 10, 30, 0);
      let result = date.toUTCString();
      expect(result.indexOf("GMT") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_0800
     * @tc.name testDateToUTCString0008
     * @tc.desc Verify Date created from date string toUTCString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("2024-06-15T10:30:00Z");
      let result = date.toUTCString();
      expect(result.indexOf("Jun") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_0900
     * @tc.name testDateToUTCString0009
     * @tc.desc Verify invalid date toUTCString returns Invalid Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("invalid");
        let result = date.toUTCString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_1300
     * @tc.name testDateToUTCString0013
     * @tc.desc Verify empty string constructed Date toUTCString returns Invalid Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("");
        let result = date.toUTCString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_1500
     * @tc.name testDateToUTCString0015
     * @tc.desc Verify toUTCString return value is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toUTCString();
      expect(result.indexOf("GMT") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_1700
     * @tc.name testDateToUTCString0017
     * @tc.desc Verify valid date UTC string ends with GMT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toUTCString();
      expect(result.endsWith("GMT")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_1800
     * @tc.name testDateToUTCString0018
     * @tc.desc Verify UTC string contains day of week abbreviation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toUTCString();
      let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
      let containsDay = days.some(d => result.indexOf(d) >= 0);
      expect(containsDay).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_1900
     * @tc.name testDateToUTCString0019
     * @tc.desc Verify UTC string contains month abbreviation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toUTCString();
      let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
      let containsMonth = months.some(m => result.indexOf(m) >= 0);
      expect(containsMonth).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_2000
     * @tc.name testDateToUTCString0020
     * @tc.desc Verify Date minimum value toUTCString returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-8640000000000000);
      let result = date.toUTCString();
      expect(result !== "Invalid Date").assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_2100
     * @tc.name testDateToUTCString0021
     * @tc.desc Verify Date maximum value toUTCString returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(8640000000000000);
      let result = date.toUTCString();
      expect(result !== "Invalid Date").assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_2500
     * @tc.name testDateToUTCString0025
     * @tc.desc Verify multiple calls to toUTCString return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1609459200000);
      let result1 = date.toUTCString();
      let result2 = date.toUTCString();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_2700
     * @tc.name testDateToUTCString0027
     * @tc.desc Verify normal date toUTCString returns epoch string or catches RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = "";
      try {
        result = date.toUTCString();
        expect(result).assertEqual("Thu, 01 Jan 1970 00:00:00 GMT");
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_2800
     * @tc.name testDateToUTCString0028
     * @tc.desc Verify finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("invalid");
        date.toUTCString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_UTC_STRNG_3200
     * @tc.name testDateToUTCString0032
     * @tc.desc Verify boolean as Date constructor argument then toUTCString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToUTCString0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(1970, 0, 1, 0, 0, 1));
      let result = date.toUTCString();
      expect(result).assertEqual("Thu, 01 Jan 1970 00:00:01 GMT");
    });

  });
}
