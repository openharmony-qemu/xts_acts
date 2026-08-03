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

export default function uint16ArrayoveralloneTest(): void {
  describe('Uint16Arrayoverallone', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_0100
     * @tc.name testUint16Arrayoverallone001
      * @tc.desc Creates an empty Uint16Array with zero length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_0200
     * @tc.name testUint16Arrayoverallone002
      * @tc.desc Creates a three-element Uint16Array from an integer length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_0300
     * @tc.name testUint16Arrayoverallone003
      * @tc.desc Creates a three-element Uint16Array from an integral number length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3.0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_0400
     * @tc.name testUint16Arrayoverallone004
      * @tc.desc Creates an empty Uint16Array from a zero integer length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_0500
     * @tc.name testUint16Arrayoverallone005
      * @tc.desc Converts a NaN constructor length to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(Number.NaN);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_0600
     * @tc.name testUint16Arrayoverallone006
      * @tc.desc Converts a negative floating-point source value to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-1.0];
      const arr = new Uint16Array(src);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_0700
     * @tc.name testUint16Arrayoverallone007
      * @tc.desc Wraps a floating-point source value of 65536 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [65536.0];
      const arr = new Uint16Array(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_0800
     * @tc.name testUint16Arrayoverallone008
      * @tc.desc Converts an infinite source value to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [Number.POSITIVE_INFINITY];
      const arr = new Uint16Array(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_0900
     * @tc.name testUint16Arrayoverallone009
      * @tc.desc Creates a buffer view with a zero byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint16Array(buf, 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_1000
     * @tc.name testUint16Arrayoverallone010
      * @tc.desc Converts an integral floating-point byte offset to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint16Array(buf, 0.0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_1100
     * @tc.name testUint16Arrayoverallone011
      * @tc.desc Truncates a fractional buffer byte offset to two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Uint16Array(buf, 2.5);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_1200
     * @tc.name testUint16Arrayoverallone012
      * @tc.desc Creates a zero-length buffer view with explicit length zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint16Array(buf, 0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_1300
     * @tc.name testUint16Arrayoverallone013
      * @tc.desc Creates five elements with Uint16Array.of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 1, 2, 3, 4);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_1400
     * @tc.name testUint16Arrayoverallone014
      * @tc.desc Creates two elements from an integer Set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(1);
      src.add(2);
      const arr = Uint16Array.from(src);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_1500
     * @tc.name testUint16Arrayoverallone015
      * @tc.desc Copies the length of a Uint16Array source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint16Array.of(1, 2);
      const arr = Uint16Array.from(src);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_1600
     * @tc.name testUint16Arrayoverallone016
      * @tc.desc Reads the first element with $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20, 30);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_1700
     * @tc.name testUint16Arrayoverallone017
      * @tc.desc Wraps negative one to 65535 when assigned with $_set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      arr.$_set(0, -1);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_1800
     * @tc.name testUint16Arrayoverallone018
      * @tc.desc Converts NaN to zero when assigned with $_set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      arr.$_set(0, Number.NaN);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_1900
     * @tc.name testUint16Arrayoverallone019
      * @tc.desc Converts infinity to zero when assigned with $_set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_2000
     * @tc.name testUint16Arrayoverallone020
      * @tc.desc Replaces the first element with the Uint16 maximum using with
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20);
      const result = arr.with(0, 65535);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_2100
     * @tc.name testUint16Arrayoverallone021
      * @tc.desc Wraps 65536 to zero in a with result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20);
      const result = arr.with(0, 65536);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_2200
     * @tc.name testUint16Arrayoverallone022
      * @tc.desc Accepts the hexadecimal Uint16 maximum in a with result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20);
      const result = arr.with(0, 0xFFFF);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_2300
     * @tc.name testUint16Arrayoverallone023
      * @tc.desc Assigns zero to an indexed element with set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      arr.set(0, 0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_2400
     * @tc.name testUint16Arrayoverallone024
      * @tc.desc Assigns the Uint16 maximum to an indexed element with set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      arr.set(0, 65535);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_2500
     * @tc.name testUint16Arrayoverallone025
      * @tc.desc Wraps 65536 to zero when assigned with indexed set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      arr.set(0, 65536);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_2600
     * @tc.name testUint16Arrayoverallone026
      * @tc.desc Assigns a hexadecimal Uint16 maximum with indexed set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      arr.set(0, 0xFFFF);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_2700
     * @tc.name testUint16Arrayoverallone027
      * @tc.desc Copies all source elements with the default set offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(2);
      const source = Uint16Array.of(10, 20);
      arr.set(source);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_2800
     * @tc.name testUint16Arrayoverallone028
      * @tc.desc Copies a source at explicit destination offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(2);
      const source = Uint16Array.of(10, 20);
      arr.set(source, 0);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_2900
     * @tc.name testUint16Arrayoverallone029
      * @tc.desc Copies a source beginning at destination offset one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      const source = Uint16Array.of(10, 20);
      arr.set(source, 1);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_3000
     * @tc.name testUint16Arrayoverallone030
      * @tc.desc Fills every element with the Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      arr.fill(65535);
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_3100
     * @tc.name testUint16Arrayoverallone031
      * @tc.desc Fills every element with negative one wrapped to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(2);
      arr.fill(-1);
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_3200
     * @tc.name testUint16Arrayoverallone032
      * @tc.desc Fills every element with the hexadecimal Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(2);
      arr.fill(0xFFFF);
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_3300
     * @tc.name testUint16Arrayoverallone033
      * @tc.desc Fills from index one while preserving the leading element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      arr.fill(5, 1);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_3400
     * @tc.name testUint16Arrayoverallone034
      * @tc.desc Finds a zero value with includes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 65535, 100);
      expect(arr.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_3500
     * @tc.name testUint16Arrayoverallone035
      * @tc.desc Finds a hexadecimal Uint16 maximum at a nonzero index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(7, 0xFFFF, 42);
      expect(arr.includes(0xFFFF)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_3600
     * @tc.name testUint16Arrayoverallone036
      * @tc.desc Returns the nonzero index of a zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(7, 0, 42);
      expect(arr.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_3700
     * @tc.name testUint16Arrayoverallone037
      * @tc.desc indexOf does not wrap search value -1 to 65535, returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 65535, 100);
      expect(arr.indexOf(-1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_3800
     * @tc.name testUint16Arrayoverallone038
      * @tc.desc indexOf does not wrap search value 65536 to 0, returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(9, 0, 42);
      expect(arr.indexOf(65536)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_3900
     * @tc.name testUint16Arrayoverallone039
      * @tc.desc lastIndexOf does not wrap search value 65536 to 0, returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(5, 0, 0);
      expect(arr.lastIndexOf(65536)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_4000
     * @tc.name testUint16Arrayoverallone040
      * @tc.desc Slices the first two elements using explicit bounds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(11, 22, 33);
      const result = arr.slice(0, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(11);
      expect(result[1]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_4100
     * @tc.name testUint16Arrayoverallone041
      * @tc.desc Creates a two-element subarray using explicit bounds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(9, 18, 27);
      const result = arr.subarray(0, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(9);
      expect(result[1]).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_4200
     * @tc.name testUint16Arrayoverallone042
      * @tc.desc Joins three elements with a comma separator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join(",");
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_4300
     * @tc.name testUint16Arrayoverallone043
      * @tc.desc Joins three elements with a vertical-bar separator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(4, 5, 6);
      const result = arr.join("|");
      expect(result).assertEqual("4|5|6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_4400
     * @tc.name testUint16Arrayoverallone044
      * @tc.desc Sorts elements in descending order with a custom comparator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 30, 20);
      arr.sort((a: number, b: number): int => a < b ? 1 : (a > b ? -1 : 0));
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_4500
     * @tc.name testUint16Arrayoverallone045
      * @tc.desc Reduces all elements to their sum from left to right
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.reduce((a: number, b: number): number => a + b);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_4600
     * @tc.name testUint16Arrayoverallone046
      * @tc.desc Reduces all elements to their sum from right to left
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(2, 3, 4);
      const result = arr.reduceRight((a: number, b: number): number => a + b);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_4700
     * @tc.name testUint16Arrayoverallone047
      * @tc.desc Adds elements right-to-left using an initial value of 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(4, 5, 6);
      const result = arr.reduceRight((a: number, b: number): number => a + b, 100);
      expect(result).assertEqual(115);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_4800
     * @tc.name testUint16Arrayoverallone048
      * @tc.desc Invokes forEach in order with value index and source arguments
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(3, 6, 9);
      let sum: number = 0;
      let indexes: int[] = [];
      let callbackArray: Uint16Array | undefined = undefined;
      arr.forEach((value: number, index: int, source: Uint16Array): void => {
        sum = sum + value;
        indexes.push(index);
        callbackArray = source;
      });
      expect(sum).assertEqual(18);
      expect(indexes.join(',')).assertEqual('0,1,2');
      expect(callbackArray).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_4900
     * @tc.name testUint16Arrayoverallone049
      * @tc.desc Maps each element by adding one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(4, 8, 12);
      const result = arr.map((value) => value + 1);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(9);
      expect(result[2]).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_5000
     * @tc.name testUint16Arrayoverallone050
      * @tc.desc Filters and preserves elements greater than ten
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(2, 12, 22);
      const result = arr.filter((value) => value > 10);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(12);
      expect(result[1]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_5100
     * @tc.name testUint16Arrayoverallone051
      * @tc.desc Finds the first element greater than ten
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 11, 21);
      const result = arr.find((value) => value > 10);
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_5200
     * @tc.name testUint16Arrayoverallone052
      * @tc.desc Finds the index of the first element greater than ten
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(4, 14, 24);
      const result = arr.findIndex((value) => value > 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_5300
     * @tc.name testUint16Arrayoverallone053
      * @tc.desc Reports true when at least one element exceeds ten
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(6, 16, 26);
      const result = arr.some((value) => value > 10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_5400
     * @tc.name testUint16Arrayoverallone054
      * @tc.desc Reports true when every element is positive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(3, 13, 23);
      const result = arr.every((value) => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_5500
     * @tc.name testUint16Arrayoverallone055
      * @tc.desc Iterates one entry for each array element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20);
      let count: number = 0;
      for (const entry of arr.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_5600
     * @tc.name testUint16Arrayoverallone056
      * @tc.desc Iterates numeric keys whose sum is three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(4, 8, 12);
      let sum: number = 0;
      for (const key of arr.keys()) {
        sum = sum + key;
      }
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_5700
     * @tc.name testUint16Arrayoverallone057
      * @tc.desc Iterates values whose sum is twelve
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(2, 4, 6);
      let sum: number = 0;
      for (const value of arr.values()) {
        sum = sum + value;
      }
      expect(sum).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_5800
     * @tc.name testUint16Arrayoverallone058
      * @tc.desc Iterates Uint16Array values with for-of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 3, 5);
      let sum: number = 0;
      for (const value of arr) {
        sum = sum + value;
      }
      expect(sum).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_5900
     * @tc.name testUint16Arrayoverallone059
      * @tc.desc Copies the element at index one to index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2, 3, 4);
      arr.copyWithin(0, 1, 2);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_6000
     * @tc.name testUint16Arrayoverallone060
      * @tc.desc Copies the trailing range to the beginning without an end bound
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(5, 10, 15, 20);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(15);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_6100
     * @tc.name testUint16Arrayoverallone061
      * @tc.desc Returns the original Uint16Array instance from valueOf
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(7, 14);
      const result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_6200
     * @tc.name testUint16Arrayoverallone062
      * @tc.desc Reverses three elements in place
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(4, 8, 12);
      arr.reverse();
      expect(arr[0]).assertEqual(12);
      expect(arr[1]).assertEqual(8);
      expect(arr[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_6300
     * @tc.name testUint16Arrayoverallone063
      * @tc.desc Creates a reversed copy without mutating the source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(2, 6, 10);
      const result = arr.toReversed();
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(6);
      expect(result[2]).assertEqual(2);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_6400
     * @tc.name testUint16Arrayoverallone064
      * @tc.desc Creates an ascending sorted copy without mutating the source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(30, 10, 20);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
      expect(arr[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_6500
     * @tc.name testUint16Arrayoverallone065
      * @tc.desc Constructs a two-element copy from a Uint16Array source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint16Array.of(10, 20);
      const arr = new Uint16Array(src);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_6600
     * @tc.name testUint16Arrayoverallone066
      * @tc.desc Creates a two-element view over an ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Uint16Array(buf, 0, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_6700
     * @tc.name testUint16Arrayoverallone067
      * @tc.desc Creates a Uint16Array with the maximum tested length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(65535);
      expect(arr.length).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_6800
     * @tc.name testUint16Arrayoverallone068
      * @tc.desc Accepts a hexadecimal length literal of 256
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0x100);
      expect(arr.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_6900
     * @tc.name testUint16Arrayoverallone069
      * @tc.desc Accepts a binary length literal of two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0b10);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_7000
     * @tc.name testUint16Arrayoverallone070
      * @tc.desc Accepts a scientific-notation length of 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1e2);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_7100
     * @tc.name testUint16Arrayoverallone071
      * @tc.desc Truncates a fractional constructor length to three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3.9);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_7200
     * @tc.name testUint16Arrayoverallone072
      * @tc.desc Preserves zero and 65535 from an integer array source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0, 65535];
      const arr = new Uint16Array(src);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_7300
     * @tc.name testUint16Arrayoverallone073
      * @tc.desc Wraps negative one from an integer array source to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [-1];
      const arr = new Uint16Array(src);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_7400
     * @tc.name testUint16Arrayoverallone074
      * @tc.desc Wraps 65536 from an integer array source to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [65536];
      const arr = new Uint16Array(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_7500
     * @tc.name testUint16Arrayoverallone075
      * @tc.desc Preserves a hexadecimal Uint16 maximum from an array source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0xFFFF];
      const arr = new Uint16Array(src);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_7600
     * @tc.name testUint16Arrayoverallone076
      * @tc.desc Preserves boundary values from a floating-point array source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0.0, 65535.0];
      const arr = new Uint16Array(src);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_7700
     * @tc.name testUint16Arrayoverallone077
      * @tc.desc Creates a buffer view beginning at byte offset two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Uint16Array(buf, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_7800
     * @tc.name testUint16Arrayoverallone078
      * @tc.desc Creates a two-element view from a four-byte buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint16Array(buf, 0, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_7900
     * @tc.name testUint16Arrayoverallone079
      * @tc.desc Creates an empty Uint16Array with Uint16Array.of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_01_8000
     * @tc.name testUint16Arrayoverallone080
      * @tc.desc Creates a single zero element with Uint16Array.of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallone080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0);
      expect(arr[0]).assertEqual(0);
    });

  });
}
