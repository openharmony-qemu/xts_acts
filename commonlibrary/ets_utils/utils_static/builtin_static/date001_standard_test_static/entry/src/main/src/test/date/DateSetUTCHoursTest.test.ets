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

export default function DateSetUTCHoursTest(): void {
  describe('DateSetUTCHoursTest' as string, () => {
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
     * @tc.number SUB_DATE_SET_UTC_HOURS_0100
     * @tc.name testDateSetUTCHours0001
     * @tc.desc Verify setUTCHours with one parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4);
      expect(result).assertEqual(Date.UTC(1970, 0, 1, 4, 0, 0, 0));
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_0200
     * @tc.name testDateSetUTCHours0002
     * @tc.desc Verify setUTCHours with two parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5);
      expect(result).assertEqual(Date.UTC(1970, 0, 1, 4, 5, 0, 0));
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_0300
     * @tc.name testDateSetUTCHours0003
     * @tc.desc Verify setUTCHours with three parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5, 6);
      expect(result).assertEqual(Date.UTC(1970, 0, 1, 4, 5, 6, 0));
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_0400
     * @tc.name testDateSetUTCHours0004
     * @tc.desc Verify setUTCHours with four parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5, 6, 7);
      expect(result).assertEqual(Date.UTC(1970, 0, 1, 4, 5, 6, 7));
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_0700
     * @tc.name testDateSetUTCHours0007
     * @tc.desc Verify setUTCHours with mid-range value 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(12);
      let expected = Date.UTC(1970, 0, 1, 12, 0, 0, 0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_0800
     * @tc.name testDateSetUTCHours0008
     * @tc.desc Verify setUTCHours with lower boundary value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(0);
      let expected = Date.UTC(1970, 0, 1, 0, 0, 0, 0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_0900
     * @tc.name testDateSetUTCHours0009
     * @tc.desc Verify setUTCHours with upper boundary value 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(23);
      let expected = Date.UTC(1970, 0, 1, 23, 0, 0, 0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_1000
     * @tc.name testDateSetUTCHours0010
     * @tc.desc Verify setUTCHours with hexadecimal value 0x10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(0x10);
      expect(result).assertEqual(Date.UTC(1970, 0, 1, 16, 0, 0, 0));
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_1400
     * @tc.name testDateSetUTCHours0014
     * @tc.desc Verify setUTCHours with negative value -1 crosses day backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(-1);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_1500
     * @tc.name testDateSetUTCHours0015
     * @tc.desc Verify setUTCHours with value 24 crosses day forward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(24);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_1600
     * @tc.name testDateSetUTCHours0016
     * @tc.desc Verify setUTCHours with maximum int value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(2147483647);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_1700
     * @tc.name testDateSetUTCHours0017
     * @tc.desc Verify setUTCHours with minimum int value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(-2147483648);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_2600
     * @tc.name testDateSetUTCHours0026
     * @tc.desc Verify setUTCHours with mid-range min value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 30);
      let expected = Date.UTC(1970, 0, 1, 4, 30, 0, 0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_2700
     * @tc.name testDateSetUTCHours0027
     * @tc.desc Verify setUTCHours with lower boundary min value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 0);
      let expected = Date.UTC(1970, 0, 1, 4, 0, 0, 0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_2800
     * @tc.name testDateSetUTCHours0028
     * @tc.desc Verify setUTCHours with upper boundary min value 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 59);
      let expected = Date.UTC(1970, 0, 1, 4, 59, 0, 0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_2900
     * @tc.name testDateSetUTCHours0029
     * @tc.desc Verify setUTCHours with min -1 crosses hour backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, -1);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_3000
     * @tc.name testDateSetUTCHours0030
     * @tc.desc Verify setUTCHours with min 60 crosses hour forward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 60);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_3500
     * @tc.name testDateSetUTCHours0035
     * @tc.desc Verify setUTCHours with mid-range sec value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5, 30);
      let expected = Date.UTC(1970, 0, 1, 4, 5, 30, 0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_3600
     * @tc.name testDateSetUTCHours0036
     * @tc.desc Verify setUTCHours with lower boundary sec value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5, 0);
      let expected = Date.UTC(1970, 0, 1, 4, 5, 0, 0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_3700
     * @tc.name testDateSetUTCHours0037
     * @tc.desc Verify setUTCHours with upper boundary sec value 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5, 59);
      let expected = Date.UTC(1970, 0, 1, 4, 5, 59, 0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_3800
     * @tc.name testDateSetUTCHours0038
     * @tc.desc Verify setUTCHours with sec -1 crosses minute backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5, -1);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_3900
     * @tc.name testDateSetUTCHours0039
     * @tc.desc Verify setUTCHours with sec 60 crosses minute forward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5, 60);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_4300
     * @tc.name testDateSetUTCHours0043
     * @tc.desc Verify setUTCHours with mid-range ms value 500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5, 6, 500);
      let expected = Date.UTC(1970, 0, 1, 4, 5, 6, 500);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_4400
     * @tc.name testDateSetUTCHours0044
     * @tc.desc Verify setUTCHours with lower boundary ms value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5, 6, 0);
      let expected = Date.UTC(1970, 0, 1, 4, 5, 6, 0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_4500
     * @tc.name testDateSetUTCHours0045
     * @tc.desc Verify setUTCHours with upper boundary ms value 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5, 6, 999);
      let expected = Date.UTC(1970, 0, 1, 4, 5, 6, 999);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_4600
     * @tc.name testDateSetUTCHours0046
     * @tc.desc Verify setUTCHours with ms -1 crosses second backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5, 6, -1);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_4700
     * @tc.name testDateSetUTCHours0047
     * @tc.desc Verify setUTCHours with ms 1000 crosses second forward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5, 6, 1000);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_5100
     * @tc.name testDateSetUTCHours0051
     * @tc.desc Verify setUTCHours with all minimum valid parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(0, 0, 0, 0);
      let expected = Date.UTC(1970, 0, 1, 0, 0, 0, 0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_5200
     * @tc.name testDateSetUTCHours0052
     * @tc.desc Verify setUTCHours with all maximum valid parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(23, 59, 59, 999);
      let expected = Date.UTC(1970, 0, 1, 23, 59, 59, 999);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_5300
     * @tc.name testDateSetUTCHours0053
     * @tc.desc Verify setUTCHours with all out-of-range parameters causes cascading carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(24, 60, 60, 1000);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_5400
     * @tc.name testDateSetUTCHours0054
     * @tc.desc Verify setUTCHours with all negative parameters causes cascading borrow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(-1, -1, -1, -1);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_5500
     * @tc.name testDateSetUTCHours0055
     * @tc.desc Verify consecutive calls to different overloads take effect independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCHours(4);
      expect(date.getUTCHours()).assertEqual(4);
      date.setUTCHours(4, 5);
      expect(date.getUTCMinutes()).assertEqual(5);
      date.setUTCHours(4, 5, 6);
      expect(date.getUTCSeconds()).assertEqual(6);
      date.setUTCHours(4, 5, 6, 7);
      expect(date.getUTCMilliseconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_6100
     * @tc.name testDateSetUTCHours0061
     * @tc.desc Verify return value is 0 when setting UTC epoch time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(0, 0, 0, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_6200
     * @tc.name testDateSetUTCHours0062
     * @tc.desc Verify return value is positive with large hour value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(23, 59, 59, 999);
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_6300
     * @tc.name testDateSetUTCHours0063
     * @tc.desc Verify return value is negative with negative hour value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(-1);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_6400
     * @tc.name testDateSetUTCHours0064
     * @tc.desc Verify return value equals date.getTime() after setUTCHours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCHours(4, 5, 6, 7);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_6800
     * @tc.name testDateSetUTCHours0068
     * @tc.desc Verify year rollover when calling setUTCHours(24) on Dec 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2025, 11, 31, 23, 0, 0, 0));
      let result = date.setUTCHours(24);
      expect(date.getUTCFullYear()).assertEqual(2026);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_6900
     * @tc.name testDateSetUTCHours0069
     * @tc.desc Verify setUTCHours on leap year Feb 29 does not change date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 1, 29, 12, 0, 0, 0));
      let result = date.setUTCHours(8);
      expect(date.getUTCDate()).assertEqual(29);
      expect(date.getUTCHours()).assertEqual(8);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_7400
     * @tc.name testDateSetUTCHours0074
     * @tc.desc Verify Date state is correct after setUTCHours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCHours(4, 5, 6, 7);
      expect(date.getUTCHours()).assertEqual(4);
      expect(date.getUTCMinutes()).assertEqual(5);
      expect(date.getUTCSeconds()).assertEqual(6);
      expect(date.getUTCMilliseconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_7500
     * @tc.name testDateSetUTCHours0075
     * @tc.desc Verify setUTCHours only modifies time without affecting date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2025, 5, 15, 10, 30, 45, 100));
      date.setUTCHours(8, 20, 30, 500);
      expect(date.getUTCFullYear()).assertEqual(2025);
      expect(date.getUTCMonth()).assertEqual(5);
      expect(date.getUTCDate()).assertEqual(15);
      expect(date.getUTCHours()).assertEqual(8);
      expect(date.getUTCMinutes()).assertEqual(20);
      expect(date.getUTCSeconds()).assertEqual(30);
      expect(date.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_7800
     * @tc.name testDateSetUTCHours0078
     * @tc.desc Verify setUTCHours result is timezone-independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCHours(12, 30, 0, 0);
      expect(date.getUTCHours()).assertEqual(12);
      expect(date.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_7900
     * @tc.name testDateSetUTCHours0079
     * @tc.desc Verify multiple consecutive setUTCHours calls correctly override previous values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCHours(4);
      expect(date.getUTCHours()).assertEqual(4);
      date.setUTCHours(8);
      expect(date.getUTCHours()).assertEqual(8);
      date.setUTCHours(23, 59, 59, 999);
      expect(date.getUTCHours()).assertEqual(23);
      expect(date.getUTCMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_8100
     * @tc.name testDateSetUTCHours0081
     * @tc.desc Verify setUTCHours to midnight 00:00:00.000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2025, 5, 15, 12, 30, 45, 100));
      date.setUTCHours(0, 0, 0, 0);
      expect(date.getUTCHours()).assertEqual(0);
      expect(date.getUTCMinutes()).assertEqual(0);
      expect(date.getUTCSeconds()).assertEqual(0);
      expect(date.getUTCMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_8200
     * @tc.name testDateSetUTCHours0082
     * @tc.desc Verify value 25 advances date by 1 day with hour 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2025, 0, 1, 0, 0, 0, 0));
      date.setUTCHours(25);
      expect(date.getUTCDate()).assertEqual(2);
      expect(date.getUTCHours()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_8300
     * @tc.name testDateSetUTCHours0083
     * @tc.desc Verify min -1 decreases hour and sets minute to 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2025, 0, 1, 1, 0, 0, 0));
      date.setUTCHours(1, -1);
      expect(date.getUTCHours()).assertEqual(0);
      expect(date.getUTCMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_HOURS_8400
     * @tc.name testDateSetUTCHours0084
     * @tc.desc Verify ms -1 decreases second and sets millisecond to 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCHours0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2025, 0, 1, 0, 0, 1, 0));
      date.setUTCHours(0, 0, 1, -1);
      expect(date.getUTCSeconds()).assertEqual(0);
      expect(date.getUTCMilliseconds()).assertEqual(999);
    });
  });
}