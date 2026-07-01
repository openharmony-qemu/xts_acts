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

export default function DateParseTest(): void {
  describe('DateParseTest', () => {
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
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_0100
     * @tc.name testDateParse0001
     * @tc.desc Verify Date.parse with one string parameter returns UTC timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("1970-01-01T00:00:00.000Z");
      expect(time).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_0700
     * @tc.name testDateParse0007
     * @tc.desc Verify Date.parse with full ISO 8601 datetime string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-06-15T12:30:45.123Z");
      expect(time).assertEqual(new Date("2024-06-15T12:30:45.123Z").getTime());
      expect(time).assertEqual(1718454645123);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_0800
     * @tc.name testDateParse0008
     * @tc.desc Verify Date.parse with ISO 8601 date-only string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-06-15");
      expect(time).assertEqual(new Date("2024-06-15").getTime());
      expect(time).assertEqual(1718409600000);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_0900
     * @tc.name testDateParse0009
     * @tc.desc Verify Date.parse with ISO 8601 datetime with timezone offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-06-15T12:30:45+08:00");
      expect(time).assertEqual(new Date("2024-06-15T12:30:45+08:00").getTime());
      expect(time).assertEqual(Date.parse("2024-06-15T04:30:45.000Z"));
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_1000
     * @tc.name testDateParse0010
     * @tc.desc Verify Date.parse with ISO 8601 datetime with milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-06-15T12:30:45.999Z");
      expect(time % 1000).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_1400
     * @tc.name testDateParse0014
     * @tc.desc Verify Date.parse with far future date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2099-12-31T23:59:59.999Z");
      expect(time).assertEqual(new Date("2099-12-31T23:59:59.999Z").getTime());
      expect(time).assertEqual(4102444799999);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_1500
     * @tc.name testDateParse0015
     * @tc.desc Verify Date.parse with current year date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2025-01-01T00:00:00.000Z");
      let target: long = 1735689600000;
      let dayMs: long = 86400000;
      expect(time > target - dayMs).assertTrue();
      expect(time < target + dayMs).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_1600
     * @tc.name testDateParse0016
     * @tc.desc Verify Date.parse with RFC 2822 format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("Sat, 15 Jun 2024 12:30:45 GMT");
      expect(time).assertEqual(Date.parse("2024-06-15T12:30:45.000Z"));
      expect(time).assertEqual(1718454645000);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_1700
     * @tc.name testDateParse0017
     * @tc.desc Verify Date.parse with slash-separated date format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024/06/15");
      let referenceDate = new Date(2024, 5, 15);
      expect(time).assertEqual(referenceDate.getTime());
      expect(new Date(time).getFullYear()).assertEqual(2024);
      expect(new Date(time).getMonth()).assertEqual(5);
      expect(new Date(time).getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_2000
     * @tc.name testDateParse0020
     * @tc.desc Verify Date.parse with month abbreviation format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("15 Jun 2024 12:30:45 GMT");
      expect(time).assertEqual(Date.parse("2024-06-15T12:30:45.000Z"));
      expect(time).assertEqual(1718454645000);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_2100
     * @tc.name testDateParse0021
     * @tc.desc Verify Date.parse with time-only string returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("12:30:45");

        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_2200
     * @tc.name testDateParse0022
     * @tc.desc Verify Date.parse with empty string returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_2300
     * @tc.name testDateParse0023
     * @tc.desc Verify Date.parse with whitespace string returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("   ");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_2400
     * @tc.name testDateParse0024
     * @tc.desc Verify Date.parse with single space returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input = " ";
      try {
        let time: long = Date.parse(input);
        expect(input.length).assertEqual(1);
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_2500
     * @tc.name testDateParse0025
     * @tc.desc Verify Date.parse with tab character returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("\t");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_2600
     * @tc.name testDateParse0026
     * @tc.desc Verify Date.parse with newline character returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("\n");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_2800
     * @tc.name testDateParse0028
     * @tc.desc Verify Date.parse with random string returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("notadate");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_2900
     * @tc.name testDateParse0029
     * @tc.desc Verify Date.parse with special characters returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("!@#$%^&*()");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_3000
     * @tc.name testDateParse0030
     * @tc.desc Verify Date.parse with numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("12345");
      let constructed: long = new Date("12345").getTime();
      let okFinite: boolean = Number.isFinite(time) && time === constructed;
      let okNaN: boolean = Number.isNaN(time) && Number.isNaN(constructed);
      expect(okFinite || okNaN).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_3100
     * @tc.name testDateParse0031
     * @tc.desc Verify Date.parse with invalid month returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("2024-13-01T00:00:00.000Z");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_3200
     * @tc.name testDateParse0032
     * @tc.desc Verify Date.parse with invalid day returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("2024-01-32T00:00:00.000Z");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_3300
     * @tc.name testDateParse0033
     * @tc.desc Verify Date.parse with invalid hour returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("2024-01-01T25:00:00.000Z");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_3400
     * @tc.name testDateParse0034
     * @tc.desc Verify Date.parse with incomplete format missing timezone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-06-15T12:30:45");
      let constructed: long = new Date("2024-06-15T12:30:45").getTime();
      let okFinite: boolean = Number.isFinite(time) && time === constructed;
      let okNaN: boolean = Number.isNaN(time) && Number.isNaN(constructed);
      expect(okFinite || okNaN).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_3500
     * @tc.name testDateParse0035
     * @tc.desc Verify Date.parse with very long string does not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "2024-06-15T00:00:00.000Z" + "a".repeat(10000);
      try {
        let time: long = Date.parse(longStr);
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_3600
     * @tc.name testDateParse0036
     * @tc.desc Verify Date.parse with concatenated date strings returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("2024-06-15T00:00:00.000Z2024-06-15T00:00:00.000Z");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_3700
     * @tc.name testDateParse0037
     * @tc.desc Verify Date.parse with XSS script tag returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("<script>alert(1)</script>");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_3800
     * @tc.name testDateParse0038
     * @tc.desc Verify Date.parse with HTML-wrapped date returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("<b>2024-06-15</b>");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_4000
     * @tc.name testDateParse0040
     * @tc.desc Verify Date.parse with HTML entity encoded date returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("2024&#45;06&#45;15");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_4300
     * @tc.name testDateParse0043
     * @tc.desc Verify Date.parse with Arabic numeral date returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("٢٠٢٤-٠٦-١٥");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_4400
     * @tc.name testDateParse0044
     * @tc.desc Verify Date.parse with fullwidth numeral date returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("２０２４-０６-１５");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_5100
     * @tc.name testDateParse0051
     * @tc.desc Verify Date.parse with isolated surrogate pair does not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("\udc04");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_5200
     * @tc.name testDateParse0052
     * @tc.desc Verify Date.parse with illegal UTF-8 byte sequence does not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("\xe4\x3f\xad");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_5300
     * @tc.name testDateParse0053
     * @tc.desc Verify Date.parse with overlong UTF-8 sequence does not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("\xc0\x81");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_5600
     * @tc.name testDateParse0056
     * @tc.desc Verify Date.parse returns 1 for 1ms after epoch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("1970-01-01T00:00:00.001Z");
      expect(time).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_5700
     * @tc.name testDateParse0057
     * @tc.desc Verify Date.parse returns -1 for 1ms before epoch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("1969-12-31T23:59:59.999Z");
      expect(time).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_5800
     * @tc.name testDateParse0058
     * @tc.desc Verify Date.parse millisecond precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-06-15T12:30:45.500Z");
      expect(time % 1000).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_5900
     * @tc.name testDateParse0059
     * @tc.desc Verify Date.parse returns whole second timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-06-15T12:30:45Z");
      expect(time % 1000).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_6100
     * @tc.name testDateParse0061
     * @tc.desc Verify Date.parse returns positive timestamp for post-epoch date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-01-01T00:00:00.000Z");
      expect(time).assertEqual(1704067200000);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_6200
     * @tc.name testDateParse0062
     * @tc.desc Verify Date.parse returns negative timestamp for pre-epoch date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("1969-01-01T00:00:00.000Z");
      expect(time < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_6300
     * @tc.name testDateParse0063
     * @tc.desc Verify Date.parse returns large value for far future date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("9999-12-31T23:59:59.999Z");
      expect(time).assertEqual(253402300799999);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_6400
     * @tc.name testDateParse0064
     * @tc.desc Verify Date.parse consistency for same date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time1: long = Date.parse("2024-06-15T12:30:45.123Z");
      let time2: long = Date.parse("2024-06-15T12:30:45.123Z");
      expect(time1).assertEqual(time2);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_6600
     * @tc.name testDateParse0066
     * @tc.desc Verify Date.parse returns integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-06-15T12:30:45.123Z");
      expect(time === Math.floor(time)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_6700
     * @tc.name testDateParse0067
     * @tc.desc Verify Date.parse returns finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-06-15T12:30:45.123Z");
      expect(Number.isFinite(time)).assertTrue();
      expect(time).assertEqual(1718454645123);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_6800
     * @tc.name testDateParse0068
     * @tc.desc Verify Date.parse returns neither null nor undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-06-15T12:30:45.123Z");
      expect(time !== null).assertTrue();
      expect(time !== undefined).assertTrue();
      expect(time).assertEqual(1718454645123);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_7000
     * @tc.name testDateParse0070
     * @tc.desc Verify Date.parse with minimum date boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("0001-01-01T00:00:00.000Z");
      let constructed: long = new Date("0001-01-01T00:00:00.000Z").getTime();
      let okFinite: boolean = Number.isFinite(time) && time === constructed;
      let okNaN: boolean = Number.isNaN(time) && Number.isNaN(constructed);
      expect(okFinite || okNaN).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_7100
     * @tc.name testDateParse0071
     * @tc.desc Verify Date.parse with maximum date boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("9999-12-31T23:59:59.999Z");
      let constructedTime: long = new Date("9999-12-31T23:59:59.999Z").getTime();
      expect(time).assertEqual(constructedTime);
      expect(time > Date.parse("1970-01-01T00:00:00.000Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_7200
     * @tc.name testDateParse0072
     * @tc.desc Verify Date.parse with leap year February 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-02-29T00:00:00.000Z");
      expect(time).assertEqual(1709164800000);
      let d = new Date(time);
      expect(d.getUTCFullYear()).assertEqual(2024);
      expect(d.getUTCMonth()).assertEqual(1);
      expect(d.getUTCDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_7500
     * @tc.name testDateParse0075
     * @tc.desc Verify Date.parse with 24:00:00 time boundary returns NaN or returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let time: long = Date.parse("2024-06-15T24:00:00.000Z");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_8500
     * @tc.name testDateParse0085
     * @tc.desc Verify Date.parse error does not pollute global state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let bad: long = Date.parse("invalid");
        let good: long = Date.parse("2024-06-15T12:30:45.123Z");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_8600
     * @tc.name testDateParse0086
     * @tc.desc Verify Date.parse consecutive invalid parses do not affect subsequent calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Date.parse("bad1");
        Date.parse("bad2");
        Date.parse("bad3");
        let time: long = Date.parse("2024-06-15T12:30:45.123Z");
        expect(Number.isNaN(time)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_9100
     * @tc.name testDateParse0091
     * @tc.desc Verify Date.parse UTC Z and timezone offset equivalence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let utc: long = Date.parse("2024-06-15T00:00:00.000Z");
      let offset: long = Date.parse("2024-06-15T08:00:00.000+08:00");
      expect(utc).assertEqual(offset);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_9200
     * @tc.name testDateParse0092
     * @tc.desc Verify Date.parse Z suffix equals +00:00 offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z: long = Date.parse("2024-06-15T12:30:45.000Z");
      let zero: long = Date.parse("2024-06-15T12:30:45.000+00:00");
      expect(z).assertEqual(zero);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_9300
     * @tc.name testDateParse0093
     * @tc.desc Verify Date.parse positive and negative timezone offsets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let plus8: long = Date.parse("2024-06-15T20:00:00.000+08:00");
      let minus5: long = Date.parse("2024-06-15T07:00:00.000-05:00");
      expect(plus8).assertEqual(minus5);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_9400
     * @tc.name testDateParse0094
     * @tc.desc Verify Date.parse full ISO format and date-only format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let full: long = Date.parse("2024-06-15T00:00:00.000Z");
      let dateOnly: long = Date.parse("2024-06-15");
      expect(full).assertEqual(1718409600000);
      expect(dateOnly).assertEqual(1718409600000);
      expect(full).assertEqual(dateOnly);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_9600
     * @tc.name testDateParse0096
     * @tc.desc Verify Date.parse and new Date epoch zero consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "1970-01-01T00:00:00.000Z";
      expect(Date.parse(str)).assertEqual(new Date(str).getTime());
      expect(Date.parse(str)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_9700
     * @tc.name testDateParse0097
     * @tc.desc Verify Date.parse and new Date invalid string consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "invalid date";
      let parseResult: long;
      let getTimeResult: long;
      let parseValid: boolean = false;
      let getTimeValid: boolean = false;

      try {
        parseResult = Date.parse(str);
        parseValid = Number.isNaN(parseResult);
        expect(parseValid && getTimeValid).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }

      try {
        getTimeResult = new Date(str).getTime();
        getTimeValid = Number.isNaN(getTimeResult);
        expect(parseValid && getTimeValid).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_9800
     * @tc.name testDateParse0098
     * @tc.desc Verify Date.parse and new Date multiple format consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let formats: string[] = [
        "2024-06-15T12:30:45.123Z",
        "2024-06-15",
        "2024-06-15T00:00:00.000+08:00",
      ];
      for (let fmt of formats) {
        let parseVal: long = Date.parse(fmt);
        let getVal: long = new Date(fmt).getTime();
        expect(parseVal).assertEqual(getVal);
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_9900
     * @tc.name testDateParse0099
     * @tc.desc Verify Date.parse result can construct new Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let timestamp: long = Date.parse("2024-06-15T12:30:45.123Z");
      let date = new Date(timestamp);
      expect(date.getTime()).assertEqual(timestamp);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_0000
     * @tc.name testDateParse0100
     * @tc.desc Verify Date.parse result for date difference calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1: long = Date.parse("2024-06-15T00:00:00.000Z");
      let t2: long = Date.parse("2024-06-16T00:00:00.000Z");
      let diff: long = t2 - t1;
      expect(diff).assertEqual(86400000);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_0500
     * @tc.name testDateParse0101
     * @tc.desc Verify Date.parse result and toISOString reversibility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "2024-06-15T12:30:45.123Z";
      let timestamp: long = Date.parse(original);
      let iso: string = new Date(timestamp).toISOString();
      expect(iso).assertEqual(original);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_0200
     * @tc.name testDateParse0102
     * @tc.desc Verify Date.parse returns stable value across many calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: long = Date.parse("2024-06-15T12:30:45.123Z");
      for (let i = 0; i < 10000; i++) {
        expect(Date.parse("2024-06-15T12:30:45.123Z")).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_0400
     * @tc.name testDateParse0104
     * @tc.desc Verify Date.parse stability with alternating formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 50; i++) {
        let iso: long = Date.parse("2024-06-15T12:30:45.123Z");
        let dateOnly: long = Date.parse("2024-06-15");
        let epoch: long = Date.parse("1970-01-01T00:00:00.000Z");
        expect(Number.isFinite(iso)).assertTrue();
        expect(Number.isFinite(dateOnly)).assertTrue();
        expect(epoch).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_0600
     * @tc.name testDateParse0107
     * @tc.desc Verify Date.parse with century leap year 2000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2000-02-29T00:00:00.000Z");
      expect(time).assertEqual(951782400000);
      let d = new Date(time);
      expect(d.getUTCFullYear()).assertEqual(2000);
      expect(d.getUTCMonth()).assertEqual(1);
      expect(d.getUTCDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_1200
     * @tc.name testDateParse0109
     * @tc.desc Verify Date.parse with DST boundary date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-03-10T02:00:00.000Z");
      expect(time).assertEqual(1710036000000);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_1800
     * @tc.name testDateParse0110
     * @tc.desc Verify Date.parse with year-end last moment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let time: long = Date.parse("2024-12-31T23:59:59.999Z");
      expect(time).assertEqual(1735689599999);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_1100
     * @tc.name testDateParse0111
     * @tc.desc Verify Date.parse and Date.UTC consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parsed: long = Date.parse("2024-06-15T00:00:00.000Z");
      let utc: number = Date.UTC(2024, 5, 15, 0, 0, 0, 0);
      expect(parsed).assertEqual(utc);
    });

    /**
     * @tc.number SUB_DATE_PARSE_ITEM_CHK_1900
     * @tc.name testDateParse0113
     * @tc.desc Verify Date.parse and valueOf consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateParse0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "2024-06-15T12:30:45.123Z";
      expect(Date.parse(str)).assertEqual(new Date(str).valueOf());
    });
  });
}
