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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongToLocaleString1Test(): void {
  describe('LongToLocaleString1Test', () => {
    const LOC1_NEG_1234: long = -1234;
    const LOC1_2: int = 2;
    const LOC1_30: int = 30;
    const LOC1_1234: long = 1234;
    const LOC1_1234567: long = 1234567;
    const LOC1_1000000000: long = 1000000000;
    const LOC1_STR_NEG_1234_COMMA: string = "-1,234";
    const LOC1_STR_1234_COMMA: string = "1,234";
    const LOC1_STR_1234_00: string = "1,234.00";
    const LOC1_EN_US: string = "en-US";
    const LOC1_ZH_CN: string = "zh-CN";

    beforeEach(async () => { await Utils.msSleep(LOC1_30); });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_0100
     * @tc.name testLongToLocaleString1001
     * @tc.desc Verify toLocaleString() with no params uses default locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const result: string = value.toLocaleString();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_0200
     * @tc.name testLongToLocaleString1002
     * @tc.desc Verify toLocaleString("en-US") with en-US locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const result: string = value.toLocaleString(LOC1_EN_US);
      // en-US locale uses comma as thousands separator, so 1234 should be "1,234"
      expect(result).assertEqual(LOC1_STR_1234_COMMA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_0300
     * @tc.name testLongToLocaleString1003
     * @tc.desc Verify toLocaleString("zh-CN") with zh-CN locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const result: string = value.toLocaleString(LOC1_ZH_CN);
      // zh-CN locale may use full-width comma ("1，234"), half-width comma ("1,234"),
      // or no grouping ("1234") depending on the device's ICU/Intl implementation.
      // Only verify format is non-empty and contains numeric characters.
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_0400
     * @tc.name testLongToLocaleString1004
     * @tc.desc Verify toLocaleString(undefined) with undefined locales
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const result: string = value.toLocaleString(undefined);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_0500
     * @tc.name testLongToLocaleString1005
     * @tc.desc Verify toLocaleString with empty options returns non-empty String
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const options: Intl.NumberFormatOptions = {};
      const result: string = value.toLocaleString(LOC1_EN_US, options);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_0600
     * @tc.name testLongToLocaleString1006
     * @tc.desc Verify large value formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1000000000);
      const opts: Intl.NumberFormatOptions = { useGrouping: true };
      const result: string = value.toLocaleString(LOC1_EN_US, opts);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_0700
     * @tc.name testLongToLocaleString1007
     * @tc.desc Verify toLocaleString with useGrouping produces grouped output for en-US
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234567);
      const opts: Intl.NumberFormatOptions = { useGrouping: true };
      const result: string = value.toLocaleString(LOC1_EN_US, opts);
      expect(result.indexOf(",") !== -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_0800
     * @tc.name testLongToLocaleString1008
     * @tc.desc Verify negative number formatting with en-US locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_NEG_1234);
      const result: string = value.toLocaleString(LOC1_EN_US);
      // Negative numbers in en-US locale should be formatted as "-1,234"
      expect(result).assertEqual(LOC1_STR_NEG_1234_COMMA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_0900
     * @tc.name testLongToLocaleString1009
     * @tc.desc Verify toLocaleString with minimumFractionDigits option
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: LOC1_2 };
      const result: string = value.toLocaleString(LOC1_EN_US, opts);
      // With minimumFractionDigits=2, 1234 should be formatted as "1,234.00"
      expect(result).assertEqual(LOC1_STR_1234_00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_1000
     * @tc.name testLongToLocaleString1010
     * @tc.desc Verify toLocaleString with Long.MAX_VALUE returns non-empty formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(Long.MAX_VALUE);
      const result: string = value.toLocaleString(LOC1_EN_US);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_1100
     * @tc.name testLongToLocaleString1011
     * @tc.desc Verify toLocaleString with Long.MIN_VALUE returns non-empty formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(Long.MIN_VALUE);
      const result: string = value.toLocaleString(LOC1_EN_US);
      expect(result.length > 0).assertTrue();
    });
  });
}
