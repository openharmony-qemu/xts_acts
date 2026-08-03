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

export default function uint16ArraySubarrayPart2Test(): void {
  describe('Uint16ArraySubarrayPart2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_0100
     * @tc.name testUint16ArraySubarrayPart2001
      * @tc.desc Verify subarray without bounds exposes all source values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray();
      expect(sub.length).assertEqual(5);
      expect(sub[0]).assertEqual(10);
      expect(sub[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_0200
     * @tc.name testUint16ArraySubarrayPart2002
     * @tc.desc Verify subarray(0) begin=0 Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0);
      expect(sub.length).assertEqual(5);
      expect(sub[0]).assertEqual(10);
      expect(sub[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_0300
     * @tc.name testUint16ArraySubarrayPart2003
     * @tc.desc Verify subarray(0, 5) Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 5);
      expect(sub[0]).assertEqual(10);
      expect(sub[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_0400
     * @tc.name testUint16ArraySubarrayPart2004
     * @tc.desc Verify subarray(3, 3) begin=end Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(3, 3);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_0500
     * @tc.name testUint16ArraySubarrayPart2005
     * @tc.desc Verify subarray(0, 10) end Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 10);
      expect(sub[0]).assertEqual(10);
      expect(sub[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_0600
     * @tc.name testUint16ArraySubarrayPart2006
     * @tc.desc Verify subarray(-3) begin Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-3);
      expect(sub[0]).assertEqual(30);
      expect(sub[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_0700
     * @tc.name testUint16ArraySubarrayPart2007
     * @tc.desc Verify subarray(-1) Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-1);
      expect(sub[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_0800
     * @tc.name testUint16ArraySubarrayPart2008
     * @tc.desc Verify subarray(0, -1) end Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, -1);
      expect(sub[0]).assertEqual(10);
      expect(sub[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_0900
     * @tc.name testUint16ArraySubarrayPart2009
     * @tc.desc Verify subarray(-4, -1) Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-4, -1);
      expect(sub[0]).assertEqual(20);
      expect(sub[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_1000
     * @tc.name testUint16ArraySubarrayPart2010
     * @tc.desc Verify subarray(-10) begin Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-10);
      expect(sub[0]).assertEqual(10);
      expect(sub[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_1100
     * @tc.name testUint16ArraySubarrayPart2011
     * @tc.desc Verify subarray(-1, -3) Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-1, -3);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_1200
     * @tc.name testUint16ArraySubarrayPart2012
     * @tc.desc Verify subarray(1) begin=1 Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1);
      expect(sub[0]).assertEqual(20);
      expect(sub[3]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_1300
     * @tc.name testUint16ArraySubarrayPart2013
     * @tc.desc Verify subarray(0, 3) Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(49152, 7, 32001, 88, 605, 17003);
      let sub: Uint16Array = arr.subarray(0, 3);
      expect(sub[0]).assertEqual(49152);
      expect(sub[2]).assertEqual(32001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_1400
     * @tc.name testUint16ArraySubarrayPart2014
      * @tc.desc Verify a newly constructed empty array yields an empty full subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
      let sub: Uint16Array = arr.subarray();
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_1500
     * @tc.name testUint16ArraySubarrayPart2015
     * @tc.desc Verify subarray() object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(901, 65534, 42, 17000, 3, 808);
      let sub: Uint16Array = arr.subarray();
      expect(sub[0]).assertEqual(901);
      expect(sub[5]).assertEqual(808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_1600
     * @tc.name testUint16ArraySubarrayPart2016
     * @tc.desc Verify subarray(1, 4) object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(60001, 14, 4095, 222, 50000, 71);
      let sub: Uint16Array = arr.subarray(1, 4);
      expect(sub[0]).assertEqual(14);
      expect(sub[2]).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_1700
     * @tc.name testUint16ArraySubarrayPart2017
      * @tc.desc Verify subarray range one through four preserves all selected values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
      expect(sub[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_1800
     * @tc.name testUint16ArraySubarrayPart2018
     * @tc.desc Verify subarray(0, 1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 1);
      expect(sub[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_1900
     * @tc.name testUint16ArraySubarrayPart2019
     * @tc.desc Verify subarray(3, 5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(3, 5);
      expect(sub[0]).assertEqual(40);
      expect(sub[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_2000
     * @tc.name testUint16ArraySubarrayPart2020
      * @tc.desc Verify a negative begin selects the final three source values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-3);
      expect(sub[0]).assertEqual(30);
      expect(sub[1]).assertEqual(40);
      expect(sub[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_2100
     * @tc.name testUint16ArraySubarrayPart2021
     * @tc.desc Verify subarray(-4, -1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-4, -1);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
      expect(sub[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_2200
     * @tc.name testUint16ArraySubarrayPart2022
     * @tc.desc Verify subarray(0, 3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 3);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_2300
     * @tc.name testUint16ArraySubarrayPart2023
     * @tc.desc Verify subarray(1, 3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300);
      let sub: Uint16Array = arr.subarray(1, 3);
      expect(sub[0]).assertEqual(200);
      expect(sub[1]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_2400
     * @tc.name testUint16ArraySubarrayPart2024
     * @tc.desc Verify subarray(0, 3) max/min
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0, 32768);
      let sub: Uint16Array = arr.subarray(0, 3);
      expect(sub[0]).assertEqual(65535);
      expect(sub[1]).assertEqual(0);
      expect(sub[2]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_2500
     * @tc.name testUint16ArraySubarrayPart2025
      * @tc.desc Verify subarray with zero begin exposes a single value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(42);
      let sub: Uint16Array = arr.subarray(0);
      expect(sub[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_2600
     * @tc.name testUint16ArraySubarrayPart2026
     * @tc.desc Verify subarray(0, 2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(7, 7, 7, 7);
      let sub: Uint16Array = arr.subarray(0, 2);
      expect(sub[0]).assertEqual(7);
      expect(sub[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_2700
     * @tc.name testUint16ArraySubarrayPart2027
     * @tc.desc Verify subarray(0, 5) length 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 5);
      expect(sub.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_2800
     * @tc.name testUint16ArraySubarrayPart2028
     * @tc.desc Verify subarray(1, 4) length 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_2900
     * @tc.name testUint16ArraySubarrayPart2029
     * @tc.desc Verify subarray(-3) length 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-3);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_3000
     * @tc.name testUint16ArraySubarrayPart2030
     * @tc.desc Verify subarray(-1) length 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-1);
      expect(sub.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_3100
     * @tc.name testUint16ArraySubarrayPart2031
     * @tc.desc Verify subarray(0, -1) end length 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, -1);
      expect(sub.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_3200
     * @tc.name testUint16ArraySubarrayPart2032
     * @tc.desc Verify subarray(-4, -1) length 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-4, -1);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_3300
     * @tc.name testUint16ArraySubarrayPart2033
     * @tc.desc Verify subarray(1) begin=1 length 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1);
      expect(sub.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_3400
     * @tc.name testUint16ArraySubarrayPart2034
     * @tc.desc Verify subarray(0, 2) length 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300);
      let sub: Uint16Array = arr.subarray(0, 2);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_3500
     * @tc.name testUint16ArraySubarrayPart2035
     * @tc.desc Verify subarray(2, 6) length 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5, 6, 7, 8);
      let sub: Uint16Array = arr.subarray(2, 6);
      expect(sub.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_3600
     * @tc.name testUint16ArraySubarrayPart2036
     * @tc.desc Verify subarray(0) length 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(42);
      let sub: Uint16Array = arr.subarray(0);
      expect(sub.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_3700
     * @tc.name testUint16ArraySubarrayPart2037
     * @tc.desc Verify subarray(1, 3) length 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0, 32768);
      let sub: Uint16Array = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_3800
     * @tc.name testUint16ArraySubarrayPart2038
     * @tc.desc Verify subarray() byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray();
      expect(sub.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_3900
     * @tc.name testUint16ArraySubarrayPart2039
     * @tc.desc Verify subarray(0, 5) byteLength 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 5);
      expect(sub.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_4000
     * @tc.name testUint16ArraySubarrayPart2040
     * @tc.desc Verify subarray(1, 4) byteLength 6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      expect(sub.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_4100
     * @tc.name testUint16ArraySubarrayPart2041
     * @tc.desc Verify subarray(-3) byteLength 6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-3);
      expect(sub.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_4200
     * @tc.name testUint16ArraySubarrayPart2042
     * @tc.desc Verify subarray(-1) byteLength 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-1);
      expect(sub.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_4300
     * @tc.name testUint16ArraySubarrayPart2043
     * @tc.desc Verify subarray(0, -1) end byteLength 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, -1);
      expect(sub.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_4400
     * @tc.name testUint16ArraySubarrayPart2044
     * @tc.desc Verify subarray(0, 3) byteLength 6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300);
      let sub: Uint16Array = arr.subarray(0, 3);
      expect(sub.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_4500
     * @tc.name testUint16ArraySubarrayPart2045
     * @tc.desc Verify subarray(2, 6) byteLength 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5, 6, 7, 8);
      let sub: Uint16Array = arr.subarray(2, 6);
      expect(sub.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_4600
     * @tc.name testUint16ArraySubarrayPart2046
     * @tc.desc Verify subarray() byteOffset 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray();
      expect(sub.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_4700
     * @tc.name testUint16ArraySubarrayPart2047
     * @tc.desc Verify subarray(0, 5) byteOffset 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 5);
      expect(sub.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_4800
     * @tc.name testUint16ArraySubarrayPart2048
     * @tc.desc Verify subarray(1, 4) 1 byteOffset 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      expect(sub.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_4900
     * @tc.name testUint16ArraySubarrayPart2049
     * @tc.desc Verify subarray(2, 5) 2 byteOffset 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(2, 5);
      expect(sub.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_5000
     * @tc.name testUint16ArraySubarrayPart2050
     * @tc.desc Verify subarray(3, 3) 3 byteOffset 6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(3, 3);
      expect(sub.byteOffset).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_5100
     * @tc.name testUint16ArraySubarrayPart2051
     * @tc.desc Verify subarray(-3) 3 byteOffset 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-3);
      expect(sub.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_5200
     * @tc.name testUint16ArraySubarrayPart2052
     * @tc.desc Verify subarray(-1) byteOffset 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-1);
      expect(sub.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_5300
     * @tc.name testUint16ArraySubarrayPart2053
     * @tc.desc Verify subarray(0, -1) byteOffset 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, -1);
      expect(sub.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_5400
     * @tc.name testUint16ArraySubarrayPart2054
     * @tc.desc Verify subarray(-4, -1) byteOffset 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-4, -1);
      expect(sub.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_5500
     * @tc.name testUint16ArraySubarrayPart2055
      * @tc.desc Verify subarray exposes length offset buffer sharing and bidirectional writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub.join(',')).assertEqual('20,30,40');
      expect(sub.byteOffset).assertEqual(2);
      expect(sub.buffer).assertEqual(arr.buffer);
      sub[0] = 99;
      expect(arr[1]).assertEqual(99);
      arr[2] = 88;
      expect(sub[1]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_5600
     * @tc.name testUint16ArraySubarrayPart2056
      * @tc.desc Verify a negative-begin subarray exposes shared tail mutations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-3);
      expect(sub.length).assertEqual(3);
      expect(sub.join(',')).assertEqual('30,40,50');
      expect(sub.buffer).assertEqual(arr.buffer);
      sub[0] = 77;
      expect(arr[2]).assertEqual(77);
      arr[3] = 66;
      expect(sub[1]).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_5700
     * @tc.name testUint16ArraySubarrayPart2057
      * @tc.desc Verify an equal zero range returns an empty shared view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 0);
      expect(sub.length).assertEqual(0);
      expect(sub.byteOffset).assertEqual(0);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_5800
     * @tc.name testUint16ArraySubarrayPart2058
     * @tc.desc Verify subarray(5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(5);
      expect(sub.length).assertEqual(0);
      expect(sub.byteOffset).assertEqual(10);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_5900
     * @tc.name testUint16ArraySubarrayPart2059
     * @tc.desc Verify subarray(4, 2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(4, 2);
      expect(sub.length).assertEqual(0);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_6000
     * @tc.name testUint16ArraySubarrayPart2060
     * @tc.desc Verify subarray(0, 10) end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 10);
      expect(sub.length).assertEqual(5);
      expect(sub.join(',')).assertEqual('10,20,30,40,50');
      expect(sub.buffer).assertEqual(arr.buffer);
      sub[0] = 99;
      expect(arr[0]).assertEqual(99);
      arr[4] = 88;
      expect(sub[4]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_6100
     * @tc.name testUint16ArraySubarrayPart2061
      * @tc.desc Verify separated subarrays share the source buffer and propagate writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let s1: Uint16Array = arr.subarray(0, 2);
      let s2: Uint16Array = arr.subarray(3, 5);
      expect(s1.join(',')).assertEqual('10,20');
      expect(s2.join(',')).assertEqual('40,50');
      expect(s1.buffer).assertEqual(arr.buffer);
      expect(s2.buffer).assertEqual(arr.buffer);
      s1[0] = 99;
      expect(arr[0]).assertEqual(99);
      arr[4] = 88;
      expect(s2[1]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_6200
     * @tc.name testUint16ArraySubarrayPart2062
      * @tc.desc Verify a full subarray retains the source buffer reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray();
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_6300
     * @tc.name testUint16ArraySubarrayPart2063
     * @tc.desc Verify subarray(1, 4) buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_6400
     * @tc.name testUint16ArraySubarrayPart2064
      * @tc.desc Verify a ranged subarray write propagates to the source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      sub[0] = 99;
      expect(arr[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_6500
     * @tc.name testUint16ArraySubarrayPart2065
      * @tc.desc Verify a source write propagates to a ranged subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      arr[2] = 88;
      expect(sub[1]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_6600
     * @tc.name testUint16ArraySubarrayPart2066
      * @tc.desc Verify a prefix subarray write propagates to the source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 2);
      sub[1] = 77;
      expect(arr[1]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_6700
     * @tc.name testUint16ArraySubarrayPart2067
     * @tc.desc Verify out-of-range source mutation does not affect subarray values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 2);
      arr[4] = 66;
      expect(sub[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_6800
     * @tc.name testUint16ArraySubarrayPart2068
     * @tc.desc Verify overlapping subarrays share mutations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let s1: Uint16Array = arr.subarray(0, 3);
      let s2: Uint16Array = arr.subarray(1, 4);
      s1[2] = 55;
      expect(s2[1]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_6900
     * @tc.name testUint16ArraySubarrayPart2069
     * @tc.desc Verify nested subarray mutation propagates to source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub1: Uint16Array = arr.subarray(0, 4);
      let sub2: Uint16Array = sub1.subarray(1, 3);
      sub2[0] = 44;
      expect(arr[1]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_7000
     * @tc.name testUint16ArraySubarrayPart2070
     * @tc.desc Verify nested subarray shares buffer with bidirectional mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub1: Uint16Array = arr.subarray(0, 4);
      let sub2: Uint16Array = sub1.subarray(1, 3);
      expect(sub2.buffer).assertEqual(arr.buffer);
      sub2[0] = 44;
      expect(arr[1]).assertEqual(44);
      arr[2] = 55;
      expect(sub2[1]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_7100
     * @tc.name testUint16ArraySubarrayPart2071
     * @tc.desc Verify negative-begin subarray mutation propagates to source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-3);
      sub[0] = 33;
      expect(arr[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_7200
     * @tc.name testUint16ArraySubarrayPart2072
     * @tc.desc Verify empty reversed-range subarray retains source buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(4, 2);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_7300
     * @tc.name testUint16ArraySubarrayPart2073
     * @tc.desc Verify empty zero-range subarray retains source buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 0);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_7400
     * @tc.name testUint16ArraySubarrayPart2074
     * @tc.desc Verify subarray buffer sharing and mutation propagation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray();
      expect(sub.buffer).assertEqual(arr.buffer);
      sub[0] = 99;
      expect(arr[0]).assertEqual(99);
      arr[4] = 88;
      expect(sub[4]).assertEqual(88);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_7500
     * @tc.name testUint16ArraySubarrayPart2075
     * @tc.desc Verify subarray clamps a begin below negative length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
       const r: Uint16Array = a.subarray(-99, 2);
      expect(r.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_7600
     * @tc.name testUint16ArraySubarrayPart2076
     * @tc.desc Verify subarray clamps an end above length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
       const r: Uint16Array = a.subarray(2, 99);
      expect(r.join(',')).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_7700
     * @tc.name testUint16ArraySubarrayPart2077
     * @tc.desc Verify subarray returns empty when begin equals end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3);
       const r: Uint16Array = a.subarray(1, 1);
      expect(r.join(',')).assertEqual('');
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_7800
     * @tc.name testUint16ArraySubarrayPart2078
     * @tc.desc Verify subarray applies both negative bounds relative to length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
       const r: Uint16Array = a.subarray(-4, -1);
      expect(r.join(',')).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_7900
     * @tc.name testUint16ArraySubarrayPart2079
     * @tc.desc Verify subarray handles a range on a nonzero parent view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const b: ArrayBuffer = new ArrayBuffer(14);
       const all: Uint16Array = new Uint16Array(b);
       all.set(Uint16Array.of(9, 1, 2, 3, 4, 5, 8));
       const v: Uint16Array = new Uint16Array(b, 2, 5);
       const r: Uint16Array = v.subarray(1, 4);
      expect(r.join(',')).assertEqual('2,3,4');
      expect(r.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART2_8000
     * @tc.name testUint16ArraySubarrayPart2080
     * @tc.desc Verify subarray mutation relation matches its allocation contract
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(5, 6, 7, 8);
       const r: Uint16Array = a.subarray(1, 3);
       r[0] = 66;
      expect(a.join(',')).assertEqual('5,66,7,8');
      expect(r.join(',')).assertEqual('66,7');
    });

  });
};
