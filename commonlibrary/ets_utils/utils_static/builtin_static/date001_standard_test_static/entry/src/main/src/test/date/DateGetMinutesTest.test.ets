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

export default function DateGetMinutesTest(): void {
  describe('DateGetMinutesTest', () => {
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
     * @tc.number SUB_DATE_GET_MINUTES_CHK_0100
     * @tc.name testDateGetMinutes0001
     * @tc.desc Verify getMinutes returns local minutes with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = date.getMinutes();
      expect(result).assertEqual(4);
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_0200
     * @tc.name testDateGetMinutes0002
     * @tc.desc Verify extra parameter is ignored and behavior is normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result = (date.getMinutes as (p: int) => int)(999);
      expect(result).assertEqual(4);
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_0300
     * @tc.name testDateGetMinutes0003
     * @tc.desc Verify getMinutes returns 0 when minutes is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      const date = new Date(2024, 0, 1, 0, 0);
      let result = date.getMinutes();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_0400
     * @tc.name testDateGetMinutes0004
     * @tc.desc Verify getMinutes returns 59 when minutes is 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      const date = new Date(2024, 0, 1, 23, 59);
      let result = date.getMinutes();
      expect(result).assertEqual(59);
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_0500
     * @tc.name testDateGetMinutes0005
     * @tc.desc Verify getMinutes returns 30 when minutes is 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      const date = new Date(2024, 5, 15, 12, 30);
      let result = date.getMinutes();
      expect(result).assertEqual(30);
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_0600
     * @tc.name testDateGetMinutes0006
     * @tc.desc Verify getMinutes after constructing Date with timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      const timestamp = new Date(2024, 0, 2, 3, 4).getTime();
      const date = new Date(timestamp);
      let result = date.getMinutes();
      expect(result).assertEqual(4);
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_0700
     * @tc.name testDateGetMinutes0007
     * @tc.desc Verify getMinutes after constructing Date with string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      const date = new Date('2024-01-02T03:04:00');
      let result = date.getMinutes();
      expect(result).assertEqual(4);
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_0800
     * @tc.name testDateGetMinutes0008
     * @tc.desc Verify getMinutes range 0-59 and integer for Date constructed with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      const date = new Date();
      let result = date.getMinutes();
      expect(result >= 0 && result <= 59).assertTrue();
      expect(Number.isInteger(result)).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_0900
     * @tc.name testDateGetMinutes0009
     * @tc.desc Verify invalid Date string getMinutes throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      try {
        const invalidDate = new Date('invalid');
        let result = invalidDate.getMinutes();
        expect(Number.isNaN(result)).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_1000
     * @tc.name testDateGetMinutes0010
     * @tc.desc Verify minutes values from 0 to 59 are all reachable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      for (let i = 0; i <= 59; i++) {
        const date = new Date(2024, 0, 1, 0, i);
        expect(date.getMinutes()).assertEqual(i);
      }
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_1100
     * @tc.name testDateGetMinutes0011
     * @tc.desc Verify minutes change from 59 to 0 across hour boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      const date1 = new Date(2024, 0, 1, 10, 59);
      expect(date1.getMinutes()).assertEqual(59);
      const date2 = new Date(2024, 0, 1, 11, 0);
      expect(date2.getMinutes()).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_1200
     * @tc.name testDateGetMinutes0012
     * @tc.desc Verify getMinutes works correctly on leap year Feb 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      const date = new Date(2024, 1, 29, 15, 42);
      expect(date.getMinutes()).assertEqual(42);
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_1300
     * @tc.name testDateGetMinutes0013
     * @tc.desc Verify multiple calls return consistent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      const date = new Date(2024, 0, 2, 3, 4);
      let result1 = date.getMinutes();
      let result2 = date.getMinutes();
      let result3 = date.getMinutes();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_1400
     * @tc.name testDateGetMinutes0014
     * @tc.desc Verify getMinutes works with getHours and getSeconds for time consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      expect(date.getHours()).assertEqual(3);
      expect(date.getMinutes()).assertEqual(4);
      expect(date.getSeconds()).assertEqual(5);
      done();
    });

    /**
     * @tc.number SUB_DATE_GET_MINUTES_CHK_1500
     * @tc.name testDateGetMinutes0015
     * @tc.desc Verify getMinutes returns updated value after setMinutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDateGetMinutes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done) => {
      const date = new Date(2024, 0, 2, 3, 4);
      expect(date.getMinutes()).assertEqual(4);
      date.setMinutes(30);
      expect(date.getMinutes()).assertEqual(30);
      done();
    });
  })
};