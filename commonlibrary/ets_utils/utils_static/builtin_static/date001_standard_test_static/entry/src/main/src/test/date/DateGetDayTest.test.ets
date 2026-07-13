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

export default function DateGetDayTest(): void {
  describe('DateGetDayTest', () => {
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
     * @tc.number SUB_DATE_GET_DAY_CHK_0100
     * @tc.name testDateGetDay0001
     * @tc.desc Verify normal call to getDay() without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result: int = date.getDay();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_0200
     * @tc.name testDateGetDay0002
     * @tc.desc Verify getDay() returns 0 for Sunday (2024-01-07)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 7);
      let result: int = date.getDay();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_0300
     * @tc.name testDateGetDay0003
     * @tc.desc Verify getDay() returns 1 for Monday (2024-01-01)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1);
      let result: int = date.getDay();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_0400
     * @tc.name testDateGetDay0004
     * @tc.desc Verify getDay() returns 3 for Wednesday (2024-01-03)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 3);
      let result: int = date.getDay();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_0500
     * @tc.name testDateGetDay0005
     * @tc.desc Verify getDay() returns 4 for Thursday (2024-01-04)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 4);
      let result: int = date.getDay();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_0600
     * @tc.name testDateGetDay0006
     * @tc.desc Verify getDay() returns 5 for Friday (2024-01-05)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 5);
      let result: int = date.getDay();
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_0700
     * @tc.name testDateGetDay0007
     * @tc.desc Verify getDay() returns 6 for Saturday (2024-01-06)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 6);
      let result: int = date.getDay();
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_0800
     * @tc.name testDateGetDay0008
     * @tc.desc Verify return value is an integer without decimal part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result: int = date.getDay();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_0900
     * @tc.name testDateGetDay0009
     * @tc.desc Verify return value is not less than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 7);
      let result: int = date.getDay();
      expect(result >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_1000
     * @tc.name testDateGetDay0010
     * @tc.desc Verify return value is not greater than 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 6);
      let result: int = date.getDay();
      expect(result <= 6).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_1100
     * @tc.name testDateGetDay0011
     * @tc.desc Verify return value can be converted to string via toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result: int = date.getDay();
      expect(result.toString()).assertEqual("2");
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_1200
     * @tc.name testDateGetDay0012
     * @tc.desc Verify consecutive dates have incrementing getDay() values (reset to 0 on Sunday)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1 = new Date(2024, 0, 1);
      const d2 = new Date(2024, 0, 2);
      const d3 = new Date(2024, 0, 3);
      expect(d1.getDay()).assertEqual(1);
      expect(d2.getDay()).assertEqual(2);
      expect(d3.getDay()).assertEqual(3);
      expect((d2.getDay() - d1.getDay())).assertEqual(1);
      expect((d3.getDay() - d2.getDay())).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_1300
     * @tc.name testDateGetDay0013
     * @tc.desc Verify constructing Date with invalid string 'invalid' throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const invalidDate = new Date("invalid");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_1400
     * @tc.name testDateGetDay0014
     * @tc.desc Verify exception handling when calling getDay() on invalid date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const invalidDate = new Date('invalid');
        let result: int = invalidDate.getDay();
        expect(Number.isNaN(result)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_1500
     * @tc.name testDateGetDay0015
     * @tc.desc Verify getDay() covers all values 0-6 across 7 consecutive days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let days: Set<int> = new Set<int>();
      for (let i = 1; i <= 7; i++) {
        const date = new Date(2024, 0, i);
        days.add(date.getDay());
      }
      expect(days.has(0)).assertTrue();
      expect(days.has(1)).assertTrue();
      expect(days.has(2)).assertTrue();
      expect(days.has(3)).assertTrue();
      expect(days.has(4)).assertTrue();
      expect(days.has(5)).assertTrue();
      expect(days.has(6)).assertTrue();
      expect(days.size).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_1600
     * @tc.name testDateGetDay0016
     * @tc.desc Verify same month and day in different years may return different weekdays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d2024 = new Date(2024, 0, 1);
      const d2023 = new Date(2023, 0, 1);
      expect(d2024.getDay()).assertEqual(1);
      expect(d2023.getDay()).assertEqual(0);
      expect(d2024.getDay() !== d2023.getDay()).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_1700
     * @tc.name testDateGetDay0017
     * @tc.desc Verify Unix epoch (1970-01-01) returns 4 (Thursday)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const epoch = new Date(1970, 0, 1);
      expect(epoch.getDay()).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_1800
     * @tc.name testDateGetDay0018
     * @tc.desc Verify weekday continuity from January 31 to February 1, 2024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const jan31 = new Date(2024, 0, 31);
      const feb1 = new Date(2024, 1, 1);
      expect(jan31.getDay()).assertEqual(3);
      expect(feb1.getDay()).assertEqual(4);
      expect(feb1.getDay() - jan31.getDay()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_1900
     * @tc.name testDateGetDay0019
     * @tc.desc Verify Saturday returns 6 and next day Sunday returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const saturday = new Date(2024, 0, 6);
      const sunday = new Date(2024, 0, 7);
      expect(saturday.getDay()).assertEqual(6);
      expect(sunday.getDay()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_2000
     * @tc.name testDateGetDay0020
     * @tc.desc Verify weekday continuity from December 31, 2023 to January 1, 2024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec31 = new Date(2023, 11, 31);
      const jan1 = new Date(2024, 0, 1);
      expect(dec31.getDay()).assertEqual(0);
      expect(jan1.getDay()).assertEqual(1);
      expect(jan1.getDay() - dec31.getDay()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_2100
     * @tc.name testDateGetDay0021
     * @tc.desc Verify getDay() after constructing Date with timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const timestamp = new Date(2024, 0, 2).getTime();
      const date = new Date(timestamp);
      expect(date.getDay()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_2200
     * @tc.name testDateGetDay0022
     * @tc.desc Verify getDay() after constructing Date with date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date("2024-01-02");
      let result: int = date.getDay();
      expect(result >= 0 && result <= 6).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_2300
     * @tc.name testDateGetDay0023
     * @tc.desc Verify getDay() returns value in range 0-6 for current date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const now = new Date();
      let result: int = now.getDay();
      expect(result >= 0 && result <= 6).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_DAY_CHK_2400
     * @tc.name testDateGetDay0024
     * @tc.desc Verify multiple calls to getDay() on same Date object return consistent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetDay0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let r1: int = date.getDay();
      let r2: int = date.getDay();
      let r3: int = date.getDay();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(2);
    });
  })
};