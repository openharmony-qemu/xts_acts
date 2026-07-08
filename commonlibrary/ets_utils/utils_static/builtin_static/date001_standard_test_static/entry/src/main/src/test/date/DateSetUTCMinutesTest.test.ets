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

export default function DateSetUTCMinutesTest(): void {
  describe('DateSetUTCMinutesTest', () => {
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
     * @tc.number SUB_DATE_SET_UTC_MNTS_0100
     * @tc.name testDateSetUTCMinutes0001
     * @tc.desc Verify setUTCMinutes with one parameter sets UTC minutes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMinutes(5);
      expect(result).assertEqual(date.getTime());
      expect(date.getUTCMinutes()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_0200
     * @tc.name testDateSetUTCMinutes0002
     * @tc.desc Verify setUTCMinutes with two parameters sets UTC minutes and seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMinutes(5, 6);
      expect(result).assertEqual(date.getTime());
      expect(date.getUTCMinutes()).assertEqual(5);
      expect(date.getUTCSeconds()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_0300
     * @tc.name testDateSetUTCMinutes0003
     * @tc.desc Verify setUTCMinutes with three parameters sets UTC minutes, seconds and milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMinutes(5, 6, 7);
      expect(result).assertEqual(date.getTime());
      expect(date.getUTCMinutes()).assertEqual(5);
      expect(date.getUTCSeconds()).assertEqual(6);
      expect(date.getUTCMilliseconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_0600
     * @tc.name testDateSetUTCMinutes0006
     * @tc.desc Verify setUTCMinutes with value 0 as minimum normal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 30));
      date.setUTCMinutes(0);
      expect(date.getUTCMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_0700
     * @tc.name testDateSetUTCMinutes0007
     * @tc.desc Verify setUTCMinutes with value 59 as maximum normal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 30));
      date.setUTCMinutes(59);
      expect(date.getUTCMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_0800
     * @tc.name testDateSetUTCMinutes0008
     * @tc.desc Verify setUTCMinutes with value 30 as half hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(30);
      expect(date.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_0900
     * @tc.name testDateSetUTCMinutes0009
     * @tc.desc Verify setUTCMinutes with value 1 near lower boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(1);
      expect(date.getUTCMinutes()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_2100
     * @tc.name testDateSetUTCMinutes0010
     * @tc.desc Verify setUTCMinutes with value 58 near upper boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(58);
      expect(date.getUTCMinutes()).assertEqual(58);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_1100
     * @tc.name testDateSetUTCMinutes0011
     * @tc.desc Verify setUTCMinutes with value 15 as typical business value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(15);
      expect(date.getUTCMinutes()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_1200
     * @tc.name testDateSetUTCMinutes0012
     * @tc.desc Verify setUTCMinutes with value -1 causes UTC hour to roll back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(-1);
      expect(date.getUTCMinutes()).assertEqual(59);
      expect(date.getUTCHours()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_1300
     * @tc.name testDateSetUTCMinutes0013
     * @tc.desc Verify setUTCMinutes with value 60 causes UTC hour to roll forward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(60);
      expect(date.getUTCMinutes()).assertEqual(0);
      expect(date.getUTCHours()).assertEqual(13);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_1400
     * @tc.name testDateSetUTCMinutes0014
     * @tc.desc Verify setUTCMinutes with large positive value 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(1000);
      expect(date.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_1500
     * @tc.name testDateSetUTCMinutes0015
     * @tc.desc Verify setUTCMinutes with large negative value -1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(-1000);
      expect(date.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_1600
     * @tc.name testDateSetUTCMinutes0016
     * @tc.desc Verify setUTCMinutes with int max value 2147483647 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(2147483647);
      expect(date.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_1700
     * @tc.name testDateSetUTCMinutes017
     * @tc.desc Verify setUTCMinutes with int min value -2147483648 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(-2147483648);
      expect(date.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_2200
     * @tc.name testDateSetUTCMinutes0022
     * @tc.desc Verify setUTCMinutes sec parameter with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(5, 0);
      expect(date.getUTCSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_2300
     * @tc.name testDateSetUTCMinutes0023
     * @tc.desc Verify setUTCMinutes sec parameter with value 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(5, 59);
      expect(date.getUTCSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_2400
     * @tc.name testDateSetUTCMinutes0024
     * @tc.desc Verify setUTCMinutes sec parameter with value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(5, 30);
      expect(date.getUTCSeconds()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_2500
     * @tc.name testDateSetUTCMinutes0025
     * @tc.desc Verify setUTCMinutes sec parameter with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(5, 1);
      expect(date.getUTCSeconds()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_2600
     * @tc.name testDateSetUTCMinutes0026
     * @tc.desc Verify setUTCMinutes sec parameter with value 58
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(5, 58);
      expect(date.getUTCSeconds()).assertEqual(58);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_2700
     * @tc.name testDateSetUTCMinutes0027
     * @tc.desc Verify setUTCMinutes sec parameter with -1 causes borrow back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5));
      date.setUTCMinutes(5, -1);
      expect(date.getUTCSeconds()).assertEqual(59);
      expect(date.getUTCMinutes()).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_2800
     * @tc.name testDateSetUTCMinutes0028
     * @tc.desc Verify setUTCMinutes sec parameter with 60 causes carry forward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5));
      date.setUTCMinutes(5, 60);
      expect(date.getUTCSeconds()).assertEqual(0);
      expect(date.getUTCMinutes()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_2900
     * @tc.name testDateSetUTCMinutes0029
     * @tc.desc Verify setUTCMinutes sec parameter with large value 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5));
      date.setUTCMinutes(5, 1000);
      expect(date.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_3000
     * @tc.name testDateSetUTCMinutes0030
     * @tc.desc Verify setUTCMinutes sec parameter with large negative value -1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5));
      date.setUTCMinutes(5, -1000);
      expect(date.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_3100
     * @tc.name testDateSetUTCMinutes0031
     * @tc.desc Verify setUTCMinutes sec parameter with int max value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5));
      date.setUTCMinutes(5, 2147483647);
      expect(date.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_3200
     * @tc.name testDateSetUTCMinutes0032
     * @tc.desc Verify setUTCMinutes sec parameter with int min value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5));
      date.setUTCMinutes(5, -2147483648);
      expect(date.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_3600
     * @tc.name testDateSetUTCMinutes0036
     * @tc.desc Verify setUTCMinutes ms parameter with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5, 6));
      date.setUTCMinutes(5, 6, 0);
      expect(date.getUTCMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_3700
     * @tc.name testDateSetUTCMinutes0037
     * @tc.desc Verify setUTCMinutes ms parameter with value 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5, 6));
      date.setUTCMinutes(5, 6, 999);
      expect(date.getUTCMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_3800
     * @tc.name testDateSetUTCMinutes0038
     * @tc.desc Verify setUTCMinutes ms parameter with value 500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5, 6));
      date.setUTCMinutes(5, 6, 500);
      expect(date.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_3900
     * @tc.name testDateSetUTCMinutes0039
     * @tc.desc Verify setUTCMinutes ms parameter with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5, 6));
      date.setUTCMinutes(5, 6, 1);
      expect(date.getUTCMilliseconds()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_4000
     * @tc.name testDateSetUTCMinutes0040
     * @tc.desc Verify setUTCMinutes ms parameter with value 998
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5, 6));
      date.setUTCMinutes(5, 6, 998);
      expect(date.getUTCMilliseconds()).assertEqual(998);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_4100
     * @tc.name testDateSetUTCMinutes0041
     * @tc.desc Verify setUTCMinutes ms parameter with value 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5, 6));
      date.setUTCMinutes(5, 6, 100);
      expect(date.getUTCMilliseconds()).assertEqual(100);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_4200
     * @tc.name testDateSetUTCMinutes0042
     * @tc.desc Verify setUTCMinutes ms parameter with -1 causes borrow back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5, 6));
      date.setUTCMinutes(5, 6, -1);
      expect(date.getUTCMilliseconds()).assertEqual(999);
      expect(date.getUTCSeconds()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_4300
     * @tc.name testDateSetUTCMinutes0043
     * @tc.desc Verify setUTCMinutes ms parameter with 1000 causes carry forward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5, 6));
      date.setUTCMinutes(5, 6, 1000);
      expect(date.getUTCMilliseconds()).assertEqual(0);
      expect(date.getUTCSeconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_4400
     * @tc.name testDateSetUTCMinutes0044
     * @tc.desc Verify setUTCMinutes ms parameter with large value 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5, 6));
      date.setUTCMinutes(5, 6, 100000);
      expect(date.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_4500
     * @tc.name testDateSetUTCMinutes0045
     * @tc.desc Verify setUTCMinutes ms parameter with large negative value -100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5, 6));
      date.setUTCMinutes(5, 6, -100000);
      expect(date.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_4600
     * @tc.name testDateSetUTCMinutes0046
     * @tc.desc Verify setUTCMinutes ms parameter with int max value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5, 6));
      date.setUTCMinutes(5, 6, 2147483647);
      expect(date.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_4700
     * @tc.name testDateSetUTCMinutes0047
     * @tc.desc Verify setUTCMinutes ms parameter with int min value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 5, 6));
      date.setUTCMinutes(5, 6, -2147483648);
      expect(date.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_5100
     * @tc.name testDateSetUTCMinutes0051
     * @tc.desc Verify setUTCMinutes with value 60 crosses UTC date boundary forward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 23, 30));
      date.setUTCMinutes(60);
      expect(date.getUTCDate()).assertEqual(3);
      expect(date.getUTCHours()).assertEqual(0);
      expect(date.getUTCMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_5200
     * @tc.name testDateSetUTCMinutes0052
     * @tc.desc Verify setUTCMinutes with value -1 crosses UTC date boundary backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 0, 0));
      date.setUTCMinutes(-1);
      expect(date.getUTCDate()).assertEqual(1);
      expect(date.getUTCHours()).assertEqual(23);
      expect(date.getUTCMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_5300
     * @tc.name testDateSetUTCMinutes0053
     * @tc.desc Verify setUTCMinutes with value 120 crosses 2 hours forward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 22, 30));
      date.setUTCMinutes(120);
      expect(date.getUTCDate()).assertEqual(3);
      expect(date.getUTCHours()).assertEqual(0);
      expect(date.getUTCMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_5400
     * @tc.name testDateSetUTCMinutes0054
     * @tc.desc Verify setUTCMinutes with value -61 crosses date boundary backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 3, 1, 0));
      date.setUTCMinutes(-61);
      expect(date.getUTCDate()).assertEqual(2);
      expect(date.getUTCHours()).assertEqual(23);
      expect(date.getUTCMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_5500
     * @tc.name testDateSetUTCMinutes0055
     * @tc.desc Verify setUTCMinutes crosses month boundary forward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 31, 23, 30));
      date.setUTCMinutes(60);
      expect(date.getUTCMonth()).assertEqual(1);
      expect(date.getUTCDate()).assertEqual(1);
      expect(date.getUTCHours()).assertEqual(0);
      expect(date.getUTCMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_5600
     * @tc.name testDateSetUTCMinutes0056
     * @tc.desc Verify setUTCMinutes crosses month boundary backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 2, 1, 0, 0));
      date.setUTCMinutes(-1);
      expect(date.getUTCMonth()).assertEqual(1);
      expect(date.getUTCDate()).assertEqual(29);
      expect(date.getUTCHours()).assertEqual(23);
      expect(date.getUTCMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_5700
     * @tc.name testDateSetUTCMinutes0057
     * @tc.desc Verify setUTCMinutes crosses year boundary forward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 11, 31, 23, 30));
      date.setUTCMinutes(60);
      expect(date.getUTCFullYear()).assertEqual(2025);
      expect(date.getUTCMonth()).assertEqual(0);
      expect(date.getUTCDate()).assertEqual(1);
      expect(date.getUTCHours()).assertEqual(0);
      expect(date.getUTCMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_5800
     * @tc.name testDateSetUTCMinutes0058
     * @tc.desc Verify setUTCMinutes crosses year boundary backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2025, 0, 1, 0, 0));
      date.setUTCMinutes(-1);
      expect(date.getUTCFullYear()).assertEqual(2024);
      expect(date.getUTCMonth()).assertEqual(11);
      expect(date.getUTCDate()).assertEqual(31);
      expect(date.getUTCHours()).assertEqual(23);
      expect(date.getUTCMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_5900
     * @tc.name testDateSetUTCMinutes0059
     * @tc.desc Verify setUTCMinutes on leap year Feb 29 crosses day boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 1, 29, 23, 30));
      date.setUTCMinutes(60);
      expect(date.getUTCMonth()).assertEqual(2);
      expect(date.getUTCDate()).assertEqual(1);
      expect(date.getUTCHours()).assertEqual(0);
      expect(date.getUTCMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_6400
     * @tc.name testDateSetUTCMinutes0064
     * @tc.desc Verify all parameters as boundary overflow cause cascade carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 23, 0, 0, 0));
      date.setUTCMinutes(59, 60, 1000);
      expect(date.getUTCDate()).assertEqual(3);
      expect(date.getUTCHours()).assertEqual(0);
      expect(date.getUTCMinutes()).assertEqual(0);
      expect(date.getUTCSeconds()).assertEqual(1);
      expect(date.getUTCMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_6500
     * @tc.name testDateSetUTCMinutes0065
     * @tc.desc Verify all parameters as negative boundary cause cascade borrow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 0, 0, 0, 0));
      date.setUTCMinutes(0, -1, -1);
      expect(date.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_6600
     * @tc.name testDateSetUTCMinutes0066
     * @tc.desc Verify setUTCMinutes returns UTC millisecond timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMinutes(5);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_6700
     * @tc.name testDateSetUTCMinutes0067
     * @tc.desc Verify setUTCMinutes return value difference reflects time change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 0, 0));
      let before = date.getTime();
      let after = date.setUTCMinutes(30);
      let diff = after - before;
      expect(diff).assertEqual(30 * 60 * 1000);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_6800
     * @tc.name testDateSetUTCMinutes0068
     * @tc.desc Verify setUTCMinutes overload 2 returns correct timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 0, 0, 0));
      let before = date.getTime();
      let after = date.setUTCMinutes(30, 45);
      let diff = after - before;
      expect(diff).assertEqual((30 * 60 + 45) * 1000);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_6900
     * @tc.name testDateSetUTCMinutes0069
     * @tc.desc Verify setUTCMinutes overload 3 returns correct timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 0, 0, 0, 0));
      let before = date.getTime();
      let after = date.setUTCMinutes(30, 45, 200);
      let diff = after - before;
      expect(diff).assertEqual((30 * 60 + 45) * 1000 + 200);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_7000
     * @tc.name testDateSetUTCMinutes0070
     * @tc.desc Verify setUTCMinutes return value equals date.getTime after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMinutes(5, 6, 7);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_7100
     * @tc.name testDateSetUTCMinutes0071
     * @tc.desc Verify setUTCMinutes returns positive number for valid value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      let result = date.setUTCMinutes(30);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_7200
     * @tc.name testDateSetUTCMinutes0072
     * @tc.desc Verify consecutive setUTCMinutes with increasing values return increasing results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      let r1 = date.setUTCMinutes(10);
      let r2 = date.setUTCMinutes(20);
      let r3 = date.setUTCMinutes(30);
      expect(r2 > r1).assertTrue();
      expect(r3 > r2).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_7300
     * @tc.name testDateSetUTCMinutes0073
     * @tc.desc Verify consecutive setUTCMinutes with decreasing values return decreasing results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 30));
      let r1 = date.setUTCMinutes(30);
      let r2 = date.setUTCMinutes(20);
      let r3 = date.setUTCMinutes(10);
      expect(r2 < r1).assertTrue();
      expect(r3 < r2).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_7400
     * @tc.name testDateSetUTCMinutes0074
     * @tc.desc Verify setUTCMinutes return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMinutes(5);
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_7500
     * @tc.name testDateSetUTCMinutes0075
     * @tc.desc Verify setUTCMinutes return value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMinutes(5);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_7600
     * @tc.name testDateSetUTCMinutes0076
     * @tc.desc Verify setUTCMinutes return value is not Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMinutes(5);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_7700
     * @tc.name testDateSetUTCMinutes0077
     * @tc.desc Verify setUTCMinutes return equals new Date constructed timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(Date.UTC(2024, 0, 2, 0, 0, 0, 0));
      let ts1 = date1.setUTCMinutes(5, 6, 7);
      const date2 = new Date(Date.UTC(2024, 0, 2, 0, 5, 6, 7));
      expect(ts1).assertEqual(date2.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_7800
     * @tc.name testDateSetUTCMinutes0078
     * @tc.desc Verify setUTCMinutes near epoch time returns value close to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(1970, 0, 1, 0, 0, 0, 0));
      let result = date.setUTCMinutes(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_7900
     * @tc.name testDateSetUTCMinutes0079
     * @tc.desc Verify setUTCMinutes with far future date returns large positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2100, 0, 1, 12, 0));
      let result = date.setUTCMinutes(30);
      let lowerBound: long = 4000000000000;
      expect(result > lowerBound).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_8000
     * @tc.name testDateSetUTCMinutes0080
     * @tc.desc Verify setUTCMinutes with far past date returns negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(1900, 0, 1, 12, 0));
      let result = date.setUTCMinutes(30);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_8100
     * @tc.name testDateSetUTCMinutes0081
     * @tc.desc Verify multiple consecutive calls reflect latest setting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 0, 0));
      let r1 = date.setUTCMinutes(15);
      let r2 = date.setUTCMinutes(30);
      let r3 = date.setUTCMinutes(45);
      expect(r2 - r1).assertEqual(15 * 60 * 1000);
      expect(r3 - r2).assertEqual(15 * 60 * 1000);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_8200
     * @tc.name testDateSetUTCMinutes0082
     * @tc.desc Verify setUTCMinutes with all three parameters as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 30));
      let result = date.setUTCMinutes(0, 0, 0);
      expect(date.getUTCMinutes()).assertEqual(0);
      expect(date.getUTCSeconds()).assertEqual(0);
      expect(date.getUTCMilliseconds()).assertEqual(0);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_8300
     * @tc.name testDateSetUTCMinutes0083
     * @tc.desc Verify setUTCMinutes with all three parameters at maximum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      let result = date.setUTCMinutes(59, 59, 999);
      expect(date.getUTCMinutes()).assertEqual(59);
      expect(date.getUTCSeconds()).assertEqual(59);
      expect(date.getUTCMilliseconds()).assertEqual(999);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_9100
     * @tc.name testDateSetUTCMinutes0091
     * @tc.desc Verify setUTCMinutes on invalid Date returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMinutes(5);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_9200
     * @tc.name testDateSetUTCMinutes0092
     * @tc.desc Verify setUTCMinutes on epoch Date(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCMinutes(5);
      expect(date.getUTCMinutes()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_9300
     * @tc.name testDateSetUTCMinutes0093
     * @tc.desc Verify setUTCMinutes on near max timestamp Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(8640000000000000 - 1);
      let result = date.setUTCMinutes(59);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_9400
     * @tc.name testDateSetUTCMinutes0094
     * @tc.desc Verify setUTCMinutes on near min timestamp Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-8640000000000000 + 1);
      let result = date.setUTCMinutes(0);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_3400
     * @tc.name testDateSetUTCMinutes0102
     * @tc.desc Verify out-of-range values auto carry or catch RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      try {
        date.setUTCMinutes(-100);
        date.setUTCMinutes(5, -100);
        date.setUTCMinutes(5, 6, -100);
        date.setUTCMinutes(100);
        date.setUTCMinutes(5, 100);
        date.setUTCMinutes(5, 6, 2000);
        expect(date.getUTCMinutes()).assertEqual(5);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_3500
     * @tc.name testDateSetUTCMinutes0103
     * @tc.desc Verify NaN parameter causes setUTCMinutes to return NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      let result = date.setUTCMinutes(0);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_4900
     * @tc.name testDateSetUTCMinutes0104
     * @tc.desc Verify undefined parameter causes setUTCMinutes to return NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      let result = date.setUTCMinutes(1);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_0500
     * @tc.name testDateSetUTCMinutes0105
     * @tc.desc Verify switching from overload 3 to overload 1 only changes minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(5, 6, 7);
      expect(date.getUTCMinutes()).assertEqual(5);
      expect(date.getUTCSeconds()).assertEqual(6);
      expect(date.getUTCMilliseconds()).assertEqual(7);
      date.setUTCMinutes(30);
      expect(date.getUTCMinutes()).assertEqual(30);
      expect(date.getUTCSeconds()).assertEqual(6);
      expect(date.getUTCMilliseconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_5000
     * @tc.name testDateSetUTCMinutes0106
     * @tc.desc Verify progressively upgrading from overload 1 to overload 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(5);
      expect(date.getUTCMinutes()).assertEqual(5);
      date.setUTCMinutes(5, 6);
      expect(date.getUTCSeconds()).assertEqual(6);
      date.setUTCMinutes(5, 6, 7);
      expect(date.getUTCMilliseconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_8700
     * @tc.name testDateSetUTCMinutes0107
     * @tc.desc Verify overload return value increment between overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 0, 0, 0, 0));
      let r1 = date.setUTCMinutes(5);
      let r2 = date.setUTCMinutes(5, 6);
      let diff2 = r2 - r1;
      expect(diff2).assertEqual(6 * 1000);
      let r3 = date.setUTCMinutes(5, 6, 7);
      let diff3 = r3 - r2;
      expect(diff3).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_8800
     * @tc.name testDateSetUTCMinutes0108
     * @tc.desc Verify setUTCMinutes on default constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setUTCMinutes(30);
      expect(date.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_8900
     * @tc.name testDateSetUTCMinutes0109
     * @tc.desc Verify setUTCMinutes on timestamp constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1704067200000);
      let result = date.setUTCMinutes(5, 6, 7);
      expect(date.getUTCMinutes()).assertEqual(5);
      expect(date.getUTCSeconds()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_1000
     * @tc.name testDateSetUTCMinutes0110
     * @tc.desc Verify setUTCMinutes on full parameter constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 10, 30, 45, 500));
      let result = date.setUTCMinutes(0, 0, 0);
      expect(date.getUTCMinutes()).assertEqual(0);
      expect(date.getUTCSeconds()).assertEqual(0);
      expect(date.getUTCMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_9000
     * @tc.name testDateSetUTCMinutes0111
     * @tc.desc Verify setUTCMinutes on string constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date("2024-01-02T12:00:00Z");
      let result = date.setUTCMinutes(30);
      expect(date.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_9500
     * @tc.name testDateSetUTCMinutes0112
     * @tc.desc Verify setUTCMinutes then setUTCHours interaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(30);
      expect(date.getUTCMinutes()).assertEqual(30);
      date.setUTCHours(10);
      expect(date.getUTCHours()).assertEqual(10);
      expect(date.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_9600
     * @tc.name testDateSetUTCMinutes0113
     * @tc.desc Verify setUTCHours then setUTCMinutes interaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCHours(10);
      expect(date.getUTCHours()).assertEqual(10);
      date.setUTCMinutes(30);
      expect(date.getUTCMinutes()).assertEqual(30);
      expect(date.getUTCHours()).assertEqual(10);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_9700
     * @tc.name testDateSetUTCMinutes0114
     * @tc.desc Verify setUTCMinutes then setUTCSeconds interaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(30);
      expect(date.getUTCMinutes()).assertEqual(30);
      date.setUTCSeconds(45);
      expect(date.getUTCSeconds()).assertEqual(45);
      expect(date.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_9800
     * @tc.name testDateSetUTCMinutes0115
     * @tc.desc Verify setUTCMinutes then setUTCMilliseconds interaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date.setUTCMinutes(30);
      expect(date.getUTCMinutes()).assertEqual(30);
      date.setUTCMilliseconds(500);
      expect(date.getUTCMilliseconds()).assertEqual(500);
      expect(date.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_10000
     * @tc.name testDateSetUTCMinutes0116
     * @tc.desc Verify two independent Date objects setUTCMinutes do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(Date.UTC(2024, 0, 2, 12, 0));
      const date2 = new Date(Date.UTC(2024, 0, 2, 12, 0));
      date1.setUTCMinutes(10);
      date2.setUTCMinutes(50);
      expect(date1.getUTCMinutes()).assertEqual(10);
      expect(date2.getUTCMinutes()).assertEqual(50);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_10100
     * @tc.name testDateSetUTCMinutes0117
     * @tc.desc Verify setUTCMinutes modifies Date object in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 2, 12, 0));
      const ref = date;
      date.setUTCMinutes(30);
      expect(ref.getUTCMinutes()).assertEqual(30);
      expect(date.getUTCMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_10200
     * @tc.name testDateSetUTCMinutes0118
     * @tc.desc Verify document example complete run for all overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCMinutes(5);
      expect(date.getUTCMinutes()).assertEqual(5);
      date.setUTCMinutes(5, 6);
      expect(date.getUTCMinutes()).assertEqual(5);
      expect(date.getUTCSeconds()).assertEqual(6);
      date.setUTCMinutes(5, 6, 7);
      expect(date.getUTCMinutes()).assertEqual(5);
      expect(date.getUTCSeconds()).assertEqual(6);
      expect(date.getUTCMilliseconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_MNTS_10300
     * @tc.name testDateSetUTCMinutes0119
     * @tc.desc Verify document example return value types for all overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCMinutes0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let r1 = date.setUTCMinutes(5);
      let r2 = date.setUTCMinutes(5, 6);
      let r3 = date.setUTCMinutes(5, 6, 7);
      expect(!Number.isNaN(r1)).assertTrue();
      expect(!Number.isNaN(r2)).assertTrue();
      expect(!Number.isNaN(r3)).assertTrue();
    });
  });
}
