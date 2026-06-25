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

export default function LongToString2Test(): void {
  describe('LongToString2Test', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const T2S_NEG_456: long = -456;
    const T2S_NEG_1: long = -1;
    const T2S_0: long = 0;
    const T2S_1: long = 1;
    const T2S_100: long = 100;
    const T2S_123: long = 123;
    const T2S_200: long = 200;
    const T2S_STR_NEG_456: string = "-456";
    const T2S_STR_NEG_1: string = "-1";
    const T2S_STR_0: string = "0";
    const T2S_STR_1: string = "1";
    const T2S_STR_100: string = "100";
    const T2S_STR_123: string = "123";
    const T2S_STR_200: string = "200";
    const T2S_STR_MIN_VALUE: string = "-9223372036854775808";
    const T2S_STR_MAX_VALUE: string = "9223372036854775807";

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING2_0100
     * @tc.name testLongToString2001
     * @tc.desc Verify new Long(123).toString() returns "123"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(T2S_123);
      const result: string = value.toString();
      expect(result).assertEqual(T2S_STR_123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING2_0200
     * @tc.name testLongToString2002
     * @tc.desc Verify new Long(0).toString() returns "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(T2S_0);
      const result: string = value.toString();
      expect(result).assertEqual(T2S_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING2_0300
     * @tc.name testLongToString2003
     * @tc.desc Verify new Long(-456).toString() returns "-456"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(T2S_NEG_456);
      const result: string = value.toString();
      expect(result).assertEqual(T2S_STR_NEG_456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING2_0400
     * @tc.name testLongToString2004
     * @tc.desc Verify new Long().toString() returns "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long();
      const result: string = value.toString();
      expect(result).assertEqual(T2S_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING2_0500
     * @tc.name testLongToString2005
     * @tc.desc Verify new Long(1).toString() returns "1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(T2S_1);
      const result: string = value.toString();
      expect(result).assertEqual(T2S_STR_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING2_0600
     * @tc.name testLongToString2006
     * @tc.desc Verify new Long(-1).toString() returns "-1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(T2S_NEG_1);
      const result: string = value.toString();
      expect(result).assertEqual(T2S_STR_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING2_0700
     * @tc.name testLongToString2007
     * @tc.desc Verify different Long values produce different strings
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: Long = new Long(T2S_100);
      const value2: Long = new Long(T2S_200);
      const result1: string = value1.toString();
      const result2: string = value2.toString();
      expect(result1).assertEqual(T2S_STR_100);
      expect(result2).assertEqual(T2S_STR_200);
      expect(result1 !== result2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING2_0800
     * @tc.name testLongToString2008
     * @tc.desc Verify new Long(Long.MIN_VALUE).toString() returns correct minimum value string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE);
      const result: string = value.toString();
      expect(result).assertEqual(T2S_STR_MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING2_0900
     * @tc.name testLongToString2009
     * @tc.desc Verify new Long(Long.MAX_VALUE).toString() returns "9223372036854775807"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MAX_VALUE);
      const result: string = value.toString();
      expect(result).assertEqual(T2S_STR_MAX_VALUE);
    });
  });
}
