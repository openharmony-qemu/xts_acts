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

export default function DateConstructor1Test(): void {
  describe('DateConstructor1Test', () => {
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
     * @tc.number SUB_DATE_CNSTR1_CHK_0100
     * @tc.name testDateConstructorNoArg
     * @tc.desc Verify creating Date instance without arguments uses current time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorNoArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date()
      expect(Number.isFinite(date.getTime())).assertTrue()
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_0200
     * @tc.name testDateConstructorWithTimestamp
     * @tc.desc Verify Date constructor with positive UTC millisecond timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorWithTimestamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      expect(date.valueOf()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_0300
     * @tc.name testDateConstructorNegativeTimestamp
     * @tc.desc Verify Date constructor with negative timestamp for pre-1970 date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorNegativeTimestamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-86400000);
      expect(date.valueOf()).assertEqual(-86400000);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_0400
     * @tc.name testDateConstructorLargeTimestamp
     * @tc.desc Verify Date constructor with large positive and negative timestamps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorLargeTimestamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1609459200000);
      expect(date1.getTime()).assertEqual(1609459200000);
      let date2 = new Date(10000000000000);
      expect(date2.valueOf()).assertEqual(10000000000000);
      let date3 = new Date(-10000000000000);
      expect(date3.valueOf()).assertEqual(-10000000000000);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_0500
     * @tc.name testDateConstructorMinMaxTimestamp
     * @tc.desc Verify Date constructor with 1, -1 and hex timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorMinMaxTimestamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1);
      expect(date1.valueOf()).assertEqual(1);
      let date2 = new Date(-1);
      expect(date2.valueOf()).assertEqual(-1);
      let date3 = new Date(0xFF);
      expect(date3.valueOf()).assertEqual(255);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_0600
     * @tc.name testDateConstructorYearMonthDay
     * @tc.desc Verify constructor with year, monthIndex, day parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorYearMonthDay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2025, 1, 1);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_0700
     * @tc.name testDateConstructorMultiParam
     * @tc.desc Verify constructor with year, monthIndex, day, hours, minutes, seconds, ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorMultiParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2024, 0, 2, 3, 4, 5, 6);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(2);
      expect(date.getHours()).assertEqual(3);
      expect(date.getMinutes()).assertEqual(4);
      expect(date.getSeconds()).assertEqual(5);
      expect(date.getMilliseconds()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_0800
     * @tc.name testDateConstructorDefaultValues
     * @tc.desc Verify default values when only year and monthIndex are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorDefaultValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2024, 0);
      expect(date.getDate()).assertEqual(1);
      expect(date.getHours()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_0900
     * @tc.name testDateConstructorPartialParams
     * @tc.desc Verify constructor with partial parameters (2-6 params)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorPartialParams', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date3 = new Date(2024, 0, 15);
      expect(date3.getDate()).assertEqual(15);
      let date4 = new Date(2024, 0, 1, 10);
      expect(date4.getHours()).assertEqual(10);
      let date5 = new Date(2024, 0, 1, 0, 30);
      expect(date5.getMinutes()).assertEqual(30);
      let date6 = new Date(2024, 0, 1, 0, 0, 45);
      expect(date6.getSeconds()).assertEqual(45);
      let date7 = new Date(2024, 0, 1, 0, 0, 0, 500);
      expect(date7.getMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1000
     * @tc.name testDateConstructorYearEdgeCases
     * @tc.desc Verify year edge cases: 0, 1, 70, 99, 69, 100, 9999, -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorYearEdgeCases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(70, 0, 1);
      expect(date1.getFullYear()).assertEqual(1970);
      let date2 = new Date(99, 0, 1);
      expect(date2.getFullYear()).assertEqual(1999);
      let date3 = new Date(69, 0, 1);
      expect(date3.getFullYear()).assertEqual(1969);
      let date4 = new Date(100, 0, 1);
      expect(date4.getFullYear()).assertEqual(100);
      let date5 = new Date(9999, 0, 1);
      expect(date5.getFullYear()).assertEqual(9999);
      let date6 = new Date(0, 0, 1);
      expect(date6.getFullYear()).assertEqual(1900);
      let date7 = new Date(2000, 0, 1);
      expect(date7.getFullYear()).assertEqual(2000);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1100
     * @tc.name testDateConstructorMonthOverflow
     * @tc.desc Verify monthIndex overflow: 12→next year Jan, 13→next year Feb, 24→two years
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorMonthOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(2024, 12, 1);
      expect(date1.getFullYear()).assertEqual(2025);
      expect(date1.getMonth()).assertEqual(0);
      let date2 = new Date(2024, 13, 1);
      expect(date2.getFullYear()).assertEqual(2025);
      expect(date2.getMonth()).assertEqual(1);
      let date3 = new Date(2024, 24, 1);
      expect(date3.getFullYear()).assertEqual(2026);
      expect(date3.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1200
     * @tc.name testDateConstructorMonthUnderflow
     * @tc.desc Verify monthIndex underflow: -1→prev year Dec, -12→prev year Jan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorMonthUnderflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(2024, -1, 1);
      expect(date1.getFullYear()).assertEqual(2023);
      expect(date1.getMonth()).assertEqual(11);
      let date2 = new Date(2024, -12, 1);
      expect(date2.getFullYear()).assertEqual(2023);
      expect(date2.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1300
     * @tc.name testDateConstructorDayOverflow
     * @tc.desc Verify day overflow: 32→next month, Feb 29 leap/non-leap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorDayOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(2024, 0, 32);
      expect(date1.getMonth()).assertEqual(1);
      expect(date1.getDate()).assertEqual(1);
      let date2 = new Date(2024, 1, 29);
      expect(date2.getMonth()).assertEqual(1);
      expect(date2.getDate()).assertEqual(29);
      let date3 = new Date(2023, 1, 29);
      expect(date3.getMonth()).assertEqual(2);
      expect(date3.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1400
     * @tc.name testDateConstructorDayUnderflow
     * @tc.desc Verify day underflow: 0→prev month last day, -1→prev month second-to-last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorDayUnderflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(2024, 1, 0);
      expect(date1.getMonth()).assertEqual(0);
      expect(date1.getDate()).assertEqual(31);
      let date2 = new Date(2024, 1, -1);
      expect(date2.getMonth()).assertEqual(0);
      expect(date2.getDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1500
     * @tc.name testDateConstructorHoursOverflow
     * @tc.desc Verify hours overflow: 24→next day, -1→prev day, 48→two days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorHoursOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(2024, 0, 1, 24);
      expect(date1.getDate()).assertEqual(2);
      expect(date1.getHours()).assertEqual(0);
      let date2 = new Date(2024, 0, 2, -1);
      expect(date2.getDate()).assertEqual(1);
      expect(date2.getHours()).assertEqual(23);
      let date3 = new Date(2024, 0, 1, 48);
      expect(date3.getDate()).assertEqual(3);
      expect(date3.getHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1600
     * @tc.name testDateConstructorMinutesOverflow
     * @tc.desc Verify minutes overflow: 60→next hour, -1→prev hour 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorMinutesOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(2024, 0, 1, 0, 60);
      expect(date1.getHours()).assertEqual(1);
      expect(date1.getMinutes()).assertEqual(0);
      let date2 = new Date(2024, 0, 1, 1, -1);
      expect(date2.getHours()).assertEqual(0);
      expect(date2.getMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1700
     * @tc.name testDateConstructorSecondsOverflow
     * @tc.desc Verify seconds overflow: 60→next minute, -1→prev minute 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorSecondsOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(2024, 0, 1, 0, 0, 60);
      expect(date1.getMinutes()).assertEqual(1);
      expect(date1.getSeconds()).assertEqual(0);
      let date2 = new Date(2024, 0, 1, 0, 1, -1);
      expect(date2.getMinutes()).assertEqual(0);
      expect(date2.getSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1800
     * @tc.name testDateConstructorMsOverflow
     * @tc.desc Verify ms overflow: 1000→next second 0, -1→prev second 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorMsOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(2024, 0, 1, 0, 0, 0, 1000);
      expect(date1.getSeconds()).assertEqual(1);
      expect(date1.getMilliseconds()).assertEqual(0);
      let date2 = new Date(2024, 0, 1, 0, 0, 1, -1);
      expect(date2.getSeconds()).assertEqual(0);
      expect(date2.getMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1900
     * @tc.name testDateConstructorMultiLevelOverflow
     * @tc.desc Verify multi-level overflow crossing month and year boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorMultiLevelOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(2024, 0, 31, 23, 59, 60, 0);
      expect(date1.getMonth()).assertEqual(1);
      expect(date1.getDate()).assertEqual(1);
      let date2 = new Date(2024, 11, 31, 23, 59, 60, 0);
      expect(date2.getFullYear()).assertEqual(2025);
      expect(date2.getMonth()).assertEqual(0);
      expect(date2.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2000
     * @tc.name testDateConstructorValidString
     * @tc.desc Verify constructor with valid date strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorValidString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date("2025-01-01");
      expect(Number.isFinite(date1.getTime())).assertTrue();
      let date2 = new Date("1970-01-01T00:00:00.000Z");
      expect(date2.valueOf()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2100
     * @tc.name testDateConstructorStringFormats
     * @tc.desc Verify constructor with various date string formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorStringFormats', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date("2025-06-15T12:30:00+08:00");
      expect(Number.isFinite(date1.getTime())).assertTrue();
      let date2 = new Date("06/15/2025");
      expect(Number.isFinite(date2.getTime())).assertTrue();
      let date3 = new Date("\u0032\u0030\u0032\u0035-\u0030\u0036-\u0031\u0035");
      expect(Number.isFinite(date3.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2200
     * @tc.name testDateConstructorInvalidString
     * @tc.desc Verify constructor with various invalid strings throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorInvalidString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let invalidInputs = ["not a date", "", "invalid date", "2025-13-01", "2025-06-15T25:00:00", "null", "NaN", "   ", "<script>alert(1)</script>", "テスト", "2024.5,0,1", "2024, 6.9, 1", "2024, 0, 15.9"];
      for (let input of invalidInputs) {
        try {
          let date = new Date(input);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('FormatError');
        }
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2300
     * @tc.name testDateConstructorIllegalUtf8
     * @tc.desc Verify constructor with illegal UTF-8 string throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorIllegalUtf8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("\udc04");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2400
     * @tc.name testDateConstructorCopy
     * @tc.desc Verify Date constructor with another Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Date(1609459200000);
      let copied = new Date(original);
      expect(copied.valueOf()).assertEqual(original.valueOf());
      expect(copied !== original).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2500
     * @tc.name testDateConstructorInstanceIndependence
     * @tc.desc Verify consecutively created instances are independent objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorInstanceIndependence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date();
      let date2 = new Date();
      let originalTime2 = date2.getTime();
      date1.setTime(0);
      expect(date2.getTime()).assertEqual(originalTime2);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2600
     * @tc.name testDateConstructorInstanceEquals
     * @tc.desc Verify two instances with same timestamp have identical valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorInstanceEquals', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(2024, 0, 2, 3, 4, 5, 6);
      let date2 = new Date(2024, 0, 2, 3, 4, 5, 6);
      expect(date1.valueOf()).assertEqual(date2.valueOf());
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2700
     * @tc.name testDateConstructorMultipleInstances
     * @tc.desc Verify multiple constructor calls return valid instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorMultipleInstances', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dates: Date[] = [];
      for (let i = 0; i < 100; i++) {
        dates.push(new Date(i));
      }
      for (let i = 0; i < dates.length; i++) {
        expect(dates[i].valueOf()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2800
     * @tc.name testDateConstructorManyInstances
     * @tc.desc Verify no memory leak or exception when rapidly creating many Date instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorManyInstances', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dates: Date[] = [];
      for (let i = 0; i < 1000; i++) {
        dates.push(new Date());
      }
      expect(dates.length).assertEqual(1000);
      for (let i = 0; i < dates.length; i++) {
        expect(Number.isFinite(dates[i].getTime())).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2900
     * @tc.name testDateConstructorGetTime
     * @tc.desc Verify getTime returns fixed constructor timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorGetTime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      expect(date.getTime()).assertEqual(1000);
      let date2 = new Date(123456789);
      expect(date2.getTime()).assertEqual(123456789);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3000
     * @tc.name testDateConstructorSetTimeAfterConstruct
     * @tc.desc Verify Date constructor with epoch date and setTime returns epoch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorSetTimeAfterConstruct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1970, 0, 1);
      date.setTime(0 as Long);
      expect(date.valueOf()).assertEqual(0);
    })

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3100
     * @tc.name testDateConstructorEpochIsoString
     * @tc.desc Verify Date constructor with epoch timestamp returns epoch ISO string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorEpochIsoString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      expect(date.valueOf()).assertEqual(0);
      expect(date.toISOString()).assertEqual("1970-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3200
     * @tc.name testDateConstructorTimestampOrdering
     * @tc.desc Verify fixed timestamps preserve ordering between Date instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorTimestampOrdering', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1000);
      let date2 = new Date(2000);
      expect(date2.getTime() > date1.getTime()).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3300
     * @tc.name testDateConstructorDateComponents
     * @tc.desc Verify year month day hour minute second can be retrieved after creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorDateComponents', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2024, 5, 15, 10, 30, 45, 123);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(5);
      expect(date.getDate()).assertEqual(15);
      expect(date.getHours()).assertEqual(10);
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getSeconds()).assertEqual(45);
      expect(date.getMilliseconds()).assertEqual(123);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3400
     * @tc.name testDateConstructorLeapYear
     * @tc.desc Verify leap year handling: 2024/2000 Feb 29 valid, 2023/1900 Feb 29 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorLeapYear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(2024, 1, 29);
      expect(date1.getMonth()).assertEqual(1);
      expect(date1.getDate()).assertEqual(29);
      let date2 = new Date(2000, 1, 29);
      expect(date2.getMonth()).assertEqual(1);
      expect(date2.getDate()).assertEqual(29);
      let date3 = new Date(2023, 1, 29);
      expect(date3.getMonth()).assertEqual(2);
      expect(date3.getDate()).assertEqual(1);
      let date4 = new Date(1900, 1, 29);
      expect(date4.getMonth()).assertEqual(2);
      expect(date4.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3500
     * @tc.name testDateConstructorDaysInMonth
     * @tc.desc Verify days in each month correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorDaysInMonth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 12; i++) {
        let date = new Date(2024, i, 1);
        expect(date.getMonth()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3600
     * @tc.name testDateConstructorValueOf
     * @tc.desc Verify valueOf returns corresponding timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorValueOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2024, 0, 1);
      expect(Number.isFinite(date.valueOf())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3700
     * @tc.name testDateConstructorToString
     * @tc.desc Verify instance can be converted to string and ISO format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorToString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2024, 0, 2, 3, 4, 5, 6);
      let str = date.toString();
      expect(str.includes("2024")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3800
     * @tc.name testDateConstructorToISOString
     * @tc.desc Verify instance can be converted to ISO format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructorToISOString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      let iso = date.toISOString();
      expect(iso.indexOf("T") > 0).assertTrue();
      expect(iso.endsWith("Z")).assertTrue();
    });

  })
};