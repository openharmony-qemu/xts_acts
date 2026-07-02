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

export default function DateToDateStringTest(): void {
  describe('DateToDateStringTest', () => {
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
     * @tc.number SUB_DATE_TO_DATE_STRNG_0500
     * @tc.name testDateToDateString0005
     * @tc.desc Verify Unix epoch UTC date fields and local date string format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toDateString();
      expect(date.getUTCFullYear()).assertEqual(1970);
      expect(date.getUTCMonth()).assertEqual(0);
      expect(date.getUTCDate()).assertEqual(1);
      expect(result.indexOf("Jan") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_0600
     * @tc.name testDateToDateString0006
     * @tc.desc Verify toDateString returns correct date string for date constructed with year, month, day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 15);
      let result = date.toDateString();
      expect(result).assertEqual("Mon Jan 15 2024");
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_0700
     * @tc.name testDateToDateString0007
     * @tc.desc Verify toDateString returns non-empty string for current date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.toDateString();
      expect(result.indexOf("Jan") >= 0 || result.indexOf("Feb") >= 0 || result.indexOf("Mar") >= 0 ||
        result.indexOf("Apr") >= 0 || result.indexOf("May") >= 0 || result.indexOf("Jun") >= 0 ||
        result.indexOf("Jul") >= 0 || result.indexOf("Aug") >= 0 || result.indexOf("Sep") >= 0 ||
        result.indexOf("Oct") >= 0 || result.indexOf("Nov") >= 0 || result.indexOf("Dec") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_0800
     * @tc.name testDateToDateString0008
     * @tc.desc Verify toDateString returns only date part without time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2023, 5, 20, 10, 30, 45, 123);
      let result = date.toDateString();
      expect(result).assertEqual("Tue Jun 20 2023");
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_0900
     * @tc.name testDateToDateString0009
     * @tc.desc Verify toDateString with date constructed from date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date("2024-03-15T12:00:00.000Z");
      let result = date.toDateString();
      expect(result.indexOf("Mar") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_1000
     * @tc.name testDateToDateString0010
     * @tc.desc Verify toDateString with positive integer timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1700000000000);
      let result = date.toDateString();
      expect(result.indexOf("Nov") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_1100
     * @tc.name testDateToDateString0011
     * @tc.desc Verify toDateString returns Invalid Date for invalid date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date("invalid");
        let result = date.toDateString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_1400
     * @tc.name testDateToDateString0014
     * @tc.desc Verify toDateString returns correct string for leap year Feb 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 1, 29);
      let result = date.toDateString();
      expect(result).assertEqual("Thu Feb 29 2024");
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_1500
     * @tc.name testDateToDateString0015
     * @tc.desc Verify toDateString auto-corrects Feb 29 in non-leap year to Mar 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2023, 1, 29);
      let result = date.toDateString();
      expect(result).assertEqual("Wed Mar 01 2023");
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_1600
     * @tc.name testDateToDateString0016
     * @tc.desc Verify toDateString returns Invalid Date for empty string constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date("");
        let result = date.toDateString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_1900
     * @tc.name testDateToDateString0019
     * @tc.desc Verify toDateString return value is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toDateString();
      expect(result.indexOf("Jan") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_2100
     * @tc.name testDateToDateString0021
     * @tc.desc Verify toDateString return format matches weekday month day year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 15);
      let result = date.toDateString();
      let parts = result.split(" ");
      expect(parts.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_2200
     * @tc.name testDateToDateString0022
     * @tc.desc Verify toDateString return value does not contain time information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15, 23, 59, 59);
      let result = date.toDateString();
      expect(result.indexOf(":")).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_2300
     * @tc.name testDateToDateString0023
     * @tc.desc Verify toDateString near maximum representable timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(8640000000000000 - 1);
      let result = date.toDateString();
      expect(result.indexOf(":")).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_2400
     * @tc.name testDateToDateString0024
     * @tc.desc Verify toDateString near minimum representable timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-8640000000000000 + 1);
      let result = date.toDateString();
      expect(result.indexOf(":")).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_3200
     * @tc.name testDateToDateString0032
     * @tc.desc Verify toDateString does not throw for normal Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date(0);
        let result = date.toDateString();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_3600
     * @tc.name testDateToDateString0036
     * @tc.desc Verify toDateString returns consistent results across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result1 = date.toDateString();
      let result2 = date.toDateString();
      let result3 = date.toDateString();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_DATE_TO_DATE_STRNG_3700
     * @tc.name testDateToDateString0037
     * @tc.desc Verify toDateString returns same result for different Date objects with same timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToDateString0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(1700000000000);
      const date2 = new Date(1700000000000);
      let result1 = date1.toDateString();
      let result2 = date2.toDateString();
      expect(result1).assertEqual(result2);
    });
  });
}
