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

export default function DateGetHoursTest(): void {
  describe('DateGetHoursTest', () => {
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
     * @tc.number SUB_DATE_GET_HOURS_CHK_0100
     * @tc.name testDateGetHours0001
     * @tc.desc Verify getHours with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3);
      let result = date.getHours();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_0200
     * @tc.name testDateGetHours0002
     * @tc.desc Verify getHours ignores extra parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3);
      let result = (date.getHours as (p: int) => int)(999);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_0300
     * @tc.name testDateGetHours0003
     * @tc.desc Verify getHours returns 0 for midnight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1, 0);
      let result = date.getHours();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_0400
     * @tc.name testDateGetHours0004
     * @tc.desc Verify getHours returns 9 for 9 AM
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15, 9);
      let result = date.getHours();
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_0500
     * @tc.name testDateGetHours0005
     * @tc.desc Verify getHours returns 12 for noon
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1, 12);
      let result = date.getHours();
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_0600
     * @tc.name testDateGetHours0006
     * @tc.desc Verify getHours returns 15 for 3 PM
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 3, 10, 15);
      let result = date.getHours();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_0700
     * @tc.name testDateGetHours0007
     * @tc.desc Verify getHours returns 23 for 11 PM
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 6, 20, 23);
      let result = date.getHours();
      expect(result).assertEqual(23);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_0800
     * @tc.name testDateGetHours0008
     * @tc.desc Verify getHours returns minimum value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1, 0);
      let result = date.getHours();
      expect(result).assertEqual(0);
      expect(result >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_0900
     * @tc.name testDateGetHours0009
     * @tc.desc Verify getHours returns maximum value 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1, 23);
      let result = date.getHours();
      expect(result).assertEqual(23);
      expect(result <= 23).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_1000
     * @tc.name testDateGetHours0010
     * @tc.desc Verify getHours return value is an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3);
      let result = date.getHours();
      expect(result).assertEqual(3);
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_1100
     * @tc.name testDateGetHours0011
     * @tc.desc Verify getHours return value is always within 0 to 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 6, 20, 14);
      let result = date.getHours();
      expect(result >= 0 && result <= 23).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_1200
     * @tc.name testDateGetHours0012
     * @tc.desc Verify getHours returns 0 when constructing hour 24 with auto carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1, 24);
      expect(date.getHours()).assertEqual(0);
      expect(date.getDate()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_1300
     * @tc.name testDateGetHours0013
     * @tc.desc Verify getHours returns 1 when constructing hour 25 with auto carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1, 25);
      expect(date.getHours()).assertEqual(1);
      expect(date.getDate()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_1400
     * @tc.name testDateGetHours0014
     * @tc.desc Verify getHours returns 23 when constructing hour -1 rolling back to previous day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, -1);
      expect(date.getHours()).assertEqual(23);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_1500
     * @tc.name testDateGetHours0015
     * @tc.desc Verify getHours returns correct hour when Date is constructed with timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const timestamp = new Date(2024, 0, 2, 10, 30, 0).getTime();
      const date = new Date(timestamp);
      expect(date.getHours()).assertEqual(10);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_1600
     * @tc.name testDateGetHours0016
     * @tc.desc Verify constructing Date with invalid string 'invalid' throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date('invalid');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_1700
     * @tc.name testDateGetHours0017
     * @tc.desc Verify getHours returns consistent results on multiple consecutive calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3);
      let r1 = date.getHours();
      let r2 = date.getHours();
      let r3 = date.getHours();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_1800
     * @tc.name testDateGetHours0018
     * @tc.desc Verify getHours returns correct value with only hour parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 14);
      expect(date.getHours()).assertEqual(14);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_1900
     * @tc.name testDateGetHours0019
     * @tc.desc Verify getHours returns only hours with full time parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 14, 30, 45, 500);
      expect(date.getHours()).assertEqual(14);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_2000
     * @tc.name testDateGetHours0020
     * @tc.desc Verify getHours after constructing with date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date('2024-06-15T14:30:00');
      expect(date.getHours()).assertEqual(14);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_2100
     * @tc.name testDateGetHours0021
     * @tc.desc Verify getHours returns value within 0-23 for current time constructed with Date()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.getHours();
      expect(result >= 0 && result <= 23).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_2200
     * @tc.name testDateGetHours0022
     * @tc.desc Verify getHours returns new value after setHours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3);
      date.setHours(18);
      expect(date.getHours()).assertEqual(18);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_2300
     * @tc.name testDateGetHours0023
     * @tc.desc Verify getHours returns 0 after setHours(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15, 10);
      date.setHours(0);
      expect(date.getHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_2400
     * @tc.name testDateGetHours0024
     * @tc.desc Verify getHours returns 23 after setHours(23)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3);
      date.setHours(23);
      expect(date.getHours()).assertEqual(23);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_2500
     * @tc.name testDateGetHours0025
     * @tc.desc Verify setHours with value exceeding 23 auto-carries to next day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3);
      date.setHours(25);
      expect(date.getHours()).assertEqual(1);
      expect(date.getDate()).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_2600
     * @tc.name testDateGetHours0026
     * @tc.desc Verify setHours with negative value rolls back to previous day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3);
      date.setHours(-1);
      expect(date.getHours()).assertEqual(23);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_HOURS_CHK_2700
     * @tc.name testDateGetHours0027
     * @tc.desc Verify getHours returns different values for different hours on same day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetHours0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(2024, 0, 2, 3);
      const date2 = new Date(2024, 0, 2, 15);
      expect(date1.getHours()).assertEqual(3);
      expect(date2.getHours()).assertEqual(15);
      expect(date1.getHours() !== date2.getHours()).assertTrue();
    });
  })
};