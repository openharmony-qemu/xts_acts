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

export default function DateSetUTCSecondsTest(): void {
  describe('DateSetUTCSecondsTest', () => {
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
     * @tc.number SUB_DATE_SET_UTC_SCNDS_0100
     * @tc.name testDateSetUTCSeconds0001
     * @tc.desc Verify setUTCSeconds with one required parameter sets UTC seconds normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(6);
      expect(result).assertEqual(Date.UTC(1970, 0, 1, 0, 0, 6));
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_0200
     * @tc.name testDateSetUTCSeconds0002
     * @tc.desc Verify setUTCSeconds with zero keeps epoch seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCSeconds(0);
      expect(date.getUTCSeconds()).assertEqual(0);
      expect(date.getTime()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_0300
     * @tc.name testDateSetUTCSeconds0003
     * @tc.desc Verify setUTCSeconds with value and ms parameters sets both UTC seconds and milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(6, 7);
      expect(result).assertEqual(Date.UTC(1970, 0, 1, 0, 0, 6, 7));
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_0500
     * @tc.name testDateSetUTCSeconds0005
     * @tc.desc Verify setUTCSeconds with more than 2 parameters ignores extra arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(6, 7);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_0600
     * @tc.name testDateSetUTCSeconds0006
     * @tc.desc Verify setUTCSeconds with value 0 (minimum valid value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15, 10, 30, 30));
      let result = date.setUTCSeconds(0);
      expect(date.getUTCSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_0700
     * @tc.name testDateSetUTCSeconds0007
     * @tc.desc Verify setUTCSeconds with value 30 (middle value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(30);
      expect(date.getUTCSeconds()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_1000
     * @tc.name testDateSetUTCSeconds0010
     * @tc.desc Verify setUTCSeconds with value -1 (negative, below lower bound)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(-1);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_1100
     * @tc.name testDateSetUTCSeconds0011
     * @tc.desc Verify setUTCSeconds with value 60 (above upper bound)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(60);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_1200
     * @tc.name testDateSetUTCSeconds0012
     * @tc.desc Verify setUTCSeconds with value 2147483647 (int max value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(2147483647);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_1300
     * @tc.name testDateSetUTCSeconds0013
     * @tc.desc Verify setUTCSeconds with value -2147483648 (int min value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(-2147483648);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_2100
     * @tc.name testDateSetUTCSeconds0021
     * @tc.desc Verify setUTCSeconds with ms -1 (negative, below lower bound)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(6, -1);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_2200
     * @tc.name testDateSetUTCSeconds0022
     * @tc.desc Verify setUTCSeconds with ms 1000 (above upper bound)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(6, 1000);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_2300
     * @tc.name testDateSetUTCSeconds0023
     * @tc.desc Verify setUTCSeconds with ms 2147483647 (int max value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(6, 2147483647);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_2400
     * @tc.name testDateSetUTCSeconds0024
     * @tc.desc Verify setUTCSeconds with ms -2147483648 (int min value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(6, -2147483648);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_2800
     * @tc.name testDateSetUTCSeconds0028
     * @tc.desc Verify setUTCSeconds with value 0 and ms 0 (double zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15, 10, 30, 45, 500));
      let result = date.setUTCSeconds(0, 0);
      expect(date.getUTCSeconds()).assertEqual(0);
      expect(date.getUTCMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_2900
     * @tc.name testDateSetUTCSeconds0029
     * @tc.desc Verify setUTCSeconds with value 59 and ms 999 (both maximum)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(59, 999);
      expect(date.getUTCSeconds()).assertEqual(59);
      expect(date.getUTCMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_3000
     * @tc.name testDateSetUTCSeconds0030
     * @tc.desc Verify setUTCSeconds with value 0 and ms 999 (seconds min, milliseconds max)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(0, 999);
      expect(date.getUTCSeconds()).assertEqual(0);
      expect(date.getUTCMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_3100
     * @tc.name testDateSetUTCSeconds0031
     * @tc.desc Verify setUTCSeconds with value 59 and ms 0 (seconds max, milliseconds min)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(59, 0);
      expect(date.getUTCSeconds()).assertEqual(59);
      expect(date.getUTCMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_3200
     * @tc.name testDateSetUTCSeconds0032
     * @tc.desc Verify setUTCSeconds with value 60 triggers minute carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15, 10, 30, 0));
      date.setUTCSeconds(60);
      expect(date.getUTCMinutes()).assertEqual(31);
      expect(date.getUTCSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_3300
     * @tc.name testDateSetUTCSeconds0033
     * @tc.desc Verify setUTCSeconds with ms 1000 triggers seconds carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15, 10, 30, 0, 0));
      date.setUTCSeconds(0, 1000);
      expect(date.getUTCSeconds()).assertEqual(1);
      expect(date.getUTCMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_3400
     * @tc.name testDateSetUTCSeconds0034
     * @tc.desc Verify setUTCSeconds with value -1 triggers minute borrow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15, 10, 1, 0));
      date.setUTCSeconds(-1);
      expect(date.getUTCMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_3500
     * @tc.name testDateSetUTCSeconds0035
     * @tc.desc Verify setUTCSeconds(value) returns long type timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(6);
      expect(result).assertEqual(6000);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_3600
     * @tc.name testDateSetUTCSeconds0036
     * @tc.desc Verify setUTCSeconds(value, ms) returns long type timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(6, 7);
      expect(result).assertEqual(6007);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_3700
     * @tc.name testDateSetUTCSeconds0037
     * @tc.desc Verify returned timestamp is consistent with getUTCSeconds and getUTCMilliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(30, 500);
      let verifyDate = new Date(result);
      expect(verifyDate.getUTCSeconds()).assertEqual(30);
      expect(verifyDate.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_3800
     * @tc.name testDateSetUTCSeconds0038
     * @tc.desc Verify setUTCSeconds returns positive value after normal setting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15, 10, 30, 0));
      let result = date.setUTCSeconds(30);
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_3900
     * @tc.name testDateSetUTCSeconds0039
     * @tc.desc Verify setUTCSeconds returns value near epoch time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(0, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_4000
     * @tc.name testDateSetUTCSeconds0040
     * @tc.desc Verify setUTCSeconds returns NaN when Date object is invalid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(30);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_4100
     * @tc.name testDateSetUTCSeconds0041
     * @tc.desc Verify setUTCSeconds return type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(6, 7);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_4200
     * @tc.name testDateSetUTCSeconds0042
     * @tc.desc Verify setUTCSeconds return value is not NaN and not Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15, 10, 30, 0));
      let result = date.setUTCSeconds(45, 250);
      expect(!Number.isNaN(result)).assertTrue();
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_4300
     * @tc.name testDateSetUTCSeconds0043
     * @tc.desc Verify setUTCSeconds with extremely large value returns valid timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCSeconds(2147483647);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_4400
     * @tc.name testDateSetUTCSeconds0044
     * @tc.desc Verify setUTCSeconds with extremely small negative value returns valid timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15, 10, 30, 0));
      let result = date.setUTCSeconds(-86400);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_4600
     * @tc.name testDateSetUTCSeconds0046
     * @tc.desc Verify setUTCSeconds with out-of-range value normalizes or catches RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      try {
        let result = date.setUTCSeconds(120);
        expect(date.getUTCMinutes()).assertEqual(2);
        expect(date.getUTCSeconds()).assertEqual(0);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_4700
     * @tc.name testDateSetUTCSeconds0047
     * @tc.desc Verify setUTCSeconds with out-of-range ms normalizes or catches RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15, 10, 30, 0, 0));
      try {
        let result = date.setUTCSeconds(0, 1500);
        expect(date.getUTCSeconds()).assertEqual(1);
        expect(date.getUTCMilliseconds()).assertEqual(500);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_4900
     * @tc.name testDateSetUTCSeconds0049
     * @tc.desc Verify Date object state remains valid after abnormal parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 5, 15, 10, 30, 45, 500));
      let originalTime = date.getTime();
      let result = date.setUTCSeconds(0, 0);
      expect(date.getUTCMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_5000
     * @tc.name testDateSetUTCSeconds0050
     * @tc.desc Verify multiple calls to setUTCSeconds, last one takes effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCSeconds(10);
      date.setUTCSeconds(20);
      date.setUTCSeconds(30);
      expect(date.getUTCSeconds()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_5100
     * @tc.name testDateSetUTCSeconds0051
     * @tc.desc Verify alternating overload 1 and overload 2 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCSeconds(30);
      expect(date.getUTCSeconds()).assertEqual(30);
      date.setUTCSeconds(45, 800);
      expect(date.getUTCSeconds()).assertEqual(45);
      expect(date.getUTCMilliseconds()).assertEqual(800);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_5200
     * @tc.name testDateSetUTCSeconds0052
     * @tc.desc Verify overload 2 then overload 1, milliseconds should remain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCSeconds(30, 500);
      expect(date.getUTCMilliseconds()).assertEqual(500);
      date.setUTCSeconds(45);
      expect(date.getUTCSeconds()).assertEqual(45);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_5300
     * @tc.name testDateSetUTCSeconds0053
     * @tc.desc Verify setUTCSeconds then setUTCMinutes does not affect seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCSeconds(30);
      date.setUTCMinutes(15);
      expect(date.getUTCMinutes()).assertEqual(15);
      expect(date.getUTCSeconds()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_SCNDS_5400
     * @tc.name testDateSetUTCSeconds0054
     * @tc.desc Verify setUTCHours then setUTCSeconds does not affect hours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCSeconds0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCHours(10);
      date.setUTCSeconds(45, 250);
      expect(date.getUTCHours()).assertEqual(10);
      expect(date.getUTCSeconds()).assertEqual(45);
      expect(date.getUTCMilliseconds()).assertEqual(250);
    });
  });
}
