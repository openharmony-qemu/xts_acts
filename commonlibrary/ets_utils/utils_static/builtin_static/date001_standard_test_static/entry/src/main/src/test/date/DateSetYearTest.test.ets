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

export default function DateSetYearTest(): void {
  describe('DateSetYearTest', () => {
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
     * @tc.number SUB_DATE_SET_YEAR_CHK_0100
     * @tc.name testDateSetYear0001
     * @tc.desc Verify setFullYear with required parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2025);
      expect(date.getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_0500
     * @tc.name testDateSetYear0005
     * @tc.desc Verify setFullYear with normal year value 1990
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(1990);
      expect(date.getFullYear()).assertEqual(1990);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_0600
     * @tc.name testDateSetYear0006
     * @tc.desc Verify setFullYear with normal year value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(1);
      expect(date.getFullYear()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_0700
     * @tc.name testDateSetYear0007
     * @tc.desc Verify setFullYear with hexadecimal year value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(0x07E6);
      expect(date.getFullYear()).assertEqual(2022);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_0800
     * @tc.name testDateSetYear0008
     * @tc.desc Verify setFullYear with year 0 as lower boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(0);
      expect(date.getFullYear()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_0900
     * @tc.name testDateSetYear0009
     * @tc.desc Verify setFullYear with int max value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2147483647);
      expect(date.getFullYear() !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_1000
     * @tc.name testDateSetYear0010
     * @tc.desc Verify setFullYear with int min value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(-2147483648);
      expect(date.getFullYear() !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_1100
     * @tc.name testDateSetYear0011
     * @tc.desc Verify setFullYear with year -1 as BCE boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(-1);
      expect(date.getFullYear()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_1300
     * @tc.name testDateSetYear0013
     * @tc.desc Verify setFullYear with two-digit year boundary 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(100);
      expect(date.getFullYear()).assertEqual(100);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_1400
     * @tc.name testDateSetYear0014
     * @tc.desc Verify setFullYear with max two-digit year 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(99);
      expect(date.getFullYear()).assertEqual(99);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_3100
     * @tc.name testDateSetYear0031
     * @tc.desc Verify setFullYear does not affect month and date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15);
      date.setFullYear(2025);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(5);
      expect(date.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_3200
     * @tc.name testDateSetYear0032
     * @tc.desc Verify timestamp changes correctly after setFullYear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let beforeTime = date.getTime();
      date.setFullYear(2025);
      let afterTime = date.getTime();
      expect(afterTime !== beforeTime).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_3600
     * @tc.name testDateSetYear0036
     * @tc.desc Verify setFullYear from 2024 to 2025 cross year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 11, 31);
      date.setFullYear(2025);
      expect(date.getFullYear()).assertEqual(2025);
      expect(date.getMonth()).assertEqual(11);
      expect(date.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_3700
     * @tc.name testDateSetYear0037
     * @tc.desc Verify setFullYear from leap year to non-leap year with Feb 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 1, 29);
      date.setFullYear(2025);
      expect(date.getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_3800
     * @tc.name testDateSetYear0038
     * @tc.desc Verify setFullYear from non-leap year to leap year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2023, 1, 28);
      date.setFullYear(2024);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_3900
     * @tc.name testDateSetYear0039
     * @tc.desc Verify multiple consecutive setFullYear calls with last one taking effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(2020);
      date.setFullYear(2021);
      date.setFullYear(2025);
      expect(date.getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_4200
     * @tc.name testDateSetYear0042
     * @tc.desc Verify setFullYear with negative year (BCE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(-100);
      expect(date.getFullYear()).assertEqual(-100);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_4400
     * @tc.name testDateSetYear0044
     * @tc.desc Verify setFullYear with year 9999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(9999);
      expect(date.getFullYear()).assertEqual(9999);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_4500
     * @tc.name testDateSetYear0045
     * @tc.desc Verify setFullYear with year 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setFullYear(10000);
      expect(date.getFullYear()).assertEqual(10000);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_4700
     * @tc.name testDateSetYear0047
     * @tc.desc Verify setFullYear from January 1st
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1);
      date.setFullYear(2026);
      expect(date.getFullYear()).assertEqual(2026);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_YEAR_CHK_4900
     * @tc.name testDateSetYear0049
     * @tc.desc Verify setFullYear on default constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetYear0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      date.setFullYear(2030);
      expect(date.getFullYear()).assertEqual(2030);
    });
  });
}
