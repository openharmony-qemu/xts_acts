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

export default function DateGetUTCDateTest(): void {
  describe('DateGetUTCDateTest', () => {
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
     * @tc.number SUB_DATE_GET_UTC_CHK_0100
     * @tc.name testDateGetUTCDate0001
     * @tc.desc Verify getUTCDate called without parameters returns 1 for epoch time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCDate();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_0400
     * @tc.name testDateGetUTCDate0004
     * @tc.desc Verify getUTCDate returns correct UTC date for normal date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15);
      let result = date.getUTCDate();
      expect(result >= 1 && result <= 31).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_0500
     * @tc.name testDateGetUTCDate0005
     * @tc.desc Verify getUTCDate returns 1 for first day of month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1));
      let result = date.getUTCDate();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_0600
     * @tc.name testDateGetUTCDate0006
     * @tc.desc Verify getUTCDate returns 31 for last day of 31-day month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 31));
      let result = date.getUTCDate();
      expect(result).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_0700
     * @tc.name testDateGetUTCDate0007
     * @tc.desc Verify getUTCDate returns 30 for last day of 30-day month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 3, 30));
      let result = date.getUTCDate();
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_0800
     * @tc.name testDateGetUTCDate0008
     * @tc.desc Verify getUTCDate returns 28 for last day of February in non-leap year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 1, 28));
      let result = date.getUTCDate();
      expect(result).assertEqual(28);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_0900
     * @tc.name testDateGetUTCDate0009
     * @tc.desc Verify getUTCDate returns 29 for February 29 in leap year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 1, 29));
      let result = date.getUTCDate();
      expect(result).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_1000
     * @tc.name testDateGetUTCDate0010
     * @tc.desc Verify getUTCDate returns UTC date across timezones
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const timestamp = Date.UTC(2024, 5, 15, 23, 0, 0);
      const date = new Date(timestamp);
      let result = date.getUTCDate();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_1100
     * @tc.name testDateGetUTCDate0011
     * @tc.desc Verify getUTCDate returns value between 1 and 31 for current time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.getUTCDate();
      expect(result >= 1 && result <= 31).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_1200
     * @tc.name testDateGetUTCDate0012
     * @tc.desc Verify getUTCDate returns minimum boundary value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 0, 0, 0, 0));
      let result = date.getUTCDate();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_1300
     * @tc.name testDateGetUTCDate0013
     * @tc.desc Verify getUTCDate returns maximum boundary value 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 11, 31, 23, 59, 59, 999));
      let result = date.getUTCDate();
      expect(result).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_1400
     * @tc.name testDateGetUTCDate0014
     * @tc.desc Verify getUTCDate with negative timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-86400000);
      let result = date.getUTCDate();
      expect(result >= 1 && result <= 31).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_2000
     * @tc.name testDateGetUTCDate0020
     * @tc.desc Verify getUTCDate returns integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 12, 30, 45));
      let result = date.getUTCDate();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_2100
     * @tc.name testDateGetUTCDate0021
     * @tc.desc Verify getUTCDate return value is within 1-31 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 6, 20));
      let result = date.getUTCDate();
      expect(result >= 1 && result <= 31).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_2200
     * @tc.name testDateGetUTCDate0022
     * @tc.desc Verify getUTCDate return value toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCDate();
      expect(result.toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_2400
     * @tc.name testDateGetUTCDate0024
     * @tc.desc Verify getUTCDate returns 31 for December 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 11, 31));
      let result = date.getUTCDate();
      expect(result).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_2700
     * @tc.name testDateGetUTCDate0027
     * @tc.desc Verify getUTCDate is not affected by millisecond precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 0, 0, 0, 999));
      let result = date.getUTCDate();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_2800
     * @tc.name testDateGetUTCDate0028
     * @tc.desc Verify getUTCDate returns expected day for epoch Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCDate();
      expect(result >= 1 && result <= 31).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_CHK_3300
     * @tc.name testDateGetUTCDate0033
     * @tc.desc Verify getUTCDate returns consistent results on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDate0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15));
      let result1 = date.getUTCDate();
      let result2 = date.getUTCDate();
      let result3 = date.getUTCDate();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });
  });
}
