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
    const LOC2_NEG_1234567: long = -1234567;
    const LOC2_NEG_1: long = -1;
    const LOC2_0: long = 0;
    const LOC2_1: long = 1;
    const LOC2_100: long = 100;
    const LOC2_1000: long = 1000;
    const LOC2_1234: long = 1234;
    const LOC2_100000: long = 100000;
    const LOC2_1234567: long = 1234567;
    const LOC2_STR_0: string = "0";
    const LOC2_STR_1: string = "1";
    const LOC2_STR_NEG_1: string = "-1";
    const LOC2_STR_100: string = "100";
    const LOC2_STR_1000_COMMA: string = "1,000";
    const LOC2_STR_100000_COMMA: string = "100,000";
    const LOC2_STR_NEG_1234567_COMMA: string = "-1,234,567";
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_0800
     * @tc.name testLongToLocaleString2008
     * @tc.desc Verify toLocaleString("en-US") with 0 returns "0" (no grouping under thousand)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_0);
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(result).assertEqual(LOC2_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_0900
     * @tc.name testLongToLocaleString2009
     * @tc.desc Verify toLocaleString("en-US") with 1 returns "1" (single digit)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_1);
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(result).assertEqual(LOC2_STR_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_1000
     * @tc.name testLongToLocaleString2010
     * @tc.desc Verify toLocaleString("en-US") with -1 preserves sign as "-1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_NEG_1);
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(result).assertEqual(LOC2_STR_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_1100
     * @tc.name testLongToLocaleString2011
     * @tc.desc Verify toLocaleString("en-US") with 100 returns "100" (sub-thousand, no grouping)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_100);
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(result).assertEqual(LOC2_STR_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_1200
     * @tc.name testLongToLocaleString2012
     * @tc.desc Verify toLocaleString("en-US") with 1000 emits first-group separator "1,000"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_1000);
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(result).assertEqual(LOC2_STR_1000_COMMA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_1300
     * @tc.name testLongToLocaleString2013
     * @tc.desc Verify toLocaleString("en-US") with 100000 returns "100,000" (six-digit grouping)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_100000);
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(result).assertEqual(LOC2_STR_100000_COMMA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_1400
     * @tc.name testLongToLocaleString2014
     * @tc.desc Verify toLocaleString("en-US") with -1234567 preserves both sign and grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_NEG_1234567);
      const result: string = value.toLocaleString(LOC2_EN_US);
      expect(result).assertEqual(LOC2_STR_NEG_1234567_COMMA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_1500
     * @tc.name testLongToLocaleString2015
     * @tc.desc Verify toLocaleString("de-DE") with zero returns "0" (locale-symmetric to en-US)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_0);
      const result: string = value.toLocaleString(LOC2_DE_DE);
      expect(result).assertEqual(LOC2_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_1600
     * @tc.name testLongToLocaleString2016
     * @tc.desc Verify toLocaleString("de-DE") with negative 1234 uses dot as grouping separator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_NEG_1234);
      const result: string = value.toLocaleString(LOC2_DE_DE);
      expect(result.indexOf("-")).assertEqual(0);
      expect(result.indexOf(".") !== -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_1700
     * @tc.name testLongToLocaleString2017
     * @tc.desc Verify toLocaleString with no arguments returns a non-empty default-locale string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_1234);
      const result: string = value.toLocaleString();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_1800
     * @tc.name testLongToLocaleString2018
     * @tc.desc Verify toLocaleString with non-NumberFormatOptions object is ignored per spec
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_1234);
      const ignoredOpts: object = new Object();
      const withOpts: string = value.toLocaleString(LOC2_EN_US, ignoredOpts);
      const withoutOpts: string = value.toLocaleString(LOC2_EN_US);
      expect(withOpts).assertEqual(withoutOpts);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_1900
     * @tc.name testLongToLocaleString2019
     * @tc.desc Verify toLocaleString same locale and value yields identical result on repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_1234567);
      const r1: string = value.toLocaleString(LOC2_EN_US);
      const r2: string = value.toLocaleString(LOC2_EN_US);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_2000
     * @tc.name testLongToLocaleString2020
     * @tc.desc Verify different input values under the same locale produce different strings
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: string = new Long(LOC2_1234).toLocaleString(LOC2_EN_US);
      const b: string = new Long(LOC2_1234567).toLocaleString(LOC2_EN_US);
      expect(a !== b).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_LOCALE_STRING2_2100
     * @tc.name testLongToLocaleString2021
     * @tc.desc Verify de-DE on 1234567 emits dots and differs from en-US comma form
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(LOC2_1234567);
      const de: string = value.toLocaleString(LOC2_DE_DE);
      const en: string = value.toLocaleString(LOC2_EN_US);
      expect(de.indexOf(".") !== -1).assertTrue();
      expect(en.indexOf(",") !== -1).assertTrue();
      expect(de !== en).assertTrue();
    });
  });
}
