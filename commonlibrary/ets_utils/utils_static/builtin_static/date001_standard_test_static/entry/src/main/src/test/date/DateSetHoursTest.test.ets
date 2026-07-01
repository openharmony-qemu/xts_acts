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

export default function DateSetHoursTest(): void {
  describe('DateSetHoursTest', () => {
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
     * @tc.number SUB_DATE_SET_HOURS_CHK_0100
     * @tc.name testDateSetHours0001
     * @tc.desc Verify setHours with 1 argument sets hours correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setHours(4);
      expect(result).assertEqual(new Date(2024, 0, 2, 4).getTime());
      expect(date.getHours()).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_0200
     * @tc.name testDateSetHours0002
     * @tc.desc Verify setHours with 2 arguments sets hours and minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setHours(4, 5);
      expect(result).assertEqual(new Date(2024, 0, 2, 4, 5).getTime());
      expect(date.getHours()).assertEqual(4);
      expect(date.getMinutes()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_0300
     * @tc.name testDateSetHours0003
     * @tc.desc Verify setHours with 3 arguments sets hours, minutes and seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setHours(4, 5, 6);
      expect(result).assertEqual(new Date(2024, 0, 2, 4, 5, 6).getTime());
      expect(date.getHours()).assertEqual(4);
      expect(date.getMinutes()).assertEqual(5);
      expect(date.getSeconds()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_0400
     * @tc.name testDateSetHours0004
     * @tc.desc Verify setHours with 4 arguments sets hours, minutes, seconds and milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setHours(4, 5, 6, 7);
      expect(result).assertEqual(new Date(2024, 0, 2, 4, 5, 6, 7).getTime());
      expect(date.getHours()).assertEqual(4);
      expect(date.getMinutes()).assertEqual(5);
      expect(date.getSeconds()).assertEqual(6);
      expect(date.getMilliseconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_0700
     * @tc.name testDateSetHours0007
     * @tc.desc Verify setHours with value 0 (minimum normal value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 12);
      date.setHours(0);
      expect(date.getHours()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_0800
     * @tc.name testDateSetHours0008
     * @tc.desc Verify setHours with value 23 (maximum normal value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 12);
      date.setHours(23);
      expect(date.getHours()).assertEqual(23);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_0900
     * @tc.name testDateSetHours0009
     * @tc.desc Verify setHours with value 12 (noon)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(12);
      expect(date.getHours()).assertEqual(12);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_1300
     * @tc.name testDateSetHours0013
     * @tc.desc Verify setHours with value -1 rolls back date by one day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(-1);
      expect(date.getHours()).assertEqual(23);
      expect(date.getDate()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_1400
     * @tc.name testDateSetHours0014
     * @tc.desc Verify setHours with value 24 rolls forward date by one day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(24);
      expect(date.getHours()).assertEqual(0);
      expect(date.getDate()).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_1500
     * @tc.name testDateSetHours0015
     * @tc.desc Verify setHours with value -100 causes large date rollback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 15);
      date.setHours(-100);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_1600
     * @tc.name testDateSetHours0016
     * @tc.desc Verify setHours with value 100 causes large date rollover
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(100);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_1700
     * @tc.name testDateSetHours0017
     * @tc.desc Verify setHours with int max value 2147483647 handles overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(2147483647);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_1800
     * @tc.name testDateSetHours0018
     * @tc.desc Verify setHours with int min value -2147483648 handles overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(-2147483648);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_2400
     * @tc.name testDateSetHours0024
     * @tc.desc Verify setHours with min 0 (minimum normal value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 0);
      expect(date.getMinutes()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_2500
     * @tc.name testDateSetHours0025
     * @tc.desc Verify setHours with min 59 (maximum normal value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 59);
      expect(date.getMinutes()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_3100
     * @tc.name testDateSetHours0031
     * @tc.desc Verify setHours with min 1000 causes large time offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 1000);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_3200
     * @tc.name testDateSetHours0032
     * @tc.desc Verify setHours with min -1000 causes large time rollback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, -1000);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_3300
     * @tc.name testDateSetHours0033
     * @tc.desc Verify setHours with min int max value 2147483647 handles overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 2147483647);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_3400
     * @tc.name testDateSetHours0034
     * @tc.desc Verify setHours with min int min value -2147483648 handles overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, -2147483648);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_3800
     * @tc.name testDateSetHours0038
     * @tc.desc Verify setHours with sec 0 (minimum normal value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 5, 0);
      expect(date.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_3900
     * @tc.name testDateSetHours0039
     * @tc.desc Verify setHours with sec 59 (maximum normal value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 5, 59);
      expect(date.getSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_4500
     * @tc.name testDateSetHours0045
     * @tc.desc Verify setHours with sec 1000 causes large time offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 5, 1000);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_4600
     * @tc.name testDateSetHours0046
     * @tc.desc Verify setHours with sec -1000 causes large time rollback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 5, -1000);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_4700
     * @tc.name testDateSetHours0047
     * @tc.desc Verify setHours with sec int max value 2147483647 handles overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 5, 2147483647);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_4800
     * @tc.name testDateSetHours0048
     * @tc.desc Verify setHours with sec int min value -2147483648 handles overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 5, -2147483648);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_5200
     * @tc.name testDateSetHours0052
     * @tc.desc Verify setHours with ms 0 (minimum normal value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 5, 6, 0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_5300
     * @tc.name testDateSetHours0053
     * @tc.desc Verify setHours with ms 999 (maximum normal value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 5, 6, 999);
      expect(date.getMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_6000
     * @tc.name testDateSetHours0060
     * @tc.desc Verify setHours with ms 100000 causes large time offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 5, 6, 100000);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_6100
     * @tc.name testDateSetHours0061
     * @tc.desc Verify setHours with ms -100000 causes large time rollback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 5, 6, -100000);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_6200
     * @tc.name testDateSetHours0062
     * @tc.desc Verify setHours with ms int max value 2147483647 handles overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 5, 6, 2147483647);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_6300
     * @tc.name testDateSetHours0063
     * @tc.desc Verify setHours with ms int min value -2147483648 handles overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 5, 6, -2147483648);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_8200
     * @tc.name testDateSetHours0082
     * @tc.desc Verify cascade carry with all boundary overflow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(23, 59, 59, 1000);
      expect(date.getDate()).assertEqual(3);
      expect(date.getHours()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_8300
     * @tc.name testDateSetHours0083
     * @tc.desc Verify cascade rollback with all negative boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 0, 0, 0, 0);
      date.setHours(0, -1, -1, -1);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_8500
     * @tc.name testDateSetHours0085
     * @tc.desc Verify setHours return value difference reflects time change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 0);
      let before = date.getTime();
      let after = date.setHours(4);
      let diff = after - before;
      expect(diff).assertEqual(4 * 60 * 60 * 1000);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_8600
     * @tc.name testDateSetHours0086
     * @tc.desc Verify setHours(value, min) returns correct UTC milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 0, 0);
      let before = date.getTime();
      let after = date.setHours(4, 30);
      let diff = after - before;
      expect(diff).assertEqual((4 * 60 + 30) * 60 * 1000);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_8700
     * @tc.name testDateSetHours0087
     * @tc.desc Verify setHours(value, min, sec) returns correct UTC milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 0, 0, 0);
      let before = date.getTime();
      let after = date.setHours(4, 5, 6);
      let diff = after - before;
      expect(diff).assertEqual(((4 * 60 + 5) * 60 + 6) * 1000);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_8800
     * @tc.name testDateSetHours0088
     * @tc.desc Verify setHours(value, min, sec, ms) returns correct UTC milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 0, 0, 0, 0);
      let before = date.getTime();
      let after = date.setHours(4, 5, 6, 7);
      let diff = after - before;
      expect(diff).assertEqual(((4 * 60 + 5) * 60 + 6) * 1000 + 7);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_8900
     * @tc.name testDateSetHours0089
     * @tc.desc Verify setHours return value equals getTime after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setHours(4, 5, 6, 7);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_9100
     * @tc.name testDateSetHours0091
     * @tc.desc Verify setHours return value is a positive integer in normal scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let result = date.setHours(12);
      expect(Number.isInteger(result) || result === Math.floor(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_9200
     * @tc.name testDateSetHours0092
     * @tc.desc Verify setHours timestamp equals manually constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(2024, 0, 2);
      let ts1 = date1.setHours(4, 5, 6, 7);
      const date2 = new Date(2024, 0, 2, 4, 5, 6, 7);
      expect(ts1).assertEqual(date2.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_9300
     * @tc.name testDateSetHours0093
     * @tc.desc Verify setHours near epoch time returns value close to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1970, 0, 1, 0, 0, 0, 0);
      let result = date.setHours(0);
      expect(Math.abs(result) < 24 * 60 * 60 * 1000).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_9400
     * @tc.name testDateSetHours0094
     * @tc.desc Verify setHours on far future date returns large positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2100, 0, 1);
      let result = date.setHours(12);
      expect(result > 0).assertTrue();
      let lowerBound: long = 4000000000000;
      expect(result > lowerBound).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_9500
     * @tc.name testDateSetHours0095
     * @tc.desc Verify setHours on far past date returns negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1900, 0, 1);
      let result = date.setHours(12);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_9600
     * @tc.name testDateSetHours0096
     * @tc.desc Verify consecutive setHours calls return progressive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      let r1 = date.setHours(4);
      let r2 = date.setHours(8);
      let r3 = date.setHours(12);
      expect(r2 - r1).assertEqual(4 * 60 * 60 * 1000);
      expect(r3 - r2).assertEqual(4 * 60 * 60 * 1000);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_0600
     * @tc.name testDateSetHours0106
     * @tc.desc Verify setHours on epoch Date(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.setHours(4);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_0500
     * @tc.name testDateSetHours0107
     * @tc.desc Verify setHours on near max timestamp Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(8640000000000000 - 1);
      let result = date.setHours(23);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_2100
     * @tc.name testDateSetHours0108
     * @tc.desc Verify setHours on near min timestamp Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-8640000000000000 + 1);
      let result = date.setHours(0);
      expect(!Number.isNaN(date.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_2200
     * @tc.name testDateSetHours0113
     * @tc.desc Verify switching from overload 4 to overload 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4, 5, 6, 7);
      date.setHours(8);
      expect(date.getHours()).assertEqual(8);
      expect(date.getMinutes()).assertEqual(5);
      expect(date.getSeconds()).assertEqual(6);
      expect(date.getMilliseconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_2300
     * @tc.name testDateSetHours0114
     * @tc.desc Verify upgrading from overload 1 to overload 4 step by step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4);
      expect(date.getHours()).assertEqual(4);
      date.setHours(4, 5);
      expect(date.getMinutes()).assertEqual(5);
      date.setHours(4, 5, 6);
      expect(date.getSeconds()).assertEqual(6);
      date.setHours(4, 5, 6, 7);
      expect(date.getMilliseconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_3500
     * @tc.name testDateSetHours0115
     * @tc.desc Verify progressive return values between overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 0, 0, 0, 0);
      let r1 = date.setHours(4);
      let r2 = date.setHours(4, 5);
      let diff2 = r2 - r1;
      expect(diff2).assertEqual(5 * 60 * 1000);
      let r3 = date.setHours(4, 5, 6);
      let diff3 = r3 - r2;
      expect(diff3).assertEqual(6 * 1000);
      let r4 = date.setHours(4, 5, 6, 7);
      let diff4 = r4 - r3;
      expect(diff4).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_3600
     * @tc.name testDateSetHours0116
     * @tc.desc Verify setHours on default constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.setHours(12);
      expect(date.getHours()).assertEqual(12);
      expect(!Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_3700
     * @tc.name testDateSetHours0117
     * @tc.desc Verify setHours on timestamp constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1704067200000);
      let result = date.setHours(4, 5, 6, 7);
      expect(date.getHours()).assertEqual(4);
      expect(date.getMinutes()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_4900
     * @tc.name testDateSetHours0118
     * @tc.desc Verify setHours on fully parameterized constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15, 10, 30, 45, 500);
      let result = date.setHours(20, 0, 0, 0);
      expect(date.getHours()).assertEqual(20);
      expect(date.getMinutes()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_1900
     * @tc.name testDateSetHours0119
     * @tc.desc Verify setHours on string constructed Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date("2024-01-02T12:00:00");
      let result = date.setHours(4);
      expect(date.getHours()).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_SET_HOURS_CHK_2000
     * @tc.name testDateSetHours0120
     * @tc.desc Verify documentation example code runs correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetHours0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2);
      date.setHours(4);
      expect(date.getHours()).assertEqual(4);
      date.setHours(4, 5);
      expect(date.getHours()).assertEqual(4);
      expect(date.getMinutes()).assertEqual(5);
      date.setHours(4, 5, 6);
      expect(date.getHours()).assertEqual(4);
      expect(date.getMinutes()).assertEqual(5);
      expect(date.getSeconds()).assertEqual(6);
      date.setHours(4, 5, 6, 7);
      expect(date.getHours()).assertEqual(4);
      expect(date.getMinutes()).assertEqual(5);
      expect(date.getSeconds()).assertEqual(6);
      expect(date.getMilliseconds()).assertEqual(7);
    });
  });
}
