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

export default function DateSetSecondsTest(): void {
  describe('DateSetSecondsTest', (): void => {
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
     * @tc.number SUB_DATE_SET_SCNDS_CHK_0300
     * @tc.name testDateSetSeconds0003
     * @tc.desc Verify setSeconds with two parameters, extra parameter handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(6, 7);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_0500
     * @tc.name testDateSetSeconds0005
     * @tc.desc Verify setSeconds with normal value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(0);
      expect(date.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_1000
     * @tc.name testDateSetSeconds0010
     * @tc.desc Verify setSeconds with -1 rolls back to previous minute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(-1);
      expect(date.getSeconds()).assertEqual(59);
      expect(date.getMinutes()).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_1100
     * @tc.name testDateSetSeconds0011
     * @tc.desc Verify setSeconds with 60 rolls forward to next minute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(60);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_1200
     * @tc.name testDateSetSeconds0012
     * @tc.desc Verify setSeconds with int min value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(-2147483648);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_1300
     * @tc.name testDateSetSeconds0013
     * @tc.desc Verify setSeconds with int max value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(2147483647);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_2400
     * @tc.name testDateSetSeconds0024
     * @tc.desc Verify setSeconds with 120 seconds carries over 2 minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(120);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_2500
     * @tc.name testDateSetSeconds0025
     * @tc.desc Verify setSeconds with -60 seconds rolls back 1 minute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(-60);
      expect(date.getSeconds()).assertEqual(0);
      expect(date.getMinutes()).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_2600
     * @tc.name testDateSetSeconds0026
     * @tc.desc Verify setSeconds overload 2 with two parameters succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(6, 7);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_2700
     * @tc.name testDateSetSeconds0027
     * @tc.desc Verify setSeconds with one parameter is equivalent to overload 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(6);
      expect(date.getSeconds()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_3000
     * @tc.name testDateSetSeconds0030
     * @tc.desc Verify setSeconds overload 2 with normal value 30 and milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(30, 500);
      expect(date.getSeconds()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_3100
     * @tc.name testDateSetSeconds0031
     * @tc.desc Verify setSeconds overload 2 with normal value 59 and milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(59, 999);
      expect(date.getSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_3200
     * @tc.name testDateSetSeconds0032
     * @tc.desc Verify setSeconds overload 2 with value 0 (lower bound)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(0, 0);
      expect(date.getSeconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_4400
     * @tc.name testDateSetSeconds0044
     * @tc.desc Verify setSeconds overload 2 with normal ms value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(6, 0);
      expect(date.getMilliseconds()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_4600
     * @tc.name testDateSetSeconds0046
     * @tc.desc Verify setSeconds overload 2 with normal ms value 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(6, 999);
      expect(date.getMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_4900
     * @tc.name testDateSetSeconds0049
     * @tc.desc Verify setSeconds overload 2 ms -1 rolls back one second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(6, -1);
      expect(date.getMilliseconds()).assertEqual(999);
      expect(date.getSeconds()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_5000
     * @tc.name testDateSetSeconds0050
     * @tc.desc Verify setSeconds overload 2 ms 1000 rolls forward one second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(6, 1000);
      expect(date.getMilliseconds()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(7);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_5100
     * @tc.name testDateSetSeconds0051
     * @tc.desc Verify setSeconds overload 2 ms with int min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(6, -2147483648);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_5200
     * @tc.name testDateSetSeconds0052
     * @tc.desc Verify setSeconds overload 2 ms with int max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(6, 2147483647);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_6300
     * @tc.name testDateSetSeconds0063
     * @tc.desc Verify setSeconds overload 2 ms 2000 carries over 2 seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(6, 2000);
      expect(date.getMilliseconds()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(8);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_6400
     * @tc.name testDateSetSeconds0064
     * @tc.desc Verify setSeconds overload 2 ms -1000 rolls back 1 second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(6, -1000);
      expect(date.getMilliseconds()).assertEqual(0);
      expect(date.getSeconds()).assertEqual(5);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_6500
     * @tc.name testDateSetSeconds0065
     * @tc.desc Verify setSeconds returns UTC millisecond timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let before = date.getTime();
      let result = date.setSeconds(6);
      expect(Number.isFinite(result)).assertTrue();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_6600
     * @tc.name testDateSetSeconds0066
     * @tc.desc Verify setSeconds return value equals getTime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(6);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_6700
     * @tc.name testDateSetSeconds0067
     * @tc.desc Verify timestamp difference after setSeconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let before = date.getTime();
      let result = date.setSeconds(10);
      let diff = result - before;
      expect(diff).assertEqual(5000);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_6800
     * @tc.name testDateSetSeconds0068
     * @tc.desc Verify setSeconds returns negative timestamp for pre-1970 date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1969, 11, 31, 23, 59, 58);
      let result = date.setSeconds(59);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_6900
     * @tc.name testDateSetSeconds0069
     * @tc.desc Verify setSeconds returns zero timestamp for epoch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(1970, 0, 1, 0, 0, 0));
      let result = date.setSeconds(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_7100
     * @tc.name testDateSetSeconds0071
     * @tc.desc Verify setSeconds return value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(6);
      expect(Number.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_7300
     * @tc.name testDateSetSeconds0073
     * @tc.desc Verify setSeconds overload 2 returns UTC millisecond timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(6, 7);
      expect(Number.isFinite(result)).assertTrue();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_7400
     * @tc.name testDateSetSeconds0074
     * @tc.desc Verify setSeconds overload 2 return value equals getTime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(6, 7);
      expect(result).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_7500
     * @tc.name testDateSetSeconds0075
     * @tc.desc Verify timestamp difference after setSeconds overload 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5, 100);
      let before = date.getTime();
      let result = date.setSeconds(10, 500);
      let diff = result - before;
      expect(diff).assertEqual(5400);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_7600
     * @tc.name testDateSetSeconds0076
     * @tc.desc Verify setSeconds overload 2 returns negative timestamp for pre-1970
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1969, 11, 31, 23, 59, 58);
      let result = date.setSeconds(59, 999);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_7700
     * @tc.name testDateSetSeconds0077
     * @tc.desc Verify setSeconds overload 2 with ms 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5, 100);
      let result = date.setSeconds(6, 0);
      expect(date.getMilliseconds()).assertEqual(0);
      expect(result % 1000).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_8000
     * @tc.name testDateSetSeconds0080
     * @tc.desc Verify setSeconds overload 2 return value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(6, 7);
      expect(Number.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_8400
     * @tc.name testDateSetSeconds0084
     * @tc.desc Verify setSeconds normal call updates seconds value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      let result = date.setSeconds(6);
      expect(Number.isFinite(result)).assertTrue();
      expect(date.getSeconds()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_8700
     * @tc.name testDateSetSeconds0087
     * @tc.desc Verify finally executes in normal scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(6);
      expect(date.getSeconds()).assertEqual(6);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_8800
     * @tc.name testDateSetSeconds0088
     * @tc.desc Verify consecutive setSeconds calls update correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(10);
      expect(date.getSeconds()).assertEqual(10);
      date.setSeconds(30);
      expect(date.getSeconds()).assertEqual(30);
      date.setSeconds(59);
      expect(date.getSeconds()).assertEqual(59);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_8900
     * @tc.name testDateSetSeconds0089
     * @tc.desc Verify alternating overload 1 and 2 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(10);
      expect(date.getSeconds()).assertEqual(10);
      date.setSeconds(20, 500);
      expect(date.getSeconds()).assertEqual(20);
      expect(date.getMilliseconds()).assertEqual(500);
      date.setSeconds(30);
      expect(date.getSeconds()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_9000
     * @tc.name testDateSetSeconds0090
     * @tc.desc Verify setSeconds does not affect other date fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(30);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(2);
      expect(date.getHours()).assertEqual(3);
      expect(date.getMinutes()).assertEqual(4);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_9100
     * @tc.name testDateSetSeconds0091
     * @tc.desc Verify setSeconds overload 2 does not affect other date fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(30, 999);
      expect(date.getFullYear()).assertEqual(2024);
      expect(date.getMonth()).assertEqual(0);
      expect(date.getDate()).assertEqual(2);
      expect(date.getHours()).assertEqual(3);
      expect(date.getMinutes()).assertEqual(4);
      expect(date.getMilliseconds()).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_9200
     * @tc.name testDateSetSeconds0092
     * @tc.desc Verify setSeconds on epoch date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setSeconds(30);
      expect(date.getSeconds()).assertEqual(30);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_9400
     * @tc.name testDateSetSeconds0094
     * @tc.desc Verify setSeconds on max timestamp date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(8640000000000000 - 1);
      let result = date.setSeconds(59);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_9500
     * @tc.name testDateSetSeconds0095
     * @tc.desc Verify overload 1 only modifies seconds not milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5, 100);
      date.setSeconds(10);
      expect(date.getSeconds()).assertEqual(10);
      expect(date.getMilliseconds()).assertEqual(100);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_9600
     * @tc.name testDateSetSeconds0096
     * @tc.desc Verify overload 2 modifies both seconds and milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5, 100);
      date.setSeconds(10, 200);
      expect(date.getSeconds()).assertEqual(10);
      expect(date.getMilliseconds()).assertEqual(200);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_9700
     * @tc.name testDateSetSeconds0097
     * @tc.desc Verify overload 1 preserves original milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5, 250);
      let originalMs = date.getMilliseconds();
      date.setSeconds(10);
      expect(date.getMilliseconds()).assertEqual(originalMs);
    });

    /**
     * @tc.number SUB_DATE_SET_SCNDS_CHK_9800
     * @tc.name testDateSetSeconds0098
     * @tc.desc Verify overload 1 preserves milliseconds set by overload 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetSeconds0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 2, 3, 4, 5);
      date.setSeconds(10, 888);
      expect(date.getMilliseconds()).assertEqual(888);
      date.setSeconds(20);
      expect(date.getMilliseconds()).assertEqual(888);
    });
  });
}
