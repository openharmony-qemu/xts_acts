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

export default function DateSetMonthTest(): void {
  describe('DateSetMonthTest', (): void => {
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
     * @tc.number SUB_DATE_SET_MONTH_CHK_0300
     * @tc.name testDateSetMonth0003
     * @tc.desc Verify setMonth ignores extra arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(1, 15);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_0500
     * @tc.name testDateSetMonth0005
     * @tc.desc Verify setMonth with month value 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(6);
      expect(date.getMonth()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_0600
     * @tc.name testDateSetMonth0006
     * @tc.desc Verify setMonth with month value 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(11);
      expect(date.getMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_0700
     * @tc.name testDateSetMonth0007
     * @tc.desc Verify setMonth with minimum month value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15);
      let result = date.setMonth(0);
      expect(date.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_1100
     * @tc.name testDateSetMonth0011
     * @tc.desc Verify setMonth with negative month -1 decrements year and sets month to December
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(-1);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_1200
     * @tc.name testDateSetMonth0012
     * @tc.desc Verify setMonth with value 12 rolls over to next year January
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(12);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_1300
     * @tc.name testDateSetMonth0013
     * @tc.desc Verify setMonth with -12 decrements year by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(-12);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_1600
     * @tc.name testDateSetMonth0016
     * @tc.desc Verify setMonth with hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(0x0A);
      expect(date.getMonth()).assertEqual(10);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_1700
     * @tc.name testDateSetMonth0017
     * @tc.desc Verify setMonth with octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(0o7);
      expect(date.getMonth()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_1800
     * @tc.name testDateSetMonth0018
     * @tc.desc Verify setMonth with binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(0b1010);
      expect(date.getMonth()).assertEqual(10);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_2400
     * @tc.name testDateSetMonth0024
     * @tc.desc Verify setMonth overload 2 with two arguments works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(1, 3);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_2500
     * @tc.name testDateSetMonth0025
     * @tc.desc Verify setMonth with one argument matches overload 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(1);
      expect(date.getMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_2800
     * @tc.name testDateSetMonth0028
     * @tc.desc Verify setMonth overload 2 with normal month value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(5, 10);
      expect(date.getMonth()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_2900
     * @tc.name testDateSetMonth0029
     * @tc.desc Verify setMonth overload 2 with month 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15);
      let result = date.setMonth(0, 1);
      expect(date.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_3100
     * @tc.name testDateSetMonth0031
     * @tc.desc Verify setMonth overload 2 with month -1 decrements year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(-1, 15);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_3200
     * @tc.name testDateSetMonth0032
     * @tc.desc Verify setMonth overload 2 with month 12 rolls over to next year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(12, 1);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_3500
     * @tc.name testDateSetMonth0035
     * @tc.desc Verify setMonth overload 2 with normal date value 1-28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(1, 15);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_3600
     * @tc.name testDateSetMonth0036
     * @tc.desc Verify setMonth overload 2 with date 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2)
      let result = date.setMonth(1, 1)
      expect(date.getDate()).assertEqual(1)
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_3700
     * @tc.name testDateSetMonth0037
     * @tc.desc Verify setMonth overload 2 with date 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(0, 31);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_3800
     * @tc.name testDateSetMonth0038
     * @tc.desc Verify setMonth overload 2 with date 0 returns last day of previous month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(2, 0);
      expect(date.getDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_3900
     * @tc.name testDateSetMonth0039
     * @tc.desc Verify setMonth overload 2 with date -1 returns second to last day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(0, -1);
      expect(date.getDate()).assertEqual(30);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_4200
     * @tc.name testDateSetMonth0042
     * @tc.desc Verify setMonth overload 2 with date 32 rolls over to next month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(0, 32);
      expect(date.getDate()).assertEqual(1);
      expect(date.getMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_4400
     * @tc.name testDateSetMonth0044
     * @tc.desc Verify setMonth overload 2 with date 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(0, 0);
      expect(date.getDate()).assertEqual(31);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_4500
     * @tc.name testDateSetMonth0045
     * @tc.desc Verify setMonth overload 2 with hexadecimal date value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(0, 0x0F);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_4600
     * @tc.name testDateSetMonth0046
     * @tc.desc Verify setMonth overload 2 with octal date value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(0, 0o17);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_4700
     * @tc.name testDateSetMonth0047
     * @tc.desc Verify setMonth overload 2 with binary date value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(0, 0b1111);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_5400
     * @tc.name testDateSetMonth0054
     * @tc.desc Verify setMonth overload 2 with month 11 and date 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(11, 31);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_5500
     * @tc.name testDateSetMonth0055
     * @tc.desc Verify setMonth in leap year with February 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(1, 29);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_5600
     * @tc.name testDateSetMonth0056
     * @tc.desc Verify setMonth in non-leap year with February 29 rolls over to March
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2023, 0, 2);
      date.setMonth(1, 29);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_5700
     * @tc.name testDateSetMonth0057
     * @tc.desc Verify setMonth in leap year with February 30 rolls over to March
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(1, 30);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_5800
     * @tc.name testDateSetMonth0058
     * @tc.desc Verify setMonth with double overflow on month and date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(12, 32);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_5900
     * @tc.name testDateSetMonth0059
     * @tc.desc Verify setMonth with double underflow on month and date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15);
      date.setMonth(-1, -1);
      expect(date.getFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_6100
     * @tc.name testDateSetMonth0061
     * @tc.desc Verify setMonth overload 1 return value equals getTime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(6);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_6200
     * @tc.name testDateSetMonth0062
     * @tc.desc Verify setMonth overload 1 return value is positive for normal date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(6);
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_6300
     * @tc.name testDateSetMonth0063
     * @tc.desc Verify setMonth overload 1 return value is millisecond integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(1);
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_6400
     * @tc.name testDateSetMonth0064
     * @tc.desc Verify setMonth overload 1 return value correct on month overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 11, 31);
      let result = date.setMonth(12);
      expect(result).assertEqual(date.getTime());
      expect(date.getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_6500
     * @tc.name testDateSetMonth0065
     * @tc.desc Verify setMonth overload 1 return value correct with negative month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(-12);
      expect(result).assertEqual(date.getTime());
      expect(date.getFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_6700
     * @tc.name testDateSetMonth0067
     * @tc.desc Verify setMonth overload 1 return value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(1);
      expect(Number.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_6900
     * @tc.name testDateSetMonth0069
     * @tc.desc Verify setMonth overload 2 return value equals getTime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(5, 20);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_7000
     * @tc.name testDateSetMonth0070
     * @tc.desc Verify setMonth overload 2 return value is positive for normal date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(1, 15);
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_7100
     * @tc.name testDateSetMonth0071
     * @tc.desc Verify setMonth overload 2 return value is millisecond integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(1, 15);
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_7200
     * @tc.name testDateSetMonth0072
     * @tc.desc Verify setMonth overload 2 return value correct on date overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(0, 32);
      expect(result).assertEqual(date.getTime());
      expect(date.getMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_7300
     * @tc.name testDateSetMonth0073
     * @tc.desc Verify setMonth overload 2 return value correct with negative parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15);
      let result = date.setMonth(-1, -1);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_7500
     * @tc.name testDateSetMonth0075
     * @tc.desc Verify setMonth overload 2 return value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMonth(1, 15);
      expect(Number.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_8300
     * @tc.name testDateSetMonth0083
     * @tc.desc Verify documentation example for overload 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(1);
      expect(date.getMonth().toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_8400
     * @tc.name testDateSetMonth0084
     * @tc.desc Verify documentation example for overload 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(1, 3);
      expect(date.getMonth().toString()).assertEqual("1");
      expect(date.getDate()).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_8500
     * @tc.name testDateSetMonth0085
     * @tc.desc Verify consecutive setMonth calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(3);
      date.setMonth(6);
      date.setMonth(11);
      expect(date.getMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_8600
     * @tc.name testDateSetMonth0086
     * @tc.desc Verify alternating overload calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(3);
      expect(date.getMonth()).assertEqual(3);
      date.setMonth(6, 15);
      expect(date.getMonth()).assertEqual(6);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_8700
     * @tc.name testDateSetMonth0087
     * @tc.desc Verify getMonth returns set value after setMonth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(7);
      expect(date.getMonth()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_8800
     * @tc.name testDateSetMonth0088
     * @tc.desc Verify setFullYear then setMonth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025);
      date.setMonth(5);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_8900
     * @tc.name testDateSetMonth0089
     * @tc.desc Verify setMonth then setDate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMonth(5);
      date.setDate(20);
      expect(date.getMonth()).assertEqual(5);
      expect(date.getDate()).assertEqual(20);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_9000
     * @tc.name testDateSetMonth0090
     * @tc.desc Verify setMonth from epoch date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setMonth(5);
      expect(date.getMonth()).assertEqual(5);
      expect(date.getFullYear()).assertEqual(1970);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_9100
     * @tc.name testDateSetMonth0091
     * @tc.desc Verify setMonth from current time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let originalYear = date.getFullYear();
      date.setMonth(11);
      expect(date.getMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_9200
     * @tc.name testDateSetMonth0092
     * @tc.desc Verify setMonth from future date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2099, 5, 15);
      date.setMonth(11);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getFullYear()).assertEqual(2099);
    });

    /**
     * @tc.number SUB_DATE_SET_MONTH_CHK_9300
     * @tc.name testDateSetMonth0093
     * @tc.desc Verify setMonth from past date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMonth0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1970, 0, 1);
      date.setMonth(11);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getFullYear()).assertEqual(1970);
    });

  });

}

