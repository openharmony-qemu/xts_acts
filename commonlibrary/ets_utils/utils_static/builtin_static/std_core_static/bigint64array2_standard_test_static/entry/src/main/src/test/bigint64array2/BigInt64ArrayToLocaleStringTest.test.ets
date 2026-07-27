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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BigInt64ArrayToLocaleString02Test(): void {
  describe('BigInt64ArrayToLocaleString02Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_0100
     * @tc.name testBigInt64ArrayToLocaleStringTwo001
     * @tc.desc Verify toLocaleString() on empty array returns an empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.toLocaleString();
      expect(res).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_0200
     * @tc.name testBigInt64ArrayToLocaleStringTwo002
     * @tc.desc Verify toLocaleString() returns expected digit string for a single positive element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_0300
     * @tc.name testBigInt64ArrayToLocaleStringTwo003
     * @tc.desc Verify toLocaleString() returns a leading minus for a single negative element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-42n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('-')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_0400
     * @tc.name testBigInt64ArrayToLocaleStringTwo004
     * @tc.desc Verify toLocaleString() returns '0' for a zero element without grouping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_0500
     * @tc.name testBigInt64ArrayToLocaleStringTwo005
     * @tc.desc Verify toLocaleString() returns the exact digit string for MAX_INT64 without grouping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_0600
     * @tc.name testBigInt64ArrayToLocaleStringTwo006
     * @tc.desc Verify toLocaleString() returns the exact digit string for MIN_INT64 without grouping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([(-9223372036854775807n - 1n)]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_0700
     * @tc.name testBigInt64ArrayToLocaleStringTwo007
     * @tc.desc Verify toLocaleString() on a 10-digit positive value returns the exact string without grouping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1234567890n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('1234567890');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_0800
     * @tc.name testBigInt64ArrayToLocaleStringTwo008
     * @tc.desc Verify toLocaleString() on a negative max-safe-ish value returns the exact string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9876543210n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('-9876543210');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_0900
     * @tc.name testBigInt64ArrayToLocaleStringTwo009
     * @tc.desc Verify toLocaleString() on a 2-element array returns comma-separated string '100,200'.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('100,200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_1000
     * @tc.name testBigInt64ArrayToLocaleStringTwo010
     * @tc.desc Verify multi-element result contains all original values as substrings.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([111n, 222n, 333n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('111') >= 0).assertTrue();
      expect(res.indexOf('222') >= 0).assertTrue();
      expect(res.indexOf('333') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_1100
     * @tc.name testBigInt64ArrayToLocaleStringTwo011
     * @tc.desc Verify multi-element result with grouping contains comma-separated elements and grouping commas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1234n, 56789n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: true };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('1,234') >= 0).assertTrue();
      expect(res.indexOf('56,789') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_1200
     * @tc.name testBigInt64ArrayToLocaleStringTwo012
     * @tc.desc Verify en-US grouping inserts commas every three digits for a 7-digit positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1234567n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: true };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('1,234,567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_1300
     * @tc.name testBigInt64ArrayToLocaleStringTwo013
     * @tc.desc Verify en-US grouping for a negative value includes leading minus and commas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1234567n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: true };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('-1,234,567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_1400
     * @tc.name testBigInt64ArrayToLocaleStringTwo014
     * @tc.desc Verify de-DE locale uses dot as the grouping separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1234567n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: true };
      let res = arr.toLocaleString('de-DE', opts);
      expect(res).assertEqual('1.234.567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_1500
     * @tc.name testBigInt64ArrayToLocaleStringTwo015
     * @tc.desc Verify useGrouping: false suppresses all grouping separators for a large number.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1234567n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('1234567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_1600
     * @tc.name testBigInt64ArrayToLocaleStringTwo016
     * @tc.desc Verify default toLocaleString() (no options) applies locale-appropriate grouping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1234567n]);
      let res = arr.toLocaleString('en-US');
      expect(res.indexOf(',') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_1700
     * @tc.name testBigInt64ArrayToLocaleStringTwo017
     * @tc.desc Verify a 10-digit value with grouping has multiple separators in en-US.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1234567890n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: true };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('1,234,567,890');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_1800
     * @tc.name testBigInt64ArrayToLocaleStringTwo018
     * @tc.desc Verify different locales may produce different formatted strings for the same value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1234567n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: true };
      let resUS = arr.toLocaleString('en-US', opts);
      let resDE = arr.toLocaleString('de-DE', opts);
      expect(resUS !== resDE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_1900
     * @tc.name testBigInt64ArrayToLocaleStringTwo019
     * @tc.desc Verify minimumIntegerDigits: 2 pads a single digit with one leading zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let opts: BigIntToLocaleStringOptions = { minimumIntegerDigits: 2, useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('01') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_2000
     * @tc.name testBigInt64ArrayToLocaleStringTwo020
     * @tc.desc Verify minimumIntegerDigits: 5 pads a single digit with four leading zeros.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n]);
      let opts: BigIntToLocaleStringOptions = { minimumIntegerDigits: 5, useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('00007') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_2100
     * @tc.name testBigInt64ArrayToLocaleStringTwo021
     * @tc.desc Verify minimumIntegerDigits: 3 on zero returns three zeros.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let opts: BigIntToLocaleStringOptions = { minimumIntegerDigits: 3, useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('000') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_2200
     * @tc.name testBigInt64ArrayToLocaleStringTwo022
     * @tc.desc Verify minimumIntegerDigits with negative value preserves minus sign before padding.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n]);
      let opts: BigIntToLocaleStringOptions = { minimumIntegerDigits: 3, useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('-')).assertEqual(0);
      expect(res.indexOf('005') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_2300
     * @tc.name testBigInt64ArrayToLocaleStringTwo023
     * @tc.desc Verify minimumIntegerDigits combined with useGrouping: true produces grouped padded output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let opts: BigIntToLocaleStringOptions = { minimumIntegerDigits: 5, useGrouping: true };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('00,001') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_2400
     * @tc.name testBigInt64ArrayToLocaleStringTwo024
     * @tc.desc Verify USD currency formatting keeps numeric content in the result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n]);
      let opts: BigIntToLocaleStringOptions = { style: 'currency', currency: 'USD' };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('50') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_2500
     * @tc.name testBigInt64ArrayToLocaleStringTwo025
     * @tc.desc Verify EUR currency formatting in de-DE locale keeps numeric content.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([70n]);
      let opts: BigIntToLocaleStringOptions = { style: 'currency', currency: 'EUR' };
      let res = arr.toLocaleString('de-DE', opts);
      expect(res.indexOf('70') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_2600
     * @tc.name testBigInt64ArrayToLocaleStringTwo026
     * @tc.desc Verify JPY currency formatting keeps numeric content (JPY has no decimal).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([80n]);
      let opts: BigIntToLocaleStringOptions = { style: 'currency', currency: 'JPY' };
      let res = arr.toLocaleString('ja-JP', opts);
      expect(res.indexOf('80') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_2700
     * @tc.name testBigInt64ArrayToLocaleStringTwo027
     * @tc.desc Verify negative USD currency contains both minus and currency indicator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-50n]);
      let opts: BigIntToLocaleStringOptions = { style: 'currency', currency: 'USD' };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('-') >= 0).assertTrue();
      expect(res.indexOf('50') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_2800
     * @tc.name testBigInt64ArrayToLocaleStringTwo028
     * @tc.desc Verify CNY currency in zh-CN locale keeps numeric content.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([90n]);
      let opts: BigIntToLocaleStringOptions = { style: 'currency', currency: 'CNY' };
      let res = arr.toLocaleString('zh-CN', opts);
      expect(res.indexOf('90') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_2900
     * @tc.name testBigInt64ArrayToLocaleStringTwo029
     * @tc.desc Verify percent style includes '%' symbol for a positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n]);
      let opts: BigIntToLocaleStringOptions = { style: 'percent' };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('%') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_3000
     * @tc.name testBigInt64ArrayToLocaleStringTwo030
     * @tc.desc Verify percent style includes '%' symbol for a negative value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-3n]);
      let opts: BigIntToLocaleStringOptions = { style: 'percent' };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('%') >= 0).assertTrue();
      expect(res.indexOf('-') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_3100
     * @tc.name testBigInt64ArrayToLocaleStringTwo031
     * @tc.desc Verify percent style with zh-CN locale includes '%'.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let opts: BigIntToLocaleStringOptions = { style: 'percent' };
      let res = arr.toLocaleString('zh-CN', opts);
      expect(res.indexOf('%') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_3200
     * @tc.name testBigInt64ArrayToLocaleStringTwo032
     * @tc.desc Verify array length is preserved after calling toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.toLocaleString();
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_3300
     * @tc.name testBigInt64ArrayToLocaleStringTwo033
     * @tc.desc Verify toLocaleString('en-US') on [999n, 1000n, 1001n] produces correct grouping at the 3-to-4-digit boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([999n, 1000n, 1001n]);
      let res = arr.toLocaleString('en-US');
      expect(res).assertEqual('999,1,000,1,001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_3400
     * @tc.name testBigInt64ArrayToLocaleStringTwo034
     * @tc.desc Verify byteLength is preserved after calling toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      arr.toLocaleString();
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_3500
     * @tc.name testBigInt64ArrayToLocaleStringTwo035
     * @tc.desc Verify byteOffset is preserved after calling toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n]);
      arr.toLocaleString();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_3600
     * @tc.name testBigInt64ArrayToLocaleStringTwo036
     * @tc.desc Verify buffer reference is preserved after calling toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n]);
      let buf = arr.buffer;
      arr.toLocaleString();
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_3700
     * @tc.name testBigInt64ArrayToLocaleStringTwo037
     * @tc.desc Verify Int8Array view on the same buffer remains unchanged after toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([101n]);
      let i8 = new Int8Array(arr.buffer);
      i8[0] = 5;
      arr.toLocaleString();
      expect(i8[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_3800
     * @tc.name testBigInt64ArrayToLocaleStringTwo038
     * @tc.desc Verify sibling BigInt64Array views on the same buffer preserve their values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v1 = new BigInt64Array(buf);
      let v2 = new BigInt64Array(buf);
      v1[0] = 42n;
      v2.toLocaleString();
      expect(v1[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_3900
     * @tc.name testBigInt64ArrayToLocaleStringTwo039
     * @tc.desc Verify custom-offset view preserves its value when the other view calls toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a1 = new BigInt64Array(buf, 0, 1);
      let a2 = new BigInt64Array(buf, 8, 1);
      a1[0] = 5n;
      a2.toLocaleString();
      expect(a1[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_4000
     * @tc.name testBigInt64ArrayToLocaleStringTwo040
     * @tc.desc Verify Uint8Array byte modifications on the shared buffer are preserved after toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let u8 = new Uint8Array(buf);
      u8[0] = 255;
      let arr = new BigInt64Array(buf);
      arr.toLocaleString();
      expect(u8[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_4100
     * @tc.name testBigInt64ArrayToLocaleStringTwo041
     * @tc.desc Verify subarray element value is preserved after calling toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array([10n, 20n, 30n]);
      let child = parent.subarray(1, 2);
      child.toLocaleString();
      expect(child[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_4200
     * @tc.name testBigInt64ArrayToLocaleStringTwo042
     * @tc.desc Verify subarray byteOffset is preserved after calling toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array([100n, 200n, 300n]);
      let child = parent.subarray(1, 2);
      child.toLocaleString();
      expect(child.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_4300
     * @tc.name testBigInt64ArrayToLocaleStringTwo043
     * @tc.desc Verify subarray.buffer === parent.buffer still holds after toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array([5n, 10n, 15n]);
      let child = parent.subarray(1, 2);
      child.toLocaleString();
      expect(child.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_4400
     * @tc.name testBigInt64ArrayToLocaleStringTwo044
     * @tc.desc Verify parent values are unchanged after subarray calls toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array([1n, 2n, 3n]);
      let child = parent.subarray(1, 2);
      child.toLocaleString();
      expect(parent[0]).assertEqual(1n);
      expect(parent[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_4500
     * @tc.name testBigInt64ArrayToLocaleStringTwo045
     * @tc.desc Verify nested subarrays preserve grandparent values after toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p = new BigInt64Array([11n, 22n, 33n, 44n]);
      let c = p.subarray(1, 3);
      let gc = c.subarray(0, 1);
      gc.toLocaleString();
      expect(p[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_4600
     * @tc.name testBigInt64ArrayToLocaleStringTwo046
     * @tc.desc Verify with() + toLocaleString() on the modified copy retains the updated value string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let modified = arr.with(0, 100n);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = modified.toLocaleString('en-US', opts);
      expect(res.indexOf('100') >= 0).assertTrue();
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_4700
     * @tc.name testBigInt64ArrayToLocaleStringTwo047
     * @tc.desc Verify slice() + toLocaleString() does not affect the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([15n, 16n]);
      let sliced = arr.slice();
      sliced.toLocaleString();
      expect(arr[0]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_4800
     * @tc.name testBigInt64ArrayToLocaleStringTwo048
     * @tc.desc Verify fill() + toLocaleString() reflects the filled value in the result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      arr.fill(7n);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('7') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_4900
     * @tc.name testBigInt64ArrayToLocaleStringTwo049
     * @tc.desc Verify copyWithin() + toLocaleString() reflects the copied elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.copyWithin(0, 2);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('3') >= 0).assertTrue();
      expect(res.indexOf('4') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_5000
     * @tc.name testBigInt64ArrayToLocaleStringTwo050
     * @tc.desc Verify toLocaleString after reverse() contains the first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.reverse();
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('3') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_5100
     * @tc.name testBigInt64ArrayToLocaleStringTwo051
     * @tc.desc Verify toLocaleString after sort() contains the smallest element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([30n, 10n, 20n]);
      arr.sort();
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('10') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_5200
     * @tc.name testBigInt64ArrayToLocaleStringTwo052
     * @tc.desc Verify toReversed() + toLocaleString() on the new reversed copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let rev = arr.toReversed();
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = rev.toLocaleString('en-US', opts);
      expect(res.indexOf('3') >= 0).assertTrue();
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_5300
     * @tc.name testBigInt64ArrayToLocaleStringTwo053
     * @tc.desc Verify toSorted() + toLocaleString() on the sorted copy preserves original.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([30n, 10n, 20n]);
      let sorted = arr.toSorted();
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = sorted.toLocaleString('en-US', opts);
      expect(res.indexOf('10') >= 0).assertTrue();
      expect(arr[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_5400
     * @tc.name testBigInt64ArrayToLocaleStringTwo054
     * @tc.desc Verify set() + toLocaleString() reflects the set elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      arr.set([9n, 8n], 1);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('9') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_5500
     * @tc.name testBigInt64ArrayToLocaleStringTwo055
     * @tc.desc Verify subarray() + toLocaleString() on a sub-portion formats only that portion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = sub.toLocaleString('en-US', opts);
      expect(res).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_5600
     * @tc.name testBigInt64ArrayToLocaleStringTwo056
     * @tc.desc Verify values() iteration after toLocaleString() still yields all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.toLocaleString();
      let count = 0;
      let iter = arr.values();
      let item = iter.next();
      while (!item.done) {
      count = count + 1;
      item = iter.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_5700
     * @tc.name testBigInt64ArrayToLocaleStringTwo057
     * @tc.desc Verify BigInt64Array.of() result can call toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(5n, 10n, 15n);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('5') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_5800
     * @tc.name testBigInt64ArrayToLocaleStringTwo058
     * @tc.desc Verify BigInt64Array.from() result can call toLocaleString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([100n, 200n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('100') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_5900
     * @tc.name testBigInt64ArrayToLocaleStringTwo059
     * @tc.desc Verify toLocaleString on zero-filled array contains zero character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('0') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_6000
     * @tc.name testBigInt64ArrayToLocaleStringTwo060
     * @tc.desc Verify toLocaleString() on a 100-element array produces correct values at representative positions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i = i + 1) {
      arr[i] = BigInt(i + 1);
      }
      let res = arr.toLocaleString();
      let parts = res.split(',');
      expect(parts[0]).assertEqual('1');
      expect(parts[50]).assertEqual('51');
      expect(parts[99]).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_6100
     * @tc.name testBigInt64ArrayToLocaleStringTwo061
     * @tc.desc Verify toLocaleString() on a large array with all same values produces consistent output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr.fill(7n);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      let parts = res.split(',');
      expect(parts[0]).assertEqual('7');
      expect(parts[10]).assertEqual('7');
      expect(parts[19]).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_6200
     * @tc.name testBigInt64ArrayToLocaleStringTwo062
     * @tc.desc Verify toLocaleString() on an all-zeros array produces only zero elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_6300
     * @tc.name testBigInt64ArrayToLocaleStringTwo063
     * @tc.desc Verify toLocaleString() on mixed positive and negative values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, 0n, 10n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('-10') >= 0).assertTrue();
      expect(res.indexOf('10') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_6400
     * @tc.name testBigInt64ArrayToLocaleStringTwo064
     * @tc.desc Verify toLocaleString() with MAX and MIN in the same array produces the expected substrings.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, (-9223372036854775807n - 1n)]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('9223372036854775807') >= 0).assertTrue();
      expect(res.indexOf('-9223372036854775808') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_6500
     * @tc.name testBigInt64ArrayToLocaleStringTwo065
     * @tc.desc Verify toLocaleString() on repeated same value produces the same substring for each element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 42n, 42n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('42,42,42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_6600
     * @tc.name testBigInt64ArrayToLocaleStringTwo066
     * @tc.desc Verify style: 'decimal' explicitly produces numeric string without currency/percent symbols.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([99n]);
      let opts: BigIntToLocaleStringOptions = { style: 'decimal', useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_6700
     * @tc.name testBigInt64ArrayToLocaleStringTwo067
     * @tc.desc Verify useGrouping + minimumIntegerDigits combined on a multi-digit value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1234n]);
      let opts: BigIntToLocaleStringOptions = { minimumIntegerDigits: 7, useGrouping: true };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('001,234') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_6800
     * @tc.name testBigInt64ArrayToLocaleStringTwo068
     * @tc.desc Verify currency + minimumIntegerDigits combined produces padded currency output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n]);
      let opts: BigIntToLocaleStringOptions = { style: 'currency', currency: 'USD', minimumIntegerDigits: 3 };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('005') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_6900
     * @tc.name testBigInt64ArrayToLocaleStringTwo069
     * @tc.desc Verify percent style toLocaleString contains % and 100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let opts: BigIntToLocaleStringOptions = { style: 'percent', minimumIntegerDigits: 2, useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('%') >= 0).assertTrue();
      expect(res.indexOf('100') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_7000
     * @tc.name testBigInt64ArrayToLocaleStringTwo070
     * @tc.desc Verify toLocaleString() called twice on the same array returns equal strings.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res1 = arr.toLocaleString('en-US', opts);
      let res2 = arr.toLocaleString('en-US', opts);
      expect(res1).assertEqual(res2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_7100
     * @tc.name testBigInt64ArrayToLocaleStringTwo071
     * @tc.desc Verify toLocaleString on negative value contains the negative number.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-999n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('-999') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_7200
     * @tc.name testBigInt64ArrayToLocaleStringTwo072
     * @tc.desc Verify toLocaleString() on a very large positive value (close to MAX) with grouping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: true };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf(',') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_7300
     * @tc.name testBigInt64ArrayToLocaleStringTwo073
     * @tc.desc Verify toLocaleString() on powers-of-10 array: 1n, 10n, 100n, 1000n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 10n, 100n, 1000n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('1,10,100') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_7400
     * @tc.name testBigInt64ArrayToLocaleStringTwo074
     * @tc.desc Verify toLocaleString() on all-9s pattern: 9n, 99n, 999n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n, 99n, 999n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('en-US', opts);
      expect(res).assertEqual('9,99,999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_7500
     * @tc.name testBigInt64ArrayToLocaleStringTwo075
     * @tc.desc Verify toLocaleString() on numbers ending in zeros: 1000n, 100000n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1000n, 100000n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: true };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('1,000') >= 0).assertTrue();
      expect(res.indexOf('100,000') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_7600
     * @tc.name testBigInt64ArrayToLocaleStringTwo076
     * @tc.desc Verify toLocaleString() on alternating digit pattern values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([121212n, 343434n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: true };
      let res = arr.toLocaleString('en-US', opts);
      expect(res.indexOf('121,212') >= 0).assertTrue();
      expect(res.indexOf('343,434') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_7700
     * @tc.name testBigInt64ArrayToLocaleStringTwo077
     * @tc.desc Verify keys() on the array after toLocaleString() reports correct indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.toLocaleString();
      let keys = arr.keys();
      let k0 = keys.next();
      let k1 = keys.next();
      let k2 = keys.next();
      expect(k0.value).assertEqual(0);
      expect(k1.value).assertEqual(1);
      expect(k2.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_7800
     * @tc.name testBigInt64ArrayToLocaleStringTwo078
     * @tc.desc Verify zh-CN toLocaleString result is a string containing grouping separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([12345678n]);
      let opts: BigIntToLocaleStringOptions = { useGrouping: true };
      let res = arr.toLocaleString('zh-CN', opts);
      expect(typeof res).assertEqual('string');
      expect(res.indexOf(',') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_7900
     * @tc.name testBigInt64ArrayToLocaleStringTwo079
     * @tc.desc Verify de-DE currency formatting for EUR includes the numeric value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1234n]);
      let opts: BigIntToLocaleStringOptions = { style: 'currency', currency: 'EUR' };
      let res = arr.toLocaleString('de-DE', opts);
      expect(res.indexOf('1.234') >= 0 || res.indexOf('1234') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_8000
     * @tc.name testBigInt64ArrayToLocaleStringTwo080
     * @tc.desc Verify toLocaleString() on a BigInt64Array with non-zero byteOffset formats the correct starting value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let full = new BigInt64Array(buf);
      full[0] = 10n;
      full[1] = 20n;
      full[2] = 30n;
      let offsetView = new BigInt64Array(buf, 8, 2);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = offsetView.toLocaleString('en-US', opts);
      expect(res.indexOf('20') >= 0).assertTrue();
      expect(res.indexOf('30') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_8100
     * @tc.name testBigInt64ArrayToLocaleStringTwo081
     * @tc.desc Verify toLocaleString with numberingSystem 'hanidec' via locale extension.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([123456n]);
      let result = arr.toLocaleString('zh-Hans-CN-u-nu-hanidec');
      expect(typeof result).assertEqual('string');
      expect(result.charCodeAt(0) > 127).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_8200
     * @tc.name testBigInt64ArrayToLocaleStringTwo082
     * @tc.desc Verify toLocaleString with ar-EG locale contains each individually-formatted element as a substring.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1000n, 2000n, 3000n]);
      let result = arr.toLocaleString('ar-EG');
      expect(typeof result).assertEqual('string');
      let expected0 = (1000n).toLocaleString('ar-EG');
      let expected1 = (2000n).toLocaleString('ar-EG');
      let expected2 = (3000n).toLocaleString('ar-EG');
      expect(result.indexOf(expected0) >= 0).assertTrue();
      expect(result.indexOf(expected1) >= 0).assertTrue();
      expect(result.indexOf(expected2) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_8300
     * @tc.name testBigInt64ArrayToLocaleStringTwo083
     * @tc.desc Verify toLocaleString throws RangeError for invalid locale.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.toLocaleString('invalid-locale-xyz-123');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_8400
     * @tc.name testBigInt64ArrayToLocaleStringTwo084
     * @tc.desc Verify MAX toLocaleString with locale en-US and default options.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.toLocaleString('en-US');
      expect(typeof res).assertEqual('string');
      expect(res.indexOf(',') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_8500
     * @tc.name testBigInt64ArrayToLocaleStringTwo085
     * @tc.desc Verify MIN toLocaleString with locale en-US and default options.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([(-9223372036854775807n - 1n)]);
      let res = arr.toLocaleString('en-US');
      expect(typeof res).assertEqual('string');
      expect(res.indexOf('-') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_8600
     * @tc.name testBigInt64ArrayToLocaleStringTwo086
     * @tc.desc Verify toLocaleString on array created by BigInt64Array.of with different locale.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(100n, 200n, 300n);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = arr.toLocaleString('fr-FR', opts);
      expect(typeof res).assertEqual('string');
      expect(res.indexOf('100') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_8700
     * @tc.name testBigInt64ArrayToLocaleStringTwo087
     * @tc.desc Verify toLocaleString on subarray result formats the correct sub-portion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array([11n, 22n, 33n, 44n, 55n]);
      let sub = parent.subarray(1, 4);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = sub.toLocaleString('en-US', opts);
      expect(res.indexOf('22') >= 0).assertTrue();
      expect(res.indexOf('33') >= 0).assertTrue();
      expect(res.indexOf('44') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_8800
     * @tc.name testBigInt64ArrayToLocaleStringTwo088
     * @tc.desc Verify toLocaleString after chained with calls produces combined result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let modified = arr.with(0, 50n).with(2, 60n);
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = modified.toLocaleString('en-US', opts);
      expect(res.indexOf('50') >= 0).assertTrue();
      expect(res.indexOf('60') >= 0).assertTrue();
      expect(res.indexOf('2') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_LOCALE_STRING_TWO_8900
     * @tc.name testBigInt64ArrayToLocaleStringTwo089
     * @tc.desc Verify toLocaleString after toSorted contains all elements; original array unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToLocaleStringTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([300n, 100n, 200n]);
      let sorted = arr.toSorted();
      let opts: BigIntToLocaleStringOptions = { useGrouping: false };
      let res = sorted.toLocaleString('en-US', opts);
      expect(res.indexOf('100') >= 0).assertTrue();
      expect(res.indexOf('200') >= 0).assertTrue();
      expect(res.indexOf('300') >= 0).assertTrue();
      expect(arr[0]).assertEqual(300n);
    });

  });
}
