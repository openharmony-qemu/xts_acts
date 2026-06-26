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

export default function DateSetMillisecondsTest(): void {
  describe('DateSetMillisecondsTest', (): void => {
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
     * @tc.number SUB_DATE_SET_MLLSC_CHK_0100
     * @tc.name testDateSetMilliseconds0001
     * @tc.desc Verify setMilliseconds with required parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMilliseconds(7);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_0400
     * @tc.name testDateSetMilliseconds0004
     * @tc.desc Verify setMilliseconds with normal integer value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMilliseconds(0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_0600
     * @tc.name testDateSetMilliseconds0006
     * @tc.desc Verify setMilliseconds with normal integer value 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMilliseconds(999);
      expect(date.getMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_1200
     * @tc.name testDateSetMilliseconds0012
     * @tc.desc Verify setMilliseconds with overflow value 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 0, 0, 0, 0);
      let result = date.setMilliseconds(1000);
      expect(result > 0).assertTrue();
      expect(date.getMilliseconds()).assertEqual(1000 % 1000);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_1300
     * @tc.name testDateSetMilliseconds0013
     * @tc.desc Verify setMilliseconds with negative overflow value -1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMilliseconds(-1000);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_1600
     * @tc.name testDateSetMilliseconds0016
     * @tc.desc Verify setMilliseconds with large positive value carries over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMilliseconds(86400000);
      expect(date.getMilliseconds()).assertEqual(0);
      expect(date.getDate()).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_1700
     * @tc.name testDateSetMilliseconds0017
     * @tc.desc Verify setMilliseconds with octal format parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMilliseconds(0o777);
      expect(date.getMilliseconds()).assertEqual(511);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_1800
     * @tc.name testDateSetMilliseconds0018
     * @tc.desc Verify setMilliseconds with binary format parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMilliseconds(0b1111100111);
      expect(date.getMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_3400
     * @tc.name testDateSetMilliseconds0034
     * @tc.desc Verify different millisecond values return different timestamps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(2024, 0, 2);
      let result1 = date1.setMilliseconds(100);
      const date2 = new Date(2024, 0, 2);
      let result2 = date2.setMilliseconds(200);
      expect(result2 - result1).assertEqual(100);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_3500
     * @tc.name testDateSetMilliseconds0035
     * @tc.desc Verify getMilliseconds matches setMilliseconds input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMilliseconds(456);
      expect(date.getMilliseconds()).assertEqual(456);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_3600
     * @tc.name testDateSetMilliseconds0036
     * @tc.desc Verify multiple setMilliseconds calls with last one taking effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMilliseconds(100);
      date.setMilliseconds(200);
      date.setMilliseconds(300);
      expect(date.getMilliseconds()).assertEqual(300);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_3700
     * @tc.name testDateSetMilliseconds0037
     * @tc.desc Verify setMilliseconds to 0 returns second-aligned timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 12, 30, 45, 999);
      let result = date.setMilliseconds(0);
      expect(date.getMilliseconds()).assertEqual(0);
      expect(result % 1000).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_3900
     * @tc.name testDateSetMilliseconds0039
     * @tc.desc Verify setMilliseconds with large positive value increases timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let before = date.getTime();
      let result = date.setMilliseconds(5000);
      expect(result - before).assertEqual(5000);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_4100
     * @tc.name testDateSetMilliseconds0041
     * @tc.desc Verify return value equals getTime after setMilliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setMilliseconds(7);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_4200
     * @tc.name testDateSetMilliseconds0042
     * @tc.desc Verify setMilliseconds on epoch time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setMilliseconds(999);
      expect(date.getMilliseconds()).assertEqual(999);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_4300
     * @tc.name testDateSetMilliseconds0043
     * @tc.desc Verify setMilliseconds near Date maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(8640000000000000 - 1);
      let result = date.setMilliseconds(0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_4400
     * @tc.name testDateSetMilliseconds0044
     * @tc.desc Verify setMilliseconds on leap year February 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 1, 29, 12, 0, 0, 0);
      let result = date.setMilliseconds(123);
      expect(date.getMilliseconds()).assertEqual(123);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_4500
     * @tc.name testDateSetMilliseconds0045
     * @tc.desc Verify setMilliseconds on December 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 11, 31, 23, 59, 59, 0);
      let result = date.setMilliseconds(999);
      expect(date.getMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_4900
     * @tc.name testDateSetMilliseconds0049
     * @tc.desc Verify setMilliseconds updates value and completes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let finallyExecuted = false;
      date.setMilliseconds(100);
      expect(date.getMilliseconds()).assertEqual(100);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_5300
     * @tc.name testDateSetMilliseconds0053
     * @tc.desc Verify other time fields consistency after setMilliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 12, 30, 45, 0);
      date.setMilliseconds(500);
      expect(date.getSeconds()).assertEqual(45);
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getHours()).assertEqual(12);
      expect(date.getMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_5400
     * @tc.name testDateSetMilliseconds0054
     * @tc.desc Verify toISOString output correct after setMilliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 0, 0, 0, 0);
      date.setMilliseconds(123);
      let iso = date.toISOString();
      expect(iso.indexOf(".123") > -1).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_5500
     * @tc.name testDateSetMilliseconds0055
     * @tc.desc Verify milliseconds overflow causes seconds carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 0, 0, 0, 0);
      date.setMilliseconds(1500);
      expect(date.getSeconds()).assertEqual(1);
      expect(date.getMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_5600
     * @tc.name testDateSetMilliseconds0056
     * @tc.desc Verify negative milliseconds causes seconds borrow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 0, 0, 1, 0);
      date.setMilliseconds(-1);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_5700
     * @tc.name testDateSetMilliseconds0057
     * @tc.desc Verify large milliseconds causes minutes carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 0, 0, 0, 0);
      date.setMilliseconds(61000);
      expect(date.getMinutes()).assertEqual(1);
      expect(date.getSeconds()).assertEqual(1);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_5800
     * @tc.name testDateSetMilliseconds0058
     * @tc.desc Verify super large milliseconds causes date carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 23, 59, 59, 0);
      date.setMilliseconds(1001);
      expect(date.getDate()).assertEqual(3);
      expect(date.getMilliseconds()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_5900
     * @tc.name testDateSetMilliseconds0059
     * @tc.desc Verify getMilliseconds consistency with setMilliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      for (let ms of [0, 1, 100, 500, 999]) {
        date.setMilliseconds(ms);
        expect(date.getMilliseconds()).assertEqual(ms);
      }
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_6000
     * @tc.name testDateSetMilliseconds0060
     * @tc.desc Verify getTime modulo 1000 equals set milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 0, 0, 0, 0);
      date.setMilliseconds(456);
      expect(date.getTime() % 1000).assertEqual(456);
    });

    /**
     * @tc.number SUB_DATE_SET_MLLSC_CHK_6100
     * @tc.name testDateSetMilliseconds0061
     * @tc.desc Verify official documentation example code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMilliseconds0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setMilliseconds(7);

      expect(date.getMilliseconds()).assertEqual(7);
    });

  });

}

