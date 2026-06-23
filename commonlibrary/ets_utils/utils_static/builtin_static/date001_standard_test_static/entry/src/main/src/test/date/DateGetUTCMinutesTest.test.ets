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

export default function DateGetUTCMinutesTest(): void {
  describe('DateGetUTCMinutesTest', () => {
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
     * @tc.number SUB_DATE_GET_UTC_MNTS_0100
     * @tc.name testDateGetUTCMinutes0001
     * @tc.desc Verify getUTCMinutes with no arguments returns 0 for timestamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCMinutes();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_0800
     * @tc.name testDateGetUTCMinutes0008
     * @tc.desc Verify getUTCMinutes returns 30 for UTC minute 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 9, 30, 0));
      let result = date.getUTCMinutes();
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_0900
     * @tc.name testDateGetUTCMinutes0009
     * @tc.desc Verify getUTCMinutes returns 45 for UTC minute 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 12, 45, 0));
      let result = date.getUTCMinutes();
      expect(result).assertEqual(45);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_1000
     * @tc.name testDateGetUTCMinutes0010
     * @tc.desc Verify getUTCMinutes returns 15 for UTC minute 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 3, 10, 15, 15, 0));
      let result = date.getUTCMinutes();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_1300
     * @tc.name testDateGetUTCMinutes0013
     * @tc.desc Verify getUTCMinutes returns maximum value 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 23, 59, 0));
      let result = date.getUTCMinutes();
      expect(result).assertEqual(59);
      expect(result <= 59).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_1400
     * @tc.name testDateGetUTCMinutes0014
     * @tc.desc Verify getUTCMinutes boundary value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 0, 1, 0));
      let result = date.getUTCMinutes();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_1500
     * @tc.name testDateGetUTCMinutes0015
     * @tc.desc Verify getUTCMinutes boundary value 58
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 23, 58, 0));
      let result = date.getUTCMinutes();
      expect(result).assertEqual(58);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_1600
     * @tc.name testDateGetUTCMinutes0016
     * @tc.desc Verify getUTCMinutes boundary value 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 0, 29, 0));
      let result = date.getUTCMinutes();
      expect(result).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_1900
     * @tc.name testDateGetUTCMinutes0019
     * @tc.desc Verify getUTCMinutes returns integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCMinutes();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_2000
     * @tc.name testDateGetUTCMinutes0020
     * @tc.desc Verify getUTCMinutes returns value in range 0-59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 6, 20, 14, 30, 0));
      let result = date.getUTCMinutes();
      expect(result >= 0 && result <= 59).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_2700
     * @tc.name testDateGetUTCMinutes0027
     * @tc.desc Verify getUTCMinutes ignores milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ms = 10 * 3600000 + 30 * 60000 + 45 * 1000 + 500;
      const date = new Date(ms);
      expect(date.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_3200
     * @tc.name testDateGetUTCMinutes0032
     * @tc.desc Verify getUTCMinutes stability with multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 8, 30, 0));
      let r1 = date.getUTCMinutes();
      let r2 = date.getUTCMinutes();
      let r3 = date.getUTCMinutes();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_3400
     * @tc.name testDateGetUTCMinutes0034
     * @tc.desc Verify getUTCMinutes for all values 0 to 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i <= 59; i++) {
        const date = new Date(Date.UTC(2024, 0, 1, 0, i));
        expect(date.getUTCMinutes()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_3600
     * @tc.name testDateGetUTCMinutes0036
     * @tc.desc Verify getUTCMinutes returns 15 for quarter past
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 10, 15, 0));
      expect(date.getUTCMinutes()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_3800
     * @tc.name testDateGetUTCMinutes0038
     * @tc.desc Verify getUTCMinutes returns 45 for three quarters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 10, 45, 0));
      expect(date.getUTCMinutes()).assertEqual(45);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_3900
     * @tc.name testDateGetUTCMinutes0039
     * @tc.desc Verify getUTCMinutes returns 59 for last minute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 23, 59, 0));
      expect(date.getUTCMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_4300
     * @tc.name testDateGetUTCMinutes0043
     * @tc.desc Verify getUTCMinutes handles 60 minutes crossing hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 10, 60, 0));
      expect(date.getUTCMinutes()).assertEqual(0);
      expect(date.getUTCHours()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_4400
     * @tc.name testDateGetUTCMinutes0044
     * @tc.desc Verify getUTCMinutes handles 90 minutes crossing hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 10, 90, 0));
      expect(date.getUTCMinutes()).assertEqual(30);
      expect(date.getUTCHours()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_4500
     * @tc.name testDateGetUTCMinutes0045
     * @tc.desc Verify getUTCMinutes handles negative minutes crossing hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 1, -1));
      expect(date.getUTCMinutes()).assertEqual(59);
      expect(date.getUTCHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_4800
     * @tc.name testDateGetUTCMinutes0048
     * @tc.desc Verify getUTCMinutes with string construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date('2024-06-15T14:30:00Z');
      expect(date.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_5000
     * @tc.name testDateGetUTCMinutes0050
     * @tc.desc Verify getUTCMinutes vs getMinutes difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 10, 30, 0));
      let utcMinutes = date.getUTCMinutes();
      let localMinutes = date.getMinutes();
      expect(utcMinutes).assertEqual(30);
      expect(utcMinutes >= 0 && utcMinutes <= 59).assertTrue();
      expect(localMinutes >= 0 && localMinutes <= 59).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_5200
     * @tc.name testDateGetUTCMinutes0052
     * @tc.desc Verify getUTCMinutes after setUTCMinutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 3, 0, 0));
      date.setUTCMinutes(45);
      expect(date.getUTCMinutes()).assertEqual(45);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_5500
     * @tc.name testDateGetUTCMinutes0055
     * @tc.desc Verify getUTCMinutes after setUTCMinutes with overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 3, 0, 0));
      date.setUTCMinutes(60);
      expect(date.getUTCMinutes()).assertEqual(0);
      expect(date.getUTCHours()).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_5600
     * @tc.name testDateGetUTCMinutes0056
     * @tc.desc Verify getUTCMinutes after setUTCMinutes with negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 3, 0, 0));
      date.setUTCMinutes(-1);
      expect(date.getUTCMinutes()).assertEqual(59);
      expect(date.getUTCHours()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_5700
     * @tc.name testDateGetUTCMinutes0057
     * @tc.desc Verify getUTCMinutes returns same value for different dates with same UTC minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(Date.UTC(2024, 0, 2, 10, 30, 0));
      const date2 = new Date(Date.UTC(2023, 5, 20, 15, 30, 0));
      expect(date1.getUTCMinutes()).assertEqual(date2.getUTCMinutes());
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_5800
     * @tc.name testDateGetUTCMinutes0058
     * @tc.desc Verify getUTCMinutes returns different values for different minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(Date.UTC(2024, 0, 2, 3, 15, 0));
      const date2 = new Date(Date.UTC(2024, 0, 2, 3, 45, 0));
      expect(date1.getUTCMinutes()).assertEqual(15);
      expect(date2.getUTCMinutes()).assertEqual(45);
      expect(date1.getUTCMinutes() !== date2.getUTCMinutes()).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_6100
     * @tc.name testDateGetUTCMinutes0061
     * @tc.desc Verify getUTCMinutes with large future timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2099, 11, 31, 23, 59, 0));
      let result = date.getUTCMinutes();
      expect(result).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_6300
     * @tc.name testDateGetUTCMinutes0063
     * @tc.desc Verify getUTCMinutes with leap year date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 1, 29, 15, 42, 0));
      expect(date.getUTCMinutes()).assertEqual(42);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MNTS_6400
     * @tc.name testDateGetUTCMinutes0064
     * @tc.desc Verify getUTCMinutes consistency with getUTCHours and getUTCSeconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMinutes0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 3, 4, 5));
      expect(date.getUTCHours()).assertEqual(3);
      expect(date.getUTCMinutes()).assertEqual(4);
      expect(date.getUTCSeconds()).assertEqual(5);
    });

  });
}
