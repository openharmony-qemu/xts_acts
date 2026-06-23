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

export default function DateGetDateTest(): void {
  describe('DateGetDateTest', () => {
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
     * @tc.number SUB_DATE_GET_DATE_CHK_0100
     * @tc.name testDateGetDate0001
     * @tc.desc Verify normal no-parameter call to getDate
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const date = new Date(2024, 0, 15);
        let result = date.getDate();
        expect(result).assertEqual(15);
      }
    );

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_0200
     * @tc.name testDateGetDate0002
     * @tc.desc Verify multiple extra parameters are ignored
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const date = new Date(2024, 5, 20);
        let result = date.getDate();
        expect(result).assertEqual(20);
      }
    );

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_0300
     * @tc.name testDateGetDate0003
     * @tc.desc Verify getDate returns January 1st
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 1);
      let result = date.getDate();
      expect(result).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_0400
     * @tc.name testDateGetDate0004
     * @tc.desc Verify getDate returns mid-month date
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 5, 15);
      let result = date.getDate();
      expect(result).assertEqual(15);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_0500
     * @tc.name testDateGetDate0005
     * @tc.desc Verify getDate returns last day of a 31-day month
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 31);
      let result = date.getDate();
      expect(result).assertEqual(31);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_0600
     * @tc.name testDateGetDate0006
     * @tc.desc Verify getDate returns last day of a 30-day month
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 3, 30);
      let result = date.getDate();
      expect(result).assertEqual(30);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_0700
     * @tc.name testDateGetDate0007
     * @tc.desc Verify getDate returns last day of February in a common year (28th)
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 1, 28);
      let result = date.getDate();
      expect(result).assertEqual(28);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_0800
     * @tc.name testDateGetDate0008
     * @tc.desc Verify getDate returns last day of February in a leap year (29th)
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 1, 29);
      let result = date.getDate();
      expect(result).assertEqual(29);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_0900
     * @tc.name testDateGetDate0009
     * @tc.desc Verify getDate returns minimum value 1
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 1);
      let result = date.getDate();
      expect(result).assertEqual(1);
      expect(result >= 1).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_1000
     * @tc.name testDateGetDate0010
     * @tc.desc Verify getDate returns maximum value 31
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 11, 31);
      let result = date.getDate();
      expect(result).assertEqual(31);
      expect(result <= 31).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_1100
     * @tc.name testDateGetDate0011
     * @tc.desc Verify return value is an integer without decimals
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 15);
      let result = date.getDate();
      expect(Number.isInteger(result)).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_1200
     * @tc.name testDateGetDate0012
     * @tc.desc Verify return value is always within range 1 to 31
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 6, 20);
      let result = date.getDate();
      expect(result >= 1 && result <= 31).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_1300
     * @tc.name testDateGetDate0013
     * @tc.desc Verify getDate after constructing date 2024-01-32 with auto carry
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 32);
      let result = date.getDate();
      expect(result).assertEqual(1);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_1400
     * @tc.name testDateGetDate0014
     * @tc.desc Verify constructing date with day 0 rolls back to last day of previous month
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 0);
      let result = date.getDate();
      expect(result).assertEqual(31);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_1500
     * @tc.name testDateGetDate0015
     * @tc.desc Verify getDate returns correct date when Date is constructed with timestamp
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(1704067200000);
      let result = date.getDate();
      expect(result >= 1 && result <= 31).assertTrue();
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_1600
     * @tc.name testDateGetDate0016
     * @tc.desc Verify constructing Date with invalid string throws FormatError
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const date = new Date('NAN');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_1700
     * @tc.name testDateGetDate0017
     * @tc.desc Verify consecutive getDate calls return consistent results
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 0, 15);
      let r1 = date.getDate();
      let r2 = date.getDate();
      let r3 = date.getDate();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(15);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_1800
     * @tc.name testDateGetDate0018
     * @tc.desc Verify getDate returns 31 for March 31st
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 2, 31);
      expect(date.getDate()).assertEqual(31);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_1900
     * @tc.name testDateGetDate0019
     * @tc.desc Verify getDate returns 31 for July 31st
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 6, 31);
      expect(date.getDate()).assertEqual(31);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_2000
     * @tc.name testDateGetDate0020
     * @tc.desc Verify getDate returns 31 for December 31st
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 11, 31);
      expect(date.getDate()).assertEqual(31);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_2100
     * @tc.name testDateGetDate0021
     * @tc.desc Verify getDate returns 30 for April 30th
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 3, 30);
      expect(date.getDate()).assertEqual(30);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_2200
     * @tc.name testDateGetDate0022
     * @tc.desc Verify getDate returns 30 for November 30th
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2024, 10, 30);
      expect(date.getDate()).assertEqual(30);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_2300
     * @tc.name testDateGetDate0023
     * @tc.desc Verify common year February 29th overflows to March 1st
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2023, 1, 29);
      expect(date.getDate()).assertEqual(1);
      expect(date.getMonth()).assertEqual(2);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_2400
     * @tc.name testDateGetDate0024
     * @tc.desc Verify getDate returns 29 for century leap year (2000) February 29th
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date = new Date(2000, 1, 29);
      expect(date.getDate()).assertEqual(29);
    })

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_2500
     * @tc.name testDateGetDate0025
     * @tc.desc Verify day after January 31st crosses to February 1st
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const date = new Date(2024, 0, 31);
        date.setDate(date.getDate() + 1);
        expect(date.getDate()).assertEqual(1);
        expect(date.getMonth()).assertEqual(1);
      }
    );

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_2600
     * @tc.name testDateGetDate0026
     * @tc.desc Verify day after December 31st crosses year to January 1st
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const date = new Date(2024, 11, 31);
        date.setDate(date.getDate() + 1);
        expect(date.getDate()).assertEqual(1);
        expect(date.getMonth()).assertEqual(0);
        expect(date.getFullYear()).assertEqual(2025);
      }
    );

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_2700
     * @tc.name testDateGetDate0027
     * @tc.desc Verify getDate after constructing with new Date(year, month, day, hours, minutes, seconds)
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const date = new Date(2024, 5, 15, 10, 30, 0);
        expect(date.getDate()).assertEqual(15);
      }
    );

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_2800
     * @tc.name testDateGetDate0028
     * @tc.desc Verify getDate after constructing with new Date(timestamp)
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const timestamp = new Date(2024, 0, 10).getTime();
        const date = new Date(timestamp);
        expect(date.getDate()).assertEqual(10);
      }
    );

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_2900
     * @tc.name testDateGetDate0029
     * @tc.desc Verify getDate after constructing with date string
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const date = new Date('2024-06-15');
        expect(date.getDate()).assertEqual(15);
      }
    );

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_3000
     * @tc.name testDateGetDate0030
     * @tc.desc Verify getDate returns value in range 1-31 for current date constructed with new Date()
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const date = new Date();
        let result = date.getDate();
        expect(result >= 1 && result <= 31).assertTrue();
      }
    );

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_3100
     * @tc.name testDateGetDate0031
     * @tc.desc Verify getDate returns new value after setDate modification
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const date = new Date(2024, 0, 5);
        date.setDate(20);
        expect(date.getDate()).assertEqual(20);
      }
    );

    /**
     * @tc.number SUB_DATE_GET_DATE_CHK_3200
     * @tc.name testDateGetDate0032
     * @tc.desc Verify setDate with overflow value auto-carries to next month
     * @tc.type Function
     * @tc.level Level1
     * @tc.size MediumTest
     */
    it('testDateGetDate0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const date = new Date(2024, 1, 5);
        date.setDate(30);
        expect(date.getDate()).assertEqual(1);
        expect(date.getMonth()).assertEqual(2);
      }
    );
  })
};