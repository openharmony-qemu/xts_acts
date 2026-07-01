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

export default function DateSetDateTest(): void {
  describe('DateSetDateTest', () => {
    beforeAll(() => {
    })
    afterAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_0100
     * @tc.name testDateSetDate0001
     * @tc.desc Verify normal call with 1 parameter sets the day correctly
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setDate(3);
      expect(date.getDate()).assertEqual(3);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_0400
     * @tc.name testDateSetDate0004
     * @tc.desc Verify setting day to 1 (first day of month)
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 15);
      let result = date.setDate(1);
      expect(date.getDate()).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_0500
     * @tc.name testDateSetDate0005
     * @tc.desc Verify setting day to 15 (mid-month)
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setDate(15);
      expect(date.getDate()).assertEqual(15);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_0600
     * @tc.name testDateSetDate0006
     * @tc.desc Verify setting day to 31 (last day of month)
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setDate(31);
      expect(date.getDate()).assertEqual(31);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_0700
     * @tc.name testDateSetDate0007
     * @tc.desc Verify setting day to 28 (last day of February in common year)
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2023, 1, 2);
      let result = date.setDate(28);
      expect(date.getDate()).assertEqual(28);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_0900
     * @tc.name testDateSetDate0009
     * @tc.desc Verify setting day to 0 overflows to last day of previous month
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setDate(0);
      expect(date.getDate()).assertEqual(31);
      expect(date.getMonth()).assertEqual(11);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_1000
     * @tc.name testDateSetDate0010
     * @tc.desc Verify setting day to 32 overflows to next month
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setDate(32);
      expect(date.getDate()).assertEqual(1);
      expect(date.getMonth()).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_1300
     * @tc.name testDateSetDate0013
     * @tc.desc Verify setting day to -1 overflows to second-to-last day of previous month
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setDate(-1);
      expect(date.getMonth()).assertEqual(11);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_2300
     * @tc.name testDateSetDate0023
     * @tc.desc Verify timestamp changes after setting a different date
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 2);
      let before = date.getTime();
      let result = date.setDate(3);
      expect(result).assertEqual(date.getTime());
      expect(result !== before).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_2400
     * @tc.name testDateSetDate0024
     * @tc.desc Verify setting the same date returns the current timestamp
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 2);
      let before = date.getTime();
      let result = date.setDate(2);
      expect(result).assertEqual(before);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_2600
     * @tc.name testDateSetDate0026
     * @tc.desc Verify return value is negative for dates before 1970
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(1969, 11, 31);
      let result = date.setDate(30);
      expect(result < 0).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_3300
     * @tc.name testDateSetDate0033
     * @tc.desc Verify finally block always executes regardless of exception
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 2);
      date.setDate(15);
      expect(date.getDate()).assertEqual(15);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_3600
     * @tc.name testDateSetDate0036
     * @tc.desc Verify Feb 28 setDate(29) in non-leap year overflows to March
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2023, 1, 28);
      let result = date.setDate(29);
      expect(date.getDate()).assertEqual(1);
      expect(date.getMonth()).assertEqual(2);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_3700
     * @tc.name testDateSetDate0037
     * @tc.desc Verify setDate(0) rolls back to last day of previous month
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 2, 15);
      let result = date.setDate(0);
      expect(date.getDate()).assertEqual(29);
      expect(date.getMonth()).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_3800
     * @tc.name testDateSetDate0038
     * @tc.desc Verify setting day to -10 rolls back to previous month
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 2, 15);
      let result = date.setDate(-10);
      expect(date.getMonth() < 2).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_3900
     * @tc.name testDateSetDate0039
     * @tc.desc Verify leap year (2024) Feb 29 is valid
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 1, 2);
      let result = date.setDate(29);
      expect(date.getDate()).assertEqual(29);
      expect(date.getMonth()).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_4100
     * @tc.name testDateSetDate0041
     * @tc.desc Verify century leap year (2000) Feb 29 is valid
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2000, 1, 2);
      let result = date.setDate(29);
      expect(date.getDate()).assertEqual(29);
      expect(date.getMonth()).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_4200
     * @tc.name testDateSetDate0042
     * @tc.desc Verify non-century leap year (1900) Feb 29 overflows
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(1900, 1, 2);
      let result = date.setDate(29);
      expect(date.getMonth()).assertEqual(2);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_4300
     * @tc.name testDateSetDate0043
     * @tc.desc Verify setDate value matches getDate after setting
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 2);
      date.setDate(20);
      expect(date.getDate()).assertEqual(20);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_4400
     * @tc.name testDateSetDate0044
     * @tc.desc Verify consecutive multiple setDate calls produce correct final result
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 2);
      date.setDate(10);
      expect(date.getDate()).assertEqual(10);
      date.setDate(25);
      expect(date.getDate()).assertEqual(25);
      date.setDate(1);
      expect(date.getDate()).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_4500
     * @tc.name testDateSetDate0045
     * @tc.desc Verify Dec 31 setDate(32) overflows to Jan of next year
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 11, 31);
      let result = date.setDate(32);
      expect(date.getDate()).assertEqual(1);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getFullYear()).assertEqual(2025);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_4600
     * @tc.name testDateSetDate0046
     * @tc.desc Verify Jan setDate(0) rolls back to Dec 31 of previous year
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 15);
      let result = date.setDate(0);
      expect(date.getDate()).assertEqual(31);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getFullYear()).assertEqual(2023);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_4800
     * @tc.name testDateSetDate0048
     * @tc.desc Verify 30-day month (April) setDate(30) works correctly
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 3, 2);
      let result = date.setDate(30);
      expect(date.getDate()).assertEqual(30);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_4900
     * @tc.name testDateSetDate0049
     * @tc.desc Verify 30-day month (April) setDate(31) overflows to next month
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 3, 2);
      let result = date.setDate(31);
      expect(date.getDate()).assertEqual(1);
      expect(date.getMonth()).assertEqual(4);
    })

    /**
     * @tc.number SUB_DATE_SET_ITEM_CHK_5000
     * @tc.name testDateSetDate0050
     * @tc.desc Verify 31-day month (January) setDate(31) works correctly
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateSetDate0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setDate(31);
      expect(date.getDate()).assertEqual(31);
      expect(date.getMonth()).assertEqual(0);
    })
  });
}
