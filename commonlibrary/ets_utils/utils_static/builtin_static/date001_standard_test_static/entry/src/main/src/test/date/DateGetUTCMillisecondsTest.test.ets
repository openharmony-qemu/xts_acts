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

export default function DateGetUTCMillisecondsTest(): void {
  describe('DateGetUTCMillisecondsTest', () => {
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
     * @tc.number SUB_DATE_GET_UTC_MLLSC_0100
     * @tc.name testDateGetUTCMilliseconds0001
     * @tc.desc Verify getUTCMilliseconds with no arguments returns 0 for timestamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMilliseconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.getUTCMilliseconds();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MLLSC_0400
     * @tc.name testDateGetUTCMilliseconds0004
     * @tc.desc Verify getUTCMilliseconds returns 123 for specified milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMilliseconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 0, 0, 0, 123));
      let result = date.getUTCMilliseconds();
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MLLSC_0500
     * @tc.name testDateGetUTCMilliseconds0005
     * @tc.desc Verify getUTCMilliseconds returns 500 for middle value milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMilliseconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 5, 15, 12, 30, 45, 500));
      let result = date.getUTCMilliseconds();
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MLLSC_0600
     * @tc.name testDateGetUTCMilliseconds0006
     * @tc.desc Verify getUTCMilliseconds returns integer in range 0-999 for current time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMilliseconds0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.getUTCMilliseconds();
      expect(result >= 0 && result <= 999).assertTrue();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MLLSC_0700
     * @tc.name testDateGetUTCMilliseconds0007
     * @tc.desc Verify getUTCMilliseconds returns 0 at minimum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMilliseconds0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(1970, 0, 1, 0, 0, 0, 0));
      let result = date.getUTCMilliseconds();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MLLSC_0800
     * @tc.name testDateGetUTCMilliseconds0008
     * @tc.desc Verify getUTCMilliseconds returns 999 at maximum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMilliseconds0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 0, 0, 0, 999));
      let result = date.getUTCMilliseconds();
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MLLSC_0900
     * @tc.name testDateGetUTCMilliseconds0009
     * @tc.desc Verify getUTCMilliseconds returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMilliseconds0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 0, 0, 0, 1));
      let result = date.getUTCMilliseconds();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MLLSC_1000
     * @tc.name testDateGetUTCMilliseconds0010
     * @tc.desc Verify getUTCMilliseconds returns 998
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMilliseconds0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 0, 0, 0, 998));
      let result = date.getUTCMilliseconds();
      expect(result).assertEqual(998);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MLLSC_1100
     * @tc.name testDateGetUTCMilliseconds0011
     * @tc.desc Verify getUTCMilliseconds works with negative timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMilliseconds0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(1969, 11, 31, 23, 59, 59, 500));
      let result = date.getUTCMilliseconds();
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MLLSC_1300
     * @tc.name testDateGetUTCMilliseconds0013
     * @tc.desc Verify getUTCMilliseconds returns value in range 0-999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMilliseconds0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1704067200123);
      let result = date.getUTCMilliseconds();
      expect(result >= 0).assertTrue();
      expect(result <= 999).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MLLSC_1400
     * @tc.name testDateGetUTCMilliseconds0014
     * @tc.desc Verify getUTCMilliseconds returns integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMilliseconds0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 0, 0, 0, 456));
      let result = date.getUTCMilliseconds();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_UTC_MLLSC_2000
     * @tc.name testDateGetUTCMilliseconds0020
     * @tc.desc Verify getUTCMilliseconds returns consistent results on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetUTCMilliseconds0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1, 0, 0, 0, 789));
      let result1 = date.getUTCMilliseconds();
      let result2 = date.getUTCMilliseconds();
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual(789);
    });
  });
}
