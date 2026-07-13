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

export default function DateSetMinutesTest(): void {
  describe('DateSetMinutesTest', (): void => {
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
     * @tc.number SUB_DATE_SET_MNTS_CHK_0100
     * @tc.name testDateSetMinutes0001
     * @tc.desc Verify setMinutes with one parameter sets minutes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(5);
      expect(result).assertEqual(date.getTime());
      expect(date.getMinutes()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_0300
     * @tc.name testDateSetMinutes0003
     * @tc.desc Verify setMinutes with two parameters matches overload 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(5, 6);
      expect(date.getMinutes()).assertEqual(5);
      expect(date.getSeconds()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_0400
     * @tc.name testDateSetMinutes0004
     * @tc.desc Verify setMinutes with two parameters sets minutes and seconds normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(30, 45);
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getSeconds()).assertEqual(45);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_0500
     * @tc.name testDateSetMinutes0005
     * @tc.desc Verify setMinutes with three parameters matches overload 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(5, 6, 7);
      expect(date.getMinutes()).assertEqual(5);
      expect(date.getSeconds()).assertEqual(6);
      expect(date.getMilliseconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_0600
     * @tc.name testDateSetMinutes0006
     * @tc.desc Verify setMinutes with three parameters sets minutes, seconds and milliseconds normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(10, 20, 500);
      expect(date.getMinutes()).assertEqual(10);
      expect(date.getSeconds()).assertEqual(20);
      expect(date.getMilliseconds()).assertEqual(500);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_0800
     * @tc.name testDateSetMinutes0008
     * @tc.desc Verify setMinutes with value 0 sets minimum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 30);
      let result = date.setMinutes(0);
      expect(date.getMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_1000
     * @tc.name testDateSetMinutes0010
     * @tc.desc Verify setMinutes with value 59 sets maximum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(59);
      expect(date.getMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_1100
     * @tc.name testDateSetMinutes0011
     * @tc.desc Verify setMinutes with value -1 triggers carry-over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(-1);
      expect(date.getMinutes()).assertEqual(59);
      expect(date.getHours()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_1200
     * @tc.name testDateSetMinutes0012
     * @tc.desc Verify setMinutes with value 60 triggers overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(60);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getHours()).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_1900
     * @tc.name testDateSetMinutes0019
     * @tc.desc Verify setMinutes sec with value 0 sets minimum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      date.setMinutes(5, 0);
      expect(date.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_2100
     * @tc.name testDateSetMinutes0021
     * @tc.desc Verify setMinutes sec with value 59 sets maximum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      date.setMinutes(5, 59);
      expect(date.getSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_2200
     * @tc.name testDateSetMinutes0022
     * @tc.desc Verify setMinutes sec with value -1 triggers carry-over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 5, 10);
      date.setMinutes(5, -1);
      expect(date.getSeconds()).assertEqual(59);
      expect(date.getMinutes()).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_2300
     * @tc.name testDateSetMinutes0023
     * @tc.desc Verify setMinutes sec with value 60 triggers overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 5, 10);
      date.setMinutes(5, 60);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_2600
     * @tc.name testDateSetMinutes0026
     * @tc.desc Verify setMinutes ms with value 0 sets minimum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      date.setMinutes(5, 6, 0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_2800
     * @tc.name testDateSetMinutes0028
     * @tc.desc Verify setMinutes ms with value 999 sets maximum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      date.setMinutes(5, 6, 999);
      expect(date.getMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_2900
     * @tc.name testDateSetMinutes0029
     * @tc.desc Verify setMinutes ms with value -1 triggers carry-over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 5, 6, 100);
      date.setMinutes(5, 6, -1);
      expect(date.getMilliseconds()).assertEqual(999);
      expect(date.getSeconds()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_3000
     * @tc.name testDateSetMinutes0030
     * @tc.desc Verify setMinutes ms with value 1000 triggers overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 5, 6, 100);
      date.setMinutes(5, 6, 1000);
      expect(date.getMilliseconds()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_3500
     * @tc.name testDateSetMinutes0035
     * @tc.desc Verify calling three overloads sequentially on same Date object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      date.setMinutes(5);
      expect(date.getMinutes()).assertEqual(5);
      date.setMinutes(10, 30);
      expect(date.getMinutes()).assertEqual(10);
      expect(date.getSeconds()).assertEqual(30);
      date.setMinutes(20, 40, 200);
      expect(date.getMinutes()).assertEqual(20);
      expect(date.getSeconds()).assertEqual(40);
      expect(date.getMilliseconds()).assertEqual(200);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_3600
     * @tc.name testDateSetMinutes0036
     * @tc.desc Verify setMinutes causes date to cross to previous day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 0, 0);
      date.setMinutes(-1);
      expect(date.getDate()).assertEqual(1);
      expect(date.getHours()).assertEqual(23);
      expect(date.getMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_3700
     * @tc.name testDateSetMinutes0037
     * @tc.desc Verify setMinutes causes date to cross to next day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 23, 0);
      date.setMinutes(60);
      expect(date.getDate()).assertEqual(3);
      expect(date.getHours()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_3800
     * @tc.name testDateSetMinutes0038
     * @tc.desc Verify setMinutes causes date to cross to previous month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1, 0, 0);
      date.setMinutes(-1);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getDate()).assertEqual(31);
      expect(date.getHours()).assertEqual(23);
      expect(date.getMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_3900
     * @tc.name testDateSetMinutes0039
     * @tc.desc Verify setMinutes causes date to cross to next month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 31, 23, 0);
      date.setMinutes(60);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(1);
      expect(date.getHours()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_4400
     * @tc.name testDateSetMinutes0044
     * @tc.desc Verify setMinutes return value matches calculated UTC timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(5, 6, 7);
      let expected = date.getTime();
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_4500
     * @tc.name testDateSetMinutes0045
     * @tc.desc Verify consecutive setMinutes calls with increasing values return increasing results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let r1 = date.setMinutes(10);
      let r2 = date.setMinutes(20);
      let r3 = date.setMinutes(30);
      expect(r2 > r1).assertTrue();
      expect(r3 > r2).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_4600
     * @tc.name testDateSetMinutes0046
     * @tc.desc Verify consecutive setMinutes calls with decreasing values return decreasing results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let r1 = date.setMinutes(30);
      let r2 = date.setMinutes(20);
      let r3 = date.setMinutes(10);
      expect(r2 < r1).assertTrue();
      expect(r3 < r2).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_4800
     * @tc.name testDateSetMinutes0048
     * @tc.desc Verify setMinutes return value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(5);
      expect(Number.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_4900
     * @tc.name testDateSetMinutes0049
     * @tc.desc Verify setMinutes return value is not Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(5);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_5000
     * @tc.name testDateSetMinutes0050
     * @tc.desc Verify setMinutes return value when value is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(0);
      expect(date.getMinutes()).assertEqual(0);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_5100
     * @tc.name testDateSetMinutes0051
     * @tc.desc Verify setMinutes return value when value is 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(59);
      expect(date.getMinutes()).assertEqual(59);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_5200
     * @tc.name testDateSetMinutes0052
     * @tc.desc Verify setMinutes with value 120 returns valid UTC timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(120);
      expect(Number.isFinite(result)).assertTrue();
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_5300
     * @tc.name testDateSetMinutes0053
     * @tc.desc Verify setMinutes return value when all overload 3 parameters are 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(0, 0, 0);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMilliseconds()).assertEqual(0);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_5400
     * @tc.name testDateSetMinutes0054
     * @tc.desc Verify setMinutes return value when all overload 3 parameters are maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.setMinutes(59, 59, 999);
      expect(date.getMinutes()).assertEqual(59);
      expect(date.getSeconds()).assertEqual(59);
      expect(date.getMilliseconds()).assertEqual(999);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_5600
     * @tc.name testDateSetMinutes0056
     * @tc.desc Verify setMinutes on empty Date object works normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setMinutes(30);
      expect(date.getMinutes()).assertEqual(30);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_6800
     * @tc.name testDateSetMinutes0068
     * @tc.desc Verify normal setMinutes calls do not returns expected results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      date.setMinutes(5);
      expect(date.getMinutes()).assertEqual(5);
      date.setMinutes(5, 6);
      expect(date.getSeconds()).assertEqual(6);
      date.setMinutes(5, 6, 7);
      expect(date.getMilliseconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_6900
     * @tc.name testDateSetMinutes0069
     * @tc.desc Verify out-of-range values do not returns expected results with auto carry-over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      date.setMinutes(-100);
      expect(date.getMinutes()).assertEqual(20);
      date.setMinutes(5, -100);
      expect(date.getSeconds()).assertEqual(20);
      date.setMinutes(5, 6, -100);
      expect(date.getMilliseconds()).assertEqual(900);
      date.setMinutes(100);
      expect(date.getMinutes()).assertEqual(40);
      date.setMinutes(5, 100);
      expect(date.getSeconds()).assertEqual(40);
      date.setMinutes(5, 6, 2000);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_7000
     * @tc.name testDateSetMinutes0070
     * @tc.desc Verify switching from overload 3 to overload 1 preserves sec and ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      date.setMinutes(10, 20, 300);
      expect(date.getMinutes()).assertEqual(10);
      expect(date.getSeconds()).assertEqual(20);
      expect(date.getMilliseconds()).assertEqual(300);
      date.setMinutes(30);
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getSeconds()).assertEqual(20);
      expect(date.getMilliseconds()).assertEqual(300);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_7100
     * @tc.name testDateSetMinutes0071
     * @tc.desc Verify switching from overload 1 to overload 3 overwrites all fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      date.setMinutes(10);
      expect(date.getMinutes()).assertEqual(10);
      date.setMinutes(20, 30, 400);
      expect(date.getMinutes()).assertEqual(20);
      expect(date.getSeconds()).assertEqual(30);
      expect(date.getMilliseconds()).assertEqual(400);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_7200
     * @tc.name testDateSetMinutes0072
     * @tc.desc Verify setMinutes then setHours works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      date.setMinutes(30);
      expect(date.getMinutes()).assertEqual(30);
      date.setHours(10);
      expect(date.getHours()).assertEqual(10);
      expect(date.getMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_7300
     * @tc.name testDateSetMinutes0073
     * @tc.desc Verify setHours then setMinutes works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      date.setHours(10);
      expect(date.getHours()).assertEqual(10);
      date.setMinutes(30);
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getHours()).assertEqual(10);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_7400
     * @tc.name testDateSetMinutes0074
     * @tc.desc Verify setMinutes then setSeconds works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      date.setMinutes(30);
      expect(date.getMinutes()).assertEqual(30);
      date.setSeconds(45);
      expect(date.getSeconds()).assertEqual(45);
      expect(date.getMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_7500
     * @tc.name testDateSetMinutes0075
     * @tc.desc Verify setMinutes then setMilliseconds works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      date.setMinutes(30);
      expect(date.getMinutes()).assertEqual(30);
      date.setMilliseconds(500);
      expect(date.getMilliseconds()).assertEqual(500);
      expect(date.getMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_7600
     * @tc.name testDateSetMinutes0076
     * @tc.desc Verify two independent Date objects setMinutes do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(2024, 0, 2, 3, 4);
      const date2 = new Date(2024, 0, 2, 3, 4);
      date1.setMinutes(10);
      date2.setMinutes(50);
      expect(date1.getMinutes()).assertEqual(10);
      expect(date2.getMinutes()).assertEqual(50);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_7700
     * @tc.name testDateSetMinutes0077
     * @tc.desc Verify setMinutes modifies Date object in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4);
      const ref = date;
      date.setMinutes(30);
      expect(ref.getMinutes()).assertEqual(30);
      expect(date.getMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_7800
     * @tc.name testDateSetMinutes0078
     * @tc.desc Verify setting minutes to 0 achieves exact hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 45, 30, 500);
      date.setMinutes(0, 0, 0);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMilliseconds()).assertEqual(0);
      expect(date.getHours()).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_8000
     * @tc.name testDateSetMinutes0080
     * @tc.desc Verify adding 30 minutes to current time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 15);
      let currentMinutes = date.getMinutes();
      date.setMinutes(currentMinutes + 30);
      expect(date.getMinutes()).assertEqual(45);
      expect(date.getHours()).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_SET_MNTS_CHK_8100
     * @tc.name testDateSetMinutes0081
     * @tc.desc Verify subtracting 15 minutes from current time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetMinutes0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 15);
      let currentMinutes = date.getMinutes();
      date.setMinutes(currentMinutes - 15);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getHours()).assertEqual(3);
    });
  });
}

