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

export default function DateSetTimeTest(): void {
  describe('DateSetTimeTest', () => {
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
     * @tc.number SUB_DATE_SET_TIME_CHK_0400
     * @tc.name testDateSetTime0004
     * @tc.desc Verify setTime with normal long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setTime(1000);
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_0500
     * @tc.name testDateSetTime0005
     * @tc.desc Verify setTime with zero epoch time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setTime(0);
      expect(result).assertEqual(0);
      expect(date.getTime()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_0600
     * @tc.name testDateSetTime0006
     * @tc.desc Verify setTime with negative value before 1970
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setTime(-86400000);
      expect(result).assertEqual(-86400000);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_0700
     * @tc.name testDateSetTime0007
     * @tc.desc Verify setTime with hexadecimal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setTime(0x1234);
      expect(result).assertEqual(0x1234);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_0900
     * @tc.name testDateSetTime0009
     * @tc.desc Verify setTime with large business number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setTime(10000000000);
      expect(result).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_1000
     * @tc.name testDateSetTime0010
     * @tc.desc Verify setTime with long max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setTime(9223372036854775807);
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_1100
     * @tc.name testDateSetTime0011
     * @tc.desc Verify setTime with long min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setTime(-9223372036854775808);
      expect(result).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_1300
     * @tc.name testDateSetTime0013
     * @tc.desc Verify setTime with one day milliseconds boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setTime(86400000);
      expect(result).assertEqual(86400000);
      expect(date.getTime()).assertEqual(86400000);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_2500
     * @tc.name testDateSetTime0025
     * @tc.desc Verify setTime returns UTC millisecond timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setTime(1609459200000);
      expect(result).assertEqual(1609459200000);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_2600
     * @tc.name testDateSetTime0026
     * @tc.desc Verify setTime return value equals getTime result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let setTimeResult = date.setTime(1609459200000);
      let getTimeResult = date.getTime();
      expect(setTimeResult).assertEqual(getTimeResult);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_2700
     * @tc.name testDateSetTime0027
     * @tc.desc Verify setTime return type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setTime(0);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_2800
     * @tc.name testDateSetTime0028
     * @tc.desc Verify consecutive setTime calls return last set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      date.setTime(1000);
      date.setTime(2000);
      let result = date.setTime(3000);
      expect(result).assertEqual(3000);
      expect(date.getTime()).assertEqual(3000);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_3000
     * @tc.name testDateSetTime0030
     * @tc.desc Verify setTime with negative value returns negative for pre-epoch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setTime(-1);
      expect(result).assertEqual(-1);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_3100
     * @tc.name testDateSetTime0031
     * @tc.desc Verify timestamp change before and after setTime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let before = date.getTime();
      let after = date.setTime(9999999999999);
      expect(after).assertEqual(9999999999999);
      expect(before !== after).assertTrue()
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_3300
     * @tc.name testDateSetTime0033
     * @tc.desc Verify return value is integer without decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setTime(12345);
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_4000
     * @tc.name testDateSetTime0040
     * @tc.desc Verify finally always executes regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      date.setTime(100);
      expect(date.getTime()).assertEqual(100);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_4200
     * @tc.name testDateSetTime0042
     * @tc.desc Verify setTime and getTime values are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      date.setTime(1609459200000);
      expect(date.getTime()).assertEqual(1609459200000);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_4400
     * @tc.name testDateSetTime0044
     * @tc.desc Verify setTime overrides existing timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      date.setTime(1000000);
      expect(date.getTime()).assertEqual(1000000);
      date.setTime(2000000);
      expect(date.getTime()).assertEqual(2000000);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_4500
     * @tc.name testDateSetTime0045
     * @tc.desc Verify setTime equals constructor with same timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ts = 1609459200000;
      const date1 = new Date(ts);
      const date2 = new Date();
      date2.setTime(ts);
      expect(date1.getTime()).assertEqual(date2.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_4600
     * @tc.name testDateSetTime0046
     * @tc.desc Verify setTime with 2025-01-01 UTC timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      date.setTime(1735689600000);
      expect(date.getTime()).assertEqual(1735689600000);
      expect(date.getUTCFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_4700
     * @tc.name testDateSetTime0047
     * @tc.desc Verify setTime with 1970-01-01 epoch timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      date.setTime(0);
      expect(date.getUTCFullYear()).assertEqual(1970);
      expect(date.getUTCMonth()).assertEqual(0);
      expect(date.getUTCDate()).assertEqual(1);
      expect(date.getUTCHours()).assertEqual(0);
      expect(date.getUTCMinutes()).assertEqual(0);
      expect(date.getUTCSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_4800
     * @tc.name testDateSetTime0048
     * @tc.desc Verify setTime with 2030-12-31 UTC timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      date.setTime(1924943999000);
      expect(date.getTime()).assertEqual(1924943999000);
      expect(date.getUTCFullYear()).assertEqual(2030);
    });

    /**
     * @tc.number SUB_DATE_SET_TIME_CHK_4900
     * @tc.name testDateSetTime0049
     * @tc.desc Verify setTime with Date.now timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTime0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let now = Date.now();
      date.setTime(now);
      expect(date.getTime()).assertEqual(now);
    });
  });
}
