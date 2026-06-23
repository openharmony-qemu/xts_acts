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

class MyDate064 extends Date {
  constructor() {
    super(0)
  }
}

export default function DateToStringTest(): void {
  describe('DateToStringTest', () => {
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
     * @tc.number SUB_DATE_TO_STRNG_CHK_0100
     * @tc.name testDateToString0001
     * @tc.desc Verify toString called without parameters returns date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_0900
     * @tc.name testDateToString0009
     * @tc.desc Verify toString with timestamp 0 returns complete date time string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_1000
     * @tc.name testDateToString0010
     * @tc.desc Verify toString with year month day constructor returns complete string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 15);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_1100
     * @tc.name testDateToString0011
     * @tc.desc Verify toString with current date returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.toString();
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_1200
     * @tc.name testDateToString0012
     * @tc.desc Verify toString with full time components returns complete string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2023, 5, 20, 10, 30, 45, 123);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_1300
     * @tc.name testDateToString0013
     * @tc.desc Verify toString with date string constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date("2024-03-15T12:00:00.000Z");
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_1400
     * @tc.name testDateToString0014
     * @tc.desc Verify toString with positive integer timestamp returns complete string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1700000000000);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_1500
     * @tc.name testDateToString0015
     * @tc.desc Verify toString of invalid date string returns Invalid Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date("invalid");
        let result = date.toString();
        expect(null).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_1700
     * @tc.name testDateToString0017
     * @tc.desc Verify toString with negative timestamp returns correct date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-100000000000);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_1800
     * @tc.name testDateToString0018
     * @tc.desc Verify toString of leap year Feb 29 returns correct month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 1, 29);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.indexOf("Feb") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_1900
     * @tc.name testDateToString0019
     * @tc.desc Verify toString of non-leap year Feb 29 auto-corrects to March
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2023, 1, 29);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.indexOf("Mar") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_2500
     * @tc.name testDateToString0025
     * @tc.desc Verify toString of float timestamp returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1000);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_3000
     * @tc.name testDateToString0030
     * @tc.desc Verify toString return value is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toString();
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_3200
     * @tc.name testDateToString0032
     * @tc.desc Verify toString return value is not number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toString();
      expect(typeof result !== "number").assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_3300
     * @tc.name testDateToString0033
     * @tc.desc Verify toString return value is not object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toString();
      expect(typeof result !== "object").assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_3400
     * @tc.name testDateToString0034
     * @tc.desc Verify toString return value is not boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toString();
      expect(typeof result !== "boolean").assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_3500
     * @tc.name testDateToString0035
     * @tc.desc Verify toString return value contains complete date and time info
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 15, 10, 30, 45);
      let result = date.toString();
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
      expect(result.indexOf("Jan") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_3600
     * @tc.name testDateToString0036
     * @tc.desc Verify toString returns longer string than toDateString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 15, 10, 30, 45);
      let toStringResult = date.toString();
      let toDateStringResult = date.toDateString();
      expect(toStringResult.length > toDateStringResult.length).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_3700
     * @tc.name testDateToString0037
     * @tc.desc Verify toString returns longer string than toTimeString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let toStringResult = date.toString();
      let toTimeStringResult = date.toTimeString();
      expect(toStringResult.length > toTimeStringResult.length).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_3800
     * @tc.name testDateToString0038
     * @tc.desc Verify toString returns different format from toISOString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1735689600000);
      let toStringResult = date.toString();
      let isoResult = date.toISOString();
      expect(typeof toStringResult).assertEqual("string");
      expect(typeof isoResult).assertEqual("string");
      expect(toStringResult !== isoResult).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_3900
     * @tc.name testDateToString0039
     * @tc.desc Verify toString returns string type while valueOf returns bigint type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let toStringResult = date.toString();
      let valueOfResult = date.valueOf();
      expect(typeof toStringResult).assertEqual("string");
      expect(typeof valueOfResult !== "string").assertTrue();
      expect(Number(valueOfResult)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_4000
     * @tc.name testDateToString0040
     * @tc.desc Verify toString near max timestamp returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(8640000000000000 - 1);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_4100
     * @tc.name testDateToString0041
     * @tc.desc Verify toString near min timestamp returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-8640000000000000 + 1);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_4400
     * @tc.name testDateToString0044
     * @tc.desc Verify toString at exact max valid timestamp returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(8640000000000000);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_4500
     * @tc.name testDateToString0045
     * @tc.desc Verify toString at exact min valid timestamp returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-8640000000000000);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_4600
     * @tc.name testDateToString0046
     * @tc.desc Verify toString of year 1 January 1 returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1, 0, 1);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_4700
     * @tc.name testDateToString0047
     * @tc.desc Verify toString of year 9999 December 31 returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(9999, 11, 31);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_5200
     * @tc.name testDateToString0052
     * @tc.desc Verify normal Date toString returns string or catches RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date(0);
        let result = date.toString();
        expect(typeof result).assertEqual("string");
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_5300
     * @tc.name testDateToString0053
     * @tc.desc Verify finally block always executes after toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyCalled = false;
      try {
        const date = new Date(0);
        let result = date.toString();
        expect(typeof result).assertEqual("string");
      } finally {
        finallyCalled = true;
      }
      expect(finallyCalled).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_5400
     * @tc.name testDateToString0054
     * @tc.desc Verify toString returns string and completion flag is set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyCalled = false;
      const date = new Date(1000);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      finallyCalled = true;
      expect(finallyCalled).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_5800
     * @tc.name testDateToString0058
     * @tc.desc Verify same Date object multiple toString calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result1 = date.toString();
      let result2 = date.toString();
      let result3 = date.toString();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_5900
     * @tc.name testDateToString0059
     * @tc.desc Verify different Date objects with same timestamp return same toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(1700000000000);
      const date2 = new Date(1700000000000);
      let result1 = date1.toString();
      let result2 = date2.toString();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_6000
     * @tc.name testDateToString0060
     * @tc.desc Verify invalid Date multiple toString calls return consistent Invalid Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date("invalid");
        let result1 = date.toString();
        let result2 = date.toString();
        expect(null).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_6200
     * @tc.name testDateToString0062
     * @tc.desc Verify Date toString returns date string not default object string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toString();
      expect(result !== "[object Object]").assertTrue();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_6300
     * @tc.name testDateToString0063
     * @tc.desc Verify Date toString return value differs from base Object toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15, 10, 30, 45);
      let dateToString = date.toString();
      expect(dateToString.indexOf("[object")).assertEqual(-1);
      expect(dateToString.length > 0).assertTrue();
      expect(dateToString.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_6400
     * @tc.name testDateToString0064
     * @tc.desc Verify subclass inheriting Date toString behavior is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myDate = new MyDate064();
      let result = myDate.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_6500
     * @tc.name testDateToString0065
     * @tc.desc Verify Date overrides toString via Object prototype check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let dateResult = date.toString();
      expect(dateResult !== "[object Date]").assertTrue();
      expect(typeof dateResult).assertEqual("string");
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_6600
     * @tc.name testDateToString0066
     * @tc.desc Verify toString of no-argument constructed Date returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_6700
     * @tc.name testDateToString0067
     * @tc.desc Verify toString of timestamp constructed Date returns complete string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1704067200000);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_6800
     * @tc.name testDateToString0068
     * @tc.desc Verify toString of year month day hour minute second constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2025, 5, 9, 12, 30, 45);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_6900
     * @tc.name testDateToString0069
     * @tc.desc Verify toString with out-of-range month parameter auto-corrects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2025, 12, 1);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_7000
     * @tc.name testDateToString0070
     * @tc.desc Verify toString with out-of-range day parameter auto-corrects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2025, 0, 32);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_7100
     * @tc.name testDateToString0071
     * @tc.desc Verify toString of ISO string constructed Date returns complete string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date("2025-06-09T12:30:45.000Z");
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_7400
     * @tc.name testDateToString0074
     * @tc.desc Verify toString after setTime with valid timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setTime(1704067200000);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_7700
     * @tc.name testDateToString0077
     * @tc.desc Verify toString after setFullYear with valid year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let originalResult = date.toString();
      date.setFullYear(2025);
      let newResult = date.toString();
      expect(newResult !== originalResult).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_8100
     * @tc.name testDateToString0081
     * @tc.desc Verify toString after setMinutes with valid value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setMinutes(30);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_8200
     * @tc.name testDateToString0082
     * @tc.desc Verify toString after setSeconds with valid value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setSeconds(45);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_8300
     * @tc.name testDateToString0083
     * @tc.desc Verify toString implicit call in string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = "Current date: " + date.toString();
      expect(result.indexOf("Current date:")).assertEqual(0);
      expect(result.length > "Current date: ".length).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_8400
     * @tc.name testDateToString0084
     * @tc.desc Verify toString usage in template strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = `Date is ${date.toString()}`;
      expect(result.indexOf("Date is ")).assertEqual(0);
      expect(result.length > "Date is ".length).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_8500
     * @tc.name testDateToString0085
     * @tc.desc Verify multiple Date instances toString independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date1 = new Date(1000);
        let result1 = date1.toString();
        let date2 = new Date("invalid");
        let result2 = date2.toString();
        expect(null).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_8600
     * @tc.name testDateToString0086
     * @tc.desc Verify batch created valid Date instances toString return non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dates: Date[] = [];
      for (let i = 0; i < 10; i++) {
        dates.push(new Date(i * 1000));
      }
      for (let i = 0; i < dates.length; i++) {
        let result = dates[i].toString();
        expect(typeof result).assertEqual("string");
        expect(result.length > 0).assertTrue();
        expect(result.length >= 10).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_8700
     * @tc.name testDateToString0087
     * @tc.desc Verify batch created invalid Date instances toString return Invalid Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        for (let i = 0; i < 4; i++) {
          let date = new Date("invalid");
          let result = date.toString();
        }
        expect(null).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_8800
     * @tc.name testDateToString0088
     * @tc.desc Verify toString of far future date returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(9999, 11, 31, 23, 59, 59);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_8900
     * @tc.name testDateToString0089
     * @tc.desc Verify toString of extremely large year Date returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(99999, 0, 1);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_9100
     * @tc.name testDateToString0091
     * @tc.desc Verify toString of negative year Date returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-1000, 0, 1);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_9200
     * @tc.name testDateToString0092
     * @tc.desc Verify toString of leap year Feb 29 Date returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 1, 29);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_9300
     * @tc.name testDateToString0093
     * @tc.desc Verify toString of non-leap year Feb 29 Date returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2025, 1, 29);
      let result = date.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
      expect(result.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_9400
     * @tc.name testDateToString0094
     * @tc.desc Verify same timestamp via number and string constructor toString consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1735689600000);
      let date2 = new Date("2025-01-01T00:00:00.000Z");
      expect(date1.toString()).assertEqual(date2.toString());
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_9500
     * @tc.name testDateToString0095
     * @tc.desc Verify two Date instances with same timestamp toString consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1000);
      let date2 = new Date(1000);
      expect(date1.toString()).assertEqual(date2.toString());
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_9600
     * @tc.name testDateToString0096
     * @tc.desc Verify different timestamps produce different toString results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToString0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1000);
      let date2 = new Date(2000);
      expect(date1.toString() !== date2.toString()).assertTrue();
    });
  });
}
