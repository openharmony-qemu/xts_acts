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

export default function DateGetUTCMonthTest(): void {
  describe('DateGetUTCMonthTest', () => {
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
     * @tc.number SUB_DATE_GET_UTC_MONTH_0100
     * @tc.name testDateGetUTCMonth0001
     * @tc.desc Verify getUTCMonth with no arguments returns 0 for timestamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result: int = date.getUTCMonth();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_0900
     * @tc.name testDateGetUTCMonth0009
     * @tc.desc Verify getUTCMonth returns 1 for February UTC date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 1, 1));
      let result: int = date.getUTCMonth();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_1300
     * @tc.name testDateGetUTCMonth0013
     * @tc.desc Verify getUTCMonth returns 5 for June UTC date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 1));
      let result: int = date.getUTCMonth();
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_1900
     * @tc.name testDateGetUTCMonth0019
     * @tc.desc Verify getUTCMonth returns 11 for December UTC date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 11, 1));
      let result: int = date.getUTCMonth();
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_2100
     * @tc.name testDateGetUTCMonth0021
     * @tc.desc Verify getUTCMonth returns maximum boundary value 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 11, 31, 23, 59, 59, 999));
      let result: int = date.getUTCMonth();
      expect(result).assertEqual(11);
      expect(result <= 11).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_2900
     * @tc.name testDateGetUTCMonth0029
     * @tc.desc Verify getUTCMonth return value is an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 12, 30, 45));
      let result: int = date.getUTCMonth();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_3000
     * @tc.name testDateGetUTCMonth0030
     * @tc.desc Verify getUTCMonth return value is within 0-11 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 6, 20));
      let result: int = date.getUTCMonth();
      expect(result >= 0 && result <= 11).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_3600
     * @tc.name testDateGetUTCMonth0036
     * @tc.desc Verify getUTCMonth with month overflow 13 carries over to next year January
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 12, 1));
      let result: int = date.getUTCMonth();
      expect(result).assertEqual(0);
      expect(date.getUTCFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_3700
     * @tc.name testDateGetUTCMonth0037
     * @tc.desc Verify getUTCMonth with negative month rolls back to previous year December
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, -1, 1));
      let result: int = date.getUTCMonth();
      expect(result).assertEqual(11);
      expect(date.getUTCFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_3800
     * @tc.name testDateGetUTCMonth0038
     * @tc.desc Verify getUTCMonth with month -12 rolls back correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, -12, 1));
      let result: int = date.getUTCMonth();
      expect(result).assertEqual(0);
      expect(date.getUTCFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_3900
     * @tc.name testDateGetUTCMonth0039
     * @tc.desc Verify getUTCMonth with month 24 carries over two years
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 24, 1));
      let result: int = date.getUTCMonth();
      expect(result).assertEqual(0);
      expect(date.getUTCFullYear()).assertEqual(2026);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_4800
     * @tc.name testDateGetUTCMonth0048
     * @tc.desc Verify finally block executes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result: int = date.getUTCMonth();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_5900
     * @tc.name testDateGetUTCMonth0059
     * @tc.desc Verify UTC date overflow causes month cross
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 31));
      date.setUTCDate(date.getUTCDate() + 1);
      expect(date.getUTCMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_6000
     * @tc.name testDateGetUTCMonth0060
     * @tc.desc Verify UTC date overflow causes year cross
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 11, 31));
      date.setUTCDate(date.getUTCDate() + 1);
      expect(date.getUTCMonth()).assertEqual(0);
      expect(date.getUTCFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_6100
     * @tc.name testDateGetUTCMonth0061
     * @tc.desc Verify UTC date day 0 rolls back to previous month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 2, 0));
      expect(date.getUTCMonth()).assertEqual(1);
      expect(date.getUTCDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_6200
     * @tc.name testDateGetUTCMonth0062
     * @tc.desc Verify non-leap year Feb 29 overflows to March UTC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 1, 29));
      expect(date.getUTCMonth()).assertEqual(2);
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_7000
     * @tc.name testDateGetUTCMonth0070
     * @tc.desc Verify UTC year end Dec 31 23:59:59 getUTCMonth returns 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 11, 31, 23, 59, 59));
      expect(date.getUTCMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_7100
     * @tc.name testDateGetUTCMonth0071
     * @tc.desc Verify UTC cross-month moment getUTCMonth returns different months
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(Date.UTC(2024, 0, 31, 23, 59, 59));
      const date2 = new Date(Date.UTC(2024, 1, 1, 0, 0, 0));
      expect(date1.getUTCMonth()).assertEqual(0);
      expect(date2.getUTCMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_7200
     * @tc.name testDateGetUTCMonth0072
     * @tc.desc Verify UTC cross-year moment getUTCMonth returns correct months
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date2024 = new Date(Date.UTC(2024, 11, 31, 23, 59, 59));
      const date2025 = new Date(Date.UTC(2025, 0, 1, 0, 0, 0));
      expect(date2024.getUTCMonth()).assertEqual(11);
      expect(date2025.getUTCMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_7300
     * @tc.name testDateGetUTCMonth0073
     * @tc.desc Verify 31-day month January getUTCMonth returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 31));
      expect(date.getUTCMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MONTH_8400
     * @tc.name testDateGetUTCMonth0084
     * @tc.desc Verify consecutive multiple calls to getUTCMonth return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMonth0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15));
      let months: int[] = [];
      for (let i = 0; i < 10; i++) {
        months.push(date.getUTCMonth());
      }
      for (let i = 0; i < months.length; i++) {
        expect(months[i]).assertEqual(5);
      }
    });
  });
}