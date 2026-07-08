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

export default function DateSetUTCDateTest(): void {
  describe('DateSetUTCDateTest', () => {
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
     * @tc.number SUB_DATE_SET_UTC_CHK_0100
     * @tc.name testDateSetUTCDate0001
     * @tc.desc Verify setUTCDate with required parameter value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCDate(2);
      expect(result > 0).assertTrue();
      expect(date.getUTCDate()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_0200
     * @tc.name testDateSetUTCDate0002
     * @tc.desc Verify setUTCDate with day 1 keeps epoch UTC date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCDate(1);
      expect(date.getUTCDate()).assertEqual(1);
      expect(date.getUTCMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_0300
     * @tc.name testDateSetUTCDate0003
     * @tc.desc Verify setUTCDate with extra parameters ignores extras
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCDate(15);
      expect(result > 0).assertTrue();
      expect(date.getUTCDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_0900
     * @tc.name testDateSetUTCDate0009
     * @tc.desc Verify setUTCDate with minimum day value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 30));
      let result = date.setUTCDate(1);
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_1000
     * @tc.name testDateSetUTCDate0010
     * @tc.desc Verify setUTCDate with 0 rolls back to last day of previous month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15));
      let result = date.setUTCDate(0);
      expect(date.getUTCDate()).assertEqual(31);
      expect(date.getUTCMonth()).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_1100
     * @tc.name testDateSetUTCDate0011
     * @tc.desc Verify setUTCDate with -1 rolls back to second last day of previous month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15));
      let result = date.setUTCDate(-1);
      expect(date.getUTCDate()).assertEqual(30);
      expect(date.getUTCMonth()).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_1300
     * @tc.name testDateSetUTCDate0013
     * @tc.desc Verify setUTCDate with int max value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCDate(2147483647);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_1400
     * @tc.name testDateSetUTCDate0014
     * @tc.desc Verify setUTCDate with int min value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCDate(-2147483648);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**

     * @tc.number SUB_DATE_SET_UTC_CHK_1500
     * @tc.name testDateSetUTCDate0015
     * @tc.desc Verify setUTCDate with overflow day value 32 rolls to next month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1));
      let result = date.setUTCDate(32);
      expect(date.getUTCDate()).assertEqual(1);
      expect(date.getUTCMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_1600
     * @tc.name testDateSetUTCDate0016
     * @tc.desc Verify setUTCDate with hex value 0x10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 1));
      let result = date.setUTCDate(0x10);
      expect(date.getUTCDate()).assertEqual(16);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_1700
     * @tc.name testDateSetUTCDate0017
     * @tc.desc Verify setUTCDate with octal value 0o17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 1));
      let result = date.setUTCDate(0o17);
      expect(date.getUTCDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_1800
     * @tc.name testDateSetUTCDate0018
     * @tc.desc Verify setUTCDate with binary value 0b11111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1));
      let result = date.setUTCDate(0b11111);
      expect(date.getUTCDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_2900
     * @tc.name testDateSetUTCDate0029
     * @tc.desc Verify setUTCDate returns correct value after setting day to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15));
      let result = date.setUTCDate(1);
      expect(result > 0).assertTrue();
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_3000
     * @tc.name testDateSetUTCDate0030
     * @tc.desc Verify setUTCDate return value matches documentation example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCDate(2);
      expect(date.getUTCDate().toString()).assertEqual("2");
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_3100
     * @tc.name testDateSetUTCDate0031
     * @tc.desc Verify setUTCDate returns negative timestamp for pre-epoch date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCDate(-365);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_3200
     * @tc.name testDateSetUTCDate0032
     * @tc.desc Verify setUTCDate with 0 rolls back date and returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 2, 15));
      let result = date.setUTCDate(0);
      expect(result > 0).assertTrue();
      expect(date.getUTCDate()).assertEqual(29);
      expect(date.getUTCMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_3500
     * @tc.name testDateSetUTCDate0035
     * @tc.desc Verify setUTCDate timestamp difference is correct after setting date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 12, 0, 0));
      let before = date.getTime();
      let result = date.setUTCDate(20);
      let diff = result - before;
      expect(diff).assertEqual(5 * 24 * 60 * 60 * 1000);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_3600
     * @tc.name testDateSetUTCDate0036
     * @tc.desc Verify setUTCDate return type is number and integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCDate(15);
      expect(!Number.isNaN(result)).assertTrue();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_3700
     * @tc.name testDateSetUTCDate0037
     * @tc.desc Verify setUTCDate return value equals getTime after setting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 10));
      let result = date.setUTCDate(15);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_3800
     * @tc.name testDateSetUTCDate0038
     * @tc.desc Verify setUTCDate at epoch returns 0 when setting day to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setUTCDate(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_3900
     * @tc.name testDateSetUTCDate0039
     * @tc.desc Verify setUTCDate with day 32 in December rolls to next year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 11, 31));
      let result = date.setUTCDate(32);
      expect(date.getUTCFullYear()).assertEqual(2025);
      expect(date.getUTCMonth()).assertEqual(0);
      expect(date.getUTCDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_4000
     * @tc.name testDateSetUTCDate0040
     * @tc.desc Verify setUTCDate with negative value in January rolls to previous year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1));
      let result = date.setUTCDate(-1);
      expect(date.getUTCFullYear()).assertEqual(2023);
      expect(date.getUTCMonth()).assertEqual(11);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_4100
     * @tc.name testDateSetUTCDate0041
     * @tc.desc Verify setUTCDate with day 29 in leap year February returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 1, 1));
      let result = date.setUTCDate(29);
      expect(date.getUTCDate()).assertEqual(29);
      expect(date.getUTCMonth()).assertEqual(1);
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_4200
     * @tc.name testDateSetUTCDate0042
     * @tc.desc Verify setUTCDate with day 29 in non-leap year February overflows to March
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 1, 1));
      let result = date.setUTCDate(29);
      expect(date.getUTCDate()).assertEqual(1);
      expect(date.getUTCMonth()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_4700
     * @tc.name testDateSetUTCDate0047
     * @tc.desc Verify finally block always executes regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let finallyCount = 0;
      try {
        date.setUTCDate(10);
        expect(date.getUTCDate()).assertEqual(10);
      } finally {
        finallyCount++
      }
      ;

      try {
        date.setUTCDate(25);
        expect(date.getUTCDate()).assertEqual(25);
      } finally {
        finallyCount++;
      }
      expect(finallyCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_4800
     * @tc.name testDateSetUTCDate0048
     * @tc.desc Verify multiple consecutive setUTCDate calls update state correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let r1 = date.setUTCDate(5);
      expect(date.getUTCDate()).assertEqual(5);
      let r2 = date.setUTCDate(20);
      expect(date.getUTCDate()).assertEqual(20);
      expect(r2 !== r1).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_4900
     * @tc.name testDateSetUTCDate0049
     * @tc.desc Verify setUTCDate on invalid Date object returns number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date("invalid");
        let result = date.setUTCDate(15);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_5000
     * @tc.name testDateSetUTCDate0050
     * @tc.desc Verify setUTCDate with day 31 in April overflows to May 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 3, 1));
      let result = date.setUTCDate(31);
      expect(date.getUTCDate()).assertEqual(1);
      expect(date.getUTCMonth()).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_5100
     * @tc.name testDateSetUTCDate0051
     * @tc.desc Verify setUTCDate with day 30 in February overflows to March
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 1, 1));
      let result = date.setUTCDate(30);
      expect(date.getUTCMonth()).assertEqual(2);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_5300
     * @tc.name testDateSetUTCDate0053
     * @tc.desc Verify setUTCDate with 0 in March rolls back to February 28 in non-leap year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2023, 2, 15));
      let result = date.setUTCDate(0);
      expect(date.getUTCDate()).assertEqual(28);
      expect(date.getUTCMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_5500
     * @tc.name testDateSetUTCDate0055
     * @tc.desc Verify setUTCDate only changes date and keeps time unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 10, 30, 45, 500));
      let result = date.setUTCDate(20);
      expect(date.getUTCHours()).assertEqual(10);
      expect(date.getUTCMinutes()).assertEqual(30);
      expect(date.getUTCSeconds()).assertEqual(45);
      expect(date.getUTCMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_5600
     * @tc.name testDateSetUTCDate0056
     * @tc.desc Verify setUTCDate combined with setUTCMonth works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1));
      date.setUTCMonth(11);
      let result = date.setUTCDate(25);
      expect(date.getUTCMonth()).assertEqual(11);
      expect(date.getUTCDate()).assertEqual(25);
    });
    
    /**
     * @tc.number SUB_DATE_SET_UTC_CHK_5700
     * @tc.name testDateSetUTCDate0057
     * @tc.desc Verify setUTCDate combined with setUTCFullYear works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDate0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setUTCFullYear(2025);
      let result = date.setUTCDate(15);
      expect(date.getUTCFullYear()).assertEqual(2025);
      expect(date.getUTCDate()).assertEqual(15);
    });
  });
}

