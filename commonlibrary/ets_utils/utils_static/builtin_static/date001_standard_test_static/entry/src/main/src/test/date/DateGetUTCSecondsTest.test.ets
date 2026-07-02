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

export default function DateGetUTCSecondsTest(): void {
  describe('DateGetUTCSecondsTest', () => {
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
     * @tc.number SUB_DATE_GET_UTC_SCNDS_0100
     * @tc.name testDateGetUTCSeconds0001
     * @tc.desc Verify getUTCSeconds with no arguments returns 0 for timestamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCSeconds();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_0700
     * @tc.name testDateGetUTCSeconds0007
     * @tc.desc Verify getUTCSeconds returns 30 for specific seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 10, 30, 30));
      let result = date.getUTCSeconds();
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_0800
     * @tc.name testDateGetUTCSeconds0008
     * @tc.desc Verify getUTCSeconds returns 45 for specific seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 11, 31, 23, 59, 45));
      let result = date.getUTCSeconds();
      expect(result).assertEqual(45);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_0900
     * @tc.name testDateGetUTCSeconds0009
     * @tc.desc Verify getUTCSeconds returns value in range 0-59 for current time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.getUTCSeconds();
      expect(result >= 0 && result <= 59).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_1200
     * @tc.name testDateGetUTCSeconds0012
     * @tc.desc Verify getUTCSeconds returns 59 at upper boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 23, 59, 59));
      let result = date.getUTCSeconds();
      expect(result).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_1300
     * @tc.name testDateGetUTCSeconds0013
     * @tc.desc Verify getUTCSeconds wraps from 59 to 0 across minute boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date59 = new Date(Date.UTC(2024, 0, 1, 0, 0, 59));
      expect(date59.getUTCSeconds()).assertEqual(59);
      const date00 = new Date(Date.UTC(2024, 0, 1, 0, 1, 0));
      expect(date00.getUTCSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_2100
     * @tc.name testDateGetUTCSeconds0021
     * @tc.desc Verify getUTCSeconds returns integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 10, 30, 45));
      let result = date.getUTCSeconds();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_2200
     * @tc.name testDateGetUTCSeconds0022
     * @tc.desc Verify getUTCSeconds returns value in range 0-59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dates = [
        new Date(0),
        new Date(Date.UTC(2024, 5, 15, 10, 30, 30)),
        new Date(Date.UTC(2024, 11, 31, 23, 59, 59)),
        new Date(Date.UTC(1999, 0, 1, 0, 0, 1)),
        new Date()
      ];
      for (let i = 0; i < dates.length; i++) {
        let result = dates[i].getUTCSeconds();
        expect(result >= 0 && result <= 59).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_2300
     * @tc.name testDateGetUTCSeconds0023
     * @tc.desc Verify getUTCSeconds return value is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCSeconds();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_2400
     * @tc.name testDateGetUTCSeconds0024
     * @tc.desc Verify getUTCSeconds return value is not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCSeconds();
      expect(result !== null).assertTrue();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_2500
     * @tc.name testDateGetUTCSeconds0025
     * @tc.desc Verify getUTCSeconds return value is not NaN for valid date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 10, 30, 45));
      let result = date.getUTCSeconds();
      expect(Number.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_2600
     * @tc.name testDateGetUTCSeconds0026
     * @tc.desc Verify getUTCSeconds with millisecond timestamp constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(45000);
      let result = date.getUTCSeconds();
      expect(result).assertEqual(45);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_2700
     * @tc.name testDateGetUTCSeconds0027
     * @tc.desc Verify getUTCSeconds with Date.UTC constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ms = Date.UTC(2024, 5, 15, 10, 30, 25);
      const date = new Date(ms);
      let result = date.getUTCSeconds();
      expect(result).assertEqual(25);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_2800
     * @tc.name testDateGetUTCSeconds0028
     * @tc.desc Verify getUTCSeconds with string constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date("2024-06-15T10:30:42Z");
      let result = date.getUTCSeconds();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_2900
     * @tc.name testDateGetUTCSeconds0029
     * @tc.desc Verify getUTCSeconds with multi-argument constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 10, 30, 15));
      let result = date.getUTCSeconds();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_3000
     * @tc.name testDateGetUTCSeconds0030
     * @tc.desc Verify getUTCSeconds returns consistent value on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 10, 30, 30));
      let result1 = date.getUTCSeconds();
      let result2 = date.getUTCSeconds();
      let result3 = date.getUTCSeconds();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_4100
     * @tc.name testDateGetUTCSeconds0041
     * @tc.desc Verify getUTCSeconds method exists on Date prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      expect(Number.isInteger(date.getUTCSeconds())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_SCNDS_4400
     * @tc.name testDateGetUTCSeconds0044
     * @tc.desc Verify getUTCSeconds is not affected by timezone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCSeconds0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const timestamp = Date.UTC(2024, 5, 15, 10, 30, 45);
      const date1 = new Date(timestamp);
      const date2 = new Date(timestamp);
      expect(date1.getUTCSeconds()).assertEqual(date2.getUTCSeconds());
      expect(date1.getUTCSeconds()).assertEqual(45);
    });
  });
}
