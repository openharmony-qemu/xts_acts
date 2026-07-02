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

export default function DateSetUTCFullYearTest(): void {
  describe('DateSetUTCFullYearTest', () => {
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
     * @tc.number SUB_DATE_SET_UTC_FULL_0100
     * @tc.name testDateSetUTCFullYear0001
     * @tc.desc Verify setUTCFullYear with one parameter sets UTC year correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      const result = date.setUTCFullYear(2024);
      expect(result).assertEqual(new Date(Date.UTC(2024, 0, 1)).getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_0200
     * @tc.name testDateSetUTCFullYear0002
     * @tc.desc Verify setUTCFullYear with two parameters sets UTC year and month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      const result = date.setUTCFullYear(2024, 5);
      expect(result).assertEqual(new Date(Date.UTC(2024, 5, 1)).getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_0300
     * @tc.name testDateSetUTCFullYear0003
     * @tc.desc Verify setUTCFullYear with three parameters sets UTC year, month and date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      const result = date.setUTCFullYear(2024, 0, 2);
      expect(result).assertEqual(new Date(Date.UTC(2024, 0, 2)).getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_0400
     * @tc.name testDateSetUTCFullYear0004
     * @tc.desc Verify setUTCFullYear with epoch year keeps UTC year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(1970);
      expect(date.getUTCFullYear()).assertEqual(1970);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_0600
     * @tc.name testDateSetUTCFullYear0006
     * @tc.desc Verify setUTCFullYear with normal year value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024);
      expect(date.getUTCFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_0700
     * @tc.name testDateSetUTCFullYear0007
     * @tc.desc Verify setUTCFullYear with year 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(0);
      expect(date.getUTCFullYear()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_0800
     * @tc.name testDateSetUTCFullYear0008
     * @tc.desc Verify setUTCFullYear with negative year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(-100);
      expect(date.getUTCFullYear()).assertEqual(-100);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_0900
     * @tc.name testDateSetUTCFullYear0009
     * @tc.desc Verify setUTCFullYear with large year value 9999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(9999);
      expect(date.getUTCFullYear()).assertEqual(9999);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_1000
     * @tc.name testDateSetUTCFullYear0010
     * @tc.desc Verify setUTCFullYear with minimum positive year 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(1);
      expect(date.getUTCFullYear()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_1100
     * @tc.name testDateSetUTCFullYear0011
     * @tc.desc Verify setUTCFullYear with int max value boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      const result = date.setUTCFullYear(2147483647);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_1200
     * @tc.name testDateSetUTCFullYear0012
     * @tc.desc Verify setUTCFullYear with int min value boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      const result = date.setUTCFullYear(-2147483648);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_1300
     * @tc.name testDateSetUTCFullYear0013
     * @tc.desc Verify setUTCFullYear with year 100 is not auto-expanded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(100);
      expect(date.getUTCFullYear()).assertEqual(100);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_1400
     * @tc.name testDateSetUTCFullYear0014
     * @tc.desc Verify setUTCFullYear with year 99 is not auto-expanded to 2099
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(99);
      expect(date.getUTCFullYear()).assertEqual(99);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_1800
     * @tc.name testDateSetUTCFullYear0018
     * @tc.desc Verify setUTCFullYear with month value 0 for January
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 0);
      expect(date.getUTCMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_1900
     * @tc.name testDateSetUTCFullYear0019
     * @tc.desc Verify setUTCFullYear with month value 11 for December
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 11);
      expect(date.getUTCMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_2000
     * @tc.name testDateSetUTCFullYear0020
     * @tc.desc Verify setUTCFullYear with month value 6 for July
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 6);
      expect(date.getUTCMonth()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_2200
     * @tc.name testDateSetUTCFullYear022
     * @tc.desc Verify setUTCFullYear with month -1 rolls back to previous year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, -1);
      expect(date.getUTCFullYear()).assertEqual(2023);
      expect(date.getUTCMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_2300
     * @tc.name testDateSetUTCFullYear0023
     * @tc.desc Verify setUTCFullYear with month 24 carries over two years
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 24);
      expect(date.getUTCFullYear()).assertEqual(2026);
      expect(date.getUTCMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_2400
     * @tc.name testDateSetUTCFullYear0024
     * @tc.desc Verify setUTCFullYear with month -12 rolls back one year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, -12);
      expect(date.getUTCFullYear()).assertEqual(2023);
      expect(date.getUTCMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_2500
     * @tc.name testDateSetUTCFullYear0025
     * @tc.desc Verify setUTCFullYear with date value 1 for first day of month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 0, 1);
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_2600
     * @tc.name testDateSetUTCFullYear0026
     * @tc.desc Verify setUTCFullYear with date value 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 0, 31);
      expect(date.getUTCDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_2800
     * @tc.name testDateSetUTCFullYear0028
     * @tc.desc Verify setUTCFullYear with date 28 in February of non-leap year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2023, 1, 28);
      expect(date.getUTCDate()).assertEqual(28);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_2900
     * @tc.name testDateSetUTCFullYear0029
     * @tc.desc Verify setUTCFullYear with date 29 in February of leap year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 1, 29);
      expect(date.getUTCDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_3000
     * @tc.name testDateSetUTCFullYear0030
     * @tc.desc Verify setUTCFullYear with date 0 returns last day of previous month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 1, 0);
      expect(date.getUTCMonth()).assertEqual(0);
      expect(date.getUTCDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_3100
     * @tc.name testDateSetUTCFullYear0031
     * @tc.desc Verify setUTCFullYear with date 32 in January overflows to February
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 0, 32);
      expect(date.getUTCMonth()).assertEqual(1);
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_3200
     * @tc.name testDateSetUTCFullYear0032
     * @tc.desc Verify setUTCFullYear with date -1 rolls back to previous month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 0, -1);
      expect(date.getUTCMonth()).assertEqual(11);
      expect(date.getUTCDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_3300
     * @tc.name testDateSetUTCFullYear0033
     * @tc.desc Verify setUTCFullYear with date 30 in February non-leap year overflows to March
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2023, 1, 30);
      expect(date.getUTCMonth()).assertEqual(2);
      expect(date.getUTCDate()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_3400
     * @tc.name testDateSetUTCFullYear0034
     * @tc.desc Verify setUTCFullYear with date 31 in April overflows to May
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 3, 31);
      expect(date.getUTCMonth()).assertEqual(4);
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_4200
     * @tc.name testDateSetUTCFullYear0042
     * @tc.desc Verify setUTCFullYear truncates floating point month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 5);
      expect(date.getUTCMonth()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_4300
     * @tc.name testDateSetUTCFullYear0043
     * @tc.desc Verify setUTCFullYear truncates floating point date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 0, 15);
      expect(date.getUTCDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_5000
     * @tc.name testDateSetUTCFullYear0050
     * @tc.desc Verify setUTCFullYear return value equals date.getTime()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      const result = date.setUTCFullYear(2024, 5, 15);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_5100
     * @tc.name testDateSetUTCFullYear0051
     * @tc.desc Verify setUTCFullYear set to epoch returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1));
      const result = date.setUTCFullYear(1970, 0, 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_5200
     * @tc.name testDateSetUTCFullYear0052
     * @tc.desc Verify setUTCFullYear returns negative timestamp for year before 1970
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      const result = date.setUTCFullYear(1969, 0, 1);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_5500
     * @tc.name testDateSetUTCFullYear0055
     * @tc.desc Verify setUTCFullYear returns integer millisecond timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      const result = date.setUTCFullYear(2024, 0, 1);
      expect(Number.isInteger(result) || result === 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_5600
     * @tc.name testDateSetUTCFullYear0056
     * @tc.desc Verify setUTCFullYear with maximum supported year returns finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      const result = date.setUTCFullYear(275760, 8, 13);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_5700
     * @tc.name testDateSetUTCFullYear0057
     * @tc.desc Verify setUTCFullYear with minimum supported year returns finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      const result = date.setUTCFullYear(-271821, 3, 20);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_6400
     * @tc.name testDateSetUTCFullYear0064
     * @tc.desc Verify multiple consecutive setUTCFullYear calls use last value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2023);
      expect(date.getUTCFullYear()).assertEqual(2023);
      date.setUTCFullYear(2025);
      expect(date.getUTCFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_6500
     * @tc.name testDateSetUTCFullYear0065
     * @tc.desc Verify setUTCFullYear with different overloads called consecutively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024);
      expect(date.getUTCFullYear()).assertEqual(2024);
      date.setUTCFullYear(2025, 5, 15);
      expect(date.getUTCFullYear()).assertEqual(2025);
      expect(date.getUTCMonth()).assertEqual(5);
      expect(date.getUTCDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_6600
     * @tc.name testDateSetUTCFullYear0066
     * @tc.desc Verify month overflow causes year increment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 12, 1);
      expect(date.getUTCFullYear()).assertEqual(2025);
      expect(date.getUTCMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_6700
     * @tc.name testDateSetUTCFullYear0067
     * @tc.desc Verify both month and date overflow causes year increment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 11, 32);
      expect(date.getUTCFullYear()).assertEqual(2025);
      expect(date.getUTCMonth()).assertEqual(0);
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_6800
     * @tc.name testDateSetUTCFullYear0068
     * @tc.desc Verify setUTCFullYear with year only preserves existing month and date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15));
      date.setUTCFullYear(2024);
      expect(date.getUTCFullYear()).assertEqual(2024);
      expect(date.getUTCMonth()).assertEqual(5);
      expect(date.getUTCDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_6900
     * @tc.name testDateSetUTCFullYear0069
     * @tc.desc Verify setUTCFullYear with year and month preserves existing date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15));
      date.setUTCFullYear(2024, 10);
      expect(date.getUTCFullYear()).assertEqual(2024);
      expect(date.getUTCMonth()).assertEqual(10);
      expect(date.getUTCDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_7000
     * @tc.name testDateSetUTCFullYear0070
     * @tc.desc Verify all UTC getters return consistent values after setUTCFullYear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 6, 20);
      expect(date.getUTCFullYear()).assertEqual(2024);
      expect(date.getUTCMonth()).assertEqual(6);
      expect(date.getUTCDate()).assertEqual(20);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_7100
     * @tc.name testDateSetUTCFullYear0071
     * @tc.desc Verify setUTCHours after setUTCFullYear does not conflict
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 0, 2);
      date.setUTCHours(12, 30, 45);
      expect(date.getUTCFullYear()).assertEqual(2024);
      expect(date.getUTCMonth()).assertEqual(0);
      expect(date.getUTCDate()).assertEqual(2);
      expect(date.getUTCHours()).assertEqual(12);
      expect(date.getUTCMinutes()).assertEqual(30);
      expect(date.getUTCSeconds()).assertEqual(45);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_7200
     * @tc.name testDateSetUTCFullYear0072
     * @tc.desc Verify setUTCFullYear with leap year February 29 is valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2024, 1, 29);
      expect(date.getUTCFullYear()).assertEqual(2024);
      expect(date.getUTCMonth()).assertEqual(1);
      expect(date.getUTCDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_7300
     * @tc.name testDateSetUTCFullYear0073
     * @tc.desc Verify setUTCFullYear with non-leap year February 29 overflows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2023, 1, 29);
      expect(date.getUTCMonth()).assertEqual(2);
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_7400
     * @tc.name testDateSetUTCFullYear0074
     * @tc.desc Verify setUTCFullYear with century leap year 2000 February 29 is valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2000, 1, 29);
      expect(date.getUTCDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_7500
     * @tc.name testDateSetUTCFullYear0075
     * @tc.desc Verify setUTCFullYear with non-century leap year 1900 February 29 overflows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(1900, 1, 29);
      expect(date.getUTCMonth()).assertEqual(2);
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_FULL_7600
     * @tc.name testDateSetUTCFullYear0076
     * @tc.desc Verify setUTCFullYear does not affect time components
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCFullYear0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 0, 1, 12, 30, 45, 500));
      date.setUTCFullYear(2024);
      expect(date.getUTCHours()).assertEqual(12);
      expect(date.getUTCMinutes()).assertEqual(30);
      expect(date.getUTCSeconds()).assertEqual(45);
      expect(date.getUTCMilliseconds()).assertEqual(500);
    });
  });
}
