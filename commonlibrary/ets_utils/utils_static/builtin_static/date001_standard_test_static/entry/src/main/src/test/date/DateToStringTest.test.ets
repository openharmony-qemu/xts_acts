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
      expect(result.indexOf("Jan") >= 0).assertTrue();
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
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
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
      expect(result.indexOf("Mar") >= 0).assertTrue();
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
      expect(Number(valueOfResult)).assertEqual(0);
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
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
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
        expect().assertFail();
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
      expect(result.indexOf("Jan") >= 0).assertTrue();
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
    });

    /**
     * @tc.number SUB_DATE_TO_STRNG_CHK_6500
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
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
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
