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
import Utils from '../Util.test';

export default function Float32ArrayMap2Test(): void {
  describe('Float32ArrayMap2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_0100
     * @tc.name testFloat32ArrayMapTwo001
     * @tc.desc Verify map Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.length).assertEqual(3);
      expect(res.$_get(0)).assertEqual(1.0);
      expect(res.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_0200
     * @tc.name testFloat32ArrayMapTwo002
     * @tc.desc map(v=>v+1) on [5.0] returns length 1 and element 6.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v + 1);
      expect(res.length).assertEqual(1);
      expect(res.$_get(0)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_0300
     * @tc.name testFloat32ArrayMapTwo003
     * @tc.desc map(v=>v) on [1,2,3,4] returns length 4 and last element 4.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.length).assertEqual(4);
      expect(res.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_0400
     * @tc.name testFloat32ArrayMapTwo004
     * @tc.desc map(v=>v) on [1,2] returns length 2 and element 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.length).assertEqual(2);
      expect(res.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_0500
     * @tc.name testFloat32ArrayMapTwo005
     * @tc.desc map(v=>v) on [1,2] returns length 2 and first element 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.length).assertEqual(2);
      expect(res.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_0600
     * @tc.name testFloat32ArrayMapTwo006
     * @tc.desc map(v=>v) on [10,20,30] returns first element 10.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      const element007 = res.$_get(0);
      expect(element007).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_0700
     * @tc.name testFloat32ArrayMapTwo007
     * @tc.desc map(v=>v) on [1.5,2.5,3.5] returns [1.5,2.5,3.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5, 3.5]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      const element008 = res.$_get(0);
      expect(element008).assertEqual(1.5);
      const element008Part2 = res.$_get(1);
      expect(element008Part2).assertEqual(2.5);
      const element008Part3 = res.$_get(2);
      expect(element008Part3).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_0800
     * @tc.name testFloat32ArrayMapTwo008
     * @tc.desc map(v=>v*2) on [1,2,3] returns [2,4,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v * 2);
      const element009 = res.$_get(0);
      expect(element009).assertEqual(2.0);
      const element009Part2 = res.$_get(1);
      expect(element009Part2).assertEqual(4.0);
      const element009Part3 = res.$_get(2);
      expect(element009Part3).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_0900
     * @tc.name testFloat32ArrayMapTwo009
     * @tc.desc map(v=>v+1) on [10,20] returns [11,21]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v + 1);
      const element010 = res.$_get(0);
      expect(element010).assertEqual(11.0);
      const element010Part2 = res.$_get(1);
      expect(element010Part2).assertEqual(21.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_1000
     * @tc.name testFloat32ArrayMapTwo010
     * @tc.desc map(v=>-v) on [1,-2,3] returns [-1,2,-3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => -v);
      const element011 = res.$_get(0);
      expect(element011).assertEqual(-1.0);
      const element011Part2 = res.$_get(1);
      expect(element011Part2).assertEqual(2.0);
      const element011Part3 = res.$_get(2);
      expect(element011Part3).assertEqual(-3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_1100
     * @tc.name testFloat32ArrayMapTwo011
     * @tc.desc map(v=>v*v) on [2,3,4] returns [4,9,16]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 3.0, 4.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v * v);
      const element012 = res.$_get(0);
      expect(element012).assertEqual(4.0);
      const element012Part2 = res.$_get(1);
      expect(element012Part2).assertEqual(9.0);
      const element012Part3 = res.$_get(2);
      expect(element012Part3).assertEqual(16.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_1200
     * @tc.name testFloat32ArrayMapTwo012
     * @tc.desc map(v=>7.0) on [1,2,3,4] returns [7.0,7.0,7.0,7.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => 7.0);
      const element013 = res.$_get(0);
      expect(element013).assertEqual(7.0);
      const element013Part2 = res.$_get(3);
      expect(element013Part2).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_1300
     * @tc.name testFloat32ArrayMapTwo013
     * @tc.desc map(v=>-7.0) on [1,2,3] returns [-7.0,-7.0,-7.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => -7.0);
      const element014 = res.$_get(0);
      expect(element014).assertEqual(-7.0);
      const element014Part2 = res.$_get(2);
      expect(element014Part2).assertEqual(-7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_1400
     * @tc.name testFloat32ArrayMapTwo014
     * @tc.desc map(v=>0) on [1,2,3] returns [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => 0);
      const element015 = res.$_get(0);
      expect(element015).assertEqual(0);
      const element015Part2 = res.$_get(2);
      expect(element015Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_1500
     * @tc.name testFloat32ArrayMapTwo015
     * @tc.desc map(v=>v/2) on [2,4,8] returns [1,2,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 4.0, 8.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v / 2);
      const element016 = res.$_get(0);
      expect(element016).assertEqual(1.0);
      const element016Part2 = res.$_get(1);
      expect(element016Part2).assertEqual(2.0);
      const element016Part3 = res.$_get(2);
      expect(element016Part3).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_1600
     * @tc.name testFloat32ArrayMapTwo016
     * @tc.desc map(v=>v-1) on [5,10,15] returns [4,9,14]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 10.0, 15.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v - 1);
      const element017 = res.$_get(0);
      expect(element017).assertEqual(4.0);
      const element017Part2 = res.$_get(1);
      expect(element017Part2).assertEqual(9.0);
      const element017Part3 = res.$_get(2);
      expect(element017Part3).assertEqual(14.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_1700
     * @tc.name testFloat32ArrayMapTwo017
     * @tc.desc Verify v*v+v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v * v + v);
      const element018 = res.$_get(0);
      expect(element018).assertEqual(6.0);
      const element018Part2 = res.$_get(1);
      expect(element018Part2).assertEqual(12.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_1800
     * @tc.name testFloat32ArrayMapTwo018
     * @tc.desc Verify 9.0 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => 9.0);
      const element032 = res.$_get(0);
      expect(element032).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_1900
     * @tc.name testFloat32ArrayMapTwo019
     * @tc.desc Verify 65536.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => 65536.0);
      const element036 = res.$_get(0);
      expect(element036).assertEqual(65536.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_2000
     * @tc.name testFloat32ArrayMapTwo020
     * @tc.desc map(v=>16777217) on [1,2,3] returns [16777216,16777216,16777216]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => 16777217);
      const element037 = res.$_get(0);
      expect(element037).assertEqual(16777216);
      const element037Part2 = res.$_get(1);
      expect(element037Part2).assertEqual(16777216);
      const element037Part3 = res.$_get(2);
      expect(element037Part3).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_2100
     * @tc.name testFloat32ArrayMapTwo021
     * @tc.desc Verify length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_2200
     * @tc.name testFloat32ArrayMapTwo022
     * @tc.desc Verify length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_2300
     * @tc.name testFloat32ArrayMapTwo023
     * @tc.desc Verify length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_2400
     * @tc.name testFloat32ArrayMapTwo024
     * @tc.desc Verify byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_2500
     * @tc.name testFloat32ArrayMapTwo025
     * @tc.desc Verify byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_2600
     * @tc.name testFloat32ArrayMapTwo026
     * @tc.desc Verify byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_2700
     * @tc.name testFloat32ArrayMapTwo027
     * @tc.desc Verify buffer.byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_2800
     * @tc.name testFloat32ArrayMapTwo028
     * @tc.desc Verify buffer.byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_2900
     * @tc.name testFloat32ArrayMapTwo029
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_3000
     * @tc.name testFloat32ArrayMapTwo030
     * @tc.desc Verify length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_3100
     * @tc.name testFloat32ArrayMapTwo031
     * @tc.desc Verify byteLength 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_3200
     * @tc.name testFloat32ArrayMapTwo032
     * @tc.desc Verify length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_3300
     * @tc.name testFloat32ArrayMapTwo033
     * @tc.desc map(v=>v*100) does not mutate original array [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.map((v: number, index: int, array: Float32Array): number => v * 100);
      const element050 = arr.$_get(0);
      expect(element050).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_3400
     * @tc.name testFloat32ArrayMapTwo034
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_3500
     * @tc.name testFloat32ArrayMapTwo035
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.map((v: number, index: int, array: Float32Array): number => v * 2);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_3600
     * @tc.name testFloat32ArrayMapTwo036
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.map((v: number, index: int, array: Float32Array): number => v * 2);
      const atValue053 = arr.at(-1);
      expect(atValue053).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_3700
     * @tc.name testFloat32ArrayMapTwo037
     * @tc.desc chained map(v=>v*2).map(v=>v*3) does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.map((v: number, index: int, array: Float32Array): number => v * 2).map((v: number, index: int, array: Float32Array): number => v * 3);
      const element054 = arr.$_get(0);
      expect(element054).assertEqual(1.0);
      const element054Part2 = arr.$_get(1);
      expect(element054Part2).assertEqual(2.0);
      const element054Part3 = arr.$_get(2);
      expect(element054Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_3800
     * @tc.name testFloat32ArrayMapTwo038
     * @tc.desc Verify buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.map((v: number, index: int, array: Float32Array): number => v * 50);
      expect(arr.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_3900
     * @tc.name testFloat32ArrayMapTwo039
     * @tc.desc map(v=>1.0e40) does not mutate original array [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.map((v: number, index: int, array: Float32Array): number => 1.0e40);
      const element056 = arr.$_get(0);
      expect(element056).assertEqual(1.0);
      const element056Part2 = arr.$_get(1);
      expect(element056Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_4000
     * @tc.name testFloat32ArrayMapTwo040
     * @tc.desc Verify map(v=>NaN) does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.map((v: number, index: int, array: Float32Array): number => Number.NaN);
      const element057 = arr.$_get(0);
      expect(element057).assertEqual(1.0);
      const element057Part2 = arr.$_get(1);
      expect(element057Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_4100
     * @tc.name testFloat32ArrayMapTwo041
     * @tc.desc Verify map map Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v * 2).map((v: number, index: int, array: Float32Array): number => v + 1);
      const element058 = res.$_get(0);
      expect(element058).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_4200
     * @tc.name testFloat32ArrayMapTwo042
     * @tc.desc Verify map length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v).map((v: number, index: int, array: Float32Array): number => v).map((v: number, index: int, array: Float32Array): number => v);
      expect(res.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_4300
     * @tc.name testFloat32ArrayMapTwo043
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v + 5);
      const element060 = res.$_get(0);
      expect(element060).assertEqual(15.0);
      const element060Part2 = res.$_get(1);
      expect(element060Part2).assertEqual(25.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_4400
     * @tc.name testFloat32ArrayMapTwo044
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      res.$_set(0, 99.0);
      const element061 = res.$_get(0);
      expect(element061).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_4500
     * @tc.name testFloat32ArrayMapTwo045
     * @tc.desc Verify at(0) returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v * 10);
      const atValue062 = res.at(-1);
      expect(atValue062).assertEqual(30.0);
      const atValue062Part2 = res.at(0);
      expect(atValue062Part2).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_4600
     * @tc.name testFloat32ArrayMapTwo046
     * @tc.desc Verify slice Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      const sl = res.slice(1);
      expect(sl.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_4700
     * @tc.name testFloat32ArrayMapTwo047
     * @tc.desc Verify filter Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      const f = res.filter((v: number, index: int, array: Float32Array): boolean => v > 2);
      expect(f.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_4800
     * @tc.name testFloat32ArrayMapTwo048
     * @tc.desc Verify reduce number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      const sum = res.reduce((acc: number, v: number, index: int, array: Float32Array): number => acc + v, 0.0);
      expect(sum).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_4900
     * @tc.name testFloat32ArrayMapTwo049
     * @tc.desc Verify join string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      const s = res.join(',');
      expect(s).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_5000
     * @tc.name testFloat32ArrayMapTwo050
     * @tc.desc Verify toString string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      const s = res.toString();
      expect(s).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_5100
     * @tc.name testFloat32ArrayMapTwo051
     * @tc.desc Verify indexOf(20.0) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      const indexValue068 = res.indexOf(20.0);
      expect(indexValue068).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_5200
     * @tc.name testFloat32ArrayMapTwo052
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      const predicateResult069 = res.includes(30.0);
      expect(predicateResult069).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_5300
     * @tc.name testFloat32ArrayMapTwo053
     * @tc.desc Verify find(v>3) on mapped values returns 4.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v * 2);
      const found = res.find((v: number, index: int, array: Float32Array): boolean => v > 3);
      expect(found).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_5400
     * @tc.name testFloat32ArrayMapTwo054
     * @tc.desc Verify findIndex(v===6.0) on mapped values returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v * 2);
      const foundIndex071 = res.findIndex((v: number, index: int, array: Float32Array): boolean => v === 6.0);
      expect(foundIndex071).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_5500
     * @tc.name testFloat32ArrayMapTwo055
     * @tc.desc Verify fill(9.0) sets all elements to 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      res.fill(9.0);
      const element072 = res.$_get(0);
      expect(element072).assertEqual(9.0);
      const element072Part2 = res.$_get(2);
      expect(element072Part2).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_5600
     * @tc.name testFloat32ArrayMapTwo056
     * @tc.desc Verify reverse() reverses element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      res.reverse();
      const element073 = res.$_get(0);
      expect(element073).assertEqual(3.0);
      const element073Part2 = res.$_get(2);
      expect(element073Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_5700
     * @tc.name testFloat32ArrayMapTwo057
     * @tc.desc Verify sort() orders elements ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      res.sort();
      const element074 = res.$_get(0);
      expect(element074).assertEqual(1.0);
      const element074Part2 = res.$_get(2);
      expect(element074Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_5800
     * @tc.name testFloat32ArrayMapTwo058
     * @tc.desc Verify copyWithin(0,2) copies the third mapped element to index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      res.copyWithin(0, 2);
      const element075 = res.$_get(0);
      expect(element075).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_5900
     * @tc.name testFloat32ArrayMapTwo059
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      const sub = res.subarray(1, 3);
      sub.$_set(0, 99.0);
      const element076 = res.$_get(1);
      expect(element076).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_6000
     * @tc.name testFloat32ArrayMapTwo060
     * @tc.desc Verify values() iteration yields original elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v * 2);
      const it = res.values();
      const first = it.next();
      expect(first.value).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_6100
     * @tc.name testFloat32ArrayMapTwo061
     * @tc.desc Verify keys() yields index 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      const it = res.keys();
      const first = it.next();
      expect(first.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_6200
     * @tc.name testFloat32ArrayMapTwo062
     * @tc.desc Verify forEach callback captures element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      let total: number = 0;
      res.forEach((v: number, index: int, array: Float32Array): void => {
        total = total + v;
      });
      expect(total).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_6300
     * @tc.name testFloat32ArrayMapTwo063
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      const observedValue080 = ArrayBuffer.isView(res);
      expect(observedValue080).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_6400
     * @tc.name testFloat32ArrayMapTwo064
     * @tc.desc Verify map buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r1 = arr.map((v: number, index: int, array: Float32Array): number => v);
      const r2 = arr.map((v: number, index: int, array: Float32Array): number => v);
      r1.$_set(0, 111.0);
      const element081 = r2.$_get(0);
      expect(element081).assertEqual(1.0);
      const element081Part2 = r1.$_get(0);
      expect(element081Part2).assertEqual(111.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_6500
     * @tc.name testFloat32ArrayMapTwo065
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      const view = new Float32Array(res.buffer);
      view.$_set(0, 42.0);
      const element082 = arr.$_get(0);
      expect(element082).assertEqual(1.0);
      const element082Part2 = res.$_get(0);
      expect(element082Part2).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_6600
     * @tc.name testFloat32ArrayMapTwo066
     * @tc.desc Verify mapping four Float32 elements creates a 16-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_6700
     * @tc.name testFloat32ArrayMapTwo067
     * @tc.desc map result is a copy: modifying result[0] does not affect original[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      res.$_set(0, 999.0);
      const element084 = arr.$_get(0);
      expect(element084).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_6800
     * @tc.name testFloat32ArrayMapTwo068
     * @tc.desc map result is a copy: modifying original[0] does not affect result[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      arr.$_set(0, 888.0);
      const element085 = res.$_get(0);
      expect(element085).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_6900
     * @tc.name testFloat32ArrayMapTwo069
     * @tc.desc map result is a copy: modifying result[1] does not affect original[1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      res.$_set(1, 777.0);
      const element086 = arr.$_get(1);
      expect(element086).assertEqual(6.0);
      const element086Part2 = res.$_get(1);
      expect(element086Part2).assertEqual(777.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_7000
     * @tc.name testFloat32ArrayMapTwo070
     * @tc.desc map result is a copy: modifying all original elements leaves result unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      arr.$_set(0, 100.0);
      arr.$_set(1, 200.0);
      arr.$_set(2, 300.0);
      const element087 = res.$_get(0);
      expect(element087).assertEqual(1.0);
      const element087Part2 = res.$_get(1);
      expect(element087Part2).assertEqual(2.0);
      const element087Part3 = res.$_get(2);
      expect(element087Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_7100
     * @tc.name testFloat32ArrayMapTwo071
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.buffer.byteLength).assertEqual(8);
      expect(res.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_7200
     * @tc.name testFloat32ArrayMapTwo072
     * @tc.desc Verify buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 0, 3);
      arr.$_set(0, 1.0);
      arr.$_set(1, 2.0);
      arr.$_set(2, 3.0);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v * 2);
      res.$_set(0, 999.0);
      const element089 = arr.$_get(0);
      expect(element089).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_7300
     * @tc.name testFloat32ArrayMapTwo073
     * @tc.desc Verify byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.$_set(0, 1.0);
      arr.$_set(1, 2.0);
      arr.$_set(2, 3.0);
      const res = arr.map((v: number, index: int, array: Float32Array): number => v);
      expect(res.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_TWO_7400
     * @tc.name testFloat32ArrayMapTwo074
     * @tc.desc Verify identity map preserves NaN, Infinity, -Infinity, -0.0, MAX_VALUE, MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, -0.0, 3.4028234663852886e+38, 1.401298464324817e-45);
      const res = arr.map((v: number): number => v);
      expect(res.$_get(0)).assertNaN();
      expect(res.$_get(1)).assertEqual(Number.POSITIVE_INFINITY);
      expect(res.$_get(2)).assertEqual(-Number.POSITIVE_INFINITY);
      const inv = 1.0 / res.$_get(3);
      expect(inv).assertEqual(-Number.POSITIVE_INFINITY);
      expect(res.$_get(4)).assertEqual(3.4028234663852886e+38);
      expect(res.$_get(5)).assertEqual(1.401298464324817e-45);
    });

  });
}
