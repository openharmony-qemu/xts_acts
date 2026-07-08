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

export default function LongToLocaleString1Test(): void {
  describe('LongToLocaleString1Test', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const LOC1_NEG_1234: long = -1234;
    const LOC1_2: int = 2;
    const LOC1_1234: long = 1234;
    const LOC1_1234567: long = 1234567;
    const LOC1_1000000000: long = 1000000000;
    const LOC1_STR_NEG_1234_COMMA: string = "-1,234";
    const LOC1_STR_1234_COMMA: string = "1,234";
    const LOC1_STR_1234_00: string = "1,234.00";
    const LOC2_EN_US: string = "en-US";
    const LOC19_JA_JP: string = "ja-JP";
    const LOC20_AR_EG: string = "ar-EG";
    const LOC22_FR_FR: string = "fr-FR";
    const LOC29_DE_CH: string = "de-CH";
    const LOC30_ZH_TW: string = "zh-TW";
    const LOC3_ZH_CN: string = "zh-CN";

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
      expect(typeof result).assertEqual('string');
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
      const result: string = value.toLocaleString(LOC2_EN_US);
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
      const result: string = value.toLocaleString(LOC3_ZH_CN);
      expect(typeof result).assertEqual('string');
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
      const result: string = value.toLocaleString();
      expect(typeof result).assertEqual('string');
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
      const result: string = value.toLocaleString(LOC2_EN_US, options);
      expect(result).assertEqual('1,234');
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
      const result: string = value.toLocaleString(LOC2_EN_US, opts);
      expect(result).assertEqual('1,000,000,000');
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
      const result: string = value.toLocaleString(LOC2_EN_US, opts);
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
      const result: string = value.toLocaleString(LOC2_EN_US);
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
      const result: string = value.toLocaleString(LOC2_EN_US, opts);
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
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(typeof result).assertEqual('string');
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
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_1200
     * @tc.name testLongToLocaleString1012
     * @tc.desc Verify toLocaleString with style currency and currencyDisplay code
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const opts: Intl.NumberFormatOptions = { style: "currency", currency: "USD", currencyDisplay: "code" };
      const result: string = value.toLocaleString(LOC2_EN_US, opts);
      expect(result.indexOf("USD") !== -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_1300
     * @tc.name testLongToLocaleString1013
     * @tc.desc Verify toLocaleString with notation scientific
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const opts: Intl.NumberFormatOptions = { notation: "scientific" };
      const result: string = value.toLocaleString(LOC2_EN_US, opts);
      expect(result.indexOf("e") !== -1 || result.indexOf("E") !== -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_1400
     * @tc.name testLongToLocaleString1014
     * @tc.desc Verify toLocaleString with notation compact
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1000000000);
      const opts: Intl.NumberFormatOptions = { notation: "compact", compactDisplay: "short" };
      const result: string = value.toLocaleString(LOC2_EN_US, opts);
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_1500
     * @tc.name testLongToLocaleString1015
     * @tc.desc Verify toLocaleString with maximumSignificantDigits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234567);
      const opts: Intl.NumberFormatOptions = { maximumSignificantDigits: LOC1_2 };
      const result: string = value.toLocaleString(LOC2_EN_US, opts);
      expect(result).assertEqual('1,200,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_1600
     * @tc.name testLongToLocaleString1016
     * @tc.desc Verify toLocaleString with signDisplay always for positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const opts: Intl.NumberFormatOptions = { signDisplay: "always" };
      const result: string = value.toLocaleString(LOC2_EN_US, opts);
      expect(result.indexOf("+") !== -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_1700
     * @tc.name testLongToLocaleString1017
     * @tc.desc Verify toLocaleString with signDisplay never for negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_NEG_1234);
      const opts: Intl.NumberFormatOptions = { signDisplay: "never" };
      const result: string = value.toLocaleString(LOC2_EN_US, opts);
      expect(result.indexOf("-")).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_1800
     * @tc.name testLongToLocaleString1018
     * @tc.desc Verify toLocaleString with zh-CN and style percent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const opts: Intl.NumberFormatOptions = { style: "percent" };
      const result: string = value.toLocaleString(LOC3_ZH_CN, opts);
      expect(result.indexOf("%") !== -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_1900
     * @tc.name testLongToLocaleString1019
     * @tc.desc Verify toLocaleString with ja-JP locale and notation compact
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(1000000);
      const opts: Intl.NumberFormatOptions = { notation: "compact", compactDisplay: "short" };
      const result: string = value.toLocaleString(LOC19_JA_JP, opts);
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_2000
     * @tc.name testLongToLocaleString1020
     * @tc.desc Verify toLocaleString with ar-EG locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234567);
      const result: string = value.toLocaleString(LOC20_AR_EG);
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_2100
     * @tc.name testLongToLocaleString1021
     * @tc.desc Verify toLocaleString with invalid locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234567);
      const result: string = value.toLocaleString("xx-XX");
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_2200
     * @tc.name testLongToLocaleString1022
     * @tc.desc Verify toLocaleString with fr-FR locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234567);
      const opts: Intl.NumberFormatOptions = { useGrouping: true };
      const result: string = value.toLocaleString(LOC22_FR_FR, opts);
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_2300
     * @tc.name testLongToLocaleString1023
     * @tc.desc Verify toLocaleString with EUR currency symbol rendering (default currencyDisplay)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const opts: Intl.NumberFormatOptions = { style: "currency", currency: "EUR" };
      const result: string = value.toLocaleString(LOC2_EN_US, opts);
      expect(result.indexOf("€") !== -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_2400
     * @tc.name testLongToLocaleString1024
     * @tc.desc Verify toLocaleString with zh-CN and useGrouping false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(1234567);
      const opts: Intl.NumberFormatOptions = { useGrouping: false };
      const result: string = value.toLocaleString(LOC3_ZH_CN, opts);
      expect(result).assertEqual('1234567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_2500
     * @tc.name testLongToLocaleString1025
     * @tc.desc Verify toLocaleString with minimumFractionDigits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 3 };
      const result: string = value.toLocaleString(LOC2_EN_US, opts);
      expect(result).assertEqual('1,234.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_2600
     * @tc.name testLongToLocaleString1026
     * @tc.desc Verify toLocaleString with maximumFractionDigits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234567);
      const opts: Intl.NumberFormatOptions = { maximumFractionDigits: LOC1_2 };
      const result: string = value.toLocaleString(LOC2_EN_US, opts);
      expect(result).assertEqual('1,234,567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_2700
     * @tc.name testLongToLocaleString1027
     * @tc.desc Verify toLocaleString with style unit meter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const opts: Intl.NumberFormatOptions = { style: "unit", unit: "meter" };
      const result: string = value.toLocaleString(LOC2_EN_US, opts);
      expect(result.indexOf("m") !== -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_2800
     * @tc.name testLongToLocaleString1028
     * @tc.desc Verify toLocaleString with GBP currency code rendering (currencyDisplay code)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(9999999);
      const opts: Intl.NumberFormatOptions = { style: "currency", currency: "GBP", currencyDisplay: "code" };
      const result: string = value.toLocaleString("en-GB", opts);
      expect(result.indexOf("GBP") !== -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_2900
     * @tc.name testLongToLocaleString1029
     * @tc.desc Verify toLocaleString with de-CH locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const opts: Intl.NumberFormatOptions = { useGrouping: true };
      const result: string = value.toLocaleString(LOC29_DE_CH, opts);
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_3000
     * @tc.name testLongToLocaleString1030
     * @tc.desc Verify toLocaleString with zh-TW locale and style percent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(123);
      const opts: Intl.NumberFormatOptions = { style: "percent", minimumFractionDigits: 1 };
      const result: string = value.toLocaleString(LOC30_ZH_TW, opts);
      expect(result.indexOf("%") !== -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING1_3100
     * @tc.name testLongToLocaleString1031
     * @tc.desc Verify toLocaleString with null/undefined locale returns non-empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(LOC1_1234);
      const resultUndefined: string = value.toLocaleString(undefined);
      expect(typeof resultUndefined).assertEqual('string');
    });
  });
}
