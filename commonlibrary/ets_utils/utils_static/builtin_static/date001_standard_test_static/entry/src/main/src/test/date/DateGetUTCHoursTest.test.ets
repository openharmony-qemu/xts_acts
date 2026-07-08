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

export default function DateGetUTCHoursTest(): void {
  describe('DateGetUTCHoursTest', () => {
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
     * @tc.number SUB_DATE_GET_UTC_HOURS_0100
     * @tc.name testDateGetUTCHours0001
     * @tc.desc Verify getUTCHours with no arguments returns 0 for timestamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCHours();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_0600
     * @tc.name testDateGetUTCHours0006
     * @tc.desc Verify getUTCHours returns 9 for UTC 9 AM
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 9, 0, 0));
      let result = date.getUTCHours();
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_0700
     * @tc.name testDateGetUTCHours0007
     * @tc.desc Verify getUTCHours returns 12 for UTC noon
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 12, 0, 0));
      let result = date.getUTCHours();
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_0800
     * @tc.name testDateGetUTCHours0008
     * @tc.desc Verify getUTCHours returns 15 for UTC 3 PM
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 3, 10, 15, 0, 0));
      let result = date.getUTCHours();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_0900
     * @tc.name testDateGetUTCHours0009
     * @tc.desc Verify getUTCHours returns 23 for UTC 11 PM
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 6, 20, 23, 0, 0));
      let result = date.getUTCHours();
      expect(result).assertEqual(23);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_1200
     * @tc.name testDateGetUTCHours0012
     * @tc.desc Verify getUTCHours returns maximum value 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 23, 0, 0));
      let result = date.getUTCHours();
      expect(result).assertEqual(23);
      expect(result <= 23).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_1300
     * @tc.name testDateGetUTCHours0013
     * @tc.desc Verify getUTCHours returns 1 near minimum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 1, 0, 0));
      let result = date.getUTCHours();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_1400
     * @tc.name testDateGetUTCHours0014
     * @tc.desc Verify getUTCHours returns 22 near maximum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 22, 0, 0));
      let result = date.getUTCHours();
      expect(result).assertEqual(22);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_1500
     * @tc.name testDateGetUTCHours0015
     * @tc.desc Verify getUTCHours returns 11 for last AM hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 11, 0, 0));
      let result = date.getUTCHours();
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_1600
     * @tc.name testDateGetUTCHours0016
     * @tc.desc Verify getUTCHours returns 13 for first PM hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 13, 0, 0));
      let result = date.getUTCHours();
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_1800
     * @tc.name testDateGetUTCHours0018
     * @tc.desc Verify getUTCHours returns an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCHours();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_1900
     * @tc.name testDateGetUTCHours0019
     * @tc.desc Verify getUTCHours return value is within 0-23 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 6, 20, 14, 0, 0));
      let result = date.getUTCHours();
      expect(result >= 0 && result <= 23).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_2000
     * @tc.name testDateGetUTCHours0020
     * @tc.desc Verify getUTCHours does not return NaN for valid date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCHours();
      expect(Number.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_2100
     * @tc.name testDateGetUTCHours0021
     * @tc.desc Verify getUTCHours return value is non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCHours();
      expect(result >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_2200
     * @tc.name testDateGetUTCHours0022
     * @tc.desc Verify getUTCHours return value is not null or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCHours();
      expect(result !== null).assertTrue();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_2600
     * @tc.name testDateGetUTCHours0026
     * @tc.desc Verify getUTCHours ignores minutes and seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ms = 10 * 3600000 + 30 * 60000 + 45 * 1000;
      const date = new Date(ms);
      expect(date.getUTCHours()).assertEqual(10);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_2900
     * @tc.name testDateGetUTCHours0029
     * @tc.desc Verify getUTCHours returns consistent results on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 8, 0, 0));
      let r1 = date.getUTCHours();
      let r2 = date.getUTCHours();
      let r3 = date.getUTCHours();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(8);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_3000
     * @tc.name testDateGetUTCHours0030
     * @tc.desc Verify getUTCHours type safety for non-Date object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date: Date = new Date(0);
      let result = date.getUTCHours();
      expect(result >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_3200
     * @tc.name testDateGetUTCHours0032
     * @tc.desc Verify getUTCHours returns 1 at UTC 1 AM
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 1, 0, 0));
      expect(date.getUTCHours()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_3300
     * @tc.name testDateGetUTCHours0033
     * @tc.desc Verify getUTCHours returns 6 at UTC 6 AM
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 6, 0, 0));
      expect(date.getUTCHours()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_3400
     * @tc.name testDateGetUTCHours0034
     * @tc.desc Verify getUTCHours returns 12 at UTC noon
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 12, 0, 0));
      expect(date.getUTCHours()).assertEqual(12);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_3500
     * @tc.name testDateGetUTCHours0035
     * @tc.desc Verify getUTCHours returns 18 at UTC 6 PM
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 18, 0, 0));
      expect(date.getUTCHours()).assertEqual(18);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_3600
     * @tc.name testDateGetUTCHours0036
     * @tc.desc Verify getUTCHours returns 23 at UTC 11 PM
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 23, 0, 0));
      expect(date.getUTCHours()).assertEqual(23);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_3700
     * @tc.name testDateGetUTCHours0037
     * @tc.desc Verify getUTCHours with only hour parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 14));
      expect(date.getUTCHours()).assertEqual(14);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_3800
     * @tc.name testDateGetUTCHours0038
     * @tc.desc Verify getUTCHours with hour and minute parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 14, 30));
      expect(date.getUTCHours()).assertEqual(14);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_3900
     * @tc.name testDateGetUTCHours0039
     * @tc.desc Verify getUTCHours with hour, minute and second parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 14, 30, 45));
      expect(date.getUTCHours()).assertEqual(14);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_4000
     * @tc.name testDateGetUTCHours0040
     * @tc.desc Verify getUTCHours with full time parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 14, 30, 45, 500));
      expect(date.getUTCHours()).assertEqual(14);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_4100
     * @tc.name testDateGetUTCHours0041
     * @tc.desc Verify getUTCHours with UTC 24 wraps to next day 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 24, 0, 0));
      expect(date.getUTCHours()).assertEqual(0);
      expect(date.getUTCDate()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_4200
     * @tc.name testDateGetUTCHours0042
     * @tc.desc Verify getUTCHours with UTC 25 wraps to next day 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 25, 0, 0));
      expect(date.getUTCHours()).assertEqual(1);
      expect(date.getUTCDate()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_4300
     * @tc.name testDateGetUTCHours0043
     * @tc.desc Verify getUTCHours with negative hour rolls back to previous day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, -1));
      expect(date.getUTCHours()).assertEqual(23);
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_4400
     * @tc.name testDateGetUTCHours0044
     * @tc.desc Verify getUTCHours with Date.UTC construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 8, 0, 0));
      expect(date.getUTCHours()).assertEqual(8);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_4600
     * @tc.name testDateGetUTCHours0046
     * @tc.desc Verify getUTCHours with ISO string construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date('2024-06-15T14:30:00Z');
      expect(date.getUTCHours()).assertEqual(14);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_4700
     * @tc.name testDateGetUTCHours0047
     * @tc.desc Verify getUTCHours with current time returns 0-23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.getUTCHours();
      expect(result >= 0 && result <= 23).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_4800
     * @tc.name testDateGetUTCHours0048
     * @tc.desc Verify getUTCHours and getHours difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 10, 0, 0));
      let utcHours = date.getUTCHours();
      let localHours = date.getHours();
      expect(utcHours).assertEqual(10);
      expect(utcHours >= 0 && utcHours <= 23).assertTrue();
      expect(localHours >= 0 && localHours <= 23).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_5100
     * @tc.name testDateGetUTCHours0051
     * @tc.desc Verify getUTCHours after setUTCHours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 3, 0, 0));
      date.setUTCHours(18);
      expect(date.getUTCHours()).assertEqual(18);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_5200
     * @tc.name testDateGetUTCHours0052
     * @tc.desc Verify getUTCHours returns 0 after setUTCHours(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 10, 0, 0));
      date.setUTCHours(0);
      expect(date.getUTCHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_5300
     * @tc.name testDateGetUTCHours0053
     * @tc.desc Verify getUTCHours returns 23 after setUTCHours(23)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 3, 0, 0));
      date.setUTCHours(23);
      expect(date.getUTCHours()).assertEqual(23);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_5400
     * @tc.name testDateGetUTCHours0054
     * @tc.desc Verify getUTCHours after setUTCHours overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 3, 0, 0));
      date.setUTCHours(25);
      expect(date.getUTCHours()).assertEqual(1);
      expect(date.getUTCDate()).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_5500
     * @tc.name testDateGetUTCHours0055
     * @tc.desc Verify getUTCHours after setUTCHours negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 3, 0, 0));
      date.setUTCHours(-1);
      expect(date.getUTCHours()).assertEqual(23);
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_5600
     * @tc.name testDateGetUTCHours0056
     * @tc.desc Verify same UTC hours on different dates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(Date.UTC(2024, 0, 2, 10, 0, 0));
      const date2 = new Date(Date.UTC(2023, 5, 20, 10, 0, 0));
      expect(date1.getUTCHours()).assertEqual(date2.getUTCHours());
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_HOURS_5700
     * @tc.name testDateGetUTCHours0057
     * @tc.desc Verify different UTC hours on same date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCHours0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(Date.UTC(2024, 0, 2, 3, 0, 0));
      const date2 = new Date(Date.UTC(2024, 0, 2, 15, 0, 0));
      expect(date1.getUTCHours()).assertEqual(3);
      expect(date2.getUTCHours()).assertEqual(15);
      expect(date1.getUTCHours() !== date2.getUTCHours()).assertTrue();
    });

  });
}
