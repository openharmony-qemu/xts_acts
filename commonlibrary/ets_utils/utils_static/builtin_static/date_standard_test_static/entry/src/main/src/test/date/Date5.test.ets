/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';
import {BusinessError} from '@ohos.base';

export default function Date5Test() {
  describe('Date5Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_0100
     * @tc.name Date5Test_001
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date1 = new Date(2024, 4, 20, 14, 30, 45);
      date1.setFullYear(2025);
      expect(date1.getFullYear()).assertEqual(2025);
      date1.setMonth(8);
      expect(date1.getMonth()).assertEqual(8);
      date1.setDate(25);
      expect(date1.getDate()).assertEqual(25);
      date1.setHours(18);
      expect(date1.getHours()).assertEqual(18);
      date1.setMinutes(45);
      expect(date1.getMinutes()).assertEqual(45);
      date1.setSeconds(50);
      expect(date1.getSeconds()).assertEqual(50);
      const date1Str =
        `${date1.getFullYear()}-${String(date1.getMonth() + 1).padStart(2, '0')}-${String(date1.getDate())
          .padStart(2, '0')} ${String(date1.getHours()).padStart(2, '0')}:${String(date1.getMinutes())
          .padStart(2, '0')}:${String(date1.getSeconds()).padStart(2, '0')}`;
      expect(date1Str).assertEqual("2025-09-25 18:45:50");
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_0200
     * @tc.name Date5Test_002
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date2 = new Date(2024, 11, 31, 23, 59, 59, 999);
      date2.setMilliseconds(1500);
      expect(date2.getMilliseconds()).assertEqual(500);
      expect(date2.getSeconds()).assertEqual(0);
      expect(date2.getMinutes()).assertEqual(0);
      expect(date2.getHours()).assertEqual(0);
      date2.setMonth(12);
      expect(date2.getMonth()).assertEqual(0);
      expect(date2.getFullYear()).assertEqual(2026);
      date2.setDate(32);
      expect(date2.getDate()).assertEqual(1);
      expect(date2.getMonth()).assertEqual(1);
    });
    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_0300
     * @tc.name Date5Test_003
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetLocalDate = new Date(2023, 9, 1, 8, 0, 0);
      const targetTimestamp = targetLocalDate.getTime();
      const date3 = new Date(2000, 0, 1);
      date3.setTime(targetTimestamp);
      expect(date3.getFullYear()).assertEqual(2023);
      expect(date3.getMonth()).assertEqual(9);
      expect(date3.getDate()).assertEqual(1);
      expect(date3.getHours()).assertEqual(8);
      expect(date3.getMinutes()).assertEqual(0);
      expect(date3.getSeconds()).assertEqual(0);
      expect(date3.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_0400
     * @tc.name Date5Test_004
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date4 = new Date(2024, 5, 15, 10, 20, 30);
      date4.setMilliseconds(750);
      expect(date4.getMilliseconds()).assertEqual(750);
      expect(date4.getSeconds()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_0500
     * @tc.name Date5Test_005
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date5 = new Date(2024, 0, 5);
      date5.setMonth(11);
      expect(date5.getMonth()).assertEqual(11);
      expect(date5.getDate()).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_0600
     * @tc.name Date5Test_006
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date6 = new Date(2023, 1, 1);
      date6.setDate(30);
      expect(date6.getMonth()).assertEqual(2);
      expect(date6.getDate()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_0700
     * @tc.name Date5Test_007
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date7 = new Date(2024, 6, 20, 20, 0);
      date7.setHours(25);
      expect(date7.getDate()).assertEqual(21);
      expect(date7.getHours()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_0800
     * @tc.name Date5Test_008
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date8 = new Date(2024, 3, 10, 15, 30);
      date8.setMinutes(70);
      expect(date8.getHours()).assertEqual(16);
      expect(date8.getMinutes()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_0900
     * @tc.name Date5Test_009
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date9 = new Date(2024, 8, 5, 9, 15, 20);
      date9.setSeconds(80);
      expect(date9.getMinutes()).assertEqual(16);
      expect(date9.getSeconds()).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_1000
     * @tc.name Date5Test_010
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date10 = new Date(2024, 1, 29);
      date10.setFullYear(2025);
      expect(date10.getMonth()).assertEqual(2);
      expect(date10.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_1100
     * @tc.name Date5Test_011
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date11 = new Date();
      date11.setTime(0);
      const date11LocalStr =
        `${date11.getFullYear()}-${String(date11.getMonth() + 1).padStart(2, '0')}-${String(date11.getDate())
          .padStart(2, '0')} ${String(date11.getHours()).padStart(2, '0')}:${String(date11.getMinutes())
          .padStart(2, '0')}:${String(date11.getSeconds()).padStart(2, '0')}`;
      expect(date11LocalStr).assertEqual("1970-01-01 08:00:00");
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_1200
     * @tc.name Date5Test_012
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date12 = new Date(2023, 10, 1, 12, 0, 0, 0);
      date12.setFullYear(2026);
      date12.setMonth(4);
      date12.setHours(18);
      date12.setMilliseconds(300);
      expect(date12.getFullYear()).assertEqual(2026);
      expect(date12.getMonth()).assertEqual(4);
      expect(date12.getHours()).assertEqual(18);
      expect(date12.getMilliseconds()).assertEqual(300);
      const date12Str =
        `${date12.getFullYear()}-${String(date12.getMonth() + 1).padStart(2, '0')}-${String(date12.getDate())
          .padStart(2, '0')} ${String(date12.getHours()).padStart(2, '0')}:${String(date12.getMinutes())
          .padStart(2, '0')}:${String(date12.getSeconds()).padStart(2, '0')}.${String(date12.getMilliseconds())
          .padStart(3, '0')}`;
      expect(date12Str).assertEqual("2026-05-01 18:00:00.300");
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_1300
     * @tc.name Date5Test_013
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date13 = new Date(2024, 5, 1);
      date13.setDate(0);
      expect(date13.getMonth()).assertEqual(4);
      expect(date13.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_1400
     * @tc.name Date5Test_014
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date14 = new Date(2024, 0, 10);
      date14.setMonth(-1);
      expect(date14.getFullYear()).assertEqual(2023);
      expect(date14.getMonth()).assertEqual(11);
      expect(date14.getDate()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_1500
     * @tc.name Date5Test_015
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date15 = new Date(2020, 2, 15);
      date15.setFullYear(2022, 8, 20);
      expect(date15.getFullYear()).assertEqual(2022);
      expect(date15.getMonth()).assertEqual(8);
      expect(date15.getDate()).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_1600
     * @tc.name Date5Test_016
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date16 = new Date(2024, 7, 8, 14, 25, 35);
      date16.setMilliseconds(2500);
      expect(date16.getMilliseconds()).assertEqual(500);
      expect(date16.getSeconds()).assertEqual(37);
      expect(date16.getMinutes()).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_1700
     * @tc.name Date5Test_017
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date17 = new Date(2024, 9, 12, 9, 40, 15, 500);
      date17.setHours(16, 20, 30, 800);
      expect(date17.getHours()).assertEqual(16);
      expect(date17.getMinutes()).assertEqual(20);
      expect(date17.getSeconds()).assertEqual(30);
      expect(date17.getMilliseconds()).assertEqual(800);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_1800
     * @tc.name Date5Test_018
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date18 = new Date(2024, 1, 10);
      date18.setDate(40);
      expect(date18.getMonth()).assertEqual(2);
      expect(date18.getDate()).assertEqual(11);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_1900
     * @tc.name Date5Test_019
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date19 = new Date(2024, 4, 22, 18, 10, 5, 100);
      date19.setMinutes(55, 45, 600);
      expect(date19.getMinutes()).assertEqual(55);
      expect(date19.getSeconds()).assertEqual(45);
      expect(date19.getMilliseconds()).assertEqual(600);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_2000
     * @tc.name Date5Test_020
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date20 = new Date(2024, 0, 5);
      date20.setMonth(15);
      expect(date20.getFullYear()).assertEqual(2025);
      expect(date20.getMonth()).assertEqual(3);
      expect(date20.getDate()).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_2100
     * @tc.name Date5Test_021
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date21 = new Date(2024, 8, 3, 11, 20, 10, 200);
      date21.setSeconds(50, 900);
      expect(date21.getSeconds()).assertEqual(50);
      expect(date21.getMilliseconds()).assertEqual(900);
      expect(date21.getMinutes()).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_2200
     * @tc.name Date5Test_022
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date22 = new Date(2024, 5, 18);
      date22.setFullYear(-100);
      expect(date22.getFullYear()).assertEqual(-100);
      expect(date22.getMonth()).assertEqual(5);
      expect(date22.getDate()).assertEqual(18);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_2300
     * @tc.name Date5Test_023
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetTime23 = new Date(2099, 11, 31, 23, 59, 59).getTime();
      const date23 = new Date();
      date23.setTime(targetTime23);
      expect(date23.getFullYear()).assertEqual(2099);
      expect(date23.getMonth()).assertEqual(11);
      expect(date23.getDate()).assertEqual(31);
      expect(date23.getHours()).assertEqual(23);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_2400
     * @tc.name Date5Test_024
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date24 = new Date(2024, 6, 1);
      date24.setDate(-5);
      expect(date24.getMonth()).assertEqual(5);
      expect(date24.getDate()).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_2500
     * @tc.name Date5Test_025
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date25 = new Date(2024, 10, 5, 20, 30);
      date25.setMinutes(120);
      date25.setHours(25);
      expect(date25.getDate()).assertEqual(6);
      expect(date25.getHours()).assertEqual(1);
      expect(date25.getMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_2600
     * @tc.name Date5Test_026
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date26 = new Date(2024, 2, 10, 8, 15, 30, 450);
      date26.setMilliseconds(0);
      expect(date26.getMilliseconds()).assertEqual(0);
      expect(date26.getSeconds()).assertEqual(30);
      expect(date26.getMinutes()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_2700
     * @tc.name Date5Test_027
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date27 = new Date(2024, 5, 20, 2, 40, 10);
      date27.setHours(-3);
      expect(date27.getDate()).assertEqual(19);
      expect(date27.getHours()).assertEqual(21);
      expect(date27.getMinutes()).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_2800
     * @tc.name Date5Test_028
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date28 = new Date(2024, 7, 5, 14, 20, 5);
      date28.setMinutes(59);
      expect(date28.getMinutes()).assertEqual(59);
      expect(date28.getHours()).assertEqual(14);
      expect(date28.getSeconds()).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_2900
     * @tc.name Date5Test_029
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date29 = new Date(2024, 0, 15);
      date29.setMonth(8, 25);
      expect(date29.getMonth()).assertEqual(8);
      expect(date29.getDate()).assertEqual(25);
      expect(date29.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_3000
     * @tc.name Date5Test_030
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date30 = new Date(2024, 9, 12, 10, 5, 20);
      date30.setSeconds(130);
      expect(date30.getSeconds()).assertEqual(10);
      expect(date30.getMinutes()).assertEqual(7);
      expect(date30.getHours()).assertEqual(10);
    });
    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_3100
     * @tc.name Date5Test_031
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date31 = new Date(2020, 1, 29);
      date31.setFullYear(2024);
      expect(date31.getMonth()).assertEqual(1);
      expect(date31.getDate()).assertEqual(29);
      expect(date31.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_3200
     * @tc.name Date5Test_032
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const negativeTimestamp = new Date(1969, 11, 31, 23, 59, 59).getTime();
      const date32 = new Date();
      date32.setTime(negativeTimestamp);
      expect(date32.toString()).assertEqual("Wed Dec 31 1969 23:59:59 GMT+0800");
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_3300
     * @tc.name Date5Test_033
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date33 = new Date(2024, 3, 15);
      date33.setDate(30);
      expect(date33.getDate()).assertEqual(30);
      expect(date33.getMonth()).assertEqual(3);
      expect(date33.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_3400
     * @tc.name Date5Test_034
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date34 = new Date(2024, 6, 8, 9, 0, 0);
      date34.setMilliseconds(3600100);
      expect(date34.getMilliseconds()).assertEqual(100);
      expect(date34.getSeconds()).assertEqual(0);
      expect(date34.getHours()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_3500
     * @tc.name Date5Test_035
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date35 = new Date(2024, 10, 3, 18, 25, 40);
      date35.setHours(23);
      expect(date35.getHours()).assertEqual(23);
      expect(date35.getDate()).assertEqual(3);
      expect(date35.getMinutes()).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_3600
     * @tc.name Date5Test_036
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date36 = new Date(2024, 4, 15, 12, 10, 5);
      date36.setMinutes(-15);
      expect(date36.getMinutes()).assertEqual(45);
      expect(date36.getHours()).assertEqual(11);
      expect(date36.getSeconds()).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_3700
     * @tc.name Date5Test_037
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date37 = new Date(2024, 0, 10);
      date37.setMonth(5, 31);
      expect(date37.getMonth()).assertEqual(6);
      expect(date37.getDate()).assertEqual(1);
      expect(date37.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_3800
     * @tc.name Date5Test_038
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date38 = new Date(2024, 8, 22, 15, 40, 10);
      date38.setSeconds(59);
      expect(date38.getSeconds()).assertEqual(59);
      expect(date38.getMinutes()).assertEqual(40);
      expect(date38.getHours()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_3900
     * @tc.name Date5Test_039
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date39 = new Date(2020, 1, 29);
      date39.setFullYear(2023, 1, 29);
      expect(date39.getMonth()).assertEqual(2);
      expect(date39.getDate()).assertEqual(1);
      expect(date39.getFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_4000
     * @tc.name Date5Test_040
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseTimestamp = new Date(2025, 2, 1, 10, 0, 0).getTime();
      const date40 = new Date();
      date40.setTime(baseTimestamp);
      date40.setMonth(5);
      date40.setMilliseconds(780);
      expect(date40.getFullYear()).assertEqual(2025);
      expect(date40.getMonth()).assertEqual(5);
      expect(date40.getMilliseconds()).assertEqual(780);
      expect(date40.getHours()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_4100
     * @tc.name Date5Test_041
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date41 = new Date(2024, 0, 31);
      date41.setDate(32);
      expect(date41.getMonth()).assertEqual(1);
      expect(date41.getDate()).assertEqual(1);
      expect(date41.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_4200
     * @tc.name Date5Test_042
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date42 = new Date(2024, 7, 1, 8, 0, 0);
      date42.setMilliseconds(500);
      date42.setMilliseconds(800);
      expect(date42.getMilliseconds()).assertEqual(800);
      expect(date42.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_4300
     * @tc.name Date5Test_043
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date43 = new Date(2024, 9, 5, 8, 0, 0);
      date43.setHours(10, 70, 20);
      expect(date43.getHours()).assertEqual(11);
      expect(date43.getMinutes()).assertEqual(10);
      expect(date43.getSeconds()).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_4400
     * @tc.name Date5Test_044
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date44 = new Date(2024, 0, 10);
      date44.setMonth(25);
      expect(date44.getFullYear()).assertEqual(2026);
      expect(date44.getMonth()).assertEqual(1);
      expect(date44.getDate()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_4500
     * @tc.name Date5Test_045
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date45 = new Date(2024, 11, 10, 15, 20, 0);
      date45.setSeconds(30, 1200);
      expect(date45.getSeconds()).assertEqual(31);
      expect(date45.getMilliseconds()).assertEqual(200);
      expect(date45.getMinutes()).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_4600
     * @tc.name Date5Test_046
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date46 = new Date(2024, 2, 15, 9, 30, 0);
      date46.setMilliseconds(60100);
      expect(date46.getMilliseconds()).assertEqual(100);
      expect(date46.getSeconds()).assertEqual(0);
      expect(date46.getMinutes()).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_4700
     * @tc.name Date5Test_047
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date47 = new Date(2024, 5, 1, 3, 10, 5);
      date47.setHours(-5);
      expect(date47.getMonth()).assertEqual(4);
      expect(date47.getDate()).assertEqual(31);
      expect(date47.getHours()).assertEqual(19);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_4800
     * @tc.name Date5Test_048
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date48 = new Date(2024, 7, 20, 10, 0, 0);
      date48.setMinutes(1450);
      expect(date48.getDate()).assertEqual(21);
      expect(date48.getHours()).assertEqual(10);
      expect(date48.getMinutes()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_4900
     * @tc.name Date5Test_049
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date49 = new Date(2024, 1, 20);
      date49.setMonth(2, 31);
      expect(date49.getMonth()).assertEqual(2);
      expect(date49.getDate()).assertEqual(31);
      expect(date49.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_5000
     * @tc.name Date5Test_050
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date50 = new Date(2024, 9, 8, 14, 20, 0);
      date50.setSeconds(3670);
      expect(date50.getSeconds()).assertEqual(10);
      expect(date50.getMinutes()).assertEqual(21);
      expect(date50.getHours()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_5100
     * @tc.name Date5Test_051
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date51 = new Date(1999, 11, 31, 23, 59, 59);
      date51.setFullYear(2025);
      expect(date51.getFullYear()).assertEqual(2025);
      expect(date51.getMonth()).assertEqual(11);
      expect(date51.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_5200
     * @tc.name Date5Test_052
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const dayEndTimestamp = new Date(2024, 4, 10, 23, 59, 59).getTime();
      const date52 = new Date();
      date52.setTime(dayEndTimestamp + 1000);
      expect(date52.getDate()).assertEqual(11);
      expect(date52.getHours()).assertEqual(0);
      expect(date52.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_5300
     * @tc.name Date5Test_053
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date53 = new Date(2024, 6, 15);
      date53.setDate(1);
      expect(date53.getDate()).assertEqual(1);
      expect(date53.getMonth()).assertEqual(6);
      expect(date53.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_5400
     * @tc.name Date5Test_054
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date54 = new Date(2024, 8, 5, 10, 0, 0);
      date54.setMilliseconds(3000);
      date54.setMilliseconds(4000);
      expect(date54.getMilliseconds()).assertEqual(0);
      expect(date54.getSeconds()).assertEqual(7);
      expect(date54.getMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_5500
     * @tc.name Date5Test_055
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date55 = new Date(2024, 10, 12, 15, 0, 0);
      date55.setHours(23, 59, 59, 999);
      expect(date55.getHours()).assertEqual(23);
      expect(date55.getMinutes()).assertEqual(59);
      expect(date55.getSeconds()).assertEqual(59);
      expect(date55.getMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_5600
     * @tc.name Date5Test_056
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date56 = new Date(2024, 5, 25, 1, 30, 10);
      date56.setMinutes(-120);
      expect(date56.getDate()).assertEqual(24);
      expect(date56.getHours()).assertEqual(23);
      expect(date56.getMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_5700
     * @tc.name Date5Test_057
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date57 = new Date(2024, 0, 5);
      date57.setMonth(-13);
      expect(date57.getFullYear()).assertEqual(2022);
      expect(date57.getMonth()).assertEqual(11);
      expect(date57.getDate()).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_5800
     * @tc.name Date5Test_058
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date58 = new Date(2024, 7, 30, 18, 25, 10);
      date58.setSeconds(-40);
      expect(date58.getSeconds()).assertEqual(20);
      expect(date58.getMinutes()).assertEqual(24);
      expect(date58.getHours()).assertEqual(18);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_5900
     * @tc.name Date5Test_059
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date59 = new Date(2024, 4, 20);
      date59.setFullYear(2025, 11, 31);
      expect(date59.getFullYear()).assertEqual(2025);
      expect(date59.getMonth()).assertEqual(11);
      expect(date59.getDate()).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_6000
     * @tc.name Date5Test_060
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date60 = new Date(2020, 0, 1);
      date60.setFullYear(2026);
      date60.setMonth(8);
      date60.setDate(15);
      date60.setHours(14);
      expect(date60.getFullYear()).assertEqual(2026);
      expect(date60.getMonth()).assertEqual(8);
      expect(date60.getDate()).assertEqual(15);
      expect(date60.getHours()).assertEqual(14);
    });
    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_6100
     * @tc.name Date5Test_061
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date61 = new Date(2024, 2, 20, 8, 0, 0);
      date61.setMilliseconds(3661000);
      expect(date61.getMilliseconds()).assertEqual(0);
      expect(date61.getSeconds()).assertEqual(1);
      expect(date61.getMinutes()).assertEqual(1);
      expect(date61.getHours()).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_6200
     * @tc.name Date5Test_062
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date62 = new Date(2024, 3, 30, 10, 0, 0);
      date62.setHours(30);
      expect(date62.getMonth()).assertEqual(4);
      expect(date62.getDate()).assertEqual(1);
      expect(date62.getHours()).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_6300
     * @tc.name Date5Test_063
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date63 = new Date(2024, 5, 15, 14, 45, 30);
      date63.setMinutes(0);
      expect(date63.getMinutes()).assertEqual(0);
      expect(date63.getHours()).assertEqual(14);
      expect(date63.getSeconds()).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_6400
     * @tc.name Date5Test_064
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date64 = new Date(2024, 0, 10);
      date64.setMonth(5, 0);
      expect(date64.getMonth()).assertEqual(4);
      expect(date64.getDate()).assertEqual(31);
      expect(date64.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_6500
     * @tc.name Date5Test_065
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date65 = new Date(2024, 7, 10, 0, 0, 0);
      date65.setSeconds(86470);
      expect(date65.getDate()).assertEqual(11);
      expect(date65.getMinutes()).assertEqual(1);
      expect(date65.getSeconds()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_6600
     * @tc.name Date5Test_066
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date66 = new Date(2024, 1, 20);
      date66.setFullYear(-200, 2, 15);
      expect(date66.getFullYear()).assertEqual(-200);
      expect(date66.getMonth()).assertEqual(2);
      expect(date66.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_6700
     * @tc.name Date5Test_067
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const y2kTimestamp = new Date(2000, 0, 1, 0, 0, 0).getTime();
      const date67 = new Date();
      date67.setTime(y2kTimestamp);
      expect(date67.getFullYear()).assertEqual(2000);
      expect(date67.getMonth()).assertEqual(0);
      expect(date67.getDate()).assertEqual(1);
      expect(date67.getHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_6800
     * @tc.name Date5Test_068
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date68 = new Date(2024, 2, 1);
      date68.setDate(-10);
      expect(date68.getMonth()).assertEqual(1);
      expect(date68.getDate()).assertEqual(19);
      expect(date68.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_6900
     * @tc.name Date5Test_069
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date69 = new Date(2024, 8, 5, 12, 30, 45);
      date69.setMilliseconds(999);
      expect(date69.getMilliseconds()).assertEqual(999);
      date69.setMilliseconds(0);
      expect(date69.getMilliseconds()).assertEqual(0);
      expect(date69.getSeconds()).assertEqual(45);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_7000
     * @tc.name Date5Test_070
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date70 = new Date(2024, 9, 12, 10, 0, 0);
      date70.setHours(15, 30, 40, 1500);
      expect(date70.getHours()).assertEqual(15);
      expect(date70.getMinutes()).assertEqual(30);
      expect(date70.getSeconds()).assertEqual(41);
      expect(date70.getMilliseconds()).assertEqual(500);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_7100
     * @tc.name Date5Test_071
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date71 = new Date(2024, 10, 3, 8, 0, 0);
      date71.setMinutes(45, 30, 1200);
      expect(date71.getMinutes()).assertEqual(45);
      expect(date71.getSeconds()).assertEqual(31);
      expect(date71.getMilliseconds()).assertEqual(200);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_7200
     * @tc.name Date5Test_072
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date72 = new Date(2024, 0, 5);
      date72.setMonth(40);
      expect(date72.getFullYear()).assertEqual(2027);
      expect(date72.getMonth()).assertEqual(4);
      expect(date72.getDate()).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_7300
     * @tc.name Date5Test_073
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date73 = new Date(2024, 11, 20, 14, 30, 0);
      date73.setSeconds(-3700);
      expect(date73.getHours()).assertEqual(13);
      expect(date73.getMinutes()).assertEqual(28);
      expect(date73.getSeconds()).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_7400
     * @tc.name Date5Test_074
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date74 = new Date(2024, 1, 29);
      date74.setFullYear(2025);
      expect(date74.getDate()).assertEqual(1);
      expect(date74.getMonth()).assertEqual(2);
      date74.setFullYear(2028);
      expect(date74.getFullYear()).assertEqual(2028);
      expect(date74.getMonth()).assertEqual(2);
      expect(date74.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_7500
     * @tc.name Date5Test_075
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date75 = new Date(2024, 4, 1);
      date75.setDate(35);
      date75.setHours(25);
      date75.setMinutes(70);
      expect(date75.getMonth()).assertEqual(5);
      expect(date75.getDate()).assertEqual(5);
      expect(date75.getHours()).assertEqual(2);
      expect(date75.getMinutes()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_7600
     * @tc.name Date5Test_076
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date76 = new Date(2024, 2, 10, 0, 0, 0);
      date76.setMilliseconds(86401000);
      expect(date76.getMilliseconds()).assertEqual(0);
      expect(date76.getDate()).assertEqual(11);
      expect(date76.getHours()).assertEqual(0);
      expect(date76.getSeconds()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_7700
     * @tc.name Date5Test_077
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date77 = new Date(2024, 1, 28, 23, 0, 0);
      date77.setHours(25);
      expect(date77.getDate()).assertEqual(29);
      expect(date77.getHours()).assertEqual(1);
      date77.setTime(new Date(2024, 1, 28, 23, 0, 0).getTime());
      date77.setHours(25);
      expect(date77.getMonth()).assertEqual(1);
      expect(date77.getDate()).assertEqual(29);
      expect(date77.getHours()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_7800
     * @tc.name Date5Test_078
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date78 = new Date(2024, 5, 15, 0, 0, 0);
      date78.setMinutes(1439);
      expect(date78.getMinutes()).assertEqual(59);
      expect(date78.getHours()).assertEqual(23);
      expect(date78.getDate()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_7900
     * @tc.name Date5Test_079
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date79 = new Date(2023, 0, 10);
      date79.setMonth(1, 1);
      expect(date79.getMonth()).assertEqual(1);
      expect(date79.getDate()).assertEqual(1);
      expect(date79.getFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_8000
     * @tc.name Date5Test_080
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date80 = new Date(2024, 7, 20, 0, 0, 0);
      date80.setSeconds(86399);
      expect(date80.getSeconds()).assertEqual(59);
      expect(date80.getMinutes()).assertEqual(59);
      expect(date80.getHours()).assertEqual(23);
      expect(date80.getDate()).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_8100
     * @tc.name Date5Test_081
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date81 = new Date(2023, 2, 15);
      date81.setFullYear(2024, 1, 29);
      expect(date81.getFullYear()).assertEqual(2024);
      expect(date81.getMonth()).assertEqual(1);
      expect(date81.getDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_8300
     * @tc.name Date5Test_083
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date83 = new Date(2024, 0, 1);
      date83.setDate(1000);
      expect(date83.getFullYear()).assertEqual(2026);
      expect(date83.getMonth()).assertEqual(8);
      expect(date83.getDate()).assertEqual(26);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_8400
     * @tc.name Date5Test_084
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date84 = new Date(2024, 8, 5, 10, 0, 1);
      date84.setMilliseconds(-500);
      expect(date84.getMilliseconds()).assertEqual(500);
      expect(date84.getSeconds()).assertEqual(0);
      expect(date84.getMinutes()).assertEqual(0);

    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_8500
     * @tc.name Date5Test_085
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date85 = new Date(2024, 0, 1, 0, 0, 0);
      date85.setHours(-10000);
      expect(date85.getFullYear()).assertEqual(2022);
      expect(date85.getMonth()).assertEqual(10);
      expect(date85.getDate()).assertEqual(10)
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_8600
     * @tc.name Date5Test_086
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date86 = new Date(2024, 0, 1, 0, 0, 0);
      date86.setMinutes(-100000);
      expect(date86.getFullYear()).assertEqual(2023);
      expect(date86.getMonth()).assertEqual(9);
      expect(date86.getDate()).assertEqual(23);
      expect(date86.getMinutes()).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_8700
     * @tc.name Date5Test_087
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date87 = new Date(2024, 0, 1);
      date87.setMonth(-200);
      expect(date87.getFullYear()).assertEqual(2007);
      expect(date87.getMonth()).assertEqual(4);
      expect(date87.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_8800
     * @tc.name Date5Test_088
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date88 = new Date(2024, 5, 15, 10, 0, 0);
      date88.setSeconds(-90000);
      expect(date88.getDate()).assertEqual(14);
      expect(date88.getHours()).assertEqual(9);
      expect(date88.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_8900
     * @tc.name Date5Test_089
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date89 = new Date(2020, 0, 1);
      date89.setFullYear(2024);
      expect(date89.getFullYear()).assertEqual(2024);
      date89.setFullYear(2025);
      expect(date89.getFullYear()).assertEqual(2025);
      date89.setFullYear(2023);
      expect(date89.getFullYear()).assertEqual(2023);
      expect(date89.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_9000
     * @tc.name Date5Test_090
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseTime90 = new Date(2025, 5, 1, 12, 0, 0).getTime();
      const date90 = new Date();
      date90.setTime(baseTime90);
      date90.setDate(35);
      date90.setHours(30);
      date90.setMilliseconds(1200);
      expect(date90.getMonth()).assertEqual(6);
      expect(date90.getDate()).assertEqual(6);
      expect(date90.getHours()).assertEqual(6);
      expect(date90.getSeconds()).assertEqual(1);
      expect(date90.getMilliseconds()).assertEqual(200);
    });
    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_9100
     * @tc.name Date5Test_091
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date91 = new Date(2024, 2, 25, 14, 0, 0);
      date91.setMilliseconds(3661000);
      expect(date91.getMilliseconds()).assertEqual(0);
      expect(date91.getSeconds()).assertEqual(1);
      expect(date91.getMinutes()).assertEqual(1);
      expect(date91.getHours()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_9200
     * @tc.name Date5Test_092
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date92 = new Date(2023, 1, 28, 22, 0, 0);
      date92.setHours(25);
      expect(date92.getMonth()).assertEqual(2);
      expect(date92.getDate()).assertEqual(1);
      expect(date92.getHours()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_9300
     * @tc.name Date5Test_093
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date93 = new Date(2024, 5, 10, 9, 0, 0);
      date93.setMinutes(50, 70);
      expect(date93.getMinutes()).assertEqual(51);
      expect(date93.getSeconds()).assertEqual(10);
      expect(date93.getHours()).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_9400
     * @tc.name Date5Test_094
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date94 = new Date(2024, 2, 15);
      date94.setMonth(3, 31);
      expect(date94.getMonth()).assertEqual(4);
      expect(date94.getDate()).assertEqual(1);
      expect(date94.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_9500
     * @tc.name Date5Test_095
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date95 = new Date(2024, 7, 5, 16, 30, 0);
      date95.setSeconds(40, 2500);
      expect(date95.getSeconds()).assertEqual(42);
      expect(date95.getMilliseconds()).assertEqual(500);
      expect(date95.getMinutes()).assertEqual(30);

    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_9600
     * @tc.name Date5Test_096
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date96 = new Date(2020, 1, 29);
      date96.setFullYear(2024);
      expect(date96.getFullYear()).assertEqual(2024);
      expect(date96.getMonth()).assertEqual(1);
      expect(date96.getDate()).assertEqual(29);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_9800
     * @tc.name Date5Test_098
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date98 = new Date(2023, 2, 1);
      date98.setDate(-5);
      expect(date98.getMonth()).assertEqual(1);
      expect(date98.getDate()).assertEqual(23);
      expect(date98.getFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_BUILTINS_Date5_TEST_9900
     * @tc.name Date5Test_099
     * @tc.desc test date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Date5Test_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date99 = new Date(2024, 8, 10, 11, 10, 5);
      date99.setMilliseconds(-1500);
      expect(date99.getMilliseconds()).assertEqual(500);
      expect(date99.getSeconds()).assertEqual(3);
      expect(date99.getMinutes()).assertEqual(10);
    });

  })
}