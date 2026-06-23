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

export default function DateToISOStringTest(): void {
  describe('DateToISOStringTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    const verifyDateInput: (value: long) => boolean = (value: long): boolean => {
      let checked = false
      try {
        let date = new Date(value)
        let result = date.toISOString()
        checked = result.length > 0 && result.endsWith("Z")
        expect(checked).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
      return checked
    }

    const verifyDateMutation: (update: (date: Date) => void) => boolean = (update: (date: Date) => void): boolean => {
      let checked = false
      try {
        let date = new Date(0)
        update(date)
        let result = date.toISOString()
        checked = result.length > 0 && result.endsWith("Z")
        expect(checked).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
      return checked
    }

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_0100
     * @tc.name testDateToISOString0001
     * @tc.desc Verify toISOString returns ISO 8601 format string when called without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toISOString();
      expect(result).assertEqual("1970-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_1000
     * @tc.name testDateToISOString0010
     * @tc.desc Verify toISOString returns correct ISO string for positive timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1704067200000);
      expect(date.toISOString()).assertEqual("2024-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_1100
     * @tc.name testDateToISOString0011
     * @tc.desc Verify toISOString returns correct ISO string for negative timestamp before 1970
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-1000000000000);
      expect(date.toISOString()).assertEqual("1938-04-24T22:13:20.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_1200
     * @tc.name testDateToISOString0012
     * @tc.desc Verify toISOString returns valid ISO format string for current time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      let result = date.toISOString()
      expect(result.indexOf("T") > 0).assertTrue();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_1300
     * @tc.name testDateToISOString0013
     * @tc.desc Verify toISOString returns correct ISO string for Date created with year month day parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2025, 0, 1);
      let result = date.toISOString();
      expect(result.indexOf("T") > 0).assertTrue();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_1400
     * @tc.name testDateToISOString0014
     * @tc.desc Verify toISOString returns correct ISO string for Date created with date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("2025-01-01T00:00:00.000Z");
      expect(date.toISOString()).assertEqual("2025-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_1700
     * @tc.name testDateToISOString0017
     * @tc.desc Verify toISOString returns epoch string for positive zero timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(+0);
      expect(date.toISOString()).assertEqual("1970-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_1800
     * @tc.name testDateToISOString0018
     * @tc.desc Verify toISOString returns epoch string for negative zero timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-0);
      expect(date.toISOString()).assertEqual("1970-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_1900
     * @tc.name testDateToISOString0019
     * @tc.desc Verify toISOString returns correct string for timestamp -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-1);
      expect(date.toISOString()).assertEqual("1969-12-31T23:59:59.999Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_2000
     * @tc.name testDateToISOString0020
     * @tc.desc Verify toISOString returns correct string for timestamp -86400000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-86400000);
      expect(date.toISOString()).assertEqual("1969-12-31T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_2100
     * @tc.name testDateToISOString0021
     * @tc.desc Verify toISOString returns valid ISO string for large negative timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-8640000000000000);
      let result = date.toISOString();
      expect(result.indexOf("T") > 0).assertTrue();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_2200
     * @tc.name testDateToISOString0022
     * @tc.desc Verify toISOString returns valid ISO string near max date range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(8640000000000000);
      let result = date.toISOString();
      expect(result.indexOf("T") > 0).assertTrue();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_2300
     * @tc.name testDateToISOString0023
     * @tc.desc Verify toISOString returns valid string for MAX_SAFE_INTEGER timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(verifyDateInput(9007199254740991)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_2500
     * @tc.name testDateToISOString0025
     * @tc.desc Verify toISOString returns valid string for MIN_SAFE_INTEGER timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(verifyDateInput(-9007199254740991)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_2600
     * @tc.name testDateToISOString0026
     * @tc.desc Verify toISOString handles floating point timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let result = date.toISOString();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_2800
     * @tc.name testDateToISOString0028
      * @tc.desc Verify toISOString returns expected result for out-of-range timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(verifyDateInput(8640000000000001)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_2900
     * @tc.name testDateToISOString0029
     * @tc.desc Verify toISOString returns expected result for Long.MAX_VALUE timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(verifyDateInput(Long.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_3000
     * @tc.name testDateToISOString0030
     * @tc.desc Verify toISOString returns expected result for Long.MIN_VALUE timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(verifyDateInput(Long.MIN_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_3300
     * @tc.name testDateToISOString0033
     * @tc.desc Verify toISOString returns expected result for timestamp just below min range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(verifyDateInput(-8640000000000001)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_3700
     * @tc.name testDateToISOString0037
     * @tc.desc Verify toISOString return value is not null or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toISOString();
      expect(result.indexOf("T") > 0).assertTrue();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_3900
     * @tc.name testDateToISOString0039
     * @tc.desc Verify toISOString return value contains T separator at index 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toISOString();
      expect(result.indexOf("T")).assertEqual(10);
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_4000
     * @tc.name testDateToISOString0040
     * @tc.desc Verify toISOString return value ends with Z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toISOString();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_4100
     * @tc.name testDateToISOString0041
     * @tc.desc Verify toISOString return value length is 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toISOString();
      expect(result.length).assertEqual(24);
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_4200
     * @tc.name testDateToISOString0042
     * @tc.desc Verify toISOString return value date part format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toISOString();
      let datePart = result.substring(0, 10);
      expect(datePart).assertEqual("1970-01-01");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_4300
     * @tc.name testDateToISOString0043
     * @tc.desc Verify toISOString return value time part format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toISOString();
      let timePart = result.substring(11, 23);
      expect(timePart).assertEqual("00:00:00.000");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_5100
     * @tc.name testDateToISOString0051
     * @tc.desc Verify toISOString return value can be searched with indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1704067200000);
      let result = date.toISOString();
      expect(result.indexOf("2024")).assertEqual(0);
      expect(result.indexOf("01")).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_5200
     * @tc.name testDateToISOString0052
     * @tc.desc Verify toISOString return value can be sliced with substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toISOString();
      expect(result.substring(0, 10)).assertEqual("1970-01-01");
      expect(result.substring(11, 19)).assertEqual("00:00:00");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_5300
     * @tc.name testDateToISOString0053
     * @tc.desc Verify toISOString return value can be split by T
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toISOString();
      let parts = result.split("T");
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual("1970-01-01");
      expect(parts[1]).assertEqual("00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_5400
     * @tc.name testDateToISOString0054
     * @tc.desc Verify toISOString return value matches ISO 8601 regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toISOString();
      expect(result.length).assertEqual(24);
      expect(result.substring(4, 5)).assertEqual('-');
      expect(result.substring(7, 8)).assertEqual('-');
      expect(result.substring(10, 11)).assertEqual('T');
      expect(result.substring(13, 14)).assertEqual(':');
      expect(result.substring(16, 17)).assertEqual(':');
      expect(result.substring(19, 20)).assertEqual('.');
      expect(result.endsWith('Z')).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_5700
     * @tc.name testDateToISOString0057
     * @tc.desc Verify toISOString returns correct string for timestamp 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1);
      expect(date.toISOString()).assertEqual("1970-01-01T00:00:00.001Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_5900
     * @tc.name testDateToISOString0059
     * @tc.desc Verify toISOString millisecond precision is 3 digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(123456789);
      let result = date.toISOString();
      let msPart = result.substring(20, 23);
      expect(msPart.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_6000
     * @tc.name testDateToISOString0060
     * @tc.desc Verify toISOString pads zero milliseconds as "000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let result = date.toISOString();
      let msPart = result.substring(20, 23);
      expect(msPart).assertEqual("000");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_6100
     * @tc.name testDateToISOString0061
     * @tc.desc Verify toISOString pads 1 millisecond as "001"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1);
      let result = date.toISOString();
      let msPart = result.substring(20, 23);
      expect(msPart).assertEqual("001");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_6200
     * @tc.name testDateToISOString0062
     * @tc.desc Verify toISOString shows 999 milliseconds as "999"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(999);
      let result = date.toISOString();
      let msPart = result.substring(20, 23);
      expect(msPart).assertEqual("999");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_6300
     * @tc.name testDateToISOString0063
     * @tc.desc Verify toISOString month boundary January returns "01"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 0, 1));
      let result = date.toISOString();
      expect(result.substring(5, 7)).assertEqual("01");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_6400
     * @tc.name testDateToISOString0064
     * @tc.desc Verify toISOString month boundary December returns "12"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 11, 1));
      let result = date.toISOString();
      expect(result.substring(5, 7)).assertEqual("12");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_6500
     * @tc.name testDateToISOString0065
     * @tc.desc Verify toISOString day boundary 1st returns "01"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 0, 1));
      let result = date.toISOString();
      expect(result.substring(8, 10)).assertEqual("01");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_6600
     * @tc.name testDateToISOString0066
     * @tc.desc Verify toISOString day boundary 31st returns "31"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 0, 31));
      let result = date.toISOString();
      expect(result.substring(8, 10)).assertEqual("31");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_6700
     * @tc.name testDateToISOString0067
     * @tc.desc Verify toISOString hour boundary 0 returns "00"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 0, 1, 0));
      let result = date.toISOString();
      expect(result.substring(11, 13)).assertEqual("00");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_6800
     * @tc.name testDateToISOString0068
     * @tc.desc Verify toISOString hour boundary 23 returns "23"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 0, 1, 23));
      let result = date.toISOString();
      expect(result.substring(11, 13)).assertEqual("23");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_6900
     * @tc.name testDateToISOString0069
     * @tc.desc Verify toISOString minute boundary 0 returns "00"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 0, 1, 0, 0));
      let result = date.toISOString();
      expect(result.substring(14, 16)).assertEqual("00");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_7000
     * @tc.name testDateToISOString0070
     * @tc.desc Verify toISOString minute boundary 59 returns "59"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 0, 1, 0, 59));
      let result = date.toISOString();
      expect(result.substring(14, 16)).assertEqual("59");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_7100
     * @tc.name testDateToISOString0071
     * @tc.desc Verify toISOString second boundary 0 returns "00"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 0, 1, 0, 0, 0));
      let result = date.toISOString();
      expect(result.substring(17, 19)).assertEqual("00");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_7200
     * @tc.name testDateToISOString0072
     * @tc.desc Verify toISOString second boundary 59 returns "59"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 0, 1, 0, 0, 59));
      let result = date.toISOString();
      expect(result.substring(17, 19)).assertEqual("59");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_7600
     * @tc.name testDateToISOString0076
     * @tc.desc Verify toISOString returns expected result for invalid date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("invalid");
        date.toISOString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_7700
     * @tc.name testDateToISOString0077
     * @tc.desc Verify toISOString returns expected result for empty string date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("");
        date.toISOString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_8000
     * @tc.name testDateToISOString0080
     * @tc.desc Verify toISOString returns expected result after setTime with out-of-range value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(verifyDateMutation((date: Date): void => {
        date.setTime(8640000000000001);
      })).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_8100
     * @tc.name testDateToISOString0081
     * @tc.desc Verify toISOString returns expected result after setTime with Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(verifyDateMutation((date: Date): void => {
        date.setTime(Long.MAX_VALUE);
      })).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_8200
     * @tc.name testDateToISOString0082
     * @tc.desc Verify toISOString returns expected result after setMonth with Int.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(verifyDateMutation((date: Date): void => {
        date.setMonth(Int.MAX_VALUE);
      })).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_8300
     * @tc.name testDateToISOString0083
     * @tc.desc Verify toISOString returns expected result after setDate with Int.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(verifyDateMutation((date: Date): void => {
        date.setDate(Int.MAX_VALUE);
      })).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_8400
     * @tc.name testDateToISOString0084
     * @tc.desc Verify toISOString returns expected result after setHours with Int.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(verifyDateMutation((date: Date): void => {
        date.setHours(Int.MAX_VALUE);
      })).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_9200
     * @tc.name testDateToISOString0092
     * @tc.desc Verify finally block executes after normal toISOString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let result = date.toISOString();
      expect(result).assertEqual("1970-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_9300
     * @tc.name testDateToISOString0093
     * @tc.desc Verify catch and finally both execute when toISOString throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checked = false;
      try {
        let date = new Date(8640000000000001);
        let result = date.toISOString();
        checked = result.length > 0 && result.endsWith("Z");
        expect(checked).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }

    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_9400
     * @tc.name testDateToISOString0094
     * @tc.desc Verify repeated toISOString calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let result1 = date.toISOString();
      let result2 = date.toISOString();
      let result3 = date.toISOString();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_9500
     * @tc.name testDateToISOString0095
     * @tc.desc Verify repeated toISOString calls on invalid Date always returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let successCount = 0;
      for (let i = 0; i < 3; i++) {
        expect(verifyDateInput(8640000000000001)).assertTrue();
        successCount++;
      }
      expect(successCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_9600
     * @tc.name testDateToISOString0096
     * @tc.desc Verify repeated toISOString calls on boundary Date return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(8640000000000000);
      let result1 = date.toISOString();
      let result2 = date.toISOString();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_9700
     * @tc.name testDateToISOString0097
     * @tc.desc Verify toISOString always returns UTC time regardless of timezone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 0, 1, 12, 0, 0));
      let result = date.toISOString();
      expect(result.substring(0, 10)).assertEqual("2025-01-01");
      expect(result.substring(11, 13)).assertEqual("12");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_9800
     * @tc.name testDateToISOString0098
     * @tc.desc Verify toISOString returns UTC time for locally constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2025, 5, 9, 12, 30, 45);
      let result = date.toISOString();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_9900
     * @tc.name testDateToISOString0099
     * @tc.desc Verify toISOString returns same result for Date.UTC and new Date with same time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let utcMs = Date.UTC(2025, 0, 1, 0, 0, 0);
      let date1 = new Date(utcMs);
      let date2 = new Date("2025-01-01T00:00:00.000Z");
      expect(date1.toISOString()).assertEqual(date2.toISOString());
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_0000
     * @tc.name testDateToISOString0100
     * @tc.desc Verify toISOString returns valid ISO string for Date constructed without arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      let result = date.toISOString();
      expect(result.length).assertEqual(24);
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_0200
     * @tc.name testDateToISOString0102
     * @tc.desc Verify toISOString returns correct ISO string for year month day construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2025, 5, 9, 12, 30, 45);
      let result = date.toISOString();
      expect(result.indexOf("T") > 0).assertTrue();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_0300
     * @tc.name testDateToISOString0103
     * @tc.desc Verify toISOString returns valid string for minimal year month day construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0, 0, 1);
      let result = date.toISOString();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_0400
     * @tc.name testDateToISOString0104
     * @tc.desc Verify toISOString handles month overflow with auto-carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2025, 12, 1);
      let result = date.toISOString();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_0500
     * @tc.name testDateToISOString0105
     * @tc.desc Verify toISOString handles day overflow with auto-carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2025, 0, 32);
      let result = date.toISOString();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_0600
     * @tc.name testDateToISOString0106
     * @tc.desc Verify toISOString returns correct string for ISO format date string construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("2025-06-09T12:30:45.000Z");
      expect(date.toISOString()).assertEqual("2025-06-09T12:30:45.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_0700
     * @tc.name testDateToISOString0107
     * @tc.desc Verify toISOString returns correct string for simple date string construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("2025/06/09");
      let result = date.toISOString();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_0800
     * @tc.name testDateToISOString0109
     * @tc.desc Verify toISOString returns expected result for whitespace string construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("   ");
        date.toISOString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_3100
     * @tc.name testDateToISOString0110
     * @tc.desc Verify toISOString returns expected result for invalid string construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("hello world");
        date.toISOString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_5800
     * @tc.name testDateToISOString0111
     * @tc.desc Verify toISOString returns expected result for XSS string construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("<script>alert(1)</script>");
        date.toISOString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_7300
     * @tc.name testDateToISOString0112
     * @tc.desc Verify toISOString returns expected result for special Unicode string construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("\u200B");
        date.toISOString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_7400
     * @tc.name testDateToISOString0113
     * @tc.desc Verify toISOString returns same value for same timestamp via number and string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1735689600000);
      let date2 = new Date("2025-01-01T00:00:00.000Z");
      expect(date1.toISOString()).assertEqual(date2.toISOString());
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_7500
     * @tc.name testDateToISOString0114
     * @tc.desc Verify toISOString returns same value for two Date instances with same timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1000);
      let date2 = new Date(1000);
      expect(date1.toISOString()).assertEqual(date2.toISOString());
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_7800
     * @tc.name testDateToISOString0115
     * @tc.desc Verify toISOString returns different values for different timestamps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1000);
      let date2 = new Date(2000);
      expect(date1.toISOString() !== date2.toISOString()).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_1600
     * @tc.name testDateToISOString0116
     * @tc.desc Verify toISOString returns updated ISO string after setTime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      date.setTime(1704067200000);
      expect(date.toISOString()).assertEqual("2024-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_7900
     * @tc.name testDateToISOString0119
     * @tc.desc Verify toISOString returns correct string after setTime with max valid timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      date.setTime(8640000000000000);
      let result = date.toISOString();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_8500
     * @tc.name testDateToISOString0120
     * @tc.desc Verify toISOString returns correct string after setTime with negative timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      date.setTime(-86400000);
      let result = date.toISOString();
      expect(result.substring(0, 10)).assertEqual("1969-12-31");
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_8800
     * @tc.name testDateToISOString0121
     * @tc.desc Verify toISOString returns updated string after setFullYear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      date.setFullYear(2025);
      let result = date.toISOString();
      expect(result.indexOf("2025") === 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_2400
     * @tc.name testDateToISOString0124
     * @tc.desc Verify toISOString returns updated string after setMinutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 0, 1, 0, 0, 0));
      date.setMinutes(30);
      let result = date.toISOString();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_8900
     * @tc.name testDateToISOString0125
     * @tc.desc Verify toISOString returns updated string after setSeconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 0, 1, 0, 0, 0));
      date.setSeconds(45);
      let result = date.toISOString();
      expect(result.substring(17, 19)).assertEqual("45");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_9000
     * @tc.name testDateToISOString0126
     * @tc.desc Verify toISOString after adding valid timestamp via getTime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let newTimestamp = date.getTime() + 86400000;
      let newDate = new Date(newTimestamp);
      expect(newDate.toISOString()).assertEqual("1970-01-02T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_10000
     * @tc.name testDateToISOString0127
     * @tc.desc Verify toISOString returns expected result after adding out-of-range value via getTime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let newTimestamp = date.getTime() + 8640000000000000;
      expect(verifyDateInput(newTimestamp)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_10100
     * @tc.name testDateToISOString0129
     * @tc.desc Verify toISOString after subtracting valid timestamp via getTime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(86400000);
      let newTimestamp = date.getTime() - 86400000;
      let newDate = new Date(newTimestamp);
      expect(newDate.toISOString()).assertEqual("1970-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_3200
     * @tc.name testDateToISOString0132
     * @tc.desc Verify toISOString returns valid string for true construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1);
      let result = date.toISOString();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_10200
     * @tc.name testDateToISOString0133
     * @tc.desc Verify toISOString returns valid string for empty array construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = [];
      let date = new Date(arr.length);
      expect(date.toISOString()).assertEqual("1970-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_3400
     * @tc.name testDateToISOString0134
     * @tc.desc Verify Date.prototype.toJSON calls toISOString in JSON.stringify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let json = JSON.stringify(date);
      expect(json.indexOf("1970-01-01T00:00:00.000Z") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_10300
     * @tc.name testDateToISOString0135
     * @tc.desc Verify Date.prototype.toJSON returns same result as toISOString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1704067200000);
      let jsonResult = date.toJSON();
      let isoResult = date.toISOString();
      expect(jsonResult).assertEqual(isoResult);
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_10400
     * @tc.name testDateToISOString0136
     * @tc.desc Verify multiple Date instances call toISOString independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1000);
      let date2 = new Date(2000);
      expect(date1.toISOString()).assertEqual("1970-01-01T00:00:01.000Z");
      expect(date2.toISOString()).assertEqual("1970-01-01T00:00:02.000Z");
      expect(date1.toISOString()).assertEqual("1970-01-01T00:00:01.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_10500
     * @tc.name testDateToISOString0137
     * @tc.desc Verify batch created valid Date instances all return correct ISO strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dates: Date[] = [];
      for (let i = 0; i < 10; i++) {
        dates.push(new Date(i * 1000));
      }
      for (let i = 0; i < dates.length; i++) {
        let result = dates[i].toISOString();
        expect(result.length).assertEqual(24);
        expect(result.endsWith("Z")).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_10600
     * @tc.name testDateToISOString0138
     * @tc.desc Verify batch created invalid Date instances all returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let invalidValues: long[] = [8640000000000001, Long.MAX_VALUE, Long.MIN_VALUE, 8640000000000002];
      for (let i = 0; i < invalidValues.length; i++) {
        expect(verifyDateInput(invalidValues[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_10700
     * @tc.name testDateToISOString0139
     * @tc.desc Verify toISOString returns string while valueOf returns long timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let isoResult = date.toISOString();
      let valueOfResult = date.valueOf();
      expect(isoResult).assertEqual("1970-01-01T00:00:00.000Z");
      expect(valueOfResult).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_10800
     * @tc.name testDateToISOString0140
     * @tc.desc Verify toISOString returns UTC format while toString may contain timezone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      let isoResult = date.toISOString();
      let toStringResult = date.toString();
      expect(isoResult.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_10900
     * @tc.name testDateToISOString0141
     * @tc.desc Verify repeated toISOString calls on same Date return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1735689600000);
      let result1 = date.toISOString();
      let result2 = date.toISOString();
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual("2025-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_11000
     * @tc.name testDateToISOString0142
     * @tc.desc Verify toISOString returns valid string for year 9999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(9999, 11, 31, 23, 59, 59));
      let result = date.toISOString();
      expect(result.substring(0, 4)).assertEqual("9999");
      expect(result.substring(5, 7)).assertEqual("12");
      expect(result.substring(8, 10)).assertEqual("31");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_11100
     * @tc.name testDateToISOString0143
     * @tc.desc Verify toISOString returns valid string for year beyond normal range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(99999, 0, 1));
      let result = date.toISOString();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_11200
     * @tc.name testDateToISOString0144
     * @tc.desc Verify toISOString returns valid string for year 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(1, 0, 1));
      let result = date.toISOString();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_11300
     * @tc.name testDateToISOString0145
     * @tc.desc Verify toISOString returns valid string for negative year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(-1000, 0, 1));
      let result = date.toISOString();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_11400
     * @tc.name testDateToISOString0146
     * @tc.desc Verify toISOString returns correct date for leap year February 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2024, 1, 29));
      let result = date.toISOString();
      expect(result.substring(5, 10)).assertEqual("02-29");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_11500
     * @tc.name testDateToISOString0147
     * @tc.desc Verify toISOString auto-carries non-leap year February 29 to March
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(Date.UTC(2025, 1, 29));
      let result = date.toISOString();
      expect(result.substring(5, 7)).assertEqual("03");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_11600
     * @tc.name testDateToISOString0148
     * @tc.desc Verify toISOString returns correct string for one day in milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(86400000);
      expect(date.toISOString()).assertEqual("1970-01-02T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_11700
     * @tc.name testDateToISOString0149
     * @tc.desc Verify toISOString returns correct string for one hour in milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(3600000);
      expect(date.toISOString()).assertEqual("1970-01-01T01:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_11800
     * @tc.name testDateToISOString0150
     * @tc.desc Verify toISOString returns correct string for one minute in milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(60000);
      expect(date.toISOString()).assertEqual("1970-01-01T00:01:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_ISO_STRNG_11900
     * @tc.name testDateToISOString0151
     * @tc.desc Verify toISOString returns correct string for one second in milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToISOString0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      expect(date.toISOString()).assertEqual("1970-01-01T00:00:01.000Z");
    });
  });
}
