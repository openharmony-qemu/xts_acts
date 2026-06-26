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

export default function DateGetFullYearTest(): void {
  describe('DateGetFullYearTest', () => {
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
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_0100
     * @tc.name testDateGetFullYear0001
     * @tc.desc Verify that getFullYear() returns correct full year when called with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 2);
      let year: int = date.getFullYear();
      expect(year).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_0200
     * @tc.name testDateGetFullYear0002
     * @tc.desc Verify that getFullYear() ignores multiple extra arguments and returns correct year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 5, 15);
      let year: int = date.getFullYear();
      expect(year).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_0300
     * @tc.name testDateGetFullYear0003
     * @tc.desc Verify that getFullYear() returns same year for different months/days in the same year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date1 = new Date(2024, 0, 1);
      const date2 = new Date(2024, 6, 15);
      const date3 = new Date(2024, 11, 31);
      expect(date1.getFullYear()).assertEqual(2024);
      expect(date2.getFullYear()).assertEqual(2024);
      expect(date3.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_0400
     * @tc.name testDateGetFullYear0004
     * @tc.desc Verify that getFullYear() returns correct year for years 2000 to 2030
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let years: int[] = [2000, 2001, 2010, 2020, 2024, 2030];
      for (let i = 0; i < years.length; i++) {
        let date = new Date(years[i], 0, 1);
        expect(date.getFullYear()).assertEqual(years[i]);
      }
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_0500
     * @tc.name testDateGetFullYear0005
     * @tc.desc Verify that getFullYear() returns 1970 for Unix epoch year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(1970, 0, 1);
      let year: int = date.getFullYear();
      expect(year).assertEqual(1970);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_0600
     * @tc.name testDateGetFullYear0006
     * @tc.desc Verify that getFullYear() returns 2000 for millennium year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2000, 0, 1);
      let year: int = date.getFullYear();
      expect(year).assertEqual(2000);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_0700
     * @tc.name testDateGetFullYear0007
     * @tc.desc Verify that getFullYear() returns leap year for Feb 29 date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 29);
      let year: int = date.getFullYear();
      expect(year).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_0800
     * @tc.name testDateGetFullYear0008
     * @tc.desc Verify that getFullYear() returns 2000 for century leap year Feb 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2000, 1, 29);
      let year: int = date.getFullYear();
      expect(year).assertEqual(2000);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_0900
     * @tc.name testDateGetFullYear0009
     * @tc.desc Verify that getFullYear() returns 1900 for non-century leap year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(1900, 0, 1);
      let year: int = date.getFullYear();
      expect(year).assertEqual(1900);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_1000
     * @tc.name testDateGetFullYear0010
     * @tc.desc Verify that getFullYear() returns 9999 for large year value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(9999, 0, 1);
      let year: int = date.getFullYear();
      expect(year).assertEqual(9999);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_1100
     * @tc.name testDateGetFullYear0011
     * @tc.desc Verify that getFullYear() return value is an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 2);
      let year: int = date.getFullYear();
      expect(year).assertEqual(2024);
      expect(Number.isInteger(year)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_1200
     * @tc.name testDateGetFullYear0012
     * @tc.desc Verify that getFullYear() returns 4-digit year value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 2);
      let year: int = date.getFullYear();
      expect(year >= 1000 && year <= 9999).assertTrue();
      expect(year).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_1300
     * @tc.name testDateGetFullYear0013
     * @tc.desc Verify that getFullYear() return value can be used in arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 2);
      let year: int = date.getFullYear();
      expect(year + 1).assertEqual(2025);
      expect(year - 1).assertEqual(2023);
      expect(year * 2).assertEqual(4048);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_1400
     * @tc.name testDateGetFullYear0014
     * @tc.desc Verify that getFullYear() return value can be converted to string via toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 2);
      let year: int = date.getFullYear();
      expect(year.toString()).assertEqual("2024");
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_1500
     * @tc.name testDateGetFullYear0015
     * @tc.desc Verify that getFullYear() returns same value on multiple calls of same Date object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 2);
      let years: int[] = [];
      for (let i = 0; i < 10; i++) {
        years.push(date.getFullYear());
      }
      for (let i = 0; i < years.length; i++) {
        expect(years[i]).assertEqual(2024);
      }
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_1600
     * @tc.name testDateGetFullYear0016
     * @tc.desc Verify that calling getFullYear() on non-Date object throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let obj: Object = {};
        (obj as Date).getFullYear();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_1700
     * @tc.name testDateGetFullYear0017
     * @tc.desc Verify that finally block always executes after getFullYear() call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 2);
      let year: int = date.getFullYear();
      expect(year).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_1800
     * @tc.name testDateGetFullYear0018
     * @tc.desc Verify that getFullYear() works with Date constructed from year, month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 5);
      expect(date.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_1900
     * @tc.name testDateGetFullYear0019
     * @tc.desc Verify that getFullYear() works with Date constructed from timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 2);
      const timestamp = date.getTime();
      const dateFromTimestamp = new Date(0, 0, 1);
      dateFromTimestamp.setTime(timestamp);
      expect(dateFromTimestamp.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_2000
     * @tc.name testDateGetFullYear0020
     * @tc.desc Verify that getFullYear() works with Date constructed from date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date("2024-01-02");
      expect(date.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_2100
     * @tc.name testDateGetFullYear0021
     * @tc.desc Verify that getFullYear() works with Date constructed from full parameters including milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 5, 15, 10, 30, 0, 500);
      expect(date.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_2200
     * @tc.name testDateGetFullYear0022
     * @tc.desc Verify that getFullYear() returns current year for new Date() constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date();
      let year: int = date.getFullYear();
      expect(year >= 1970).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_2300
     * @tc.name testDateGetFullYear0023
     * @tc.desc Verify that getFullYear() returns correct year at year end Dec 31 23:59:59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 11, 31, 23, 59, 59);
      expect(date.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_2400
     * @tc.name testDateGetFullYear0024
     * @tc.desc Verify that getFullYear() returns different years across year boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date2024 = new Date(2024, 11, 31, 23, 59, 59);
      const date2025 = new Date(2025, 0, 1, 0, 0, 0);
      expect(date2024.getFullYear()).assertEqual(2024);
      expect(date2025.getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_2500
     * @tc.name testDateGetFullYear0025
     * @tc.desc Verify that getFullYear() returns 2100 for non-leap year divisible by 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2100, 0, 1);
      expect(date.getFullYear()).assertEqual(2100);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_2600
     * @tc.name testDateGetFullYear0026
     * @tc.desc Verify that getFullYear() returns 2020 for ordinary leap year divisible by 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2020, 1, 29);
      expect(date.getFullYear()).assertEqual(2020);
      expect(date.getDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_2700
     * @tc.name testDateGetFullYear0027
     * @tc.desc Verify that getFullYear() returns 2023 for non-leap year not divisible by 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 1, 28);
      expect(date.getFullYear()).assertEqual(2023);
      expect(date.getDate()).assertEqual(28);
    });

    /**
     * @tc.number SUB_DATE_GET_FULL_YEAR_CHK_2800
     * @tc.name testDateGetFullYear0028
     * @tc.desc Verify that getFullYear() handles timezone boundary at year transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDateGetFullYear0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(Date.UTC(2024, 0, 1, 0, 0, 0));
      let year: int = date.getFullYear();
      expect(year >= 2023 && year <= 2024).assertTrue();
    });
  })
};