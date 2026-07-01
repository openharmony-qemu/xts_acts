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

export default function DateGetMillisecondsTest(): void {
  describe('DateGetMillisecondsTest', () => {
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
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_0100
     * @tc.name testDateGetMilliseconds0001
     * @tc.desc Verify that getMilliseconds returns correct value when called without arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5, 6);
      let result = date.getMilliseconds();
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_0200
     * @tc.name testDateGetMilliseconds0002
     * @tc.desc Verify that extra arguments passed to getMilliseconds are ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5, 6);
      let result = (date.getMilliseconds as (p: int) => int)(999);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_0300
     * @tc.name testDateGetMilliseconds0003
     * @tc.desc Verify that getMilliseconds returns 123 when constructed with milliseconds 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15, 10, 30, 45, 123);
      let result = date.getMilliseconds();
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_0400
     * @tc.name testDateGetMilliseconds0004
     * @tc.desc Verify that getMilliseconds returns milliseconds part from timestamp-constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1704067200123);
      let result = date.getMilliseconds();
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_0500
     * @tc.name testDateGetMilliseconds0005
     * @tc.desc Verify that getMilliseconds returns value between 0 and 999 for current time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.getMilliseconds();
      expect(result >= 0 && result <= 999).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_0600
     * @tc.name testDateGetMilliseconds0006
     * @tc.desc Verify that getMilliseconds returns 0 when only year month day are provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1);
      let result = date.getMilliseconds();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_0700
     * @tc.name testDateGetMilliseconds0007
     * @tc.desc Verify that getMilliseconds returns 999 when milliseconds parameter is 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1, 23, 59, 59, 999);
      let result = date.getMilliseconds();
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_0800
     * @tc.name testDateGetMilliseconds0008
     * @tc.desc Verify that milliseconds overflow 1000 carries over to seconds and getMilliseconds returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1, 0, 0, 0, 1000);
      let result = date.getMilliseconds();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_0900
     * @tc.name testDateGetMilliseconds0009
     * @tc.desc Verify that getMilliseconds returns 0 for timestamp 0 (Unix epoch)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getMilliseconds();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_1000
     * @tc.name testDateGetMilliseconds0010
     * @tc.desc Verify that getMilliseconds returns parsed milliseconds from date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date("2024-01-02T03:04:05.678");
      let result = date.getMilliseconds();
      expect(result).assertEqual(678);
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_1100
     * @tc.name testDateGetMilliseconds0011
     * @tc.desc Verify that getMilliseconds returns value consistent with setMilliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1);
      date.setMilliseconds(456);
      let result = date.getMilliseconds();
      expect(result).assertEqual(456);
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_1200
     * @tc.name testDateGetMilliseconds0012
     * @tc.desc Verify that getMilliseconds return value is an integer between 0 and 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15, 10, 30, 45, 500);
      let result = date.getMilliseconds();
      expect(Number.isInteger(result)).assertTrue();
      expect(result >= 0).assertTrue();
      expect(result <= 999).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_1300
     * @tc.name testDateGetMilliseconds0013
     * @tc.desc Verify that getMilliseconds return value can be converted to string via toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5, 6);
      let result = date.getMilliseconds().toString();
      expect(result).assertEqual("6");
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_1400
     * @tc.name testDateGetMilliseconds0014
     * @tc.desc Verify that getMilliseconds throws FormatError for invalid date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultValue: number = 0;
      try {
        const date: Date = new Date('invalid');
        resultValue = date.getMilliseconds();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_GET_MILLISECONDS_CHK_1500
     * @tc.name testDateGetMilliseconds0015
     * @tc.desc Verify that multiple consecutive calls to getMilliseconds return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetMilliseconds0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5, 6);
      let result1 = date.getMilliseconds();
      let result2 = date.getMilliseconds();
      let result3 = date.getMilliseconds();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });
  })
}