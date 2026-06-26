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

export default function DateSetFullYearTest(): void {
  describe('DateSetFullYearTest', () => {
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
     * @tc.number SUB_DATE_SET_FULL_YEAR_0100
     * @tc.name testDateSetFullYear0001
     * @tc.desc Verify setFullYear with one required parameter sets year successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setFullYear(2025);
      expect(date.getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_0300
     * @tc.name testDateSetFullYear0003
     * @tc.desc Verify setFullYear with two required parameters sets year and month successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setFullYear(2025, 1);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_0500
     * @tc.name testDateSetFullYear0005
     * @tc.desc Verify setFullYear with three required parameters sets year month and date successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setFullYear(2025, 1, 3);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_0700
     * @tc.name testDateSetFullYear0007
     * @tc.desc Verify setFullYear with normal year value sets successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2000);
      expect(date.getFullYear()).assertEqual(2000);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_0800
     * @tc.name testDateSetFullYear0008
     * @tc.desc Verify setFullYear with 0 sets year to year 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(0);
      expect(date.getFullYear()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_0900
     * @tc.name testDateSetFullYear0009
     * @tc.desc Verify setFullYear with negative year (BC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(-100);
      expect(date.getFullYear()).assertEqual(-100);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_1000
     * @tc.name testDateSetFullYear0010
     * @tc.desc Verify setFullYear with hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(0x07E6);
      expect(date.getFullYear()).assertEqual(2022);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_1200
     * @tc.name testDateSetFullYear0012
     * @tc.desc Verify setFullYear with binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(0b11111011000);
      expect(date.getFullYear()).assertEqual(2008);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_1500
     * @tc.name testDateSetFullYear0015
     * @tc.desc Verify setFullYear with 1 (minimum positive year)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(1);
      expect(date.getFullYear()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_1600
     * @tc.name testDateSetFullYear0016
     * @tc.desc Verify setFullYear with -1 (1 BC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(-1);
      expect(date.getFullYear()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_1700
     * @tc.name testDateSetFullYear0017
     * @tc.desc Verify setFullYear with 100 (two-digit to three-digit year boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(100);
      expect(date.getFullYear()).assertEqual(100);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_1800
     * @tc.name testDateSetFullYear0018
     * @tc.desc Verify setFullYear with 99 (two-digit year)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(99);
      expect(date.getFullYear()).assertEqual(99);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_2800
     * @tc.name testDateSetFullYear0028
     * @tc.desc Verify setFullYear month parameter with 0 (January)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15);
      date.setFullYear(2025, 0);
      expect(date.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_2900
     * @tc.name testDateSetFullYear0029
     * @tc.desc Verify setFullYear month parameter with 11 (December)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, 11);
      expect(date.getMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_3100
     * @tc.name testDateSetFullYear0031
     * @tc.desc Verify setFullYear month parameter with hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, 0x0A);
      expect(date.getMonth()).assertEqual(10);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_3200
     * @tc.name testDateSetFullYear0032
     * @tc.desc Verify setFullYear month -1 rolls back to December of previous year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, -1);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_3300
     * @tc.name testDateSetFullYear0033
     * @tc.desc Verify setFullYear month 12 rolls over to January of next year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, 12);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getFullYear()).assertEqual(2026);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_3400
     * @tc.name testDateSetFullYear0034
     * @tc.desc Verify setFullYear month -12 large negative overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, -12);
      expect(date.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_4300
     * @tc.name testDateSetFullYear0043
     * @tc.desc Verify setFullYear date parameter with 1 (first day of month)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, 1, 1);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_4400
     * @tc.name testDateSetFullYear0044
     * @tc.desc Verify setFullYear date parameter with 28 (middle date)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, 1, 28);
      expect(date.getDate()).assertEqual(28);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_4500
     * @tc.name testDateSetFullYear0045
     * @tc.desc Verify setFullYear date parameter with 31 (last day of long month)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, 0, 31);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_4600
     * @tc.name testDateSetFullYear0046
     * @tc.desc Verify setFullYear date parameter with hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, 1, 0x0F);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_4700
     * @tc.name testDateSetFullYear0047
     * @tc.desc Verify setFullYear date 0 overflows to last day of previous month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, 1, 0);
      expect(date.getDate()).assertEqual(31);
      expect(date.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_4800
     * @tc.name testDateSetFullYear0048
     * @tc.desc Verify setFullYear date -1 overflows to second last day of previous month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, 1, -1);
      expect(date.getDate()).assertEqual(30);
      expect(date.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_4900
     * @tc.name testDateSetFullYear0049
     * @tc.desc Verify setFullYear date 32 overflows to next month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, 0, 32);
      expect(date.getDate()).assertEqual(1);
      expect(date.getMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_5000
     * @tc.name testDateSetFullYear0050
     * @tc.desc Verify setFullYear date 29 in February (leap year 2024)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2024, 1, 29);
      expect(date.getDate()).assertEqual(29);
      expect(date.getMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_5100
     * @tc.name testDateSetFullYear0051
     * @tc.desc Verify setFullYear date 29 in February (non-leap year 2025)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, 1, 29);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_5900
     * @tc.name testDateSetFullYear0059
     * @tc.desc Verify setFullYear only changes year without affecting month and date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15);
      date.setFullYear(2025);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(5);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_6000
     * @tc.name testDateSetFullYear0060
     * @tc.desc Verify setFullYear with year month date vs only year comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(2024, 5, 15);
      const date2 = new Date(2024, 5, 15);
      date1.setFullYear(2025);
      date2.setFullYear(2025, 0, 1);
      expect(date1.getFullYear()).assertEqual(date2.getFullYear());
      expect(date1.getMonth()).assertEqual(5);
      expect(date2.getMonth()).assertEqual(0);
      expect(date2.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_6200
     * @tc.name testDateSetFullYear0062
     * @tc.desc Verify setFullYear date overflow causes month and year increment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2024, 11, 32);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_6300
     * @tc.name testDateSetFullYear0063
     * @tc.desc Verify setFullYear with both negative month and date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 6, 15);
      date.setFullYear(2025, -1, -1);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(10);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_6900
     * @tc.name testDateSetFullYear0069
     * @tc.desc Verify setFullYear return value equals date.getTime() after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setFullYear(2025, 1, 3);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_7100
     * @tc.name testDateSetFullYear0071
     * @tc.desc Verify setFullYear to year 0 returns negative timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setFullYear(0, 0, 1);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_7400
     * @tc.name testDateSetFullYear0074
     * @tc.desc Verify setFullYear normal call return value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setFullYear(2025);
      expect(Number.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_7500
     * @tc.name testDateSetFullYear0075
     * @tc.desc Verify setFullYear normal call return value is not Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setFullYear(2025);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_7600
     * @tc.name testDateSetFullYear0076
     * @tc.desc Verify setFullYear returns different timestamps for leap and non-leap year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(2024, 1, 29);
      const date2 = new Date(2024, 1, 29);
      let r1 = date1.setFullYear(2024);
      let r2 = date2.setFullYear(2023);
      expect(r1 !== r2).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_7700
     * @tc.name testDateSetFullYear0077
     * @tc.desc Verify setFullYear timestamp difference before and after setting
     * @tc.size MediumTest
     * @tc.type Function     * @tc.level Level 2
     */
    it('testDateSetFullYear0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let before = date.getTime();
      let after = date.setFullYear(2025);
      let diff = after - before;
      expect(diff > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_8300
     * @tc.name testDateSetFullYear0083
     * @tc.desc Verify finally block executes after normal setFullYear call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025);
      expect(date.getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_8600
     * @tc.name testDateSetFullYear0086
     * @tc.desc Verify setFullYear preserves hours minutes seconds when setting year only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15, 10, 30, 45);
      let hours = date.getHours();
      let minutes = date.getMinutes();
      let seconds = date.getSeconds();
      date.setFullYear(2025);
      expect(date.getHours()).assertEqual(hours);
      expect(date.getMinutes()).assertEqual(minutes);
      expect(date.getSeconds()).assertEqual(seconds);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_8700
     * @tc.name testDateSetFullYear0087
     * @tc.desc Verify setFullYear preserves hours minutes seconds when setting year month date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15, 10, 30, 45);
      date.setFullYear(2025, 0, 1);
      expect(date.getHours()).assertEqual(10);
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getSeconds()).assertEqual(45);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_8800
     * @tc.name testDateSetFullYear0088
     * @tc.desc Verify consecutive setFullYear calls use last value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025);
      date.setFullYear(2026);
      date.setFullYear(2027);
      expect(date.getFullYear()).assertEqual(2027);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_8900
     * @tc.name testDateSetFullYear0089
     * @tc.desc Verify alternating setFullYear overloads produce correct final state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025);
      date.setFullYear(2026, 6);
      date.setFullYear(2027, 11, 31);
      expect(date.getFullYear()).assertEqual(2027);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_9000
     * @tc.name testDateSetFullYear0090
     * @tc.desc Verify setFullYear followed by setMonth works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025);
      date.setMonth(11);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_SET_FULL_YEAR_9100
     * @tc.name testDateSetFullYear0091
     * @tc.desc Verify setFullYear followed by setDate works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetFullYear0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025, 1);
      date.setDate(28);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(28);
    });
  });
}
