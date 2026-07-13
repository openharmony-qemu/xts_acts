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

export default function DateGetTimezoneOffsetTest(): void {
  describe('DateGetTimezoneOffsetTest', () => {
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
     * @tc.number SUB_DATE_GET_TMZN_OFFST_0100
     * @tc.name testDateGetTimezoneOffset0001
     * @tc.desc Verify getTimezoneOffset with no parameters returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      expect(Number.isInteger(offset)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_0300
     * @tc.name testDateGetTimezoneOffset0003
     * @tc.desc Verify getTimezoneOffset returns timezone offset with UTC timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      expect(offset >= -720 && offset <= 840).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_0400
     * @tc.name testDateGetTimezoneOffset0004
     * @tc.desc Verify getTimezoneOffset with current time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let offset: long = date.getTimezoneOffset();
      expect(Number.isInteger(offset)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_0500
     * @tc.name testDateGetTimezoneOffset0005
     * @tc.desc Verify getTimezoneOffset with date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date('2024-06-15T12:00:00');
      let offset: long = date.getTimezoneOffset();
      expect(Number.isInteger(offset)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_0600
     * @tc.name testDateGetTimezoneOffset0006
     * @tc.desc Verify getTimezoneOffset with year month day parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15, 12, 0, 0);
      let offset: long = date.getTimezoneOffset();
      expect(Number.isInteger(offset)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_0700
     * @tc.name testDateGetTimezoneOffset0007
     * @tc.desc Verify different Date instances return consistent timezone offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(0);
      const date2 = new Date(1000000000000);
      let offset1: long = date1.getTimezoneOffset();
      let offset2: long = date2.getTimezoneOffset();
      expect(offset1).assertEqual(offset2);
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_0800
     * @tc.name testDateGetTimezoneOffset0008
     * @tc.desc Verify getTimezoneOffset return value can be converted to string via toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      let offsetStr: string = offset.toString();
      expect(Number(offsetStr)).assertEqual(offset);
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_0900
     * @tc.name testDateGetTimezoneOffset0009
     * @tc.desc Verify timezone offset range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      expect(offset > -13 * 60).assertTrue();
      expect(offset < 15 * 60).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_1000
     * @tc.name testDateGetTimezoneOffset0010
     * @tc.desc Verify timezone offset sign and range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      expect(offset >= -720 && offset <= 840).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_1100
     * @tc.name testDateGetTimezoneOffset0011
     * @tc.desc Verify getTimezoneOffset return type is integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      expect(Number.isInteger(offset)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_1200
     * @tc.name testDateGetTimezoneOffset0012
     * @tc.desc Verify getTimezoneOffset returns integer without decimal part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      expect(offset % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_1300
     * @tc.name testDateGetTimezoneOffset0013
     * @tc.desc Verify timezone offset minimum value > -720 minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      expect(offset > -721).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_1400
     * @tc.name testDateGetTimezoneOffset0014
     * @tc.desc Verify timezone offset maximum value < 840 minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      expect(offset < 841).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_1500
     * @tc.name testDateGetTimezoneOffset0015
     * @tc.desc Verify timezone offset absolute value does not exceed 840
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      expect(Math.abs(offset) < 841).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_1600
     * @tc.name testDateGetTimezoneOffset0016
     * @tc.desc Verify timezone offset is a multiple of 15 minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      expect(offset % 15).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_1700
     * @tc.name testDateGetTimezoneOffset0017
     * @tc.desc Verify getTimezoneOffset returns a non-null offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      expect(Number.isInteger(offset)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_2100
     * @tc.name testDateGetTimezoneOffset0021
     * @tc.desc Verify getTimezoneOffset is publicly accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      expect(Number.isInteger(date.getTimezoneOffset())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_2300
     * @tc.name testDateGetTimezoneOffset0023
     * @tc.desc Verify getTime and getTimezoneOffset combined usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let time: long = date.getTime();
      let offset: long = date.getTimezoneOffset();
      let localTime: long = time - offset * 60 * 1000;
      expect(Number.isInteger(localTime)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_2400
     * @tc.name testDateGetTimezoneOffset0024
     * @tc.desc Verify getHours and getTimezoneOffset consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      let utcHours: number = date.getUTCHours();
      let localHours: number = date.getHours();
      let expectedOffset: number = (utcHours - localHours) * 60;
      expect(Math.abs(offset - expectedOffset) % 1440).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_2500
     * @tc.name testDateGetTimezoneOffset0025
     * @tc.desc Verify getTimezoneOffset with year month day hour minute second constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1, 0, 0, 0, 0);
      let offset: long = date.getTimezoneOffset();
      expect(Number.isInteger(offset)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_2600
     * @tc.name testDateGetTimezoneOffset0026
     * @tc.desc Verify getTimezoneOffset with timestamp constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1704067200000);
      let offset: long = date.getTimezoneOffset();
      expect(Number.isInteger(offset)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_OFFST_2700
     * @tc.name testDateGetTimezoneOffset0027
     * @tc.desc Verify getTimezoneOffset with ISO date string constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneOffset0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date('2024-01-01T00:00:00.000Z');
      let offset: long = date.getTimezoneOffset();
      expect(Number.isInteger(offset)).assertTrue();
    });
  });
}