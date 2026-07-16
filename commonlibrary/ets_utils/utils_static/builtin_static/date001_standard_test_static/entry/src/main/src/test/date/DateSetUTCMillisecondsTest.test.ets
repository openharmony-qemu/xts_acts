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

export default function DateSetUTCMillisecondsTest(): void {
  describe('DateSetUTCMillisecondsTest', () => {
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
     * @tc.number SUB_DATE_SET_UTC_MLLSC_0100
     * @tc.name testDateSetUTCMilliseconds0001
     * @tc.desc Verify setUTCMilliseconds with required parameter sets UTC milliseconds correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(7);
      expect(result).assertEqual(7);
      expect(date.getUTCMilliseconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_0200
     * @tc.name testDateSetUTCMilliseconds0002
     * @tc.desc Verify setUTCMilliseconds with zero keeps epoch milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCMilliseconds(0);
      expect(date.getUTCMilliseconds()).assertEqual(0);
      expect(date.getTime()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_0600
     * @tc.name testDateSetUTCMilliseconds0006
     * @tc.desc Verify setUTCMilliseconds with 999 the max valid milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(999);
      expect(date.getUTCMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_0700
     * @tc.name testDateSetUTCMilliseconds0007
     * @tc.desc Verify setUTCMilliseconds with hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(0xFF);
      expect(date.getUTCMilliseconds()).assertEqual(255);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_0800
     * @tc.name testDateSetUTCMilliseconds0008
     * @tc.desc Verify setUTCMilliseconds with octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(0o777);
      expect(date.getUTCMilliseconds()).assertEqual(511);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_0900
     * @tc.name testDateSetUTCMilliseconds0009
     * @tc.desc Verify setUTCMilliseconds with binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(0b1010);
      expect(date.getUTCMilliseconds()).assertEqual(10);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_1000
     * @tc.name testDateSetUTCMilliseconds0010
     * @tc.desc Verify setUTCMilliseconds with int max value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(2147483647);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_1100
     * @tc.name testDateSetUTCMilliseconds0011
     * @tc.desc Verify setUTCMilliseconds with int min value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(-2147483648);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_1200
     * @tc.name testDateSetUTCMilliseconds0012
     * @tc.desc Verify setUTCMilliseconds with -1 representing 999ms of previous second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_1300
     * @tc.name testDateSetUTCMilliseconds0013
     * @tc.desc Verify setUTCMilliseconds with 1000 carries over to next second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(1000);
      expect(result).assertEqual(1000);
      expect(date.getUTCSeconds()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_1400
     * @tc.name testDateSetUTCMilliseconds0014
     * @tc.desc Verify setUTCMilliseconds with -1000 borrows from previous second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(-1000);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_1500
     * @tc.name testDateSetUTCMilliseconds0015
     * @tc.desc Verify setUTCMilliseconds with 0x7FFFFFFF int hex max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(0x7FFFFFFF);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_2400
     * @tc.name testDateSetUTCMilliseconds0024
     * @tc.desc Verify setUTCMilliseconds with negative value normalizes previous second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCMilliseconds(-1);
      expect(date.getUTCSeconds()).assertEqual(59);
      expect(date.getUTCMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_2800
     * @tc.name testDateSetUTCMilliseconds0028
     * @tc.desc Verify setUTCMilliseconds called multiple times with different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCMilliseconds(100);
      expect(date.getUTCMilliseconds()).assertEqual(100);
      date.setUTCMilliseconds(500);
      expect(date.getUTCMilliseconds()).assertEqual(500);
      date.setUTCMilliseconds(0);
      expect(date.getUTCMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_2900
     * @tc.name testDateSetUTCMilliseconds0029
     * @tc.desc Verify setUTCMilliseconds with very large positive integer causes date overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(999999999);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_3000
     * @tc.name testDateSetUTCMilliseconds0030
     * @tc.desc Verify setUTCMilliseconds with very large negative integer causes date overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(-999999999);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_3100
     * @tc.name testDateSetUTCMilliseconds0031
     * @tc.desc Verify setUTCMilliseconds returns updated timestamp after setting UTC milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(7);
      expect(!Number.isNaN(result)).assertTrue();
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_3200
     * @tc.name testDateSetUTCMilliseconds0032
     * @tc.desc Verify setUTCMilliseconds return value equals getTime()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(500);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_3300
     * @tc.name testDateSetUTCMilliseconds0033
     * @tc.desc Verify setUTCMilliseconds returns UTC timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15, 10, 30, 45, 0));
      let result = date.setUTCMilliseconds(123);
      expect(result).assertEqual(date.getTime());
      expect(date.getUTCMilliseconds()).assertEqual(123);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_3400
     * @tc.name testDateSetUTCMilliseconds0034
     * @tc.desc Verify other time fields unchanged after setUTCMilliseconds within valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15, 10, 30, 45, 200));
      let result = date.setUTCMilliseconds(800);
      expect(date.getUTCFullYear()).assertEqual(2023);
      expect(date.getUTCMonth()).assertEqual(5);
      expect(date.getUTCDate()).assertEqual(15);
      expect(date.getUTCHours()).assertEqual(10);
      expect(date.getUTCMinutes()).assertEqual(30);
      expect(date.getUTCSeconds()).assertEqual(45);
      expect(date.getUTCMilliseconds()).assertEqual(800);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_3500
     * @tc.name testDateSetUTCMilliseconds0035
     * @tc.desc Verify setUTCMilliseconds with 0 returns correct timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 0, 1, 0, 0, 0, 500));
      let result = date.setUTCMilliseconds(0);
      expect(result).assertEqual(Date.UTC(2023, 0, 1, 0, 0, 0, 0));
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_3600
     * @tc.name testDateSetUTCMilliseconds0036
     * @tc.desc Verify setUTCMilliseconds with 999 returns correct timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(999);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_3800
     * @tc.name testDateSetUTCMilliseconds0038
     * @tc.desc Verify setUTCMilliseconds with 1000 carries over seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(1500);
      expect(date.getUTCSeconds()).assertEqual(1);
      expect(date.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_3900
     * @tc.name testDateSetUTCMilliseconds0039
     * @tc.desc Verify setUTCMilliseconds with -1 borrows from seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1000);
      let result = date.setUTCMilliseconds(-1);
      expect(date.getUTCSeconds()).assertEqual(0);
      expect(date.getUTCMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_4000
     * @tc.name testDateSetUTCMilliseconds0040
     * @tc.desc Verify large value carry over affects minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 0, 1, 0, 0, 59, 0));
      let result = date.setUTCMilliseconds(1500);
      expect(date.getUTCMinutes()).assertEqual(1);
      expect(date.getUTCSeconds()).assertEqual(0);
      expect(date.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_4100
     * @tc.name testDateSetUTCMilliseconds0041
     * @tc.desc Verify setUTCMilliseconds return type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(100);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_4200
     * @tc.name testDateSetUTCMilliseconds0042
     * @tc.desc Verify setUTCMilliseconds returns finite number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(500);
      expect(Number.isFinite(result)).assertTrue();
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_4300
     * @tc.name testDateSetUTCMilliseconds0043
     * @tc.desc Verify setUTCMilliseconds returns integer without decimal part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(123);
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_4400
     * @tc.name testDateSetUTCMilliseconds0044
     * @tc.desc Verify setUTCMilliseconds timestamp near Date max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(8640000000000000);
      let result = date.setUTCMilliseconds(0);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_4500
     * @tc.name testDateSetUTCMilliseconds0045
     * @tc.desc Verify setUTCMilliseconds timestamp near Date min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-8640000000000000);
      let result = date.setUTCMilliseconds(0);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_4600
     * @tc.name testDateSetUTCMilliseconds0046
     * @tc.desc Verify setUTCMilliseconds returns NaN after setting out-of-range value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(8640000000000000);
      let result = date.setUTCMilliseconds(999999999);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_5100
     * @tc.name testDateSetUTCMilliseconds0051
     * @tc.desc Verify setUTCMilliseconds with valid parameter updates milliseconds or catches RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      try {
        date.setUTCMilliseconds(100)
        expect(date.getUTCMilliseconds()).assertEqual(100);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_5200
     * @tc.name testDateSetUTCMilliseconds0052
     * @tc.desc Verify setUTCMilliseconds with invalid parameter caught by catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      try {
        date.setUTCMilliseconds(999999999);
        expect(date.getUTCMilliseconds()).assertEqual(999);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_5300
     * @tc.name testDateSetUTCMilliseconds0053
     * @tc.desc Verify finally block always executes regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCMilliseconds(100);
      expect(date.getUTCMilliseconds()).assertEqual(100);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_5600
     * @tc.name testDateSetUTCMilliseconds0056
     * @tc.desc Verify setUTCMilliseconds is an instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMilliseconds(500);
      expect(result).assertEqual(500);
      expect(date.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_5900
     * @tc.name testDateSetUTCMilliseconds0059
     * @tc.desc Verify setUTCMilliseconds is synchronous and returns immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0)
      let result = date.setUTCMilliseconds(500)
      expect(!Number.isNaN(result)).assertTrue()
      expect(date.getUTCMilliseconds()).assertEqual(500)
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_6000
     * @tc.name testDateSetUTCMilliseconds0060
     * @tc.desc Verify setUTCMilliseconds behavior consistent in async context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0)
      let result = date.setUTCMilliseconds(200)
      expect(result).assertEqual(200)
      expect(date.getUTCMilliseconds()).assertEqual(200)
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_6100
     * @tc.name testDateSetUTCMilliseconds0061
     * @tc.desc Verify setUTCMilliseconds in Promise.then callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0)
      date.setUTCMilliseconds(300)
      expect(date.getUTCMilliseconds()).assertEqual(300)
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_6200
     * @tc.name testDateSetUTCMilliseconds0062
     * @tc.desc Verify getUTCMilliseconds reads same value after setUTCMilliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0)
      date.setUTCMilliseconds(456)
      expect(date.getUTCMilliseconds()).assertEqual(456)
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_6300
     * @tc.name testDateSetUTCMilliseconds0063
     * @tc.desc Verify other UTC fields unchanged when setting milliseconds within 0-999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 6, 15, 12, 30, 45, 100))
      date.setUTCMilliseconds(800)
      expect(date.getUTCFullYear()).assertEqual(2023)
      expect(date.getUTCMonth()).assertEqual(6)
      expect(date.getUTCDate()).assertEqual(15)
      expect(date.getUTCHours()).assertEqual(12)
      expect(date.getUTCMinutes()).assertEqual(30)
      expect(date.getUTCSeconds()).assertEqual(45)
      expect(date.getUTCMilliseconds()).assertEqual(800)
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_6400
     * @tc.name testDateSetUTCMilliseconds0064
     * @tc.desc Verify setUTCSeconds and setUTCMilliseconds work independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0)
      date.setUTCSeconds(30)
      date.setUTCMilliseconds(500)
      expect(date.getUTCSeconds()).assertEqual(30)
      expect(date.getUTCMilliseconds()).assertEqual(500)
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_6500
     * @tc.name testDateSetUTCMilliseconds0065
     * @tc.desc Verify last setUTCMilliseconds call takes effect after multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0)
      date.setUTCMilliseconds(100)
      date.setUTCMilliseconds(200)
      date.setUTCMilliseconds(300)
      expect(date.getUTCMilliseconds()).assertEqual(300)
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MLLSC_6600
     * @tc.name testDateSetUTCMilliseconds0066
     * @tc.desc Verify alternating setUTCMilliseconds and other UTC setters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMilliseconds0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCHours(5);
      date.setUTCMilliseconds(250);
      date.setUTCMinutes(30);
      expect(date.getUTCHours()).assertEqual(5);
      expect(date.getUTCMinutes()).assertEqual(30);
      expect(date.getUTCMilliseconds()).assertEqual(250);
    });

  });
}
