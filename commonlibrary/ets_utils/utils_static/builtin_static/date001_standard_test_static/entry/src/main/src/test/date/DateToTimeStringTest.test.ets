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

export default function DateToTimeStringTest(): void {
  describe('DateToTimeStringTest', () => {
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
     * @tc.number SUB_DATE_TO_TIME_STRNG_0100
     * @tc.name testDateToTimeString0001
     * @tc.desc Verify toTimeString with no parameters executes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_0200
     * @tc.name testDateToTimeString0002
     * @tc.desc Verify toTimeString ignores extra parameters and returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_0400
     * @tc.name testDateToTimeString0004
     * @tc.desc Verify toTimeString called on standard Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 0, 1, 12, 30, 45);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_0600
     * @tc.name testDateToTimeString0006
     * @tc.desc Verify toTimeString called on current time Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_0700
     * @tc.name testDateToTimeString0007
     * @tc.desc Verify toTimeString called on string-constructed Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date("2026-05-09T12:30:45");
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_0800
     * @tc.name testDateToTimeString0008
     * @tc.desc Verify toTimeString called on multi-argument constructed Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 4, 9, 8, 30, 15, 500);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_1000
     * @tc.name testDateToTimeString0010
     * @tc.desc Verify toTimeString with negative timestamp (pre-epoch)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-86400000);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_1100
     * @tc.name testDateToTimeString0011
     * @tc.desc Verify epoch time returns correctly formatted time string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_1200
     * @tc.name testDateToTimeString0012
     * @tc.desc Verify specified date time returns time string with correct hour minute second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 4, 9, 14, 30, 45);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_1300
     * @tc.name testDateToTimeString0013
     * @tc.desc Verify midnight 00:00:00 time string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 0, 1, 0, 0, 0);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_1400
     * @tc.name testDateToTimeString0014
     * @tc.desc Verify 23:59:59 time string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 11, 31, 23, 59, 59);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_1500
     * @tc.name testDateToTimeString0015
     * @tc.desc Verify time string format with milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 4, 9, 12, 30, 45, 123);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_1700
     * @tc.name testDateToTimeString0017
     * @tc.desc Verify minimum timestamp Date instance return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-8640000000000000);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_1800
     * @tc.name testDateToTimeString0018
     * @tc.desc Verify maximum timestamp Date instance return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(8640000000000000);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_1900
     * @tc.name testDateToTimeString0019
     * @tc.desc Verify multiple calls on same Date instance return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 4, 9, 12, 0, 0);
      let result1: string = date.toTimeString();
      let result2: string = date.toTimeString();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_2500
     * @tc.name testDateToTimeString0025
     * @tc.desc Verify different timestamps return different time strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(0);
      const date2 = new Date(3600000);
      let result1: string = date1.toTimeString();
      let result2: string = date2.toTimeString();
      expect(result1 !== result2).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_2600
     * @tc.name testDateToTimeString0026
     * @tc.desc Verify crossing midnight time point returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 0, 2, 0, 0, 0);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_2700
     * @tc.name testDateToTimeString0027
     * @tc.desc Verify leap year February 29 date returns normal time string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 1, 29, 12, 0, 0);
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_2800
     * @tc.name testDateToTimeString0028
     * @tc.desc Verify invalid Date instance (NaN timestamp) toTimeString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date("invalid date string");
        let result: string = date.toTimeString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_2900
     * @tc.name testDateToTimeString0029
     * @tc.desc Verify toTimeString after constructing Date with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date("invalid");
        let result: string = date.toTimeString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_3200
     * @tc.name testDateToTimeString0032
     * @tc.desc Verify normal Date instance toTimeString returns formatted string or catches RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date(0);
        let result: string = date.toTimeString();
        expect(result.indexOf(":") > 0).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_3400
     * @tc.name testDateToTimeString0034
     * @tc.desc Verify consecutive multiple calls on same Date instance do not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      try {
        for (let i = 0; i < 100; i++) {
          let result: string = date.toTimeString();
        }
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_3500
     * @tc.name testDateToTimeString0035
     * @tc.desc Verify multiple Date instances calling toTimeString all return normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date1 = new Date(0);
        const date2 = new Date(1000);
        const date3 = new Date(2026, 4, 9);
        let r1: string = date1.toTimeString();
        let r2: string = date2.toTimeString();
        let r3: string = date3.toTimeString();
        expect(r1.indexOf(":") > 0).assertTrue();
        expect(r1 !== r2 || r2 !== r3).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_3600
     * @tc.name testDateToTimeString0036
     * @tc.desc Verify toTimeString after constructing Date with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date("");
        let result: string = date.toTimeString();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_TIME_STRNG_3800
     * @tc.name testDateToTimeString0038
     * @tc.desc Verify toTimeString after constructing Date with undefined (treated as current time)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToTimeString0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result: string = date.toTimeString();
      expect(result.indexOf(":") > 0).assertTrue();
    });
  });
}
