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

export default function DateSetUTCMonthTest(): void {
  describe('DateSetUTCMonthTest', () => {
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
     * @tc.number SUB_DATE_SET_UTC_MONTH_0100
     * @tc.name testDateSetUTCMonth0001
     * @tc.desc Verify setUTCMonth with required month parameter sets UTC month correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(1);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_0200
     * @tc.name testDateSetUTCMonth0002
     * @tc.desc Verify setUTCMonth without parameters causes expected behavior or runtime behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCMonth(0);
      expect(date.getUTCMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_0300
     * @tc.name testDateSetUTCMonth0003
     * @tc.desc Verify setUTCMonth with extra parameters beyond overload 1 matches overload 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(1, 2);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_0600
     * @tc.name testDateSetUTCMonth0006
     * @tc.desc Verify setUTCMonth accepts at most 2 parameters (month, date)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCMonth(1, 2);
      expect(date.getUTCMonth()).assertEqual(1);
      expect(date.getUTCDate()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_0800
     * @tc.name testDateSetUTCMonth0008
     * @tc.desc Verify setUTCMonth with month 6 representing July
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(6);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_0900
     * @tc.name testDateSetUTCMonth0009
     * @tc.desc Verify setUTCMonth with month 11 representing December
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(11);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_1000
     * @tc.name testDateSetUTCMonth0010
     * @tc.desc Verify setUTCMonth with month 5 representing June
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(5);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_1300
     * @tc.name testDateSetUTCMonth0013
     * @tc.desc Verify setUTCMonth with negative month -1 rolls back to December of previous year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2023, 5, 15);
      let result = date.setUTCMonth(-1);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_1400
     * @tc.name testDateSetUTCMonth0014
     * @tc.desc Verify setUTCMonth with month 12 rolls over to January of next year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2023, 5, 15);
      let result = date.setUTCMonth(12);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_1500
     * @tc.name testDateSetUTCMonth0015
     * @tc.desc Verify setUTCMonth with int minimum value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(-2147483648);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_1600
     * @tc.name testDateSetUTCMonth0016
     * @tc.desc Verify setUTCMonth with int maximum value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(2147483647);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_2400
     * @tc.name testDateSetUTCMonth0024
     * @tc.desc Verify setUTCMonth with date parameter 1 as first day of month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(1, 1);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_2500
     * @tc.name testDateSetUTCMonth0025
     * @tc.desc Verify setUTCMonth with date parameter 15 as mid-month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(1, 15);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_2600
     * @tc.name testDateSetUTCMonth0026
     * @tc.desc Verify setUTCMonth with date parameter 28 as common end-of-month value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(1, 28);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_2700
     * @tc.name testDateSetUTCMonth0027
     * @tc.desc Verify setUTCMonth with date parameter 31 as maximum end-of-month day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(0, 31);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_3000
     * @tc.name testDateSetUTCMonth0030
     * @tc.desc Verify setUTCMonth with date parameter 0 overflows to last day of previous month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2023, 5, 15);
      let result = date.setUTCMonth(1, 0);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_3100
     * @tc.name testDateSetUTCMonth0031
     * @tc.desc Verify setUTCMonth with negative date parameter -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2023, 5, 15);
      let result = date.setUTCMonth(1, -1);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_3200
     * @tc.name testDateSetUTCMonth0032
     * @tc.desc Verify setUTCMonth with date parameter 32 rolls over to next month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(0, 32);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_3300
     * @tc.name testDateSetUTCMonth0033
     * @tc.desc Verify setUTCMonth with date 29 in February of non-leap year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2023, 0, 1);
      let result = date.setUTCMonth(1, 29);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_3400
     * @tc.name testDateSetUTCMonth0034
     * @tc.desc Verify setUTCMonth with date parameter int maximum value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(1, 2147483647);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_3500
     * @tc.name testDateSetUTCMonth0035
     * @tc.desc Verify setUTCMonth with date parameter int minimum value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(1, -2147483648);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_4200
     * @tc.name testDateSetUTCMonth0042
     * @tc.desc Verify setUTCMonth overload 1 returns long timestamp type and updated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(1);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_4600
     * @tc.name testDateSetUTCMonth0046
     * @tc.desc Verify setUTCMonth overload 2 returns long timestamp type and updated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(1, 2);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_4800
     * @tc.name testDateSetUTCMonth0048
     * @tc.desc Verify setUTCMonth sets both month and date correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCMonth(5, 20);
      expect(date.getUTCMonth()).assertEqual(5);
      expect(date.getUTCDate()).assertEqual(20);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_4900
     * @tc.name testDateSetUTCMonth0049
     * @tc.desc Verify setUTCMonth returns positive timestamp for date after 1970
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(1);
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_5000
     * @tc.name testDateSetUTCMonth0050
     * @tc.desc Verify setUTCMonth returns value close to zero for epoch time 1970-01-01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCMonth(0, 1);
      expect(date.getUTCMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_5100
     * @tc.name testDateSetUTCMonth0051
     * @tc.desc Verify setUTCMonth returns negative timestamp for date before 1970
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(-13);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_5400
     * @tc.name testDateSetUTCMonth0054
     * @tc.desc Verify setUTCMonth return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(1);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_5500
     * @tc.name testDateSetUTCMonth0055
     * @tc.desc Verify setUTCMonth return value is an integer without fractional part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMonth(1, 2);
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_5600
     * @tc.name testDateSetUTCMonth0056
     * @tc.desc Verify consecutive setUTCMonth calls each return latest timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let r1 = date.setUTCMonth(1);
      let r2 = date.setUTCMonth(6);
      expect(r2 !== r1).assertTrue();
      expect(date.getUTCMonth()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_5700
     * @tc.name testDateSetUTCMonth0057
     * @tc.desc Verify other UTC fields remain unchanged after setUTCMonth overload 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2023, 5, 15, 10, 30, 45, 500);
      let prevDate = date.getUTCDate();
      let prevHours = date.getUTCHours();
      date.setUTCMonth(3);
      expect(date.getUTCDate()).assertEqual(prevDate);
      expect(date.getUTCHours()).assertEqual(prevHours);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_5800
     * @tc.name testDateSetUTCMonth0058
     * @tc.desc Verify setUTCMonth with month 12 carries over to January of next year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15));
      date.setUTCMonth(12);
      expect(date.getUTCFullYear()).assertEqual(2024);
      expect(date.getUTCMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_5900
     * @tc.name testDateSetUTCMonth0059
     * @tc.desc Verify setUTCMonth with month -1 rolls back to December of previous year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15));
      date.setUTCMonth(-1);
      expect(date.getUTCFullYear()).assertEqual(2022);
      expect(date.getUTCMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MONTH_6000
     * @tc.name testDateSetUTCMonth0060
     * @tc.desc Verify setUTCMonth with February date 31 auto-carries to March
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMonth0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 0, 1));
      date.setUTCMonth(1, 31);
      expect(date.getUTCMonth()).assertEqual(2);
      expect(date.getUTCDate()).assertEqual(3);
    });

  });
}