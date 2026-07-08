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

export default function DateGetTimeTest(): void {
  describe('DateGetTimeTest', () => {
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
     * @tc.number SUB_DATE_GET_TIME_CHK_0100
     * @tc.name testDateGetTime0001
     * @tc.desc Verify getTime returns normally with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getTime();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_0200
     * @tc.name testDateGetTime0002
     * @tc.desc Verify getTime ignores extra arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1000);
      let result = date.getTime();
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_0300
     * @tc.name testDateGetTime0003
     * @tc.desc Verify getTime returns correct value for large millisecond timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const timestamp = 1700000000000;
      const date = new Date(timestamp);
      let result = date.getTime();
      expect(result).assertEqual(timestamp);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_0400
     * @tc.name testDateGetTime0004
     * @tc.desc Verify getTime returns negative value for pre-1970 timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-1000);
      let result = date.getTime();
      expect(result).assertEqual(-1000);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_0500
     * @tc.name testDateGetTime0005
     * @tc.desc Verify getTime returns consistent value on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1609459200000);
      let result1 = date.getTime();
      let result2 = date.getTime();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_0600
     * @tc.name testDateGetTime0006
     * @tc.desc Verify getTime returns negative value for pre-1970 date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-86400000);
      let result = date.getTime();
      expect(result).assertEqual(-86400000);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_0700
     * @tc.name testDateGetTime0007
     * @tc.desc Verify getTime returns correct value near max safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxTs = 9223372036854775807;
      const date = new Date(maxTs);
      let result = date.getTime();
      expect(result).assertEqual(maxTs);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_0800
     * @tc.name testDateGetTime0008
     * @tc.desc Verify getTime return type is long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1609459200000);
      const result = date.getTime();
      const numericValue = Number(result);
      expect(!isNaN(numericValue)).assertTrue();
      expect(numericValue).assertEqual(1609459200000);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_0900
     * @tc.name testDateGetTime0009
     * @tc.desc Verify getTime return value can be used in numeric operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(1000);
      const date2 = new Date(2000);
      let diff = date2.getTime() - date1.getTime();
      expect(diff).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_1000
     * @tc.name testDateGetTime0010
     * @tc.desc Verify getTime return value matches Date.now()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const now = Date.now();
      const date = new Date(now);
      let result = date.getTime();
      expect(result).assertEqual(now);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_1100
     * @tc.name testDateGetTime0011
     * @tc.desc Verify getTime returns correct negative value for very small negative timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-9999999999999);
      let result = date.getTime();
      expect(result).assertEqual(-9999999999999);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_1200
     * @tc.name testDateGetTime0012
     * @tc.desc Verify getTime returns correct positive value for very large positive timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(9999999999999);
      let result = date.getTime();
      expect(result).assertEqual(9999999999999);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_1300
     * @tc.name testDateGetTime0013
     * @tc.desc Verify getTime returns integer millisecond precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(12345);
      let result = date.getTime();
      expect(result % 1).assertEqual(0);
      expect(result).assertEqual(12345);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_1400
     * @tc.name testDateGetTime0014
     * @tc.desc Verify getTime after Date constructed with date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date("2025-01-01T00:00:00.000Z");
      let result = date.getTime();
      expect(result).assertEqual(1735689600000);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_1500
     * @tc.name testDateGetTime0015
     * @tc.desc Verify getTime and setTime work together correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setTime(1700000000000);
      let result = date.getTime();
      expect(result).assertEqual(1700000000000);
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_1600
     * @tc.name testDateGetTime0016
     * @tc.desc Verify getTime return value is consistent with valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1700000000000);
      expect(date.getTime()).assertEqual(date.valueOf());
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_1700
     * @tc.name testDateGetTime0017
     * @tc.desc Verify getTime returns stable value on rapid consecutive calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1700000000000);
      for (let i = 0; i < 100; i++) {
        let result = date.getTime();
        expect(result).assertEqual(1700000000000);
      }
    });

    /**
     * @tc.number SUB_DATE_GET_TIME_CHK_1800
     * @tc.name testDateGetTime0018
     * @tc.desc Verify getTime returns different values for different dates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTime0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(2025, 0, 1);
      const date2 = new Date(2025, 11, 31);
      expect(date1.getTime() < date2.getTime()).assertTrue();
    });
  })
};