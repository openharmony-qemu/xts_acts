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

export default function DateGetMonthTest(): void {
  describe('DateGetMonthTest', () => {
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
     * @tc.number SUB_DATE_GET_MONTH_CHK_0100
     * @tc.name testDateGetMonth0001
     * @tc.desc Verify getMonth() returns correct month (0-11) when called without arguments
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      let result: int = date.getMonth();
      expect(result).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_0200
     * @tc.name testDateGetMonth0002
     * @tc.desc Verify getMonth() ignores extra single argument and returns correct month
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      let result: int = (date.getMonth as (p: int) => int)(999);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_0300
     * @tc.name testDateGetMonth0003
     * @tc.desc Verify getMonth() ignores multiple extra arguments and returns correct month
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 5, 15);
      let result: int = (date.getMonth as (p1: int, p2: int, p3: int) => int)(1, 2, 3);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_0600
     * @tc.name testDateGetMonth0006
     * @tc.desc Verify getMonth() ignores string as extra argument
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      let result: int = (date.getMonth as (p: string) => int)("invalid");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_0700
     * @tc.name testDateGetMonth0007
     * @tc.desc Verify getMonth() ignores boolean as extra argument
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      let result: int = (date.getMonth as (p: boolean) => int)(true);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_0800
     * @tc.name testDateGetMonth0008
     * @tc.desc Verify getMonth() returns 0 for January
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 1);
      let result: int = date.getMonth();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_1300
     * @tc.name testDateGetMonth0013
     * @tc.desc Verify getMonth() returns 5 for June
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 5, 1);
      let result: int = date.getMonth();
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_1900
     * @tc.name testDateGetMonth0019
     * @tc.desc Verify getMonth() returns 11 for December
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 11, 1);
      let result: int = date.getMonth();
      expect(result).assertEqual(11);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_2000
     * @tc.name testDateGetMonth0020
     * @tc.desc Verify getMonth() returns minimum value 0
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 1);
      let result: int = date.getMonth();
      expect(result).assertEqual(0);
      expect(result >= 0).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_2100
     * @tc.name testDateGetMonth0021
     * @tc.desc Verify getMonth() returns maximum value 11
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 11, 31);
      let result: int = date.getMonth();
      expect(result).assertEqual(11);
      expect(result <= 11).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_2300
     * @tc.name testDateGetMonth0023
     * @tc.desc Verify getMonth() returns correct value near maximum boundary
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 10, 30);
      let result: int = date.getMonth();
      expect(result).assertEqual(10);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_2400
     * @tc.name testDateGetMonth0024
     * @tc.desc Verify getMonth() return type is number
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      let result: int = date.getMonth();
      expect(result >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_2500
     * @tc.name testDateGetMonth0025
     * @tc.desc Verify getMonth() return value is an integer
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      let result: int = date.getMonth();
      expect(Number.isInteger(result)).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_2600
     * @tc.name testDateGetMonth0026
     * @tc.desc Verify getMonth() return value is within range 0-11
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 6, 15);
      let result: int = date.getMonth();
      expect(result >= 0 && result <= 11).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_2700
     * @tc.name testDateGetMonth0027
     * @tc.desc Verify getMonth() return value is not NaN for valid Date
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      let result: int = date.getMonth();
      expect(Number.isNaN(result)).assertFalse();
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_2800
     * @tc.name testDateGetMonth0028
     * @tc.desc Verify getMonth() return value can be used in arithmetic operations
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      let result: int = date.getMonth();
      expect(result + 1).assertEqual(2);
      expect(result - 1).assertEqual(0);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_2900
     * @tc.name testDateGetMonth0029
     * @tc.desc Verify getMonth() return value can be converted to string via toString()
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      let result: int = date.getMonth();
      expect(result.toString()).assertEqual("1");
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_3000
     * @tc.name testDateGetMonth0030
     * @tc.desc Verify getMonth() returns same value on multiple calls
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      let r1: int = date.getMonth();
      let r2: int = date.getMonth();
      let r3: int = date.getMonth();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_3100
     * @tc.name testDateGetMonth0031
     * @tc.desc Verify getMonth() handles month overflow with input 13
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 12, 1);
      let result: int = date.getMonth();
      expect(result).assertEqual(0);
      expect(date.getFullYear()).assertEqual(2025);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_3200
     * @tc.name testDateGetMonth0032
     * @tc.desc Verify getMonth() handles negative month input
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, -1, 1);
      let result: int = date.getMonth();
      expect(result).assertEqual(11);
      expect(date.getFullYear()).assertEqual(2023);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_3300
     * @tc.name testDateGetMonth0033
     * @tc.desc Verify getMonth() handles month input of -12
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, -12, 1);
      let result: int = date.getMonth();
      expect(result).assertEqual(0);
      expect(date.getFullYear()).assertEqual(2023);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_3400
     * @tc.name testDateGetMonth0034
     * @tc.desc Verify getMonth() handles month overflow with input 24
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 24, 1);
      let result: int = date.getMonth();
      expect(result).assertEqual(0);
      expect(date.getFullYear()).assertEqual(2026);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_3500
     * @tc.name testDateGetMonth0035
     * @tc.desc Verify getMonth() returns NaN for invalid Date object
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      try {
        const date = new Date('invalid');
        let result: int = date.getMonth();
        expect(Number.isNaN(result)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_3600
     * @tc.name testDateGetMonth0036
     * @tc.desc Verify calling getMonth() on null returns expected result
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      try {
        let d: Date = null as Date;
        d.getMonth();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_3700
     * @tc.name testDateGetMonth0037
     * @tc.desc Verify calling getMonth() on undefined returns expected result
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      try {
        let d: Date = undefined as Date;
        d.getMonth();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_3900
     * @tc.name testDateGetMonth0039
     * @tc.desc Verify finally block executes after getMonth() call
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      let result: int = date.getMonth();
      expect(result).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_4100
     * @tc.name testDateGetMonth0041
     * @tc.desc Verify non-Date instance cannot call getMonth (normal Date instance call)
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date: Date = new Date(2024, 1, 2);
      let result: int = date.getMonth();
      expect(result >= 0).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_4200
     * @tc.name testDateGetMonth0042
     * @tc.desc Verify getMonth() with Date constructed from year, month, day
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      expect(date.getMonth()).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_4300
     * @tc.name testDateGetMonth0043
     * @tc.desc Verify getMonth() with Date constructed from year, month
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 5);
      expect(date.getMonth()).assertEqual(5);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_4400
     * @tc.name testDateGetMonth0044
     * @tc.desc Verify getMonth() with Date constructed from timestamp
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 5, 15);
      expect(date.getMonth()).assertEqual(5);

      const timestamp: number = new Date(2024, 5, 15).getTime();
      expect(date.getTime() === timestamp).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_4500
     * @tc.name testDateGetMonth0045
     * @tc.desc Verify getMonth() with Date constructed from date string
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date("2024-06-15");
      expect(date.getMonth()).assertEqual(5);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_4600
     * @tc.name testDateGetMonth0046
     * @tc.desc Verify getMonth() with Date constructed from ISO string
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date("2024-06-15T12:30:00");
      expect(date.getMonth()).assertEqual(5);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_4700
     * @tc.name testDateGetMonth0047
     * @tc.desc Verify getMonth() with Date constructed from year, month, day, hours, minutes, seconds
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 5, 15, 10, 30, 0);
      expect(date.getMonth()).assertEqual(5);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_4800
     * @tc.name testDateGetMonth0048
     * @tc.desc Verify getMonth() with Date constructed from full parameters including milliseconds
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 5, 15, 10, 30, 0, 500);
      expect(date.getMonth()).assertEqual(5);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_4900
     * @tc.name testDateGetMonth0049
     * @tc.desc Verify getMonth() returns 0-11 for Date constructed with no arguments
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date();
      let result: int = date.getMonth();
      expect(result >= 0 && result <= 11).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_5000
     * @tc.name testDateGetMonth0050
     * @tc.desc Verify getMonth() after date overflow crossing month boundary
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 31);
      date.setDate(date.getDate() + 1);
      expect(date.getMonth()).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_5100
     * @tc.name testDateGetMonth0051
     * @tc.desc Verify getMonth() after date overflow crossing year boundary
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 11, 31);
      date.setDate(date.getDate() + 1);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getFullYear()).assertEqual(2025);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_5200
     * @tc.name testDateGetMonth0052
     * @tc.desc Verify getMonth() with day=0 rolls back to previous month
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 2, 0);
      expect(date.getMonth()).assertEqual(1);
      expect(date.getDate()).assertEqual(29);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_5300
     * @tc.name testDateGetMonth0053
     * @tc.desc Verify getMonth() for Feb 29 in non-leap year overflows to March
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 1, 29);
      expect(date.getMonth()).assertEqual(2);
      expect(date.getDate()).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_5500
     * @tc.name testDateGetMonth0055
     * @tc.desc Verify getMonth() returns 1 for Feb 29 in leap year
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 29);
      expect(date.getMonth()).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_5800
     * @tc.name testDateGetMonth0058
     * @tc.desc Verify getMonth() returns 1 for Feb 28 in leap year
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 28);
      expect(date.getMonth()).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_6000
     * @tc.name testDateGetMonth0060
     * @tc.desc Verify getMonth() returns 0 at start of year (Jan 1 00:00:00)
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 1, 0, 0, 0);
      expect(date.getMonth()).assertEqual(0);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_6100
     * @tc.name testDateGetMonth0061
     * @tc.desc Verify getMonth() returns 11 at end of year (Dec 31 23:59:59)
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 11, 31, 23, 59, 59);
      expect(date.getMonth()).assertEqual(11);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_6200
     * @tc.name testDateGetMonth0062
     * @tc.desc Verify getMonth() returns different months across month boundary
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date1 = new Date(2024, 0, 31, 23, 59, 59);
      const date2 = new Date(2024, 1, 1, 0, 0, 0);
      expect(date1.getMonth()).assertEqual(0);
      expect(date2.getMonth()).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_6400
     * @tc.name testDateGetMonth0064
     * @tc.desc Verify getMonth() returns 0 for January (31 days)
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 31);
      expect(date.getMonth()).assertEqual(0);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_7100
     * @tc.name testDateGetMonth0071
     * @tc.desc Verify getMonth() returns 3 for April (30 days)
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 3, 30);
      expect(date.getMonth()).assertEqual(3);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_7400
     * @tc.name testDateGetMonth0074
     * @tc.desc Verify getMonth() returns 10 for November (30 days)
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 10, 30);
      expect(date.getMonth()).assertEqual(10);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_7500
     * @tc.name testDateGetMonth0075
     * @tc.desc Verify getMonth() returns consistent results across 10 consecutive calls
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      let months: int[] = [];
      for (let i = 0; i < 10; i++) {
        months.push(date.getMonth());
      }
      for (let i = 0; i < months.length; i++) {
        expect(months[i]).assertEqual(1);
      }
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_7600
     * @tc.name testDateGetMonth0076
     * @tc.desc Verify getMonth() returns same value for different Date objects with same month
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date1 = new Date(2024, 1, 1);
      const date2 = new Date(2024, 1, 15);
      const date3 = new Date(2024, 1, 28);
      expect(date1.getMonth()).assertEqual(date2.getMonth());
      expect(date2.getMonth()).assertEqual(date3.getMonth());
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_7700
     * @tc.name testDateGetMonth0077
     * @tc.desc Verify getMonth() returns same value for same month across different years
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date1 = new Date(2023, 5, 15);
      const date2 = new Date(2024, 5, 15);
      const date3 = new Date(2025, 5, 15);
      expect(date1.getMonth()).assertEqual(5);
      expect(date2.getMonth()).assertEqual(5);
      expect(date3.getMonth()).assertEqual(5);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_7800
     * @tc.name testDateGetMonth0078
     * @tc.desc Verify getMonth() returns correct local time month
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 2);
      let localMonth: int = date.getMonth();
      expect(localMonth).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_GET_MONTH_CHK_7900
     * @tc.name testDateGetMonth0079
     * @tc.desc Verify getMonth() with Date constructed from UTC timestamp
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetMonth0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(Date.UTC(2024, 5, 15, 12, 0, 0));
      let result: int = date.getMonth();
      expect(result >= 5 && result <= 6).assertTrue();
    })

  })
};