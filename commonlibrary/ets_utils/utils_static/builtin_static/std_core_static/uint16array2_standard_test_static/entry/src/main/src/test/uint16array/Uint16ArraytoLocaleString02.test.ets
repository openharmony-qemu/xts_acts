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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayToLocaleStringPart2Test(): void {
  describe('Uint16ArrayToLocaleStringPart2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_0100
     * @tc.name testUint16ArrayToLocaleStringPart2001
      * @tc.desc Verify en-US formats both thousands values with comma grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1234, 5678);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('1,234,5,678');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_0200
     * @tc.name testUint16ArrayToLocaleStringPart2002
      * @tc.desc Verify de-DE formats both thousands values with period grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(2345, 6789);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('2.345,6.789');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_0300
     * @tc.name testUint16ArrayToLocaleStringPart2003
      * @tc.desc Verify zh-CN formats both thousands values with comma grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(3456, 7890);
      const result = arr.toLocaleString('zh-CN');
      expect(result).assertEqual('3,456,7,890');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_0400
     * @tc.name testUint16ArrayToLocaleStringPart2004
      * @tc.desc Verify fixed fraction options append two decimals to each value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(4567, 8901);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      const result: string = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('4,567.00,8,901.00');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_0500
     * @tc.name testUint16ArrayToLocaleStringPart2005
      * @tc.desc Verify an empty Uint16Array formats as an empty locale string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array();
      const result = arr.toLocaleString();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_0600
     * @tc.name testUint16ArrayToLocaleStringPart2006
      * @tc.desc Verify a single element formats as its locale decimal representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(42);
      const result = arr.toLocaleString();
      expect(result).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_0700
     * @tc.name testUint16ArrayToLocaleStringPart2007
      * @tc.desc Verify default formatting preserves a five-element sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(5);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const result = arr.toLocaleString();
      expect(result).assertEqual('10,20,30,40,50');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_0800
     * @tc.name testUint16ArrayToLocaleStringPart2008
      * @tc.desc Verify default formatting serializes a single zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0);
      const result = arr.toLocaleString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_0900
     * @tc.name testUint16ArrayToLocaleStringPart2009
      * @tc.desc Verify en-US groups a single Uint16 maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('65,535');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_1000
     * @tc.name testUint16ArrayToLocaleStringPart2010
      * @tc.desc Verify en-US groups a single thousand value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('1,000');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_1100
     * @tc.name testUint16ArrayToLocaleStringPart2011
      * @tc.desc Verify de-DE groups a single thousand value with a period
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('1.000');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_1200
     * @tc.name testUint16ArrayToLocaleStringPart2012
      * @tc.desc Verify default formatting preserves two zero elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 0);
      const result = arr.toLocaleString();
      expect(result).assertEqual('0,0');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_1300
     * @tc.name testUint16ArrayToLocaleStringPart2013
      * @tc.desc Verify default formatting preserves two small elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2);
      const result = arr.toLocaleString();
      expect(result).assertEqual('1,2');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_1400
     * @tc.name testUint16ArrayToLocaleStringPart2014
      * @tc.desc Verify default formatting preserves a three-element tens sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.toLocaleString();
      expect(result).assertEqual('10,20,30');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_1500
     * @tc.name testUint16ArrayToLocaleStringPart2015
      * @tc.desc Verify en-US formats zero without grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_1600
     * @tc.name testUint16ArrayToLocaleStringPart2016
      * @tc.desc Verify en-US formats a one-digit value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(5);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_1700
     * @tc.name testUint16ArrayToLocaleStringPart2017
      * @tc.desc Verify en-US formats a two-digit value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_1800
     * @tc.name testUint16ArrayToLocaleStringPart2018
      * @tc.desc Verify en-US formats a three-digit value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(100);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_1900
     * @tc.name testUint16ArrayToLocaleStringPart2019
      * @tc.desc Verify en-US groups a five-digit value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10000);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('10,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_2000
     * @tc.name testUint16ArrayToLocaleStringPart2020
      * @tc.desc Verify en-US groups the Uint16 midpoint value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(32768);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('32,768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_2100
     * @tc.name testUint16ArrayToLocaleStringPart2021
      * @tc.desc Verify en-US preserves two zero elements without grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 0);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_2200
     * @tc.name testUint16ArrayToLocaleStringPart2022
      * @tc.desc Verify en-US preserves two small elements without grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_2300
     * @tc.name testUint16ArrayToLocaleStringPart2023
     * @tc.desc Verify en-US formatting preserves three element values and order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000, 2000, 3000);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('1,000,2,000,3,000');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_2400
     * @tc.name testUint16ArrayToLocaleStringPart2024
     * @tc.desc Verify en-US formatting for distinct boundary and irregular values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(17, 4096, 65535, 802);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('17,4,096,65,535,802');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_2500
     * @tc.name testUint16ArrayToLocaleStringPart2025
     * @tc.desc Verify en-US formatting for a non-monotonic five element sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(54321, 9, 1200, 77, 30005);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('54,321,9,1,200,77,30,005');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_2600
     * @tc.name testUint16ArrayToLocaleStringPart2026
      * @tc.desc Verify en-US groups only the four- and five-digit elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 100, 1000, 10000);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('10,100,1,000,10,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_2700
     * @tc.name testUint16ArrayToLocaleStringPart2027
      * @tc.desc Verify de-DE formats zero without grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_2800
     * @tc.name testUint16ArrayToLocaleStringPart2028
      * @tc.desc Verify de-DE formats a one-digit value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(5);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_2900
     * @tc.name testUint16ArrayToLocaleStringPart2029
      * @tc.desc Verify de-DE groups a thousand value with a period
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('1.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_3000
     * @tc.name testUint16ArrayToLocaleStringPart2030
      * @tc.desc Verify de-DE groups a five-digit value with a period
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10000);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('10.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_3100
     * @tc.name testUint16ArrayToLocaleStringPart2031
      * @tc.desc Verify de-DE groups the Uint16 maximum value with a period
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('65.535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_3200
     * @tc.name testUint16ArrayToLocaleStringPart2032
      * @tc.desc Verify de-DE groups the Uint16 midpoint value with a period
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(32768);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('32.768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_3300
     * @tc.name testUint16ArrayToLocaleStringPart2033
      * @tc.desc Verify de-DE preserves two zero elements without grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 0);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_3400
     * @tc.name testUint16ArrayToLocaleStringPart2034
      * @tc.desc Verify de-DE groups each value in a two-thousand sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000, 2000);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('1.000,2.000');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_3500
     * @tc.name testUint16ArrayToLocaleStringPart2035
      * @tc.desc Verify de-DE preserves ungrouped three-digit elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(100, 200, 300);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_3600
     * @tc.name testUint16ArrayToLocaleStringPart2036
      * @tc.desc Verify zh-CN formats zero without grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0);
      const result = arr.toLocaleString('zh-CN');
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_3700
     * @tc.name testUint16ArrayToLocaleStringPart2037
      * @tc.desc Verify zh-CN groups a thousand value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000);
      const result = arr.toLocaleString('zh-CN');
      expect(result).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_3800
     * @tc.name testUint16ArrayToLocaleStringPart2038
      * @tc.desc Verify zh-CN groups a five-digit value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10000);
      const result = arr.toLocaleString('zh-CN');
      expect(result).assertEqual('10,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_3900
     * @tc.name testUint16ArrayToLocaleStringPart2039
      * @tc.desc Verify zh-CN groups the Uint16 maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535);
      const result = arr.toLocaleString('zh-CN');
      expect(result).assertEqual('65,535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_4000
     * @tc.name testUint16ArrayToLocaleStringPart2040
      * @tc.desc Verify zh-CN groups the Uint16 midpoint value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(32768);
      const result = arr.toLocaleString('zh-CN');
      expect(result).assertEqual('32,768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_4100
     * @tc.name testUint16ArrayToLocaleStringPart2041
      * @tc.desc Verify zh-CN groups an irregular five-digit value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(12345);
      const result = arr.toLocaleString('zh-CN');
      expect(result).assertEqual('12,345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_4200
     * @tc.name testUint16ArrayToLocaleStringPart2042
      * @tc.desc Verify zh-CN preserves two zero elements without grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 0);
      const result = arr.toLocaleString('zh-CN');
      expect(result).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_4300
     * @tc.name testUint16ArrayToLocaleStringPart2043
      * @tc.desc Verify zh-CN groups each value in a two-thousand sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000, 2000);
      const result = arr.toLocaleString('zh-CN');
      expect(result).assertEqual('1,000,2,000');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_4400
     * @tc.name testUint16ArrayToLocaleStringPart2044
      * @tc.desc Verify zh-CN preserves an ungrouped small-value sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(5, 50, 500);
      const result = arr.toLocaleString('zh-CN');
      expect(result).assertEqual('5,50,500');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_4500
     * @tc.name testUint16ArrayToLocaleStringPart2045
      * @tc.desc Verify en-US minimumFractionDigits adds two decimals to a thousand
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      const result: string = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_4600
     * @tc.name testUint16ArrayToLocaleStringPart2046
      * @tc.desc Verify en-US minimumFractionDigits pads zero to three decimals
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 3 };
      const result: string = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('0.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_4700
     * @tc.name testUint16ArrayToLocaleStringPart2047
      * @tc.desc Verify en-US groups and pads the Uint16 maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      const result: string = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('65,535.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_4800
     * @tc.name testUint16ArrayToLocaleStringPart2048
       * @tc.desc Verify en-US formatting renders a one-digit value with four fraction digits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(5);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 4 };
      const result: string = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('5.0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_4900
     * @tc.name testUint16ArrayToLocaleStringPart2049
      * @tc.desc Verify de-DE fixed fractions use period grouping and comma decimals
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      const result: string = arr.toLocaleString('de-DE', opts);
      expect(result).assertEqual('1.000,00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_5000
     * @tc.name testUint16ArrayToLocaleStringPart2050
       * @tc.desc Verify de-DE formatting renders zero with three fraction digits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 3 };
      const result: string = arr.toLocaleString('de-DE', opts);
      expect(result).assertEqual('0,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_5100
     * @tc.name testUint16ArrayToLocaleStringPart2051
      * @tc.desc Verify de-DE groups and pads the Uint16 maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      const result: string = arr.toLocaleString('de-DE', opts);
      expect(result).assertEqual('65.535,00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_5200
     * @tc.name testUint16ArrayToLocaleStringPart2052
      * @tc.desc Verify zh-CN groups and pads a thousand value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      const result: string = arr.toLocaleString('zh-CN', opts);
      expect(result).assertEqual('1,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_5300
     * @tc.name testUint16ArrayToLocaleStringPart2053
      * @tc.desc Verify en-US zero maximum fraction digits retain grouped integers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(12345);
      const opts: Intl.NumberFormatOptions = { maximumFractionDigits: 0 };
      const result: string = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('12,345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_5400
     * @tc.name testUint16ArrayToLocaleStringPart2054
      * @tc.desc Verify en-US zero maximum fraction digits retain a grouped thousand
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000);
      const opts: Intl.NumberFormatOptions = { maximumFractionDigits: 0 };
      const result: string = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_5500
     * @tc.name testUint16ArrayToLocaleStringPart2055
      * @tc.desc Verify de-DE zero maximum fraction digits retain period grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000);
      const opts: Intl.NumberFormatOptions = { maximumFractionDigits: 0 };
      const result: string = arr.toLocaleString('de-DE', opts);
      expect(result).assertEqual('1.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_5600
     * @tc.name testUint16ArrayToLocaleStringPart2056
      * @tc.desc Verify zh-CN zero maximum fraction digits retain maximum grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535);
      const opts: Intl.NumberFormatOptions = { maximumFractionDigits: 0 };
      const result: string = arr.toLocaleString('zh-CN', opts);
      expect(result).assertEqual('65,535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_5700
     * @tc.name testUint16ArrayToLocaleStringPart2057
      * @tc.desc Verify en-US matching fraction bounds produce two decimals
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2, maximumFractionDigits: 2 };
      const result: string = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_5800
     * @tc.name testUint16ArrayToLocaleStringPart2058
      * @tc.desc Verify en-US matching one-digit fraction bounds pad a small value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(5);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 1, maximumFractionDigits: 1 };
      const result: string = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('5.0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_5900
     * @tc.name testUint16ArrayToLocaleStringPart2059
       * @tc.desc Verify de-DE formatting uses exactly two fraction digits when both bounds are two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2, maximumFractionDigits: 3 };
      const result: string = arr.toLocaleString('de-DE', opts);
      expect(result).assertEqual('1.000,00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_6000
     * @tc.name testUint16ArrayToLocaleStringPart2060
      * @tc.desc Verify en-US zero fraction bounds format zero as an integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 0, maximumFractionDigits: 0 };
      const result: string = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_6100
     * @tc.name testUint16ArrayToLocaleStringPart2061
      * @tc.desc Verify toLocaleString does not mutate element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000, 2000, 3000);
      const backup0 = arr[0];
      const backup1 = arr[1];
      const backup2 = arr[2];
      arr.toLocaleString();
      expect(arr[0]).assertEqual(backup0);
      expect(arr[1]).assertEqual(backup1);
      expect(arr[2]).assertEqual(backup2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_6200
     * @tc.name testUint16ArrayToLocaleStringPart2062
      * @tc.desc Verify en-US formatting does not change array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000, 2000);
      const lenBefore = arr.length;
      arr.toLocaleString('en-US');
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_6300
     * @tc.name testUint16ArrayToLocaleStringPart2063
      * @tc.desc Verify de-DE formatting does not mutate source elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000, 2000);
      const backup = Uint16Array.of(arr[0], arr[1]);
      arr.toLocaleString('de-DE');
      expect(arr[0]).assertEqual(backup[0]);
      expect(arr[1]).assertEqual(backup[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_6400
     * @tc.name testUint16ArrayToLocaleStringPart2064
      * @tc.desc Verify formatting options do not mutate source elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000, 2000);
      const backup = Uint16Array.of(arr[0], arr[1]);
      const opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      arr.toLocaleString('en-US', opts);
      expect(arr[0]).assertEqual(backup[0]);
      expect(arr[1]).assertEqual(backup[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_6500
     * @tc.name testUint16ArrayToLocaleStringPart2065
      * @tc.desc Verify zh-CN formatting does not mutate source elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000, 2000);
      const backup = Uint16Array.of(arr[0], arr[1]);
      arr.toLocaleString('zh-CN');
      expect(arr[0]).assertEqual(backup[0]);
      expect(arr[1]).assertEqual(backup[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_6600
     * @tc.name testUint16ArrayToLocaleStringPart2066
      * @tc.desc Verify formatting an empty receiver preserves its zero length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array();
      arr.toLocaleString();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_6700
     * @tc.name testUint16ArrayToLocaleStringPart2067
      * @tc.desc Verify repeated en-US formatting returns the same string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000, 2000);
      const r1 = arr.toLocaleString('en-US');
      const r2 = arr.toLocaleString('en-US');
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_6800
     * @tc.name testUint16ArrayToLocaleStringPart2068
      * @tc.desc Verify multiple locale formats leave source elements unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000, 2000);
      const backup = Uint16Array.of(arr[0], arr[1]);
      arr.toLocaleString('en-US');
      arr.toLocaleString('de-DE');
      arr.toLocaleString('zh-CN');
      expect(arr[0]).assertEqual(backup[0]);
      expect(arr[1]).assertEqual(backup[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_6900
     * @tc.name testUint16ArrayToLocaleStringPart2069
      * @tc.desc Verify en-US formatting groups the maximum Uint16 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('65,535');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_7000
     * @tc.name testUint16ArrayToLocaleStringPart2070
      * @tc.desc Verify en-US formatting preserves three zero elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 0, 0);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_7100
     * @tc.name testUint16ArrayToLocaleStringPart2071
      * @tc.desc Verify en-US formatting preserves repeated maximum Uint16 values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535, 65535);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('65,535,65,535');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_7200
     * @tc.name testUint16ArrayToLocaleStringPart2072
      * @tc.desc Verify en-US formats a hexadecimal ten literal as decimal ten
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0x0A);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_7300
     * @tc.name testUint16ArrayToLocaleStringPart2073
      * @tc.desc Verify en-US formats a binary ten literal as decimal ten
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0b1010);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_7400
     * @tc.name testUint16ArrayToLocaleStringPart2074
      * @tc.desc Verify en-US formats an octal ten literal as decimal ten
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0o12);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_7500
     * @tc.name testUint16ArrayToLocaleStringPart2075
      * @tc.desc Verify en-US groups a scientific-notation ten-thousand value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1e4);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('10,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART2_7600
     * @tc.name testUint16ArrayToLocaleStringPart2076
      * @tc.desc Verify a copied typed array remains isolated from source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(10, 20, 30);
      const copied: Uint16Array = new Uint16Array(source);
      copied.$_set(0, 99);
      expect(source.$_get(0)).assertEqual(10);
    });

  });
}
