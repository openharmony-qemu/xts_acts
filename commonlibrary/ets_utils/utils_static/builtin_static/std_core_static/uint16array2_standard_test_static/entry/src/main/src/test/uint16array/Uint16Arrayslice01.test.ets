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

export default function uint16ArraySlicePart1Test(): void {
  describe('Uint16ArraySlicePart1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_0100
     * @tc.name testUint16ArraySlicePart1001
      * @tc.desc Verify slice without bounds returns a distinct full-length copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice();
      expect(r.length).assertEqual(6);
      expect(r).not().assertEqual(src);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_0200
     * @tc.name testUint16ArraySlicePart1002
     * @tc.desc Verify slice(1) 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(1);
      expect(r[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_0300
     * @tc.name testUint16ArraySlicePart1003
     * @tc.desc Verify slice(0, 2) 0 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, 2);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_0400
     * @tc.name testUint16ArraySlicePart1004
      * @tc.desc Verify slice from zero returns the source first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0);
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_0500
     * @tc.name testUint16ArraySlicePart1005
     * @tc.desc Verify begin=2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(2);
      expect(r[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_0600
     * @tc.name testUint16ArraySlicePart1006
     * @tc.desc Verify begin=length-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(5);
      expect(r[0]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_0700
     * @tc.name testUint16ArraySlicePart1007
     * @tc.desc Verify begin=length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(6);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_0800
     * @tc.name testUint16ArraySlicePart1008
     * @tc.desc Verify begin=length+1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(7);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_0900
     * @tc.name testUint16ArraySlicePart1009
      * @tc.desc Verify slice from negative one returns the final element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(-1);
      expect(r[0]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_1000
     * @tc.name testUint16ArraySlicePart1010
     * @tc.desc Verify begin=-2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(-2);
      expect(r[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_1100
     * @tc.name testUint16ArraySlicePart1011
     * @tc.desc Verify begin=-length 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(-6);
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_1200
     * @tc.name testUint16ArraySlicePart1012
     * @tc.desc Verify begin=-length-1 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(-7);
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_1300
     * @tc.name testUint16ArraySlicePart1013
     * @tc.desc Verify begin=-0 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(-0);
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_1400
     * @tc.name testUint16ArraySlicePart1014
      * @tc.desc Verify slice normalizes a NaN begin to the full source range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(Number.NaN.toInt());
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_1500
     * @tc.name testUint16ArraySlicePart1015
     * @tc.desc Verify begin=Infinity length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(Number.POSITIVE_INFINITY.toInt());
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_1600
     * @tc.name testUint16ArraySlicePart1016
      * @tc.desc Verify slice clamps a negative infinite begin to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice((-Number.POSITIVE_INFINITY).toInt());
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_1700
     * @tc.name testUint16ArraySlicePart1017
     * @tc.desc Verify slice from positive begin index three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice((3.14).toInt());
      expect(r[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_1800
     * @tc.name testUint16ArraySlicePart1018
     * @tc.desc Verify begin=-3.14 -3 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice((-3.14).toInt());
      expect(r[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_1900
     * @tc.name testUint16ArraySlicePart1019
     * @tc.desc Verify begin=65535.9 length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice((65535.9).toInt());
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_2000
     * @tc.name testUint16ArraySlicePart1020
     * @tc.desc Verify begin=0x10 16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0x10);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_2100
     * @tc.name testUint16ArraySlicePart1021
      * @tc.desc Verify slice interprets binary begin two as the third element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(47001, 8, 321, 65530, 92, 14007, 3);
      let r: Uint16Array = src.slice(0b10);
      expect(r[0]).assertEqual(321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_2200
     * @tc.name testUint16ArraySlicePart1022
     * @tc.desc Verify begin=0o10 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0o10);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_2300
     * @tc.name testUint16ArraySlicePart1023
     * @tc.desc Verify begin=1e0 1 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice((1e0).toInt());
      expect(r[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_2400
     * @tc.name testUint16ArraySlicePart1024
     * @tc.desc Verify begin=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice((0.0).toInt());
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_2500
     * @tc.name testUint16ArraySlicePart1025
     * @tc.desc Verify begin=0x1 1 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(17, 60999, 404, 2, 33008);
      let r: Uint16Array = src.slice(0x1);
      expect(r[0]).assertEqual(60999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_2600
     * @tc.name testUint16ArraySlicePart1026
     * @tc.desc Verify begin=-0x10 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(-0x10);
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_2700
     * @tc.name testUint16ArraySlicePart1027
      * @tc.desc Verify slice with zero end returns empty content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_2800
     * @tc.name testUint16ArraySlicePart1028
      * @tc.desc Verify slice with end one includes only the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, 1);
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_2900
     * @tc.name testUint16ArraySlicePart1029
      * @tc.desc Verify slice with end two includes the second element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, 2);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_3000
     * @tc.name testUint16ArraySlicePart1030
     * @tc.desc Verify end=length-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, 5);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_3100
     * @tc.name testUint16ArraySlicePart1031
     * @tc.desc Verify end=length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, 6);
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_3200
     * @tc.name testUint16ArraySlicePart1032
     * @tc.desc Verify end=length+1 length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, 7);
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_3300
     * @tc.name testUint16ArraySlicePart1033
      * @tc.desc Verify slice with negative-one end excludes the final element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, -1);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_3400
     * @tc.name testUint16ArraySlicePart1034
      * @tc.desc Verify slice with negative-two end excludes the final two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, -2);
      expect(r[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_3500
     * @tc.name testUint16ArraySlicePart1035
     * @tc.desc Verify end=-length 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, -6);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_3600
     * @tc.name testUint16ArraySlicePart1036
     * @tc.desc Verify end=-length-1 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, -7);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_3700
     * @tc.name testUint16ArraySlicePart1037
      * @tc.desc Verify slice normalizes a NaN end to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, Number.NaN.toInt());
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_3800
     * @tc.name testUint16ArraySlicePart1038
      * @tc.desc Verify slice clamps an infinite end to the source length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, Number.POSITIVE_INFINITY.toInt());
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_3900
     * @tc.name testUint16ArraySlicePart1039
      * @tc.desc Verify slice clamps a negative infinite end to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, (-Number.POSITIVE_INFINITY).toInt());
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_4000
     * @tc.name testUint16ArraySlicePart1040
     * @tc.desc Verify end=3.14 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, (3.14).toInt());
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_4100
     * @tc.name testUint16ArraySlicePart1041
     * @tc.desc Verify end=-3.14 -3 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, (-3.14).toInt());
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_4200
     * @tc.name testUint16ArraySlicePart1042
     * @tc.desc Verify end=0x10 16 length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, 0x10);
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_4300
     * @tc.name testUint16ArraySlicePart1043
     * @tc.desc Verify end=0b10 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, 0b10);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_4400
     * @tc.name testUint16ArraySlicePart1044
     * @tc.desc Verify end=0o10 8 length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, 0o10);
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_4500
     * @tc.name testUint16ArraySlicePart1045
      * @tc.desc Verify slice interprets scientific-notation end one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, (1e0).toInt());
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_4600
     * @tc.name testUint16ArraySlicePart1046
     * @tc.desc Verify end=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0, (0.0).toInt());
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_4700
     * @tc.name testUint16ArraySlicePart1047
     * @tc.desc Verify slice(2, 4) [30, 40]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(2, 4);
      expect(r[0]).assertEqual(30);
      expect(r[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_4800
     * @tc.name testUint16ArraySlicePart1048
     * @tc.desc Verify slice(1, 3) [20, 30]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(1, 3);
      expect(r[0]).assertEqual(20);
      expect(r[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_4900
     * @tc.name testUint16ArraySlicePart1049
      * @tc.desc Verify slice returns empty when begin exceeds end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(4, 2);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_5000
     * @tc.name testUint16ArraySlicePart1050
     * @tc.desc Verify (-3, -1) [40, 50]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(-3, -1);
      expect(r[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_5100
     * @tc.name testUint16ArraySlicePart1051
     * @tc.desc Verify (-4, -2) [30, 40]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(-4, -2);
      expect(r[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_5200
     * @tc.name testUint16ArraySlicePart1052
      * @tc.desc Verify slice honors a hexadecimal end bound
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(50001, 6, 712, 40960, 93, 1205, 65500);
      let r: Uint16Array = src.slice(0, 0x5);
      expect(r[4]).assertEqual(93);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_5300
     * @tc.name testUint16ArraySlicePart1053
      * @tc.desc Verify slice honors binary begin and hexadecimal end bounds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0b1, 0x4);
      expect(r[0]).assertEqual(20);
      expect(r[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_5400
     * @tc.name testUint16ArraySlicePart1054
      * @tc.desc Verify slice clamps opposing octal bounds to the full range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(-0o10, 0o10);
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_5500
     * @tc.name testUint16ArraySlicePart1055
     * @tc.desc Verify slice converts NaN begin to zero and positive infinity end to the array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(Number.NaN.toInt(), Number.POSITIVE_INFINITY.toInt());
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_5600
     * @tc.name testUint16ArraySlicePart1056
     * @tc.desc Verify Infinity 0 begin end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(Number.POSITIVE_INFINITY.toInt(), 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_5700
     * @tc.name testUint16ArraySlicePart1057
     * @tc.desc Verify begin=1 end=1e0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(1, (1e0).toInt());
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_5800
     * @tc.name testUint16ArraySlicePart1058
      * @tc.desc Verify slice without bounds returns empty content for an empty source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Uint16Array = new Uint16Array();
      let r: Uint16Array = empty.slice();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_5900
     * @tc.name testUint16ArraySlicePart1059
      * @tc.desc Verify slice with zero begin returns empty content for an empty source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Uint16Array = new Uint16Array();
      let r: Uint16Array = empty.slice(0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_6000
     * @tc.name testUint16ArraySlicePart1060
      * @tc.desc Verify slice with bounds returns empty content for an empty source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Uint16Array = new Uint16Array();
      let r: Uint16Array = empty.slice(0, 2);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_6100
     * @tc.name testUint16ArraySlicePart1061
      * @tc.desc Verify slice with negative begin returns empty content for an empty source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Uint16Array = new Uint16Array();
      let r: Uint16Array = empty.slice(-1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_6200
     * @tc.name testUint16ArraySlicePart1062
      * @tc.desc Verify slice normalizes NaN begin for an empty source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Uint16Array = new Uint16Array();
      let r: Uint16Array = empty.slice(Number.NaN.toInt());
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_6300
     * @tc.name testUint16ArraySlicePart1063
      * @tc.desc Verify slice without bounds copies a single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let single: Uint16Array = Uint16Array.of(5);
      let r: Uint16Array = single.slice();
      expect(r[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_6400
     * @tc.name testUint16ArraySlicePart1064
      * @tc.desc Verify slice with zero begin copies a single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let single: Uint16Array = Uint16Array.of(5);
      let r: Uint16Array = single.slice(0);
      expect(r[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_6500
     * @tc.name testUint16ArraySlicePart1065
      * @tc.desc Verify slice at the single-element length returns empty content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let single: Uint16Array = Uint16Array.of(5);
      let r: Uint16Array = single.slice(1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_6600
     * @tc.name testUint16ArraySlicePart1066
      * @tc.desc Verify equal bounds return empty content for a single-element source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let single: Uint16Array = Uint16Array.of(5);
      let r: Uint16Array = single.slice(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_6700
     * @tc.name testUint16ArraySlicePart1067
      * @tc.desc Verify negative single-element begin copies that element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let single: Uint16Array = Uint16Array.of(5);
      let r: Uint16Array = single.slice(-1);
      expect(r[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_6800
     * @tc.name testUint16ArraySlicePart1068
     * @tc.desc Verify 100 slice()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let large: Uint16Array = new Uint16Array(100);
      let r: Uint16Array = large.slice();
      expect(r.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_6900
     * @tc.name testUint16ArraySlicePart1069
     * @tc.desc Verify 100 slice(50)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let large: Uint16Array = new Uint16Array(100);
      let r: Uint16Array = large.slice(50);
      expect(r.length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_7000
     * @tc.name testUint16ArraySlicePart1070
     * @tc.desc Verify 100 slice(90) 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let large: Uint16Array = new Uint16Array(100);
      let r: Uint16Array = large.slice(90);
      expect(r.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_7100
     * @tc.name testUint16ArraySlicePart1071
     * @tc.desc Verify 100 slice(0, 50)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let large: Uint16Array = new Uint16Array(100);
      let r: Uint16Array = large.slice(0, 50);
      expect(r.length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_7200
     * @tc.name testUint16ArraySlicePart1072
     * @tc.desc Verify 100 slice(-10) 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let large: Uint16Array = new Uint16Array(100);
      let r: Uint16Array = large.slice(-10);
      expect(r.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_7300
     * @tc.name testUint16ArraySlicePart1073
      * @tc.desc Verify slice selects Uint16 boundary values by range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src2: Uint16Array = Uint16Array.of(0, 65535, 32768, 1);
      let r: Uint16Array = src2.slice(1, 3);
      expect(r[0]).assertEqual(65535);
      expect(r[1]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_7400
     * @tc.name testUint16ArraySlicePart1074
     * @tc.desc Verify slice(-2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src2: Uint16Array = Uint16Array.of(0, 65535, 32768, 1);
      let r: Uint16Array = src2.slice(-2);
      expect(r[0]).assertEqual(32768);
      expect(r[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_7500
     * @tc.name testUint16ArraySlicePart1075
      * @tc.desc Verify slice retains duplicate values in the selected range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let same: Uint16Array = Uint16Array.of(42, 42, 42, 42, 42);
      let r: Uint16Array = same.slice(1, 3);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_7600
     * @tc.name testUint16ArraySlicePart1076
     * @tc.desc Verify begin=3.14 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(3);
      expect(r.join(',')).assertEqual('40,50,60');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_7700
     * @tc.name testUint16ArraySlicePart1077
     * @tc.desc Verify slice normalizes a negative begin index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(-3);
      expect(r.join(',')).assertEqual('40,50,60');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_7800
     * @tc.name testUint16ArraySlicePart1078
     * @tc.desc Verify slice clamps a begin index beyond the array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(65535);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART1_7900
     * @tc.name testUint16ArraySlicePart1079
     * @tc.desc Verify begin=0b10 2 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60);
      let r: Uint16Array = src.slice(0b10);
      expect(r[0]).assertEqual(30);
    });

  });
}
