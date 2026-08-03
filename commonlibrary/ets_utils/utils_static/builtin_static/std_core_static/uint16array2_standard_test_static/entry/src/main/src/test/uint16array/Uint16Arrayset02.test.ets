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

export default function uint16ArraySetPart2Test(): void {
  describe('Uint16ArraySetPart2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_0100
     * @tc.name testUint16ArraySetPart2001
     * @tc.desc Verify scalar set stores 42 at the first index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 42);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_0200
     * @tc.name testUint16ArraySetPart2002
     * @tc.desc Verify scalar set stores 100 at a middle index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(4, 100);
      expect(arr[4]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_0300
     * @tc.name testUint16ArraySetPart2003
     * @tc.desc Verify scalar set stores 200 at the final valid index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(7, 200);
      expect(arr[7]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_0400
     * @tc.name testUint16ArraySetPart2004
     * @tc.desc Verify scalar set retains values on both sides of the byte boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 255);
      expect(arr[0]).assertEqual(255);
      arr.set(0, 256);
      expect(arr[0]).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_0500
     * @tc.name testUint16ArraySetPart2005
     * @tc.desc Verify scalar set at an index equal to length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      try {
        arr.set(8, 42);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_0600
     * @tc.name testUint16ArraySetPart2006
     * @tc.desc Verify scalar set stores zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_0700
     * @tc.name testUint16ArraySetPart2007
     * @tc.desc Verify scalar set stores the maximum Uint16 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 65535);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_0800
     * @tc.name testUint16ArraySetPart2008
     * @tc.desc Verify scalar set wraps 65536 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 65536);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_0900
     * @tc.name testUint16ArraySetPart2009
     * @tc.desc Verify scalar set wraps negative one to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, -1);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_1000
     * @tc.name testUint16ArraySetPart2010
     * @tc.desc Verify scalar set stores the Uint16 midpoint value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 32768);
      expect(arr[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_1100
     * @tc.name testUint16ArraySetPart2011
     * @tc.desc Verify scalar set stores hexadecimal 0x7FFF as 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 0x7FFF);
      expect(arr[0]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_1200
     * @tc.name testUint16ArraySetPart2012
     * @tc.desc Verify scalar set stores hexadecimal 0x8000 as 32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 0x8000);
      expect(arr[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_1300
     * @tc.name testUint16ArraySetPart2013
     * @tc.desc Verify scalar set stores hexadecimal 0xFFFF as 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 0xFFFF);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_1400
     * @tc.name testUint16ArraySetPart2014
     * @tc.desc Verify scalar set wraps hexadecimal 0x10000 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 0x10000);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_1500
     * @tc.name testUint16ArraySetPart2015
     * @tc.desc Verify scalar set stores the octal Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 0o177777);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_1600
     * @tc.name testUint16ArraySetPart2016
     * @tc.desc Verify scalar set wraps octal 0o200000 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 0o200000);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_1700
     * @tc.name testUint16ArraySetPart2017
     * @tc.desc Verify scalar set stores the binary Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 0b1111111111111111);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_1800
     * @tc.name testUint16ArraySetPart2018
     * @tc.desc Verify scalar set wraps a 17-bit binary value to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 0b10000000000000000);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_1900
     * @tc.name testUint16ArraySetPart2019
     * @tc.desc Verify scalar set truncates a positive fraction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 3.14);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_2000
     * @tc.name testUint16ArraySetPart2020
     * @tc.desc Verify scalar set truncates a fraction below the Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 65535.9);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_2100
     * @tc.name testUint16ArraySetPart2021
     * @tc.desc Verify scalar set truncates a negative fraction toward zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, -0.5);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_2200
     * @tc.name testUint16ArraySetPart2022
     * @tc.desc Verify scalar set wraps two Uint16 ranges to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 65536 * 2);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_2300
     * @tc.name testUint16ArraySetPart2023
     * @tc.desc Verify scalar set retains the remainder after multiple Uint16 ranges
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 65536 * 2 + 5);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_2400
     * @tc.name testUint16ArraySetPart2024
     * @tc.desc Verify scalar set converts NaN to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, Number.NaN);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_2500
     * @tc.name testUint16ArraySetPart2025
     * @tc.desc Verify scalar set converts positive infinity to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, Number.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_2600
     * @tc.name testUint16ArraySetPart2026
     * @tc.desc Verify scalar set converts negative infinity to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, -Number.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_2700
     * @tc.name testUint16ArraySetPart2027
     * @tc.desc Verify scalar set stores an exponential literal of ten
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 1e1);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_2800
     * @tc.name testUint16ArraySetPart2028
     * @tc.desc Verify scalar set stores an exponential literal of one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 1e0);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_2900
     * @tc.name testUint16ArraySetPart2029
     * @tc.desc Verify scalar set stores an exponential literal at the Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 6.5535e4);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_3000
     * @tc.name testUint16ArraySetPart2030
     * @tc.desc Verify set(0, 42) writes index 0 and leaves indexes 1 and 7 as 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 42);
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual(0);
      expect(arr[7]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_3100
     * @tc.name testUint16ArraySetPart2031
     * @tc.desc Verify scalar set changes only the requested middle index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(3, 99);
      expect(arr[0]).assertEqual(0);
      expect(arr[3]).assertEqual(99);
      expect(arr[7]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_3200
     * @tc.name testUint16ArraySetPart2032
     * @tc.desc Verify consecutive scalar sets populate consecutive indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 10);
      arr.set(1, 20);
      arr.set(2, 30);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_3300
     * @tc.name testUint16ArraySetPart2033
     * @tc.desc Verify a later scalar set overwrites the same index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 100);
      arr.set(0, 200);
      expect(arr[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_3400
     * @tc.name testUint16ArraySetPart2034
     * @tc.desc Verify scalar set wraps the square of the Uint16 range to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 65536 * 65536);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_3500
     * @tc.name testUint16ArraySetPart2035
     * @tc.desc Verify scalar set wraps negative Uint16 range to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, -65536);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_3600
     * @tc.name testUint16ArraySetPart2036
     * @tc.desc Verify copying an empty array preserves zero-initialized elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([]);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_3700
     * @tc.name testUint16ArraySetPart2037
     * @tc.desc Verify a one-element array source copies its value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([42]);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_3800
     * @tc.name testUint16ArraySetPart2038
     * @tc.desc Verify an array source copies three elements in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([1, 2, 3]);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_3900
     * @tc.name testUint16ArraySetPart2039
     * @tc.desc Verify an array source fills a target of equal length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([10, 20, 30, 40, 50]);
      expect(arr[0]).assertEqual(10);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_4000
     * @tc.name testUint16ArraySetPart2040
     * @tc.desc Verify a one-element array copy preserves the following target element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([99]);
      expect(arr[0]).assertEqual(99);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_4100
     * @tc.name testUint16ArraySetPart2041
     * @tc.desc Verify an array source value of 65536 wraps to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([65536]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_4200
     * @tc.name testUint16ArraySetPart2042
     * @tc.desc Verify an array source value of negative one wraps to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([-1]);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_4300
     * @tc.name testUint16ArraySetPart2043
     * @tc.desc Verify an array source truncates a positive fractional value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([3.14]);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_4400
     * @tc.name testUint16ArraySetPart2044
     * @tc.desc Verify an array source converts NaN to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([Number.NaN]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_4500
     * @tc.name testUint16ArraySetPart2045
     * @tc.desc Verify an array source converts positive infinity to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([Number.POSITIVE_INFINITY]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_4600
     * @tc.name testUint16ArraySetPart2046
     * @tc.desc Verify an array source converts negative infinity to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([-Number.POSITIVE_INFINITY]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_4700
     * @tc.name testUint16ArraySetPart2047
     * @tc.desc Verify an array source truncates a fraction below the Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([65535.9]);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_4800
     * @tc.name testUint16ArraySetPart2048
     * @tc.desc Verify an array source truncates a negative fraction toward zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([-0.5]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_4900
     * @tc.name testUint16ArraySetPart2049
     * @tc.desc Verify an array source copies mixed Uint16 boundary values in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([0, 65535, 32768, 1, 100]);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(65535);
      expect(arr[2]).assertEqual(32768);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_5000
     * @tc.name testUint16ArraySetPart2050
     * @tc.desc Verify an array source copies hexadecimal Uint16 boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([0xFFFF, 0x0, 0x8000]);
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_5100
     * @tc.name testUint16ArraySetPart2051
     * @tc.desc Verify an array source copies binary Uint16 boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([0b1111111111111111, 0b0, 0b1000000000000000]);
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_5200
     * @tc.name testUint16ArraySetPart2052
     * @tc.desc Verify a second array copy overwrites the full target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([10, 20, 30, 40, 50]);
      arr.set([0, 0, 0, 0, 0]);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_5300
     * @tc.name testUint16ArraySetPart2053
     * @tc.desc Verify an array source fills the target with Uint16 maximum values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([65535, 65535, 65535, 65535, 65535]);
      expect(arr[0]).assertEqual(65535);
      expect(arr[4]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_5400
     * @tc.name testUint16ArraySetPart2054
     * @tc.desc Verify an array source fills the target with an ascending sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([0, 1, 2, 3, 4]);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_5500
     * @tc.name testUint16ArraySetPart2055
     * @tc.desc Verify an array source longer than the target throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      try {
        arr.set([1, 2, 3, 4, 5, 6]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_5600
     * @tc.name testUint16ArraySetPart2056
     * @tc.desc Verify set [1,2,3] leaves trailing elements as 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([1, 2, 3]);
      expect(arr.join(',')).assertEqual('1,2,3,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_5700
     * @tc.name testUint16ArraySetPart2057
     * @tc.desc Verify a FixedArray source fills all target elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([100, 200, 300, 400, 500]);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
      expect(arr[3]).assertEqual(400);
      expect(arr[4]).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_5800
     * @tc.name testUint16ArraySetPart2058
     * @tc.desc Verify a later FixedArray copy preserves elements beyond its length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([1, 2, 3]);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      arr.set([4, 5]);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_5900
     * @tc.name testUint16ArraySetPart2059
     * @tc.desc Verify an array source converts wrapped and fractional values per element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set([65536, -1, 3.14]);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(65535);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_6000
     * @tc.name testUint16ArraySetPart2060
     * @tc.desc Verify copying an empty Uint16Array preserves zero-initialized elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_6100
     * @tc.name testUint16ArraySetPart2061
     * @tc.desc Verify a one-element Uint16Array source copies its value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([100]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_6200
     * @tc.name testUint16ArraySetPart2062
     * @tc.desc Verify a Uint16Array source copies three elements at offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([1, 2, 3]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_6300
     * @tc.name testUint16ArraySetPart2063
     * @tc.desc Verify a four-element Uint16Array source fills the target suffix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([1, 2, 3, 4]);
      arr.set(src, 4);
      expect(arr[4]).assertEqual(1);
      expect(arr[7]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_6400
     * @tc.name testUint16ArraySetPart2064
     * @tc.desc Verify a one-element Uint16Array source fits at the final index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([99]);
      arr.set(src, 7);
      expect(arr[7]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_6500
     * @tc.name testUint16ArraySetPart2065
     * @tc.desc Verify a nonempty Uint16Array source at offset equal to length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([1, 2]);
      try {
        arr.set(src, 8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_6600
     * @tc.name testUint16ArraySetPart2066
     * @tc.desc Verify a Uint16Array source at an offset beyond length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([1, 2]);
      try {
        arr.set(src, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_6700
     * @tc.name testUint16ArraySetPart2067
     * @tc.desc Verify a Uint16Array source at a negative offset throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([1, 2]);
      try {
        arr.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_6800
     * @tc.name testUint16ArraySetPart2068
     * @tc.desc Verify a Uint16Array source that exceeds the remaining capacity throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([1, 2]);
      try {
        arr.set(src, 7);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_6900
     * @tc.name testUint16ArraySetPart2069
     * @tc.desc Verify a Uint16Array source copies mixed boundary values in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([0, 65535, 32768]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(65535);
      expect(arr[2]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_7000
     * @tc.name testUint16ArraySetPart2070
     * @tc.desc Verify a Uint16Array source copies hexadecimal boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([0xFFFF, 0x0, 0x8000]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_7100
     * @tc.name testUint16ArraySetPart2071
     * @tc.desc Verify set Uint16Array at offset 0 writes elements and preserves boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([1, 2, 3]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_7200
     * @tc.name testUint16ArraySetPart2072
     * @tc.desc Verify a nonzero-offset Uint16Array copy preserves preceding elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([100, 200]);
      arr.set(src, 3);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_7300
     * @tc.name testUint16ArraySetPart2073
     * @tc.desc Verify a Uint16Array prefix copy preserves unfilled trailing elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([1, 2, 3]);
      arr.set(src, 0);
      expect(arr[3]).assertEqual(0);
      expect(arr[7]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_7400
     * @tc.name testUint16ArraySetPart2074
     * @tc.desc Verify a Uint16Array source copies three values at offset two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([10, 20, 30]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_7500
     * @tc.name testUint16ArraySetPart2075
     * @tc.desc Verify separate Uint16Array copies populate disjoint target ranges
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src1: Uint16Array = Uint16Array.from([1, 2, 3]);
      let src2: Uint16Array = Uint16Array.from([4, 5]);
      arr.set(src1, 0);
      arr.set(src2, 5);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
      expect(arr[5]).assertEqual(4);
      expect(arr[6]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_7600
     * @tc.name testUint16ArraySetPart2076
     * @tc.desc Verify the same Uint16Array source can be copied at two offsets
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([99]);
      arr.set(src, 0);
      arr.set(src, 4);
      expect(arr[0]).assertEqual(99);
      expect(arr[4]).assertEqual(99);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_7700
     * @tc.name testUint16ArraySetPart2077
     * @tc.desc Verify a Uint16Array prefix copy preserves the existing suffix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set([10, 20, 30, 40, 50, 60, 70, 80]);
      let src: Uint16Array = Uint16Array.from([0, 0, 0]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_7800
     * @tc.name testUint16ArraySetPart2078
     * @tc.desc Verify a Uint16Array source copies repeated maximum values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      let src: Uint16Array = Uint16Array.from([65535, 65535, 65535]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(65535);
      expect(arr[2]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_7900
     * @tc.name testUint16ArraySetPart2079
     * @tc.desc Verify scalar and array-source conversions apply Uint16 rules per element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.set(0, 65536);
      arr.set(1, -1);
      arr.set(2, 3.14);
      arr.set([Number.NaN, Number.POSITIVE_INFINITY], 3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(65535);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_8000
     * @tc.name testUint16ArraySetPart2080
     * @tc.desc Verify scalar set truncates negative 0.9 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, -0.9);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_8100
     * @tc.name testUint16ArraySetPart2081
     * @tc.desc Verify scalar set retains seven after wrapping three Uint16 ranges
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 65536 * 3 + 7);
      expect(arr[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_PART2_8200
     * @tc.name testUint16ArraySetPart2082
     * @tc.desc Verify scalar set wraps hexadecimal 0x1FFFF to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySetPart2082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(8);
      arr.set(0, 0x1FFFF);
      expect(arr[0]).assertEqual(65535);
    });

  });
}
