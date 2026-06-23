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

export default function DateValueOfTest(): void {
  describe('DateValueOfTest', () => {
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
     * @tc.number SUB_DATE_VALUE_OF_CHK_0100
     * @tc.name testDateValueOf0001
     * @tc.desc Verify valueOf without parameters returns long timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = Number(date.valueOf());
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_1000
     * @tc.name testDateValueOf0010
     * @tc.desc Verify valueOf returns corresponding long for positive timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1704067200000);
      expect(Number(date.valueOf())).assertEqual(1704067200000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_1100
     * @tc.name testDateValueOf0011
     * @tc.desc Verify valueOf returns negative long for pre-1970 timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-1000000000000);
      expect(Number(date.valueOf())).assertEqual(-1000000000000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_1200
     * @tc.name testDateValueOf0012
     * @tc.desc Verify valueOf returns positive long for current Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      let result: long = date.valueOf();
      expect(result).assertEqual(date.getTime());
      let lowerBound: long = 1000000000;
      expect(result > lowerBound).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_1300
     * @tc.name testDateValueOf0013
     * @tc.desc Verify valueOf returns timestamp for Date created with year/month/day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2025, 0, 1);
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_1400
     * @tc.name testDateValueOf0014
     * @tc.desc Verify valueOf returns timestamp for Date created from date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("2025-01-01T00:00:00.000Z");
      expect(Number(date.valueOf())).assertEqual(1735689600000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_1900
     * @tc.name testDateValueOf0019
     * @tc.desc Verify valueOf returns -1 for timestamp -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-1);
      expect(Number(date.valueOf())).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_2000
     * @tc.name testDateValueOf0020
     * @tc.desc Verify valueOf returns -86400000 for timestamp -86400000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-86400000);
      expect(Number(date.valueOf())).assertEqual(-86400000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_4000
     * @tc.name testDateValueOf0040
     * @tc.desc Verify valueOf result can participate in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let result = Number(date.valueOf());
      let computed = result + 1000;
      expect(computed).assertEqual(2000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_4100
     * @tc.name testDateValueOf0041
     * @tc.desc Verify valueOf result supports comparison operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let result = Number(date.valueOf());
      expect(result > 0).assertTrue();
      expect(result < 10000).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_4200
     * @tc.name testDateValueOf0042
     * @tc.desc Verify valueOf result can be converted via toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.valueOf();
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_4300
     * @tc.name testDateValueOf0043
     * @tc.desc Verify valueOf result can be converted via Number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let result = Number(date.valueOf());
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_4800
     * @tc.name testDateValueOf0048
     * @tc.desc Verify valueOf returns 1 for timestamp 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1);
      expect(Number(date.valueOf())).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_5000
     * @tc.name testDateValueOf0050
     * @tc.desc Verify valueOf returns millisecond precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(123456789);
      let result = Number(date.valueOf());
      expect(result % 1 === 0).assertTrue();
      expect(result).assertEqual(123456789);
      expect(result).assertEqual(date.getTime());
    });
    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_5100
     * @tc.name testDateValueOf0051
     * @tc.desc Verify valueOf returns number for valid Date or catches RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      try {
        let result = Number(date.valueOf());
        expect(result).assertEqual(0);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_5600
     * @tc.name testDateValueOf0056
     * @tc.desc Verify finally block executes after valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = Number(date.valueOf());
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_5800
     * @tc.name testDateValueOf0058
     * @tc.desc Verify multiple valueOf calls on same Date are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let result1 = Number(date.valueOf());
      let result2 = Number(date.valueOf());
      let result3 = Number(date.valueOf());
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_5900
     * @tc.name testDateValueOf0059
     * @tc.desc Verify multiple valueOf calls on invalid Date are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("invalid");
        let result1 = Number(date.valueOf());
        let result2 = Number(date.valueOf());
        let result3 = Number(date.valueOf());
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_6000
     * @tc.name testDateValueOf0060
     * @tc.desc Verify multiple valueOf calls on boundary Date are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(8640000000000000);
      let result1 = Number(date.valueOf());
      let result2 = Number(date.valueOf());
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual(8640000000000000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_6100
     * @tc.name testDateValueOf0061
     * @tc.desc Verify valueOf and getTime return same numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1704067200000);
      let valueOfResult = Number(date.valueOf());
      let getTimeResult = date.getTime();
      expect(valueOfResult).assertEqual(getTimeResult);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_6200
     * @tc.name testDateValueOf0062
     * @tc.desc Verify valueOf and getTime are consistent for timestamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0)
      let valueOfResult = Number(date.valueOf());
      let getTimeResult = date.getTime();
      expect(valueOfResult).assertEqual(getTimeResult);
      expect(valueOfResult).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_6300
     * @tc.name testDateValueOf0063
     * @tc.desc Verify valueOf and getTime are consistent for negative timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-1000000000000);
      let valueOfResult = Number(date.valueOf());
      let getTimeResult = date.getTime();
      expect(valueOfResult).assertEqual(getTimeResult);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_6400
     * @tc.name testDateValueOf0064
     * @tc.desc Verify both valueOf and getTime return NaN for invalid Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("invalid");
        let valueOfResult = Number(date.valueOf());
        let getTimeResult = date.getTime();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_6500
     * @tc.name testDateValueOf0065
     * @tc.desc Verify valueOf and getTime are consistent for boundary timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(8640000000000000);
      let valueOfResult = Number(date.valueOf());
      let getTimeResult = date.getTime();
      expect(valueOfResult).assertEqual(getTimeResult);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_6600
     * @tc.name testDateValueOf0066
     * @tc.desc Verify valueOf returns bigint while getTime returns number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let valueOfResult = date.valueOf();
      let getTimeResult = date.getTime();
      expect(Number(valueOfResult)).assertEqual(1000);
      expect(Number(getTimeResult)).assertEqual(1000);
      expect(Number(valueOfResult)).assertEqual(Number(getTimeResult));
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_6700
     * @tc.name testDateValueOf0067
     * @tc.desc Verify valueOf for Date created with fixed timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let result: long = date.valueOf();
      expect(result).assertEqual(date.getTime());
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_6900
     * @tc.name testDateValueOf0069
     * @tc.desc Verify valueOf for Date created with year/month/day/hour/minute/second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2025, 5, 9, 12, 30, 45);
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(5);
      expect(date.getDate()).assertEqual(9);
      expect(date.getHours()).assertEqual(12);
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getSeconds()).assertEqual(45);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_7000
     * @tc.name testDateValueOf0070
     * @tc.desc Verify valueOf for Date created with minimum year/month/day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0, 0, 1);
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_7100
     * @tc.name testDateValueOf0071
     * @tc.desc Verify valueOf for Date with overflowed month parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2025, 12, 1);
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
      expect(date.getFullYear()).assertEqual(2026);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_7200
     * @tc.name testDateValueOf0072
     * @tc.desc Verify valueOf for Date with overflowed day parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2025, 0, 32);
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_7300
     * @tc.name testDateValueOf0073
     * @tc.desc Verify valueOf for Date created from ISO format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("2025-06-09T12:30:45.000Z");
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_7400
     * @tc.name testDateValueOf0074
     * @tc.desc Verify valueOf for Date created from simple date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("2025/06/09");
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(5);
      expect(date.getDate()).assertEqual(9);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_7500
     * @tc.name testDateValueOf0075
     * @tc.desc Verify valueOf returns NaN for Date created from empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("")
        let result = Number(date.valueOf());
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_7600
     * @tc.name testDateValueOf0076
     * @tc.desc Verify valueOf returns NaN for Date created from whitespace string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("   ");
        let result = Number(date.valueOf());
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_7700
     * @tc.name testDateValueOf0077
     * @tc.desc Verify valueOf returns NaN for Date created from invalid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("hello world");
        let result = Number(date.valueOf());
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_8000
     * @tc.name testDateValueOf0080
     * @tc.desc Verify valueOf consistency between number and string construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1735689600000);
      let date2 = new Date("2025-01-01T00:00:00.000Z");
      expect(Number(date1.valueOf())).assertEqual(Number(date2.valueOf()));
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_8100
     * @tc.name testDateValueOf0081
     * @tc.desc Verify valueOf returns same value for two Date instances with same timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1000);
      let date2 = new Date(1000);
      expect(Number(date1.valueOf())).assertEqual(Number(date2.valueOf()));
      expect(Number(date1.valueOf())).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_8200
     * @tc.name testDateValueOf0082
     * @tc.desc Verify valueOf returns different values for different timestamps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1000);
      let date2 = new Date(2000);
      expect(Number(date1.valueOf()) !== Number(date2.valueOf())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_8300
     * @tc.name testDateValueOf0083
     * @tc.desc Verify valueOf after setTime with valid timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      date.setTime(1000000000000);
      expect(Number(date.valueOf())).assertEqual(1000000000000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_8700
     * @tc.name testDateValueOf0087
     * @tc.desc Verify valueOf after setTime with maximum valid timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      date.setTime(8640000000000000);
      expect(Number(date.valueOf())).assertEqual(8640000000000000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_8800
     * @tc.name testDateValueOf0088
     * @tc.desc Verify valueOf after setTime with negative timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      date.setTime(-1000000000000);
      expect(Number(date.valueOf())).assertEqual(-1000000000000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_8900
     * @tc.name testDateValueOf0089
     * @tc.desc Verify valueOf after setFullYear with valid year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let originalValue = Number(date.valueOf());
      date.setFullYear(2025);
      let newValue = Number(date.valueOf());
      expect(newValue !== originalValue).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_9300
     * @tc.name testDateValueOf0093
     * @tc.desc Verify valueOf after setMinutes with valid value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      date.setMinutes(30);
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
      expect(date.getMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_9400
     * @tc.name testDateValueOf0094
     * @tc.desc Verify valueOf after setSeconds with valid value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      date.setSeconds(45);
      let result = Number(date.valueOf());
      expect(result).assertEqual(45000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_9500
     * @tc.name testDateValueOf0095
     * @tc.desc Verify valueOf after adding valid timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let newTimestamp = date.getTime() + 86400000;
      let newDate = new Date(newTimestamp);
      expect(Number(newDate.valueOf())).assertEqual(86401000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_9800
     * @tc.name testDateValueOf0098
     * @tc.desc Verify valueOf after subtracting valid timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(86401000);
      let newTimestamp = date.getTime() - 86400000;
      let newDate = new Date(newTimestamp);
      expect(Number(newDate.valueOf())).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_0200
     * @tc.name testDateValueOf101
     * @tc.desc Verify valueOf for Date created with true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1);
      let result = Number(date.valueOf());
      expect(result).assertEqual(1);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_0300
     * @tc.name testDateValueOf0103
     * @tc.desc Verify valueOf in addition arithmetic operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let result = Number(date.valueOf()) + 500;
      expect(result).assertEqual(1500);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_0400
     * @tc.name testDateValueOf0104
     * @tc.desc Verify valueOf in comparison operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1000);
      let date2 = new Date(2000);
      expect(Number(date1.valueOf()) < Number(date2.valueOf())).assertTrue();
      expect(Number(date2.valueOf()) > Number(date1.valueOf())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_0500
     * @tc.name testDateValueOf0105
     * @tc.desc Verify valueOf for Date sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Date(1000);
      let d2 = new Date(2000);
      let d3 = new Date(3000);
      expect(Number(d1.valueOf())).assertEqual(1000);
      expect(Number(d2.valueOf())).assertEqual(2000);
      expect(Number(d3.valueOf())).assertEqual(3000);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_0600
     * @tc.name testDateValueOf0106
     * @tc.desc Verify constructing Date with invalid string returns expected result during multiple instance creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date1 = new Date(1000);
        let date2 = new Date("invalid");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_0700
     * @tc.name testDateValueOf107
     * @tc.desc Verify valueOf for batch-created valid Date instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dates: Date[] = [];
      for (let i = 0; i < 10; i++) {
        dates.push(new Date(i * 1000));
      }
      for (let i = 0; i < dates.length; i++) {
        expect(Number(dates[i].valueOf())).assertEqual(i * 1000);
      }
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_0800
     * @tc.name testDateValueOf108
     * @tc.desc Verify valueOf for batch-created invalid Date instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        for (let i = 0; i < 4; i++) {
          let date = new Date("invalid");
          let result = Number(date.valueOf());
        }
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_1700
     * @tc.name testDateValueOf109
     * @tc.desc Verify valueOf returns long while toString returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let valueOfResult = date.valueOf();
      let toStringResult = date.toString();
      expect(Number(valueOfResult)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_1800
     * @tc.name testDateValueOf0110
     * @tc.desc Verify valueOf and toISOString return different representations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1735689600000);
      let valueOfResult = Number(date.valueOf());
      let isoResult = date.toISOString();
      expect(valueOfResult).assertEqual(1735689600000);
      expect(isoResult).assertEqual("2025-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_2400
     * @tc.name testDateValueOf0111
     * @tc.desc Verify valueOf for Date with year 9999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(9999, 11, 31, 23, 59, 59);
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
      expect(date.getFullYear()).assertEqual(9999);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_2700
     * @tc.name testDateValueOf0112
     * @tc.desc Verify valueOf for Date with year 99999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(99999, 0, 1);
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
      expect(date.getFullYear()).assertEqual(99999);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_2900
     * @tc.name testDateValueOf0113
     * @tc.desc Verify valueOf for Date with year 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1, 0, 1);
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
      expect(result < 0).assertTrue();
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_3000
     * @tc.name testDateValueOf0114
     * @tc.desc Verify valueOf for Date with negative year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-1000, 0, 1);
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
      expect(result < 0).assertTrue();
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_3100
     * @tc.name testDateValueOf0115
     * @tc.desc Verify valueOf for leap year February 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2024, 1, 29);
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_VALUE_OF_CHK_1600
     * @tc.name testDateValueOf0116
     * @tc.desc Verify valueOf for non-leap year February 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateValueOf0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2025, 1, 29);
      let result = Number(date.valueOf());
      expect(result).assertEqual(date.getTime());
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    });
  });
}
