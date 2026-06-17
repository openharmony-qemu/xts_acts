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

export default function LongToString1Test(): void {
  describe('LongToString1Test', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const TS1_NEG_10000000000: long = -10000000000;
    const TS1_NEG_456: long = -456;
    const TS1_NEG_1: long = -1;
    const TS1_0: long = 0;
    const TS1_1: long = 1;
    const TS1_30: int = 30;
    const TS1_123: long = 123;
    const TS1_10000000000: long = 10000000000;
    const TS1_STR_NEG_10000000000: string = "-10000000000";
    const TS1_STR_NEG_456: string = "-456";
    const TS1_STR_NEG_1: string = "-1";
    const TS1_STR_0: string = "0";
    const TS1_STR_1: string = "1";
    const TS1_STR_123: string = "123";
    const TS1_STR_10000000000: string = "10000000000";

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING1_0100
     * @tc.name testLongToString1001
     * @tc.desc Verify Long.toString(123) returns "123"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Long.toString(TS1_123);
      expect(result).assertEqual(TS1_STR_123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING1_0200
     * @tc.name testLongToString1002
     * @tc.desc Verify Long.toString(0) returns "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Long.toString(TS1_0);
      expect(result).assertEqual(TS1_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING1_0300
     * @tc.name testLongToString1003
     * @tc.desc Verify Long.toString(-456) returns "-456"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Long.toString(TS1_NEG_456);
      expect(result).assertEqual(TS1_STR_NEG_456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING1_0400
     * @tc.name testLongToString1004
     * @tc.desc Verify Long.toString(10000000000) returns "10000000000"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Long.toString(TS1_10000000000);
      expect(result).assertEqual(TS1_STR_10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING1_0500
     * @tc.name testLongToString1005
     * @tc.desc Verify Long.toString(-10000000000) returns "-10000000000"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Long.toString(TS1_NEG_10000000000);
      expect(result).assertEqual(TS1_STR_NEG_10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING1_0600
     * @tc.name testLongToString1006
     * @tc.desc Verify Long.toString(1) returns "1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Long.toString(TS1_1);
      expect(result).assertEqual(TS1_STR_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING1_0700
     * @tc.name testLongToString1007
     * @tc.desc Verify Long.toString(-1) returns "-1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Long.toString(TS1_NEG_1);
      expect(result).assertEqual(TS1_STR_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING1_0800
     * @tc.name testLongToString1008
     * @tc.desc Verify positive result contains no spaces
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Long.toString(TS1_123);
      expect(result.indexOf(" ")).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING1_0900
     * @tc.name testLongToString1009
     * @tc.desc Verify multiple calls with same input return same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1: string = Long.toString(TS1_123);
      const result2: string = Long.toString(TS1_123);
      expect(result1).assertEqual(result2);
    });
  });
}
