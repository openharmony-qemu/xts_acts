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

export default function DateGetUTCFullYearTest(): void {
  describe('DateGetUTCFullYearTest', () => {
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
     * @tc.number SUB_DATE_GET_UTC_FULL_0100
     * @tc.name testDateGetUTCFullYear0001
     * @tc.desc Verify getUTCFullYear with no parameters returns 1970 for epoch time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCFullYear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCFullYear();
      expect(result).assertEqual(1970);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_FULL_0400
     * @tc.name testDateGetUTCFullYear0004
     * @tc.desc Verify getUTCFullYear with fixed date 2026-06-30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCFullYear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 5, 30);
      let result = date.getUTCFullYear();
      expect(result).assertEqual(2026);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_FULL_0500
     * @tc.name testDateGetUTCFullYear0005
     * @tc.desc Verify getUTCFullYear returns far future year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCFullYear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2100, 5, 15);
      let result = date.getUTCFullYear();
      expect(result).assertEqual(2100);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_FULL_0800
     * @tc.name testDateGetUTCFullYear0008
     * @tc.desc Verify getUTCFullYear at year boundary December 31st
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCFullYear0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 11, 31);
      let result = date.getUTCFullYear();
      expect(result).assertEqual(2026);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_FULL_0900
     * @tc.name testDateGetUTCFullYear0009
     * @tc.desc Verify getUTCFullYear with negative timestamp before 1970
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCFullYear0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-86400000);
      let result = date.getUTCFullYear();
      expect(result).assertEqual(1969);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_FULL_1500
     * @tc.name testDateGetUTCFullYear0015
     * @tc.desc Verify getUTCFullYear returns integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCFullYear0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 5, 15, 12, 30, 45, 500);
      let result = date.getUTCFullYear();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_FULL_1600
     * @tc.name testDateGetUTCFullYear0016
     * @tc.desc Verify getUTCFullYear returns correct year for leap day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCFullYear0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 1, 29);
      let result = date.getUTCFullYear();
      expect(result).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_FULL_1700
     * @tc.name testDateGetUTCFullYear0017
     * @tc.desc Verify getUTCFullYear at UTC year boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCFullYear0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2026, 0, 1, 0, 0, 0));
      let result = date.getUTCFullYear();
      expect(result).assertEqual(2026);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_FULL_1800
     * @tc.name testDateGetUTCFullYear0018
     * @tc.desc Verify getUTCFullYear just before UTC year boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCFullYear0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2025, 11, 31, 23, 59, 59, 999));
      let result = date.getUTCFullYear();
      expect(result).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_FULL_2300
     * @tc.name testDateGetUTCFullYear0023
     * @tc.desc Verify getUTCFullYear override behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCFullYear0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2026, 5, 15, 12, 0, 0));
      let result = date.getUTCFullYear();
      expect(result).assertEqual(2026);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_FULL_2400
     * @tc.name testDateGetUTCFullYear0024
     * @tc.desc Verify getUTCFullYear returns same value on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCFullYear0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 0, 1);
      let result1 = date.getUTCFullYear();
      let result2 = date.getUTCFullYear();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_FULL_2500
     * @tc.name testDateGetUTCFullYear0025
     * @tc.desc Verify getUTCFullYear returns same year for same timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCFullYear0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const timestamp = 1735689600000;
      const date1 = new Date(timestamp);
      const date2 = new Date(timestamp);
      expect(date1.getUTCFullYear()).assertEqual(date2.getUTCFullYear());
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_FULL_2600
     * @tc.name testDateGetUTCFullYear0026
     * @tc.desc Verify getUTCFullYear vs getFullYear difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCFullYear0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2026, 0, 1, 0, 0, 0));
      let utcYear = date.getUTCFullYear();
      let localYear = date.getFullYear();
      expect(utcYear).assertEqual(2026);
    });
  });
}
