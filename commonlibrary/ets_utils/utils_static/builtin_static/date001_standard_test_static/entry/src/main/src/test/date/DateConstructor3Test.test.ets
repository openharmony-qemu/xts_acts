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

export default function DateConstructor3Test(): void {
  describe('DateConstructor3Test', () => {
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
     * @tc.number SUB_DATE_CNSTR3_CHK_0100
     * @tc.name testDateConstructor30001
     * @tc.desc Verify passing only 2 required parameters year and monthIndex with default values for rest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
      expect(date.getHours()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_0200
     * @tc.name testDateConstructor30002
     * @tc.desc Verify passing year, monthIndex, day as three parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 15);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_0300
     * @tc.name testDateConstructor30003
     * @tc.desc Verify passing year, monthIndex, undefined day, hours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 10);
      expect(date.getHours()).assertEqual(10);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_0400
     * @tc.name testDateConstructor30004
     * @tc.desc Verify passing year, monthIndex, 1, 0, 30 skipping to minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 30);
      expect(date.getMinutes()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_0500
     * @tc.name testDateConstructor30005
     * @tc.desc Verify passing year, monthIndex, 1, 0, 0, 45 for seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 45);
      expect(date.getSeconds()).assertEqual(45);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_0600
     * @tc.name testDateConstructor30006
     * @tc.desc Verify passing year, monthIndex, 1, 0, 0, 0, 500 for milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 0, 500);
      expect(date.getMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_0700
     * @tc.name testDateConstructor30007
     * @tc.desc Verify passing year, monthIndex, day as 3 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 5, 20);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(5);
      expect(date.getDate()).assertEqual(20);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_0800
     * @tc.name testDateConstructor30008
     * @tc.desc Verify passing year, monthIndex, day, hours as 4 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 5, 20, 14);
      expect(date.getHours()).assertEqual(14);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_0900
     * @tc.name testDateConstructor30009
     * @tc.desc Verify passing year, monthIndex, day, hours, minutes as 5 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 5, 20, 14, 30);
      expect(date.getHours()).assertEqual(14);
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_1000
     * @tc.name testDateConstructor30010
     * @tc.desc Verify passing year, monthIndex, day, hours, minutes, seconds as 6 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 5, 20, 14, 30, 45);
      expect(date.getHours()).assertEqual(14);
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getSeconds()).assertEqual(45);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_1100
     * @tc.name testDateConstructor30011
     * @tc.desc Verify passing all 7 parameters year, monthIndex, day, hours, minutes, seconds, ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 2, 3, 4, 5, 6);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(2);
      expect(date.getHours()).assertEqual(3);
      expect(date.getMinutes()).assertEqual(4);
      expect(date.getSeconds()).assertEqual(5);
      expect(date.getMilliseconds()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_1200
     * @tc.name testDateConstructor30012
     * @tc.desc Verify passing 8 parameters with extra parameters ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 2, 3, 4, 5, 6);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMilliseconds()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_1300
     * @tc.name testDateConstructor30013
     * @tc.desc Verify passing only year without monthIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_1500
     * @tc.name testDateConstructor30015
     * @tc.desc Verify passing normal year 2024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1);
      expect(date.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_1600
     * @tc.name testDateConstructor30016
     * @tc.desc Verify passing Unix epoch year 1970
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(1970, 0, 1);
      expect(date.getFullYear()).assertEqual(1970);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_1700
     * @tc.name testDateConstructor30017
     * @tc.desc Verify passing year 2000 for millennium handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2000, 0, 1);
      expect(date.getFullYear()).assertEqual(2000);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_1800
     * @tc.name testDateConstructor30018
     * @tc.desc Verify passing minimum positive year 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(1, 0, 1);
      expect(date.getFullYear()).assertEqual(1901);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_1900
     * @tc.name testDateConstructor30019
     * @tc.desc Verify passing year 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(100, 0, 1);
      expect(date.getFullYear()).assertEqual(100);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_2000
     * @tc.name testDateConstructor30020
     * @tc.desc Verify passing year 9999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(9999, 0, 1);
      expect(date.getFullYear()).assertEqual(9999);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_2100
     * @tc.name testDateConstructor30021
     * @tc.desc Verify passing year 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(0, 0, 1);
      expect(date !== null).assertTrue();
      expect(date.getFullYear()).assertEqual(1900);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_2200
     * @tc.name testDateConstructor30022
     * @tc.desc Verify passing negative year -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(-1, 0, 1);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_2300
     * @tc.name testDateConstructor30023
     * @tc.desc Verify passing Int.MAX_VALUE as year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2147483647, 0, 1);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_2400
     * @tc.name testDateConstructor30024
     * @tc.desc Verify passing Int.MIN_VALUE as year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(-2147483648, 0, 1);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_2500
     * @tc.name testDateConstructor30025
     * @tc.desc Verify passing two-digit year 70 interpreted as 1970
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(70, 0, 1);
      expect(date.getFullYear()).assertEqual(1970);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_2600
     * @tc.name testDateConstructor30026
     * @tc.desc Verify passing two-digit year 99 interpreted as 1999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(99, 0, 1);
      expect(date.getFullYear()).assertEqual(1999);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_2800
     * @tc.name testDateConstructor30028
     * @tc.desc Verify passing two-digit year 69 interpreted as 1969
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(69, 0, 1);
      expect(date.getFullYear()).assertEqual(1969);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_2900
     * @tc.name testDateConstructor30029
     * @tc.desc Verify passing decimal year 2024.5 truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let date = new Date('2024.5,0,1');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_3300
     * @tc.name testDateConstructor30033
     * @tc.desc Verify passing monthIndex 0 for January
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1);
      expect(date.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_3400
     * @tc.name testDateConstructor30034
     * @tc.desc Verify passing monthIndex 6 for July
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 6, 1);
      expect(date.getMonth()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_3500
     * @tc.name testDateConstructor30035
     * @tc.desc Verify passing monthIndex 11 for December
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 11, 1);
      expect(date.getMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_3600
     * @tc.name testDateConstructor30036
     * @tc.desc Verify iterating monthIndex from 0 to 11 for all months
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (let i = 0; i < 12; i++) {
        let date = new Date(2024, i, 1);
        expect(date.getMonth()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_3700
     * @tc.name testDateConstructor30037
     * @tc.desc Verify passing monthIndex 12 overflows to next year January
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 12, 1);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_3800
     * @tc.name testDateConstructor30038
     * @tc.desc Verify passing monthIndex 13 overflows to next year February
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 13, 1);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_3900
     * @tc.name testDateConstructor30039
     * @tc.desc Verify passing monthIndex 24 overflows two years
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 24, 1);
      expect(date.getFullYear()).assertEqual(2026);
      expect(date.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_4000
     * @tc.name testDateConstructor30040
     * @tc.desc Verify passing monthIndex -1 falls back to previous year December
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, -1, 1);
      expect(date.getFullYear()).assertEqual(2023);
      expect(date.getMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_4100
     * @tc.name testDateConstructor30041
     * @tc.desc Verify passing monthIndex -12 falls back one year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, -12, 1);
      expect(date.getFullYear()).assertEqual(2023);
      expect(date.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_4200
     * @tc.name testDateConstructor30042
     * @tc.desc Verify passing Int.MAX_VALUE as monthIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 2147483647, 1);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_4300
     * @tc.name testDateConstructor30043
     * @tc.desc Verify passing Int.MIN_VALUE as monthIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, -2147483648, 1);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_4400
     * @tc.name testDateConstructor30044
     * @tc.desc Verify string NaN Date constructor returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let date = new Date('NaN');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_4500
     * @tc.name testDateConstructor30045
     * @tc.desc Verify passing decimal 6.9 as monthIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let date = new Date('2024, 6.9, 1');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_4600
     * @tc.name testDateConstructor30046
     * @tc.desc Verify passing day 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_4700
     * @tc.name testDateConstructor30047
     * @tc.desc Verify passing day 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 15);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_4800
     * @tc.name testDateConstructor30048
     * @tc.desc Verify passing day 31 in 31-day month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 31);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_4900
     * @tc.name testDateConstructor30049
     * @tc.desc Verify passing day 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 3, 30);
      expect(date.getDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_5000
     * @tc.name testDateConstructor30050
     * @tc.desc Verify passing day 28 in non-leap year February
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2023, 1, 28);
      expect(date.getDate()).assertEqual(28);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_5100
     * @tc.name testDateConstructor30051
     * @tc.desc Verify passing day 29 in leap year February
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 1, 29);
      expect(date.getDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_5200
     * @tc.name testDateConstructor30052
     * @tc.desc Verify passing day 0 falls back to last day of previous month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 1, 0);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_5300
     * @tc.name testDateConstructor30053
     * @tc.desc Verify passing day -1 falls back to second-to-last day of previous month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 1, -1);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_5400
     * @tc.name testDateConstructor30054
     * @tc.desc Verify passing day 32 in January overflows to February 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 32);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_5500
     * @tc.name testDateConstructor30055
     * @tc.desc Verify passing Int.MAX_VALUE as day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 2147483647);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_5600
     * @tc.name testDateConstructor30056
     * @tc.desc Verify passing Int.MIN_VALUE as day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, -2147483648);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_5700
     * @tc.name testDateConstructor30057
     * @tc.desc Verify not passing day defaults to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_5900
     * @tc.name testDateConstructor30059
     * @tc.desc Verify passing decimal 15.9 as day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let date = new Date('2024, 0, 15.9');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_6000
     * @tc.name testDateConstructor30060
     * @tc.desc Verify passing hours 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0);
      expect(date.getHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_6100
     * @tc.name testDateConstructor30061
     * @tc.desc Verify passing hours 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 12);
      expect(date.getHours()).assertEqual(12);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_6200
     * @tc.name testDateConstructor30062
     * @tc.desc Verify passing hours 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 23);
      expect(date.getHours()).assertEqual(23);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_6300
     * @tc.name testDateConstructor30063
     * @tc.desc Verify passing hours 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 6);
      expect(date.getHours()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_6400
     * @tc.name testDateConstructor30064
     * @tc.desc Verify passing hours 24 overflows to next day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 24);
      expect(date.getDate()).assertEqual(2);
      expect(date.getHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_6500
     * @tc.name testDateConstructor30065
     * @tc.desc Verify passing hours -1 falls back to previous day 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 2, -1);
      expect(date.getDate()).assertEqual(1);
      expect(date.getHours()).assertEqual(23);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_6600
     * @tc.name testDateConstructor30066
     * @tc.desc Verify passing hours 48 overflows two days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 48);
      expect(date.getDate()).assertEqual(3);
      expect(date.getHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_6700
     * @tc.name testDateConstructor30067
     * @tc.desc Verify passing Int.MAX_VALUE as hours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 2147483647);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_6800
     * @tc.name testDateConstructor30068
     * @tc.desc Verify passing Int.MIN_VALUE as hours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, -2147483648);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_6900
     * @tc.name testDateConstructor30069
     * @tc.desc Verify not passing hours defaults to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1);
      expect(date.getHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_7000
     * @tc.name testDateConstructor30070
     * @tc.desc Verify passing NaN as hours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1,);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_7100
     * @tc.name testDateConstructor30071
     * @tc.desc Verify passing minutes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0);
      expect(date.getMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_7300
     * @tc.name testDateConstructor30073
     * @tc.desc Verify passing minutes 59 as maximum normal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 59);
      expect(date.getMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_7400
     * @tc.name testDateConstructor30074
     * @tc.desc Verify passing minutes 60 overflows to next hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 60);
      expect(date.getHours()).assertEqual(1);
      expect(date.getMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_7500
     * @tc.name testDateConstructor30075
     * @tc.desc Verify passing minutes -1 falls back to previous hour 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 1, -1);
      expect(date.getHours()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_7600
     * @tc.name testDateConstructor30076
     * @tc.desc Verify passing Int.MAX_VALUE as minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 2147483647);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_7700
     * @tc.name testDateConstructor30077
     * @tc.desc Verify not passing minutes defaults to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 12);
      expect(date.getMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_7800
     * @tc.name testDateConstructor30078
     * @tc.desc Verify passing NaN as minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0,);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_7900
     * @tc.name testDateConstructor30079
     * @tc.desc Verify passing seconds 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 0);
      expect(date.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_8000
     * @tc.name testDateConstructor30080
     * @tc.desc Verify passing seconds 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 30);
      expect(date.getSeconds()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_8100
     * @tc.name testDateConstructor30081
     * @tc.desc Verify passing seconds 59 as maximum normal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 59);
      expect(date.getSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_8200
     * @tc.name testDateConstructor30082
     * @tc.desc Verify passing seconds 60 overflows to next minute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 60);
      expect(date.getMinutes()).assertEqual(1);
      expect(date.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_8300
     * @tc.name testDateConstructor30083
     * @tc.desc Verify passing seconds -1 falls back to previous minute 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 1, -1);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_8400
     * @tc.name testDateConstructor30084
     * @tc.desc Verify passing Int.MAX_VALUE as seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 2147483647);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_8500
     * @tc.name testDateConstructor30085
     * @tc.desc Verify not passing seconds defaults to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 12, 30);
      expect(date.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_8600
     * @tc.name testDateConstructor30086
     * @tc.desc Verify passing NaN as seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0,);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_8700
     * @tc.name testDateConstructor30087
     * @tc.desc Verify passing ms 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 0, 0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_8900
     * @tc.name testDateConstructor30089
     * @tc.desc Verify passing ms 999 as maximum normal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 0, 999);
      expect(date.getMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_9000
     * @tc.name testDateConstructor30090
     * @tc.desc Verify passing ms 1000 overflows to next second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 0, 1000);
      expect(date.getSeconds()).assertEqual(1);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_9100
     * @tc.name testDateConstructor30091
     * @tc.desc Verify passing ms -1 falls back to previous second 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 1, -1);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_9200
     * @tc.name testDateConstructor30092
     * @tc.desc Verify passing Int.MAX_VALUE as ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 0, 2147483647);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_9300
     * @tc.name testDateConstructor30093
     * @tc.desc Verify not passing ms defaults to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 12, 30, 45);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_9400
     * @tc.name testDateConstructor30094
     * @tc.desc Verify passing NaN as ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 0,);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_9500
     * @tc.name testDateConstructor30095
     * @tc.desc Verify constructor returns Date instance with instanceof check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 2, 3, 4, 5, 6);
      expect(date instanceof Date).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_9600
     * @tc.name testDateConstructor30096
     * @tc.desc Verify all fields match the passed parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 5, 15, 10, 30, 45, 123);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(5);
      expect(date.getDate()).assertEqual(15);
      expect(date.getHours()).assertEqual(10);
      expect(date.getMinutes()).assertEqual(30);
      expect(date.getSeconds()).assertEqual(45);
      expect(date.getMilliseconds()).assertEqual(123);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_9700
     * @tc.name testDateConstructor30097
     * @tc.desc Verify valueOf returns corresponding timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1);
      expect(date.valueOf() > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_9800
     * @tc.name testDateConstructor30098
     * @tc.desc Verify toString returns date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 2, 3, 4, 5, 6);
      let str = date.toString();
      expect(str.length > 0).assertTrue();
      expect(str.includes("2024")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_9900
     * @tc.name testDateConstructor30099
     * @tc.desc Verify default values when only year and monthIndex are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0);
      expect(date.getDate()).assertEqual(1);
      expect(date.getHours()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_0000
     * @tc.name testDateConstructor30100
     * @tc.desc Verify all fields correct after monthIndex overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 12, 1);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_5800
     * @tc.name testDateConstructor30102
     * @tc.desc Verify multi-level overflow from ms to minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 23, 59, 59, 1000);
      expect(date.getDate()).assertEqual(2);
      expect(date.getHours()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_7200
     * @tc.name testDateConstructor30103
     * @tc.desc Verify return value is Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1);
      expect(date instanceof Date).assertTrue();
      expect(typeof date).assertEqual("object");
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_8800
     * @tc.name testDateConstructor30105
     * @tc.desc Verify constructing date with minimum parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(1, 0, 1, 0, 0, 0, 0);
      expect(date.getFullYear()).assertEqual(1901);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_10000
     * @tc.name testDateConstructor30106
     * @tc.desc Verify constructing date with maximum year parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(9999, 11, 31, 23, 59, 59, 999);
      expect(date.getFullYear()).assertEqual(9999);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_10100
     * @tc.name testDateConstructor30107
     * @tc.desc Verify constructing date with negative year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(-1, 0, 1);
      expect(date !== null).assertTrue();
      expect(date.getFullYear()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_10300
     * @tc.name testDateConstructor30109
     * @tc.desc Verify ISO string Date constructor creates a valid Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let date = new Date("2024-01-01T00:00:00.000Z");
        expect(date !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_10400
     * @tc.name testDateConstructor30110
     * @tc.desc Verify normal date construction returns non-null Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_10600
     * @tc.name testDateConstructor30114
     * @tc.desc Verify monthIndex overflow normalizes to the following year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 13, 1);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_10700
     * @tc.name testDateConstructor30115
     * @tc.desc Verify leap year 2024 February 29 is valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 1, 29);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_10800
     * @tc.name testDateConstructor30116
     * @tc.desc Verify century leap year 2000 February 29 is valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2000, 1, 29);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_10900
     * @tc.name testDateConstructor30117
     * @tc.desc Verify non-leap year 2023 February 29 overflows to March 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2023, 1, 29);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_11000
     * @tc.name testDateConstructor30118
     * @tc.desc Verify 1900 non-leap year February 29 overflows to March 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(1900, 1, 29);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_11100
     * @tc.name testDateConstructor30119
     * @tc.desc Verify leap year February 28 is normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 1, 28);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(28);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_11200
     * @tc.name testDateConstructor30120
     * @tc.desc Verify leap year March 1 is normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 2, 1);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_11300
     * @tc.name testDateConstructor30124
     * @tc.desc Verify monthIndex -13 falls back more than one year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, -13, 1);
      expect(date.getFullYear()).assertEqual(2022);
      expect(date.getMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_11400
     * @tc.name testDateConstructor30126
     * @tc.desc Verify non-leap February day 30 overflows to March
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2023, 1, 30);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_2700
     * @tc.name testDateConstructor30127
     * @tc.desc Verify leap February day 30 overflows to March
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 1, 30);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_11500
     * @tc.name testDateConstructor30128
     * @tc.desc Verify April day 31 overflows to May
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 3, 31);
      expect(date.getMonth()).assertEqual(4);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_11600
     * @tc.name testDateConstructor30130
     * @tc.desc Verify March day 0 falls back to February 29 in leap year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 2, 0);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_11700
     * @tc.name testDateConstructor30131
     * @tc.desc Verify March day 0 falls back to February 28 in non-leap year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2023, 2, 0);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(28);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_11800
     * @tc.name testDateConstructor30132
     * @tc.desc Verify hours 24 overflows to next day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 24, 0, 0, 0);
      expect(date.getDate()).assertEqual(2);
      expect(date.getHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_11900
     * @tc.name testDateConstructor30133
     * @tc.desc Verify minutes 60 overflows to next hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 60, 0, 0);
      expect(date.getHours()).assertEqual(1);
      expect(date.getMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_12000
     * @tc.name testDateConstructor30134
     * @tc.desc Verify seconds 60 overflows to next minute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 0, 0, 60, 0);
      expect(date.getMinutes()).assertEqual(1);
      expect(date.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_12100
     * @tc.name testDateConstructor30137
     * @tc.desc Verify multi-level overflow crossing month boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 31, 23, 59, 60, 0);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(1);
      expect(date.getHours()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_12200
     * @tc.name testDateConstructor30138
     * @tc.desc Verify multi-level overflow crossing year boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 11, 31, 23, 59, 60, 0);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_12300
     * @tc.name testDateConstructor30139
     * @tc.desc Verify passing all negative parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(-1, -1, -1, -1, -1, -1, -1);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_12400
     * @tc.name testDateConstructor30140
     * @tc.desc Verify positive year with all other parameters negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, -1, -1, -1, -1, -1, -1);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_12500
     * @tc.name testDateConstructor30141
     * @tc.desc Verify negative monthIndex with positive day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, -1, 15);
      expect(date.getFullYear()).assertEqual(2023);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_12600
     * @tc.name testDateConstructor30142
     * @tc.desc Verify documentation example code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const date = new Date(2024, 0, 2, 3, 4, 5, 6);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(2);
      expect(date.getHours()).assertEqual(3);
      expect(date.getMinutes()).assertEqual(4);
      expect(date.getSeconds()).assertEqual(5);
      expect(date.getMilliseconds()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_12700
     * @tc.name testDateConstructor30143
     * @tc.desc Verify January has 31 days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 31);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_12800
     * @tc.name testDateConstructor30144
     * @tc.desc Verify non-leap February has 28 days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2023, 1, 28);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(28);
      let dateOverflow = new Date(2023, 1, 29);
      expect(dateOverflow.getMonth()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_12900
     * @tc.name testDateConstructor30146
     * @tc.desc Verify March has 31 days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 2, 31);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_13000
     * @tc.name testDateConstructor30147
     * @tc.desc Verify April has 30 days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 3, 30);
      expect(date.getMonth()).assertEqual(3);
      expect(date.getDate()).assertEqual(30);
      let dateOverflow = new Date(2024, 3, 31);
      expect(dateOverflow.getMonth()).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_13100
     * @tc.name testDateConstructor30148
     * @tc.desc Verify May has 31 days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 4, 31);
      expect(date.getMonth()).assertEqual(4);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_13200
     * @tc.name testDateConstructor30149
     * @tc.desc Verify June has 30 days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 5, 30);
      expect(date.getMonth()).assertEqual(5);
      expect(date.getDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_13300
     * @tc.name testDateConstructor30150
     * @tc.desc Verify July has 31 days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 6, 31);
      expect(date.getMonth()).assertEqual(6);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_13400
     * @tc.name testDateConstructor30151
     * @tc.desc Verify August has 31 days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 7, 31);
      expect(date.getMonth()).assertEqual(7);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_13500
     * @tc.name testDateConstructor30152
     * @tc.desc Verify September has 30 days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 8, 30);
      expect(date.getMonth()).assertEqual(8);
      expect(date.getDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_13600
     * @tc.name testDateConstructor30153
     * @tc.desc Verify October has 31 days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 9, 31);
      expect(date.getMonth()).assertEqual(9);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_13700
     * @tc.name testDateConstructor30154
     * @tc.desc Verify November has 30 days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 10, 30);
      expect(date.getMonth()).assertEqual(10);
      expect(date.getDate()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_13800
     * @tc.name testDateConstructor30155
     * @tc.desc Verify December has 31 days
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 11, 31);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_13900
     * @tc.name testDateConstructor30156
     * @tc.desc Verify constructor uses local time with getHours and getUTCHours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date = new Date(2024, 0, 1, 12, 0, 0, 0);
      expect(date.getHours()).assertEqual(12);
      let utcHours = date.getUTCHours();
      expect(utcHours >= 0 && utcHours <= 23).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR3_CHK_14000
     * @tc.name testDateConstructor30157
     * @tc.desc Verify consistent construction with same parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateConstructor30157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let date1 = new Date(2024, 0, 2, 3, 4, 5, 6);
      let date2 = new Date(2024, 0, 2, 3, 4, 5, 6);
      expect(date1.valueOf()).assertEqual(date2.valueOf());
    });
  })
};
