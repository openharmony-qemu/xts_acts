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

export default function LongToLocaleString2Test(): void {
  describe('LongToLocaleString2Test', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const LOC2_NEG_1234: long = -1234;
    const LOC2_0: long = 0;
    const LOC2_1234: long = 1234;
    const LOC2_1234567: long = 1234567;
    const LOC2_STR_1234_DOT: string = "1.234";
    const LOC2_EN_US: string = "en-US";
    const LOC2_DE_DE: string = "de-DE";

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_0100
     * @tc.name testLongToLocaleString2001
     * @tc.desc Verify toLocaleString("de-DE") with German locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_1234);
      const result: string = value.toLocaleString(LOC2_DE_DE);
      expect(result).assertEqual(LOC2_STR_1234_DOT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_0200
     * @tc.name testLongToLocaleString2002
     * @tc.desc Verify toLocaleString("en-US") with zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_0);
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_0300
     * @tc.name testLongToLocaleString2003
     * @tc.desc Verify toLocaleString("en-US") with negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_NEG_1234);
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(result).assertEqual("-1,234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_0400
     * @tc.name testLongToLocaleString2004
     * @tc.desc Verify toLocaleString("en-US") with 1234 returns "1,234"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_1234);
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(result).assertEqual("1,234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_0500
     * @tc.name testLongToLocaleString2005
     * @tc.desc Verify different locales produce different results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_1234567);
      const r1: string = value.toLocaleString(LOC2_EN_US);
      const r2: string = value.toLocaleString(LOC2_DE_DE);
      expect(r1 !== r2).assertTrue();
      expect(r1.indexOf(",") !== -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_0600
     * @tc.name testLongToLocaleString2006
     * @tc.desc Verify toLocaleString("en-US") with Long.MAX_VALUE returns a string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MAX_VALUE);
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_0700
     * @tc.name testLongToLocaleString2007
     * @tc.desc Verify toLocaleString("en-US") with Long.MIN_VALUE returns a string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE);
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(typeof result).assertEqual('string');
    });
  });
}
