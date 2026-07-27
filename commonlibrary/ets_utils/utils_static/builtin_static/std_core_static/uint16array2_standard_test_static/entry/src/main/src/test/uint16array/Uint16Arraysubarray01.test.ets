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

export default function uint16ArraySubarrayPart1Test(): void {
  describe('Uint16ArraySubarrayPart1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_0100
     * @tc.name testUint16ArraySubarrayPart1001
      * @tc.desc Verify subarray without bounds exposes the complete source range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray();
      expect(sub.length).assertEqual(5);
      expect(sub[0]).assertEqual(10);
      expect(sub[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_0200
     * @tc.name testUint16ArraySubarrayPart1002
     * @tc.desc Verify subarray(1) 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1);
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(20);
      expect(sub[3]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_0300
     * @tc.name testUint16ArraySubarrayPart1003
     * @tc.desc Verify subarray(1, 3) begin end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_0400
     * @tc.name testUint16ArraySubarrayPart1004
      * @tc.desc Verify subarray from zero exposes the complete source range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0);
      expect(sub.length).assertEqual(5);
      expect(sub[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_0500
     * @tc.name testUint16ArraySubarrayPart1005
     * @tc.desc Verify begin=2 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(2);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_0600
     * @tc.name testUint16ArraySubarrayPart1006
     * @tc.desc Verify begin=3 length-2 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(3);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_0700
     * @tc.name testUint16ArraySubarrayPart1007
     * @tc.desc Verify begin=4 length-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(4);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_0800
     * @tc.name testUint16ArraySubarrayPart1008
     * @tc.desc Verify begin=5 length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(5);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_0900
     * @tc.name testUint16ArraySubarrayPart1009
     * @tc.desc Verify begin=6 length+1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(6);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_1000
     * @tc.name testUint16ArraySubarrayPart1010
     * @tc.desc Verify begin=100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(100);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_1100
     * @tc.name testUint16ArraySubarrayPart1011
      * @tc.desc Verify subarray from negative one exposes the final element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-1);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_1200
     * @tc.name testUint16ArraySubarrayPart1012
     * @tc.desc Verify begin=-5 -length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-5);
      expect(sub.length).assertEqual(5);
      expect(sub[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_1300
     * @tc.name testUint16ArraySubarrayPart1013
     * @tc.desc Verify begin=-6 -length-1 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-6);
      expect(sub.length).assertEqual(5);
      expect(sub[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_1400
     * @tc.name testUint16ArraySubarrayPart1014
     * @tc.desc Verify begin=0xFFFF 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0xFFFF);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_1500
     * @tc.name testUint16ArraySubarrayPart1015
     * @tc.desc Verify begin=3e0 3 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray((3e0).toInt());
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_1600
     * @tc.name testUint16ArraySubarrayPart1016
     * @tc.desc Verify begin=5e0 5 length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray((5e0).toInt());
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_1700
     * @tc.name testUint16ArraySubarrayPart1017
     * @tc.desc Verify begin=(10/2) length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray((10 / 2).toInt());
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_1800
     * @tc.name testUint16ArraySubarrayPart1018
     * @tc.desc Verify begin=3.0 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray((3.0).toInt());
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_1900
     * @tc.name testUint16ArraySubarrayPart1019
     * @tc.desc Verify begin=3.14 3 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray((3.14).toInt());
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_2000
     * @tc.name testUint16ArraySubarrayPart1020
     * @tc.desc Verify begin=-0.5 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray((-0.5).toInt());
      expect(sub.length).assertEqual(5);
      expect(sub[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_2100
     * @tc.name testUint16ArraySubarrayPart1021
      * @tc.desc Verify subarray normalizes a NaN begin to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(Number.NaN.toInt());
      expect(sub.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_2200
     * @tc.name testUint16ArraySubarrayPart1022
     * @tc.desc Verify begin=Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(Number.POSITIVE_INFINITY.toInt());
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_2300
     * @tc.name testUint16ArraySubarrayPart1023
      * @tc.desc Verify subarray clamps a negative infinite begin to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray((-Number.POSITIVE_INFINITY).toInt());
      expect(sub.length).assertEqual(5);
      expect(sub[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_2400
     * @tc.name testUint16ArraySubarrayPart1024
      * @tc.desc Verify subarray with zero end returns an empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_2500
     * @tc.name testUint16ArraySubarrayPart1025
      * @tc.desc Verify subarray with end one exposes the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 1);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_2600
     * @tc.name testUint16ArraySubarrayPart1026
      * @tc.desc Verify subarray with end two exposes two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_2700
     * @tc.name testUint16ArraySubarrayPart1027
     * @tc.desc Verify end=3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 3);
      expect(sub.length).assertEqual(3);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_2800
     * @tc.name testUint16ArraySubarrayPart1028
     * @tc.desc Verify end=4 length-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 4);
      expect(sub.length).assertEqual(4);
      expect(sub[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_2900
     * @tc.name testUint16ArraySubarrayPart1029
     * @tc.desc Verify end=5 length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 5);
      expect(sub.length).assertEqual(5);
      expect(sub[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_3000
     * @tc.name testUint16ArraySubarrayPart1030
     * @tc.desc Verify end=6 length+1 length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 6);
      expect(sub.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_3100
     * @tc.name testUint16ArraySubarrayPart1031
     * @tc.desc Verify end=100 length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 100);
      expect(sub.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_3200
     * @tc.name testUint16ArraySubarrayPart1032
      * @tc.desc Verify subarray with negative-one end excludes the final element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, -1);
      expect(sub.length).assertEqual(4);
      expect(sub[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_3300
     * @tc.name testUint16ArraySubarrayPart1033
      * @tc.desc Verify subarray with negative-two end excludes the final two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, -2);
      expect(sub.length).assertEqual(3);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_3400
     * @tc.name testUint16ArraySubarrayPart1034
     * @tc.desc Verify end=-4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, -4);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_3500
     * @tc.name testUint16ArraySubarrayPart1035
     * @tc.desc Verify end=-5 -length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, -5);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_3600
     * @tc.name testUint16ArraySubarrayPart1036
     * @tc.desc Verify end=-6 -length-1 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, -6);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_3700
     * @tc.name testUint16ArraySubarrayPart1037
     * @tc.desc Verify end=-100 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, -100);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_3800
     * @tc.name testUint16ArraySubarrayPart1038
     * @tc.desc Verify end=0xFF 255 length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 0xFF);
      expect(sub.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_3900
     * @tc.name testUint16ArraySubarrayPart1039
     * @tc.desc Verify end=1e0 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, (1e0).toInt());
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_4000
     * @tc.name testUint16ArraySubarrayPart1040
     * @tc.desc Verify end=3e0 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, (3e0).toInt());
      expect(sub.length).assertEqual(3);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_4100
     * @tc.name testUint16ArraySubarrayPart1041
     * @tc.desc Verify end=5e0 5 length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, (5e0).toInt());
      expect(sub.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_4200
     * @tc.name testUint16ArraySubarrayPart1042
     * @tc.desc Verify end=(1+2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, (1 + 2).toInt());
      expect(sub.length).assertEqual(3);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_4300
     * @tc.name testUint16ArraySubarrayPart1043
     * @tc.desc Verify end=(5-1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, (5 - 1).toInt());
      expect(sub.length).assertEqual(4);
      expect(sub[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_4400
     * @tc.name testUint16ArraySubarrayPart1044
     * @tc.desc Verify end=(10/2) length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, (10 / 2).toInt());
      expect(sub.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_4500
     * @tc.name testUint16ArraySubarrayPart1045
     * @tc.desc Verify end=3.0 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, (3.0).toInt());
      expect(sub.length).assertEqual(3);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_4600
     * @tc.name testUint16ArraySubarrayPart1046
     * @tc.desc Verify end=3.9 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, (3.9).toInt());
      expect(sub.length).assertEqual(3);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_4700
     * @tc.name testUint16ArraySubarrayPart1047
     * @tc.desc Verify end=-0.5 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, (-0.5).toInt());
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_4800
     * @tc.name testUint16ArraySubarrayPart1048
      * @tc.desc Verify subarray normalizes a NaN end to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, Number.NaN.toInt());
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_4900
     * @tc.name testUint16ArraySubarrayPart1049
      * @tc.desc Verify subarray clamps an infinite end to the source length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, Number.POSITIVE_INFINITY.toInt());
      expect(sub.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_5000
     * @tc.name testUint16ArraySubarrayPart1050
      * @tc.desc Verify subarray clamps a negative infinite end to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, (-Number.POSITIVE_INFINITY).toInt());
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_5100
     * @tc.name testUint16ArraySubarrayPart1051
     * @tc.desc Verify begin=2, end=4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(2, 4);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(30);
      expect(sub[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_5200
     * @tc.name testUint16ArraySubarrayPart1052
     * @tc.desc Verify begin=4, end=2 begin end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(4, 2);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_5300
     * @tc.name testUint16ArraySubarrayPart1053
     * @tc.desc Verify begin=1, end=1 begin end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_5400
     * @tc.name testUint16ArraySubarrayPart1054
     * @tc.desc Verify begin=3, end=3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(3, 3);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_5500
     * @tc.name testUint16ArraySubarrayPart1055
     * @tc.desc Verify begin=2, end=-1 begin end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(2, -1);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(30);
      expect(sub[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_5600
     * @tc.name testUint16ArraySubarrayPart1056
     * @tc.desc Verify begin=-3, end=-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(-3, -1);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(30);
      expect(sub[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_5700
     * @tc.name testUint16ArraySubarrayPart1057
      * @tc.desc Verify an empty source subarray without bounds returns an empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of();
      let sub: Uint16Array = arr.subarray();
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_5800
     * @tc.name testUint16ArraySubarrayPart1058
      * @tc.desc Verify an empty source returns an empty view for equal bounds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of();
      let sub: Uint16Array = arr.subarray(0, 0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_5900
     * @tc.name testUint16ArraySubarrayPart1059
      * @tc.desc Verify subarray with zero begin exposes a single source element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(42);
      let sub: Uint16Array = arr.subarray(0);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_6000
     * @tc.name testUint16ArraySubarrayPart1060
      * @tc.desc Verify subarray at a single-element length returns an empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(42);
      let sub: Uint16Array = arr.subarray(1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_6100
     * @tc.name testUint16ArraySubarrayPart1061
      * @tc.desc Verify negative begin exposes the final single source element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(42);
      let sub: Uint16Array = arr.subarray(-1);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_6200
     * @tc.name testUint16ArraySubarrayPart1062
     * @tc.desc Verify 10 subarray(5) 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60, 70, 80, 90, 100);
      let sub: Uint16Array = arr.subarray(5);
      expect(sub.length).assertEqual(5);
      expect(sub[0]).assertEqual(60);
      expect(sub[4]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_6300
     * @tc.name testUint16ArraySubarrayPart1063
     * @tc.desc Verify 10 subarray(5, 8) 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60, 70, 80, 90, 100);
      let sub: Uint16Array = arr.subarray(5, 8);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(60);
      expect(sub[2]).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_6400
     * @tc.name testUint16ArraySubarrayPart1064
     * @tc.desc Verify subarray(1, 4) has length 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_6500
     * @tc.name testUint16ArraySubarrayPart1065
     * @tc.desc Verify subarray(1, 4) has byteLength 6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      expect(sub.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_6600
     * @tc.name testUint16ArraySubarrayPart1066
     * @tc.desc Verify subarray begin byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(2);
      expect(sub.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_6700
     * @tc.name testUint16ArraySubarrayPart1067
     * @tc.desc Verify subarray(1, 3) shares the source buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 3);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_6800
     * @tc.name testUint16ArraySubarrayPart1068
     * @tc.desc Verify subarray write propagates to source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      sub[0] = 99;
      expect(arr[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_6900
     * @tc.name testUint16ArraySubarrayPart1069
     * @tc.desc Verify source write propagates to subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      arr[2] = 88;
      expect(sub[1]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_7000
     * @tc.name testUint16ArraySubarrayPart1070
     * @tc.desc Verify sibling subarrays share one buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub1: Uint16Array = arr.subarray(0, 2);
      let sub2: Uint16Array = arr.subarray(2, 5);
      expect(sub1.buffer).assertEqual(sub2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_7100
     * @tc.name testUint16ArraySubarrayPart1071
      * @tc.desc Verify a nested subarray retains the source buffer and selected values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub1: Uint16Array = arr.subarray(1, 5);
      let sub2: Uint16Array = sub1.subarray(0, 2);
      expect(sub2.length).assertEqual(2);
      expect(sub2[0]).assertEqual(20);
      expect(sub2[1]).assertEqual(30);
      expect(sub2.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_7200
     * @tc.name testUint16ArraySubarrayPart1072
      * @tc.desc Verify a subarray write propagates the maximum Uint16 value to its source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      sub[0] = 65535;
      expect(arr[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_7300
     * @tc.name testUint16ArraySubarrayPart1073
      * @tc.desc Verify a subarray write propagates zero to its source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      sub[0] = 0;
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_7400
     * @tc.name testUint16ArraySubarrayPart1074
      * @tc.desc Verify a subarray write wraps 65536 to zero in its source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      sub[0] = 65536;
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_7500
     * @tc.name testUint16ArraySubarrayPart1075
      * @tc.desc Verify a subarray write wraps negative one to 65535 in its source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      sub[0] = -1;
      expect(arr[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_7600
     * @tc.name testUint16ArraySubarrayPart1076
      * @tc.desc Verify a subarray write truncates a fractional value in its source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      sub[0] = 3.14;
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_7700
     * @tc.name testUint16ArraySubarrayPart1077
      * @tc.desc Verify a source write propagates the maximum Uint16 value to its subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      arr[1] = 65535;
      expect(sub[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_7800
     * @tc.name testUint16ArraySubarrayPart1078
      * @tc.desc Verify a source write propagates zero to its subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      arr[1] = 0;
      expect(sub[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_7900
     * @tc.name testUint16ArraySubarrayPart1079
      * @tc.desc Verify a source overflow write appears as zero in its subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      arr[1] = 65536;
      expect(sub[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_8000
     * @tc.name testUint16ArraySubarrayPart1080
      * @tc.desc Verify a negative source write appears as 65535 in its subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      arr[1] = -1;
      expect(sub[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_8100
     * @tc.name testUint16ArraySubarrayPart1081
      * @tc.desc Verify sibling subarrays with identical ranges observe shared writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub1: Uint16Array = arr.subarray(1, 4);
      let sub2: Uint16Array = arr.subarray(1, 4);
      sub1[0] = 77;
      expect(sub2[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_8200
     * @tc.name testUint16ArraySubarrayPart1082
      * @tc.desc Verify a subarray write converts NaN to zero in its source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      sub[0] = Number.NaN;
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_8300
     * @tc.name testUint16ArraySubarrayPart1083
      * @tc.desc Verify a subarray write converts positive infinity to zero in its source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      sub[0] = Number.POSITIVE_INFINITY;
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_8400
     * @tc.name testUint16ArraySubarrayPart1084
      * @tc.desc Verify a subarray write converts negative infinity to zero in its source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(1, 4);
      sub[0] = -Number.POSITIVE_INFINITY;
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_8500
     * @tc.name testUint16ArraySubarrayPart1085
     * @tc.desc Verify begin=0x10000 hex
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0x10000);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SUBARRAY_PART1_8600
     * @tc.name testUint16ArraySubarrayPart1086
     * @tc.desc Verify end=0x10000 hex length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySubarrayPart1086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let sub: Uint16Array = arr.subarray(0, 0x10000);
      expect(sub.length).assertEqual(5);
    });

  });
}
