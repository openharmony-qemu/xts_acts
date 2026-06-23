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

export default function DateNowTest(): void {
  describe('DateNowTest', () => {
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
     * @tc.number SUB_DATE_NOW_ITEM_CHK_0100
     * @tc.name testDateNow0001
     * @tc.desc Verify Date.now returns finite integer timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateNow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let timestamp: long = Date.now();
      expect(Number.isFinite(timestamp)).assertTrue();
      expect(Number.isInteger(timestamp)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_NOW_ITEM_CHK_0800
     * @tc.name testDateNow0008
     * @tc.desc Verify Date.now timestamp is within JavaScript safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateNow0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let timestamp: long = Date.now();
      expect(timestamp >= 0).assertTrue();
      expect(timestamp <= Number.MAX_SAFE_INTEGER).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_NOW_ITEM_CHK_0900
     * @tc.name testDateNow0009
     * @tc.desc Verify consecutive calls to Date.now return non-decreasing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateNow0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ts1: long = Date.now();
      let ts2: long = Date.now();
      expect(ts2 >= ts1).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_NOW_ITEM_CHK_1000
     * @tc.name testDateNow0010
     * @tc.desc Verify multiple Date.now calls produce non-decreasing finite values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateNow0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let previous: long = 0;
      for (let i = 0; i < 10; i++) {
        let timestamp: long = Date.now();
        expect(Number.isFinite(timestamp)).assertTrue();
        expect(timestamp >= previous).assertTrue();
        previous = timestamp;
      }
    });

    /**
     * @tc.number SUB_DATE_NOW_ITEM_CHK_1600
     * @tc.name testDateNow0016
     * @tc.desc Verify Date.now return value can construct a Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateNow0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let timestamp: long = Date.now();
      let date = new Date(timestamp);
      expect(date.getTime()).assertEqual(timestamp);
    });

    /**
     * @tc.number SUB_DATE_NOW_ITEM_CHK_2700
     * @tc.name testDateNow0027
     * @tc.desc Verify multiple Date.now calls in a loop are finite and non-decreasing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateNow0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let previous: long = 0;
      for (let i = 0; i < 100; i++) {
        let ts: long = Date.now();
        expect(Number.isFinite(ts)).assertTrue();
        expect(ts >= previous).assertTrue();
        previous = ts;
      }
    });

    /**
     * @tc.number SUB_DATE_NOW_ITEM_CHK_2800
     * @tc.name testDateNow0028
     * @tc.desc Verify many Date.now calls complete and return finite values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateNow0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let last: long = 0;
      for (let i = 0; i < 10000; i++) {
        last = Date.now();
      }
      expect(Number.isFinite(last)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_NOW_ITEM_CHK_2900
     * @tc.name testDateNow0029
     * @tc.desc Verify Date.now returns stable valid values across many calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateNow0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 100; i++) {
        let ts: long = Date.now();
        expect(ts >= 0 && Number.isFinite(ts)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DATE_NOW_ITEM_CHK_3400
     * @tc.name testDateNow0034
     * @tc.desc Verify elapsed time calculation is non-negative while work completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateNow0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let start: long = Date.now();
      let arr: number[] = [];
      for (let i = 0; i < 100000; i++) {
        arr.push(i);
      }
      let end: long = Date.now();
      expect(end >= start).assertTrue();
      expect(arr.length).assertEqual(100000);
    });

    /**
     * @tc.number SUB_DATE_NOW_ITEM_CHK_3500
     * @tc.name testDateNow0035
     * @tc.desc Verify Date.now return value can be converted to ISO string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateNow0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ts: long = Date.now();
      let date = new Date(ts);
      let isoStr: string = date.toISOString();
      expect(isoStr.endsWith("Z")).assertTrue();
      expect(isoStr.indexOf("T") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_NOW_ITEM_CHK_3700
     * @tc.name testDateNow0037
     * @tc.desc Verify many calls to Date.now all return valid non-negative finite values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateNow0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        let ts: long = Date.now();
        expect(ts >= 0 && Number.isFinite(ts)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DATE_NOW_ITEM_CHK_3800
     * @tc.name testDateNow0038
     * @tc.desc Verify Date.now is greater than or equal to epoch timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateNow0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let epoch: number = Date.UTC(1970, 0, 1);
      let now: long = Date.now();
      expect(now >= epoch).assertTrue();
    });
  });
}
