'use static'


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from './../Util.test';

const UINT64_MODULUS_VALUE: bigint = 18446744073709551616n;

export default function biguint64arrayToLocaleStringTest(): void {

  describe('BigUint64ArrayToLocaleStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_0100
     * @tc.name testBigUint64ArrayToLocaleString001
     * @tc.desc Verify toLocaleString(en-US) on an empty array returns an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let localeText = sourceArray.toLocaleString('en-US');
      expect(localeText).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_0200
     * @tc.name testBigUint64ArrayToLocaleString002
     * @tc.desc Verify toLocaleString(en-US) formats a single zero as zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n]);
      let localeText = sourceArray.toLocaleString('en-US');
      expect(localeText).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_0300
     * @tc.name testBigUint64ArrayToLocaleString003
     * @tc.desc Verify toLocaleString(de-DE) keeps a single one as one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let localeText = sourceArray.toLocaleString('de-DE');
      expect(localeText).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_0400
     * @tc.name testBigUint64ArrayToLocaleString004
     * @tc.desc Verify toLocaleString(zh-CN) keeps a small two digit value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let localeText = sourceArray.toLocaleString('zh-CN');
      expect(localeText).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_0500
     * @tc.name testBigUint64ArrayToLocaleString005
     * @tc.desc Verify toLocaleString() keeps an ungrouped three digit value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([999n]);
      let localeText = sourceArray.toLocaleString();
      expect(localeText).assertEqual('999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_0600
     * @tc.name testBigUint64ArrayToLocaleString006
     * @tc.desc Verify toLocaleString() joins three small values with commas in source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let localeText = sourceArray.toLocaleString();
      expect(localeText).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_0700
     * @tc.name testBigUint64ArrayToLocaleString007
     * @tc.desc Verify toLocaleString(en-US) joins default zero-filled elements with commas
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      let localeText = sourceArray.toLocaleString('en-US');
      expect(localeText).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_0800
     * @tc.name testBigUint64ArrayToLocaleString008
     * @tc.desc Verify toLocaleString(en-US useGrouping false) observes modulo storage for overflow writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(2);
      sourceArray[0] = UINT64_MODULUS_VALUE;
      sourceArray[1] = UINT64_MODULUS_VALUE + 1n;
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('0,1');
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_0900
     * @tc.name testBigUint64ArrayToLocaleString009
     * @tc.desc Verify toLocaleString(en-US) applies grouping to one thousand
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1000n]);
      let localeText = sourceArray.toLocaleString('en-US');
      expect(localeText).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_1000
     * @tc.name testBigUint64ArrayToLocaleString010
     * @tc.desc Verify toLocaleString(en-US) applies grouping to one million
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1000000n]);
      let localeText = sourceArray.toLocaleString('en-US');
      expect(localeText).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_1100
     * @tc.name testBigUint64ArrayToLocaleString011
     * @tc.desc Verify toLocaleString(de-DE) applies dot grouping to one thousand
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1000n]);
      let localeText = sourceArray.toLocaleString('de-DE');
      expect(localeText).assertEqual('1.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_1200
     * @tc.name testBigUint64ArrayToLocaleString012
     * @tc.desc Verify toLocaleString(en-US useGrouping false) disables grouping separators
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1000000n]);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_1300
     * @tc.name testBigUint64ArrayToLocaleString013
     * @tc.desc Verify toLocaleString(de-DE useGrouping false) disables grouping separators
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1000000n]);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = sourceArray.toLocaleString('de-DE', formatOptions);
      expect(localeText).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_1400
     * @tc.name testBigUint64ArrayToLocaleString014
     * @tc.desc Verify toLocaleString(en-US minimumIntegerDigits 3) pads a single digit with zeros
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([7n]);
      let formatOptions: BigIntToLocaleStringOptions = { minimumIntegerDigits: 3 };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('007');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_1500
     * @tc.name testBigUint64ArrayToLocaleString015
     * @tc.desc Verify toLocaleString(en-US) combines disabled grouping and integer digit padding
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false, minimumIntegerDigits: 5 };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('00042');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_1600
     * @tc.name testBigUint64ArrayToLocaleString016
     * @tc.desc Verify toLocaleString(en-US minimumFractionDigits 2) appends two fraction digits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let formatOptions: BigIntToLocaleStringOptions = { minimumFractionDigits: 2 };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('42.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_1700
     * @tc.name testBigUint64ArrayToLocaleString017
     * @tc.desc Verify toLocaleString(en-US maximumFractionDigits 0) keeps an integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let formatOptions: BigIntToLocaleStringOptions = { maximumFractionDigits: 0 };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_1800
     * @tc.name testBigUint64ArrayToLocaleString018
     * @tc.desc Verify toLocaleString(en-US percent style) formats a BigInt value as percent text
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([12n]);
      let formatOptions: BigIntToLocaleStringOptions = { style: 'percent' };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('1,200%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_1900
     * @tc.name testBigUint64ArrayToLocaleString019
     * @tc.desc Verify toLocaleString(en-US currency style) formats a BigInt value with USD currency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2500n]);
      let formatOptions: BigIntToLocaleStringOptions = { style: 'currency', currency: 'USD' };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('$2,500.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_2000
     * @tc.name testBigUint64ArrayToLocaleString020
     * @tc.desc Verify toLocaleString(en-US empty options) matches the locale-only result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1234n]);
      let baselineText = sourceArray.toLocaleString('en-US');
      let formatOptions: BigIntToLocaleStringOptions = {};
      let emptyOptionsText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(emptyOptionsText).assertEqual(baselineText);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_2100
     * @tc.name testBigUint64ArrayToLocaleString021
     * @tc.desc Verify toLocaleString(undefined) matches the default locale result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let defaultText = sourceArray.toLocaleString();
      let undefinedLocaleText = sourceArray.toLocaleString(undefined);
      expect(undefinedLocaleText).assertEqual(defaultText);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_2200
     * @tc.name testBigUint64ArrayToLocaleString022
     * @tc.desc Verify toLocaleString(en-US undefined options) matches the locale-only result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1234n]);
      let localeOnlyText = sourceArray.toLocaleString('en-US');
      let undefinedOptionsText = sourceArray.toLocaleString('en-US', undefined);
      expect(undefinedOptionsText).assertEqual(localeOnlyText);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_2300
     * @tc.name testBigUint64ArrayToLocaleString023
     * @tc.desc Verify consecutive toLocaleString calls with the same arguments are deterministic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1234567n]);
      let firstText = sourceArray.toLocaleString('en-US');
      let secondText = sourceArray.toLocaleString('en-US');
      expect(secondText).assertEqual(firstText);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_2400
     * @tc.name testBigUint64ArrayToLocaleString024
     * @tc.desc Verify toLocaleString does not mutate length byteLength or element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let originalLength = sourceArray.length;
      let originalByteLength = sourceArray.byteLength;
      let originalMiddleValue = sourceArray[1];
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('10,20,30');
      expect(sourceArray.length).assertEqual(originalLength);
      expect(sourceArray.byteLength).assertEqual(originalByteLength);
      expect(sourceArray[1]).assertEqual(originalMiddleValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_2500
     * @tc.name testBigUint64ArrayToLocaleString025
     * @tc.desc Verify subarray view toLocaleString only formats the selected window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let windowArray = sourceArray.subarray(1, 3);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = windowArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('20,30');
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_2600
     * @tc.name testBigUint64ArrayToLocaleString026
     * @tc.desc Verify ArrayBuffer view toLocaleString respects byteOffset and length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let fullArray = new BigUint64Array(buffer);
      fullArray[0] = 10n;
      fullArray[1] = 20n;
      fullArray[2] = 30n;
      let windowArray = new BigUint64Array(buffer, 8, 2);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = windowArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('20,30');
      expect(windowArray.byteOffset).assertEqual(8);
      expect(windowArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_2700
     * @tc.name testBigUint64ArrayToLocaleString027
     * @tc.desc Verify BigUint64Array.from result toLocaleString preserves source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.from([100n, 200n, 300n]);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_2800
     * @tc.name testBigUint64ArrayToLocaleString028
     * @tc.desc Verify BigUint64Array.of result toLocaleString preserves argument order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 3n);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('5,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_2900
     * @tc.name testBigUint64ArrayToLocaleString029
     * @tc.desc Verify toLocaleString throws RangeError for an invalid locale tag
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n]);
      try {
        sourceArray.toLocaleString('invalid_locale');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_3000
     * @tc.name testBigUint64ArrayToLocaleString030
     * @tc.desc Verify toLocaleString throws RangeError for an empty locale tag on a non-empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n]);
      try {
        sourceArray.toLocaleString('');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_3100
     * @tc.name testBigUint64ArrayToLocaleString031
     * @tc.desc Verify BigUint64Array.from(Set<BigInt>) result toLocaleString preserves insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(12n);
      sourceSet.add(34n);
      sourceSet.add(56n);
      let sourceArray = BigUint64Array.from(sourceSet);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('12,34,56');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_3200
     * @tc.name testBigUint64ArrayToLocaleString032
     * @tc.desc Verify FixedArray<BigInt> constructed array toLocaleString preserves source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<BigInt> = [8n, 16n, 24n];
      let sourceArray = new BigUint64Array(sourceValues);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('8,16,24');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_3300
     * @tc.name testBigUint64ArrayToLocaleString033
     * @tc.desc Verify number byteOffset view toLocaleString reads the converted window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bufferByteLength: int = 24;
      let sourceBuffer = new ArrayBuffer(bufferByteLength);
      let baseView = new BigUint64Array(sourceBuffer);
      baseView[0] = 10n;
      baseView[1] = 20n;
      baseView[2] = 30n;
      let byteOffset: number = 8.0;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = offsetView.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_3400
     * @tc.name testBigUint64ArrayToLocaleString034
     * @tc.desc Verify zero-length ArrayBuffer view toLocaleString returns an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bufferByteLength: int = 16;
      let sourceBuffer = new ArrayBuffer(bufferByteLength);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let emptyWindow = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = emptyWindow.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_3500
     * @tc.name testBigUint64ArrayToLocaleString035
     * @tc.desc Verify subarray toLocaleString reflects parent mutation within the live window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let windowArray = sourceArray.subarray(beginIndex, endIndex);
      sourceArray[2] = 99n;
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = windowArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('20,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_3600
     * @tc.name testBigUint64ArrayToLocaleString036
     * @tc.desc Verify length-bounded byteOffset subarray toLocaleString formats current window values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(56);
      let fullView = new BigUint64Array(sharedBuffer, 0, 7);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      fullView[6] = 70n;
      let byteOffset: int = 8;
      let viewLength: int = 5;
      let byteOffsetView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let beginIndex: int = 2;
      let endIndex: int = 5;
      let nestedView = byteOffsetView.subarray(beginIndex, endIndex);
      fullView[4] = 555n;
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = nestedView.toLocaleString('en-US', formatOptions);
      expect(nestedView.byteOffset).assertEqual(24);
      expect(nestedView.length).assertEqual(3);
      expect(localeText).assertEqual('40,555,60');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_3700
     * @tc.name testBigUint64ArrayToLocaleString037
     * @tc.desc Verify slice copy from byteOffset view toLocaleString ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let copyBegin: int = 0;
      let copyEnd: int = 3;
      let sliceCopy = sourceView.slice(copyBegin, copyEnd);
      sourceView[1] = 777n;
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = sliceCopy.toLocaleString('en-US', formatOptions);
      expect(sliceCopy.byteOffset).assertEqual(0);
      expect(sliceCopy.length).assertEqual(3);
      expect(localeText).assertEqual('20,30,40');
      expect(sourceView[1]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_3800
     * @tc.name testBigUint64ArrayToLocaleString038
     * @tc.desc Verify Set source toLocaleString reflects insertion order after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet = new Set<BigInt>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('7,11,15');
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_3900
     * @tc.name testBigUint64ArrayToLocaleString039
     * @tc.desc Verify advanced iterator source toLocaleString starts at the current cursor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('10,15,20');
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_4000
     * @tc.name testBigUint64ArrayToLocaleString040
     * @tc.desc Verify toLocaleString(en-US) applies grouping to every element in a multi-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1000n, 2000000n]);
      let localeText = sourceArray.toLocaleString('en-US');
      expect(localeText).assertEqual('1,000,2,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_4100
     * @tc.name testBigUint64ArrayToLocaleString041
     * @tc.desc Verify toLocaleString(en-US) applies combined stable options to every array element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([7n, 42n]);
      let formatOptions: BigIntToLocaleStringOptions = {
        useGrouping: false,
        minimumIntegerDigits: 4,
        minimumFractionDigits: 2
      };
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(localeText).assertEqual('0007.00,0042.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_4200
     * @tc.name testBigUint64ArrayToLocaleString042
     * @tc.desc Verify locale list falls back from unsupported zz-ZZ to en-US formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1000n]);
      let localeList: readonly string[] = ['zz-ZZ', 'en-US'];
      let localeText = sourceArray.toLocaleString(localeList);
      expect(localeText).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_4300
     * @tc.name testBigUint64ArrayToLocaleString043
     * @tc.desc Verify toLocaleString throws RangeError for an invalid style option value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(42n);
      let formatOptions: BigIntToLocaleStringOptions = { style: 'invalid-style' };
      try {
        sourceArray.toLocaleString('en-US', formatOptions);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_4400
     * @tc.name testBigUint64ArrayToLocaleString044
     * @tc.desc Verify toLocaleString throws RangeError when currency style omits the currency code
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(42n);
      let formatOptions: BigIntToLocaleStringOptions = { style: 'currency' };
      try {
        sourceArray.toLocaleString('en-US', formatOptions);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_4500
     * @tc.name testBigUint64ArrayToLocaleString045
     * @tc.desc Verify locale list selects the first supported locale before later alternatives
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValue: BigInt = 1000n;
      let sourceArray = BigUint64Array.of(sourceValue);
      let localeList: readonly string[] = ['de-DE', 'en-US'];
      let localeText = sourceArray.toLocaleString(localeList);
      let expectedText: string = '1.000';
      expect(localeText).assertEqual(expectedText);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_4600
     * @tc.name testBigUint64ArrayToLocaleString046
     * @tc.desc Verify toLocaleString throws RangeError for an invalid currency code
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValue: BigInt = 42n;
      let sourceArray = BigUint64Array.of(sourceValue);
      let localeName: string = 'en-US';
      let formatOptions: BigIntToLocaleStringOptions = { style: 'currency', currency: 'INVALID' };
      try {
        sourceArray.toLocaleString(localeName, formatOptions);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_4700
     * @tc.name testBigUint64ArrayToLocaleString047
     * @tc.desc Verify toLocaleString throws RangeError when minimumIntegerDigits is below one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValue: BigInt = 42n;
      let sourceArray = BigUint64Array.of(sourceValue);
      let localeName: string = 'en-US';
      let formatOptions: BigIntToLocaleStringOptions = { minimumIntegerDigits: 0 };
      try {
        sourceArray.toLocaleString(localeName, formatOptions);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOLOCALESTRING_4800
     * @tc.name testBigUint64ArrayToLocaleString048
     * @tc.desc Verify toLocaleString throws RangeError when maximumFractionDigits is below minimumFractionDigits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToLocaleString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValue: BigInt = 42n;
      let sourceArray = BigUint64Array.of(sourceValue);
      let localeName: string = 'en-US';
      let formatOptions: BigIntToLocaleStringOptions = {
        minimumFractionDigits: 2,
        maximumFractionDigits: 1
      };
      try {
        sourceArray.toLocaleString(localeName, formatOptions);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });
  });
}
