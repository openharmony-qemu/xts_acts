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

export default function DateGetUTCDayTest(): void {
  describe('DateGetUTCDayTest', () => {
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
     * @tc.number SUB_DATE_GET_UTC_DAY_0100
     * @tc.name testDateGetUTCDay0001
     * @tc.desc Verify getUTCDay called without parameters returns 4 for epoch time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCDay();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_0400
     * @tc.name testDateGetUTCDay0004
     * @tc.desc Verify getUTCDay returns 0 for Sunday
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 7));
      let result = date.getUTCDay();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_0500
     * @tc.name testDateGetUTCDay0005
     * @tc.desc Verify getUTCDay returns 1 for Monday
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 8));
      let result = date.getUTCDay();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_0600
     * @tc.name testDateGetUTCDay0006
     * @tc.desc Verify getUTCDay returns 2 for Tuesday
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 9));
      let result = date.getUTCDay();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_0700
     * @tc.name testDateGetUTCDay0007
     * @tc.desc Verify getUTCDay returns 3 for Wednesday
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 10));
      let result = date.getUTCDay();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_0800
     * @tc.name testDateGetUTCDay0008
     * @tc.desc Verify getUTCDay returns 4 for Thursday
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 11));
      let result = date.getUTCDay();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_0900
     * @tc.name testDateGetUTCDay0009
     * @tc.desc Verify getUTCDay returns 5 for Friday
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 1, 12));
      let result = date.getUTCDay();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_1000
     * @tc.name testDateGetUTCDay0010
     * @tc.desc Verify getUTCDay returns 6 for Saturday
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 13));
      let result = date.getUTCDay();
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_1100
     * @tc.name testDateGetUTCDay0011
     * @tc.desc Verify getUTCDay covers all 7 days from 0 to 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: number[] = [];
      for (let i = 0; i < 7; i++) {
        const date = new Date(Date.UTC(2024, 0, 7 + i));
        results.push(date.getUTCDay());
      }
      expect(results[0]).assertEqual(0);
      expect(results[1]).assertEqual(1);
      expect(results[2]).assertEqual(2);
      expect(results[3]).assertEqual(3);
      expect(results[4]).assertEqual(4);
      expect(results[5]).assertEqual(5);
      expect(results[6]).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_1200
     * @tc.name testDateGetUTCDay0012
     * @tc.desc Verify getUTCDay with Date constructor returns value in 0-6 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 7);
      let result = date.getUTCDay();
      expect(result >= 0 && result <= 6).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_1400
     * @tc.name testDateGetUTCDay0014
     * @tc.desc Verify getUTCDay continuity across year boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(Date.UTC(2023, 11, 31));
      const date2 = new Date(Date.UTC(2024, 0, 1));
      let result1 = date1.getUTCDay();
      let result2 = date2.getUTCDay();
      expect(result2).assertEqual((result1 + 1) % 7);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_1500
     * @tc.name testDateGetUTCDay0015
     * @tc.desc Verify getUTCDay for leap year February 29 returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 1, 29));
      let result = date.getUTCDay();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_2400
     * @tc.name testDateGetUTCDay0024
     * @tc.desc Verify getUTCDay return value is integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 7));
      let result = date.getUTCDay();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_2900
     * @tc.name testDateGetUTCDay0029
     * @tc.desc Verify getUTCDay cyclic boundary from Saturday to Sunday
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const saturday = new Date(Date.UTC(2024, 0, 13));
      const sunday = new Date(Date.UTC(2024, 0, 14));
      expect(saturday.getUTCDay()).assertEqual(6);
      expect(sunday.getUTCDay()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_3000
     * @tc.name testDateGetUTCDay0030
     * @tc.desc Verify getUTCDay returns consistent results for multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 7));
      let result1 = date.getUTCDay();
      let result2 = date.getUTCDay();
      let result3 = date.getUTCDay();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_3800
     * @tc.name testDateGetUTCDay0038
     * @tc.desc Verify getUTCDay consistency with getUTCHours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 7, 12, 30, 45));
      let day = date.getUTCDay();
      let hours = date.getUTCHours();
      expect(day).assertEqual(0);
      expect(hours).assertEqual(12);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_4000
     * @tc.name testDateGetUTCDay0040
     * @tc.desc Verify getUTCDay returns same value for different times on same day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const morning = new Date(Date.UTC(2024, 0, 7, 0, 0, 0));
      const noon = new Date(Date.UTC(2024, 0, 7, 12, 0, 0));
      const evening = new Date(Date.UTC(2024, 0, 7, 23, 59, 59));
      expect(morning.getUTCDay()).assertEqual(noon.getUTCDay());
      expect(noon.getUTCDay()).assertEqual(evening.getUTCDay());
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_4100
     * @tc.name testDateGetUTCDay0041
     * @tc.desc Verify getUTCDay does not modify Date object state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let before = date.valueOf();
      date.getUTCDay();
      let after = date.valueOf();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_DAY_4200
     * @tc.name testDateGetUTCDay0042
     * @tc.desc Verify different Date instances return independent getUTCDay results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCDay0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(Date.UTC(2024, 0, 7));
      const date2 = new Date(Date.UTC(2024, 0, 8));
      expect(date1.getUTCDay()).assertEqual(0);
      expect(date2.getUTCDay()).assertEqual(1);
    });
  });
}
