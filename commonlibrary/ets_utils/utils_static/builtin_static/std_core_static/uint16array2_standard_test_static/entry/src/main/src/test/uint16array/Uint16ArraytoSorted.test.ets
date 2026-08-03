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

export default function uint16ArrayToSortedTest(): void {
  describe('Uint16ArrayToSortedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_0100
     * @tc.name testUint16ArrayToSorted001
      * @tc.desc Verify toSorted returns ascending values without mutating the source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(3, 1, 2);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_0200
     * @tc.name testUint16ArrayToSorted002
      * @tc.desc Verify a sorted result remains unchanged after source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(4, 1, 3);
      const result = arr.toSorted();
      arr[0] = 99;
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_0300
     * @tc.name testUint16ArrayToSorted003
      * @tc.desc Verify toSorted produces ascending comma-separated content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(5, 2, 4);
      const result = arr.toSorted();
      expect(result.join(',')).assertEqual('2,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_0400
     * @tc.name testUint16ArrayToSorted004
      * @tc.desc Verify toSorted leaves the original order intact
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(6, 1, 5);
      const backup = arr.join(",");
      const result: Uint16Array = arr.toSorted();
      expect(result.join(",")).assertEqual("1,5,6");
      expect(arr.join(",")).assertEqual(backup);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_0500
     * @tc.name testUint16ArrayToSorted005
      * @tc.desc Verify toSorted creates a distinct empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array();
      const result = arr.toSorted();
      expect(result.length).assertEqual(0);
      expect(result).not().assertEqual(arr);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_0600
     * @tc.name testUint16ArrayToSorted006
      * @tc.desc Verify toSorted creates a distinct single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(42);
      const result: Uint16Array = arr.toSorted();
      expect(result).not().assertEqual(arr);
      expect(result.join(',')).assertEqual('42');
      expect(arr.join(',')).assertEqual('42');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_0700
     * @tc.name testUint16ArrayToSorted007
      * @tc.desc Verify toSorted numerically orders five unsorted values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(5, 3, 1, 4, 2);
      const result: Uint16Array = arr.toSorted();
      expect(result.join(",")).assertEqual("1,2,3,4,5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_0800
     * @tc.name testUint16ArrayToSorted008
      * @tc.desc Verify toSorted preserves the empty length of a zero-length array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      const result = arr.toSorted();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_0900
     * @tc.name testUint16ArrayToSorted009
      * @tc.desc Verify toSorted handles an empty array created by Uint16Array.of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of();
      const result = arr.toSorted();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_1000
     * @tc.name testUint16ArrayToSorted010
      * @tc.desc Verify toSorted returns empty content for an empty subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2, 3);
      const empty = arr.subarray(0, 0);
      const result = empty.toSorted();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_1100
     * @tc.name testUint16ArrayToSorted011
      * @tc.desc Verify toSorted handles an empty array created by Uint16Array.from
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.from([]);
      const result = arr.toSorted();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_1200
     * @tc.name testUint16ArrayToSorted012
      * @tc.desc Verify toSorted handles an empty array constructed from a literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      const result = arr.toSorted();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_1300
     * @tc.name testUint16ArrayToSorted013
      * @tc.desc Verify toSorted preserves a single zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_1400
     * @tc.name testUint16ArrayToSorted014
      * @tc.desc Verify toSorted preserves the maximum Uint16 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_1500
     * @tc.name testUint16ArrayToSorted015
      * @tc.desc Verify toSorted preserves the Uint16 midpoint value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(32768);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_1600
     * @tc.name testUint16ArrayToSorted016
      * @tc.desc Verify toSorted preserves a single ordinary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(100);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_1700
     * @tc.name testUint16ArrayToSorted017
      * @tc.desc Verify toSorted exposes overflow conversion of 65536 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65536);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_1800
     * @tc.name testUint16ArrayToSorted018
      * @tc.desc Verify toSorted exposes negative-one conversion to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(-1);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_1900
     * @tc.name testUint16ArrayToSorted019
      * @tc.desc Verify toSorted preserves truncation of a fractional value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(3.14);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_2000
     * @tc.name testUint16ArrayToSorted020
      * @tc.desc Verify toSorted truncates a fractional maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535.9);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_2100
     * @tc.name testUint16ArrayToSorted021
      * @tc.desc Verify toSorted preserves the decimal value of a hexadecimal literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0xFF);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_2200
     * @tc.name testUint16ArrayToSorted022
      * @tc.desc Verify toSorted preserves the decimal value of an octal literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0o7777);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(4095);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_2300
     * @tc.name testUint16ArrayToSorted023
      * @tc.desc Verify toSorted preserves the decimal value of a binary literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0b10101010);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(170);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_2400
     * @tc.name testUint16ArrayToSorted024
      * @tc.desc Verify toSorted retains an already ascending four-value sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 1, 2, 3);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_2500
     * @tc.name testUint16ArrayToSorted025
      * @tc.desc Verify toSorted retains ascending minimum midpoint and maximum values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 32768, 65535);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,32768,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_2600
     * @tc.name testUint16ArrayToSorted026
      * @tc.desc Verify toSorted retains an ascending boundary pair
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 65535);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_2700
     * @tc.name testUint16ArrayToSorted027
      * @tc.desc Verify toSorted retains an ascending three-value range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(100, 200, 300);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("100,200,300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_2800
     * @tc.name testUint16ArrayToSorted028
      * @tc.desc Verify toSorted converts and retains ascending hexadecimal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0x0, 0x80, 0xFF);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,128,255");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_2900
     * @tc.name testUint16ArrayToSorted029
      * @tc.desc Verify toSorted retains repeated minimum values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 0, 0);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_3000
     * @tc.name testUint16ArrayToSorted030
      * @tc.desc Verify toSorted retains repeated ordinary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 1, 1);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("1,1,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_3100
     * @tc.name testUint16ArrayToSorted031
      * @tc.desc Verify toSorted retains repeated maximum values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535, 65535, 65535);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("65535,65535,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_3200
     * @tc.name testUint16ArrayToSorted032
      * @tc.desc Verify toSorted reorders a descending four-value sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(3, 2, 1, 0);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_3300
     * @tc.name testUint16ArrayToSorted033
      * @tc.desc Verify toSorted orders descending Uint16 boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535, 32768, 0);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,32768,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_3400
     * @tc.name testUint16ArrayToSorted034
      * @tc.desc Verify toSorted reorders a descending boundary pair
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535, 0);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_3500
     * @tc.name testUint16ArrayToSorted035
      * @tc.desc Verify toSorted reorders a descending three-value range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(300, 200, 100);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("100,200,300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_3600
     * @tc.name testUint16ArrayToSorted036
      * @tc.desc Verify toSorted orders descending hexadecimal values numerically
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0xFF, 0x80, 0x0);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,128,255");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_3700
     * @tc.name testUint16ArrayToSorted037
      * @tc.desc Verify toSorted orders adjacent values near the Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535, 65534, 65533);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("65533,65534,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_3800
     * @tc.name testUint16ArrayToSorted038
      * @tc.desc Verify toSorted orders a long descending nonuniform sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10000, 5000, 1000, 500, 100, 50, 10, 5, 1);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("1,5,10,50,100,500,1000,5000,10000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_3900
     * @tc.name testUint16ArrayToSorted039
      * @tc.desc Verify toSorted orders a mixed Uint16 boundary permutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535, 0, 32768);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,32768,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_4000
     * @tc.name testUint16ArrayToSorted040
      * @tc.desc Verify toSorted uses numeric rather than lexicographic ordering
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(100, 1, 1000, 10, 10000);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("1,10,100,1000,10000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_4100
     * @tc.name testUint16ArrayToSorted041
      * @tc.desc Verify toSorted groups duplicate minimum and maximum values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 65535, 0, 65535);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,0,65535,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_4200
     * @tc.name testUint16ArrayToSorted042
      * @tc.desc Verify toSorted orders widely spaced five-digit values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(50000, 10000, 30000, 20000, 40000);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("10000,20000,30000,40000,50000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_4300
     * @tc.name testUint16ArrayToSorted043
      * @tc.desc Verify toSorted orders an irregular seven-value sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(42, 7, 15, 23, 8, 16, 4);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("4,7,8,15,16,23,42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_4400
     * @tc.name testUint16ArrayToSorted044
      * @tc.desc Verify toSorted orders mixed hexadecimal Uint16 values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0xFFFF, 0x0, 0xABCD, 0x1234);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,4660,43981,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_4500
     * @tc.name testUint16ArrayToSorted045
      * @tc.desc Verify toSorted groups repeated ascending value runs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2, 3, 1, 2, 3);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("1,1,2,2,3,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_4600
     * @tc.name testUint16ArrayToSorted046
      * @tc.desc Verify toSorted orders every decimal digit from a permutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(5, 3, 8, 1, 9, 2, 7, 4, 6, 0);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,1,2,3,4,5,6,7,8,9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_4700
     * @tc.name testUint16ArrayToSorted047
      * @tc.desc Verify toSorted interleaves low and high boundary ranges numerically
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 65535, 2, 65534, 3, 65533);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("1,2,3,65533,65534,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_4800
     * @tc.name testUint16ArrayToSorted048
      * @tc.desc Verify toSorted retains four identical values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(5, 5, 5, 5);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("5,5,5,5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_4900
     * @tc.name testUint16ArrayToSorted049
      * @tc.desc Verify toSorted retains an already grouped duplicate sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 1, 2, 2);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("1,1,2,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_5000
     * @tc.name testUint16ArrayToSorted050
      * @tc.desc Verify toSorted groups alternating duplicate values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(3, 1, 3, 1, 3);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("1,1,3,3,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_5100
     * @tc.name testUint16ArrayToSorted051
      * @tc.desc Verify toSorted retains grouped duplicate boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 0, 65535, 65535);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,0,65535,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_5200
     * @tc.name testUint16ArrayToSorted052
      * @tc.desc Verify toSorted positions duplicate midpoint values between boundaries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(32768, 32768, 0, 65535);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,32768,32768,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_5300
     * @tc.name testUint16ArrayToSorted053
      * @tc.desc Verify toSorted retains a fully ascending boundary triplet
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 1, 65535);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,1,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_5400
     * @tc.name testUint16ArrayToSorted054
      * @tc.desc Verify toSorted moves a maximum-first triplet into ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535, 0, 1);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,1,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_5500
     * @tc.name testUint16ArrayToSorted055
      * @tc.desc Verify toSorted orders a rotated boundary triplet
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(32768, 65535, 0);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,32768,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_5600
     * @tc.name testUint16ArrayToSorted056
      * @tc.desc Verify toSorted retains ascending values around the Uint16 midpoint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0x7FFF, 0x8000, 0xFFFF);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("32767,32768,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_5700
     * @tc.name testUint16ArrayToSorted057
      * @tc.desc Verify toSorted orders values spanning both sides of the midpoint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 0xFFFF, 0x8000, 0x7FFF, 0);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("0,1,32767,32768,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_5800
     * @tc.name testUint16ArrayToSorted058
      * @tc.desc Verify toSorted orders values from a literal-backed typed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_5900
     * @tc.name testUint16ArrayToSorted059
      * @tc.desc Verify toSorted orders values copied from another Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint16Array.of(5, 2, 4, 1, 3);
      const arr = new Uint16Array(src);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("1,2,3,4,5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_6000
     * @tc.name testUint16ArrayToSorted060
      * @tc.desc Verify toSorted orders values created with Uint16Array.from
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.from([9, 5, 7, 1, 3]);
      const result = arr.toSorted();
      expect(result.join(",")).assertEqual("1,3,5,7,9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_6100
     * @tc.name testUint16ArrayToSorted061
      * @tc.desc Verify toSorted orders values produced by map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2, 3);
      const mapped = arr.map((v: number): number => {
        return v * 10;
      });
      const result = mapped.toSorted();
      expect(result.join(",")).assertEqual("10,20,30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_6200
     * @tc.name testUint16ArrayToSorted062
      * @tc.desc Verify toSorted orders only the selected subarray range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(9, 5, 7, 1, 3);
      const sub = arr.subarray(1, 4);
      const result = sub.toSorted();
      expect(result.join(",")).assertEqual("1,5,7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_6300
     * @tc.name testUint16ArrayToSorted063
      * @tc.desc Verify toSorted preserves all values in an ascending hundred-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      const result = arr.toSorted();
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(0);
      expect(result[99]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_6400
     * @tc.name testUint16ArrayToSorted064
      * @tc.desc Verify toSorted reverses a descending hundred-element array without mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = 99 - i;
      }
      const result = arr.toSorted();
      expect(result).not().assertEqual(arr);
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(0);
      expect(result[50]).assertEqual(50);
      expect(result[99]).assertEqual(99);
      expect(arr[0]).assertEqual(99);
      expect(arr[99]).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_6500
     * @tc.name testUint16ArrayToSorted065
      * @tc.desc Verify toSorted preserves repeated values in a hundred-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = 42;
      }
      const result = arr.toSorted();
      expect(result).not().assertEqual(arr);
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(42);
      expect(result[50]).assertEqual(42);
      expect(result[99]).assertEqual(42);
      expect(arr[0]).assertEqual(42);
      expect(arr[99]).assertEqual(42);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_6600
     * @tc.name testUint16ArrayToSorted066
     * @tc.desc Verify toSorted returns complete ascending numeric content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(40, 2, 300, 11);
      const result: Uint16Array = source.toSorted();
      expect(result.join(',')).assertEqual('2,11,40,300');
      expect(source.join(',')).assertEqual('40,2,300,11');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_6700
     * @tc.name testUint16ArrayToSorted067
     * @tc.desc Verify toSorted performs numeric ascending order without arguments
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(4, 1, 3, 2);
      const result: Uint16Array = source.toSorted();
      expect(result.join(',')).assertEqual('1,2,3,4');
      expect(source.join(',')).assertEqual('4,1,3,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_6800
     * @tc.name testUint16ArrayToSorted068
     * @tc.desc Verify toSorted keeps duplicate and boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(65535, 0, 32768, 0, 65535);
      const result: Uint16Array = source.toSorted();
      expect(result.join(',')).assertEqual('0,0,32768,65535,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_6900
     * @tc.name testUint16ArrayToSorted069
     * @tc.desc Verify toSorted returns an empty independent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = new Uint16Array();
      const result: Uint16Array = source.toSorted();
      expect(source.length).assertEqual(0);
      expect(result.length).assertEqual(0);
      expect(result.buffer).not().assertEqual(source.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_7000
     * @tc.name testUint16ArrayToSorted070
     * @tc.desc Verify toSorted returns a separate single-element result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(42);
      const result: Uint16Array = source.toSorted();
      result[0] = 9;
      expect(result.join(',')).assertEqual('9');
      expect(source.join(',')).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_7100
     * @tc.name testUint16ArrayToSorted071
     * @tc.desc Verify toSorted orders converted Uint16 values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = new Uint16Array([-1, 65536, 65537, 32768]);
      const result: Uint16Array = source.toSorted();
      expect(result.join(',')).assertEqual('0,1,32768,65535');
      expect(source.join(',')).assertEqual('65535,0,1,32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_7200
     * @tc.name testUint16ArrayToSorted072
     * @tc.desc Verify toSorted orders an even and odd value mixture numerically
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(7, 4, 3, 8, 5, 2);
      const result: Uint16Array = source.toSorted();
      expect(result.join(',')).assertEqual('2,3,4,5,7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_7300
     * @tc.name testUint16ArrayToSorted073
     * @tc.desc Verify toSorted result mutation does not affect source content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(3, 1, 2);
      const result: Uint16Array = source.toSorted();
      result[1] = 99;
      expect(result.join(',')).assertEqual('1,99,3');
      expect(source.join(',')).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_7400
     * @tc.name testUint16ArrayToSorted074
     * @tc.desc Verify toSorted source mutation does not affect the result snapshot
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(9, 7, 8);
      const result: Uint16Array = source.toSorted();
      source[0] = 1;
      expect(result.join(',')).assertEqual('7,8,9');
      expect(source.join(',')).assertEqual('1,7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_7500
     * @tc.name testUint16ArrayToSorted075
     * @tc.desc Verify toSorted sorts only values in a nonzero buffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      const full: Uint16Array = new Uint16Array(buffer);
      full.set(Uint16Array.of(90, 7, 3, 5, 80));
      const view: Uint16Array = new Uint16Array(buffer, 2, 3);
      const result: Uint16Array = view.toSorted();
      expect(result.join(',')).assertEqual('3,5,7');
      expect(full.join(',')).assertEqual('90,7,3,5,80');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_7600
     * @tc.name testUint16ArrayToSorted076
     * @tc.desc Verify toSorted returns a newly allocated buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(3, 2, 1);
      const result: Uint16Array = source.toSorted();
      expect(result.buffer).not().assertEqual(source.buffer);
      expect(result.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_7700
     * @tc.name testUint16ArrayToSorted077
     * @tc.desc Verify toSorted orders nonconsecutive values numerically
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(14, 3, 11, 8, 5);
      const result: Uint16Array = source.toSorted();
      expect(result.join(',')).assertEqual('3,5,8,11,14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSORTED_7800
     * @tc.name testUint16ArrayToSorted078
     * @tc.desc Verify repeated toSorted calls return equivalent independent snapshots
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToSorted078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(3, 2, 1);
      const first: Uint16Array = source.toSorted();
      const second: Uint16Array = source.toSorted();
      first[0] = 99;
      expect(first.join(',')).assertEqual('99,2,3');
      expect(second.join(',')).assertEqual('1,2,3');
      expect(source.join(',')).assertEqual('3,2,1');
    });

  });
}
