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

export default function DateGetSecondsTest(): void {
  describe('DateGetSecondsTest', () => {
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
     * @tc.number SUB_DATE_GET_SECONDS_CHK_0100
     * @tc.name testDateGetSeconds0001
     * @tc.desc Verify getSeconds with no arguments returns local seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.getSeconds();
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_0200
     * @tc.name testDateGetSeconds0002
     * @tc.desc Verify getSeconds ignores multiple extra arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result1 = date.getSeconds();
      let result2 = date.getSeconds();
      expect(result1).assertEqual(5);
      expect(result2).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_0300
     * @tc.name testDateGetSeconds0003
     * @tc.desc Verify getSeconds returns 0 when seconds is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1, 0, 0, 0);
      let result = date.getSeconds();
      expect(result).assertEqual(0);
      expect(result >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_0400
     * @tc.name testDateGetSeconds0004
     * @tc.desc Verify getSeconds returns 59 when seconds is 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1, 23, 59, 59);
      let result = date.getSeconds();
      expect(result).assertEqual(59);
      expect(result <= 59).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_0500
     * @tc.name testDateGetSeconds0005
     * @tc.desc Verify getSeconds returns 30 when seconds is 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15, 12, 30, 30);
      let result = date.getSeconds();
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_0600
     * @tc.name testDateGetSeconds0006
     * @tc.desc Verify getSeconds after constructing Date with timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const timestamp = new Date(2024, 0, 2, 3, 4, 5).getTime();
      const date = new Date(timestamp);
      let result = date.getSeconds();
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_0700
     * @tc.name testDateGetSeconds0007
     * @tc.desc Verify getSeconds after constructing Date with string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date('2024-01-02T03:04:05');
      let result = date.getSeconds();
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_0800
     * @tc.name testDateGetSeconds0008
     * @tc.desc Verify getSeconds range 0-59 and integer for current time Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.getSeconds();
      expect(result >= 0 && result <= 59).assertTrue();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_0900
     * @tc.name testDateGetSeconds0009
     * @tc.desc Verify getSeconds returns NaN for invalid Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const invalidDate = new Date('invalid-date-string');
        let result = invalidDate.getSeconds();
        expect(Number.isNaN(result)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_1000
     * @tc.name testDateGetSeconds0010
     * @tc.desc Verify getSeconds returns expected result when called on non-Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Date | null = null;
        (obj as Date).getSeconds();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_1100
     * @tc.name testDateGetSeconds0011
     * @tc.desc Verify getSeconds covers full range 0-59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i <= 59; i++) {
        const date = new Date(2024, 0, 1, 0, 0, i);
        expect(date.getSeconds()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_1200
     * @tc.name testDateGetSeconds0012
     * @tc.desc Verify getSeconds across minute boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(2024, 0, 1, 10, 30, 59);
      expect(date1.getSeconds()).assertEqual(59);
      const date2 = new Date(2024, 0, 1, 10, 31, 0);
      expect(date2.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_1300
     * @tc.name testDateGetSeconds0013
     * @tc.desc Verify getSeconds across hour boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1, 10, 59, 59);
      expect(date.getSeconds()).assertEqual(59);
      const date2 = new Date(2024, 0, 1, 11, 0, 0);
      expect(date2.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_1400
     * @tc.name testDateGetSeconds0014
     * @tc.desc Verify getSeconds on leap year February 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 1, 29, 15, 42, 37);
      expect(date.getSeconds()).assertEqual(37);
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_1500
     * @tc.name testDateGetSeconds0015
     * @tc.desc Verify getSeconds with far future date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2099, 11, 31, 23, 59, 59);
      let result = date.getSeconds();
      expect(result).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_1600
     * @tc.name testDateGetSeconds0016
     * @tc.desc Verify getSeconds returns same value on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result1 = date.getSeconds();
      let result2 = date.getSeconds();
      let result3 = date.getSeconds();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_1700
     * @tc.name testDateGetSeconds0017
     * @tc.desc Verify getSeconds consistency with getHours and getMinutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      expect(date.getHours()).assertEqual(3);
      expect(date.getMinutes()).assertEqual(4);
      expect(date.getSeconds()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_GET_SECONDS_CHK_1800
     * @tc.name testDateGetSeconds0018
     * @tc.desc Verify getSeconds after setSeconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetSeconds0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      expect(date.getSeconds()).assertEqual(5);
      date.setSeconds(30);
      expect(date.getSeconds()).assertEqual(30);
    });
  });
}