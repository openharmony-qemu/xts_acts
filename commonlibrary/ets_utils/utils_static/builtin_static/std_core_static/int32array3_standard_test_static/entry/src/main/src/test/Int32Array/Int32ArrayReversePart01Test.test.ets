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

export default function int32ArrayReversePart01Test(): void {
  describe('Int32ArrayReversePart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayReversePart01Test001
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reverse();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayReversePart01Test002
     * @tc.desc Verify reverse() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayReversePart01Test003
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayReversePart01Test004
     * @tc.desc Verify length=1 reverse length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayReversePart01Test005
     * @tc.desc Verify length=2 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayReversePart01Test006
     * @tc.desc Verify length=5 reverse 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayReversePart01Test007
     * @tc.desc Verify length=6 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(60);
      expect(arr.$_get(2)).assertEqual(40);
      expect(arr.$_get(3)).assertEqual(30);
      expect(arr.$_get(5)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayReversePart01Test008
     * @tc.desc Verify new Int32Array(3) reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayReversePart01Test009
     * @tc.desc Verify new Int32Array(4) reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayReversePart01Test010
     * @tc.desc Verify reverse length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.reverse();
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayReversePart01Test011
     * @tc.desc Verify reverse length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      arr.reverse();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayReversePart01Test012
     * @tc.desc Verify int32 2147483647 reverse MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 0, 0]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayReversePart01Test013
     * @tc.desc Verify int32 2147483647 reverse MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 2147483647]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayReversePart01Test014
     * @tc.desc Verify int32 -2147483648 reverse MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648 as number, 0, 0]);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayReversePart01Test015
     * @tc.desc Verify int32 -2147483648 reverse MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, -2147483648 as number]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayReversePart01Test016
     * @tc.desc Verify -1(0xFFFFFFFF ) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 5, 9]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayReversePart01Test017
     * @tc.desc Verify -1 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 9, -1]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayReversePart01Test018
     * @tc.desc Verify 0 reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayReversePart01Test019
     * @tc.desc Verify 0 reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 0, 4, 5]);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayReversePart01Test020
     * @tc.desc Verify MAX reverse MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-10, -20, 2147483647, 20, 10]);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayReversePart01Test021
     * @tc.desc Verify MIN reverse MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, -2147483648 as number, -20, -10]);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayReversePart01Test022
     * @tc.desc Verify [MAX, MIN]reverse [MIN, MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648 as number]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayReversePart01Test023
     * @tc.desc Verify [MIN, MAX]reverse [MAX, MIN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648 as number, 2147483647]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayReversePart01Test024
     * @tc.desc Verify 1 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 100, 200]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(200);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayReversePart01Test025
     * @tc.desc Verify -2 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2, -100, -200]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-200);
      expect(arr.$_get(2)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayReversePart01Test026
     * @tc.desc Verify 99 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 99]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayReversePart01Test027
     * @tc.desc Verify -99 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-10, -20, -99]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-99);
      expect(arr.$_get(2)).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayReversePart01Test028
     * @tc.desc Verify 7 reverse 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayReversePart01Test029
     * @tc.desc Verify -5 reverse -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5, -5, -5]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-5);
      expect(arr.$_get(1)).assertEqual(-5);
      expect(arr.$_get(2)).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayReversePart01Test030
     * @tc.desc Verify 0 reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayReversePart01Test031
     * @tc.desc Verify [1,2,3,4,5]reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayReversePart01Test032
     * @tc.desc Verify [5,4,3,2,1]reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 4, 3, 2, 1]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayReversePart01Test033
     * @tc.desc Verify [1,2,3,2,1]reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 2, 1]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayReversePart01Test034
     * @tc.desc Verify [1,-1,2,-2,3]reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -1, 2, -2, 3]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(-2);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(-1);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayReversePart01Test035
     * @tc.desc Verify 0 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 0, 0, 0, 9]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayReversePart01Test036
     * @tc.desc Verify [-1,0,1]reverse [1,0,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayReversePart01Test037
     * @tc.desc Verify [0,-0]reverse 0 -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -0]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayReversePart01Test038
     * @tc.desc Verify [-5,-4,-3,-2,-1]reverse [-1,-2,-3,-4,-5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5, -4, -3, -2, -1]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(-3);
      expect(arr.$_get(4)).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayReversePart01Test039
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42, 0, 0, 0]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayReversePart01Test040
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 99]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayReversePart01Test041
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 77, 0, 0]);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(77);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayReversePart01Test042
     * @tc.desc Verify [1,2,2,1]reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 2, 1]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayReversePart01Test043
     * @tc.desc Verify [1,-1,1,-1]reverse [-1,1,-1,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -1, 1, -1]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(-1);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayReversePart01Test044
     * @tc.desc Verify [1,-1,0,-1,1]reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -1, 0, -1, 1]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(-1);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayReversePart01Test045
     * @tc.desc Verify [MIN,-1,0,0,-1,MAX]reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648 as number, -1, 0, 0, -1, 2147483647]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(4)).assertEqual(-1);
      expect(arr.$_get(5)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayReversePart01Test046
     * @tc.desc Verify MAX reverse MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayReversePart01Test047
     * @tc.desc Verify MIN reverse MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648 as number]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayReversePart01Test048
     * @tc.desc Verify -1 reverse -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayReversePart01Test049
     * @tc.desc Verify 0 reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayReversePart01Test050
     * @tc.desc Verify MIN MAX reverse MAX MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648 as number, 0, 2147483647]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayReversePart01Test051
     * @tc.desc Verify MAX MIN reverse MIN MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 0, -2147483648 as number]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayReversePart01Test052
     * @tc.desc Verify -1 reverse -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 5, -1]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayReversePart01Test053
     * @tc.desc Verify 0 reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 7, 0]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayReversePart01Test054
     * @tc.desc Verify 1 2147483647 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 1000000, 2147483647]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(1000000);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayReversePart01Test055
     * @tc.desc Verify -1 -2147483648 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1000000, -2147483648 as number]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-1000000);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayReversePart01Test056
     * @tc.desc Verify 0xFF(255) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0xFF, 0, 0]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayReversePart01Test057
     * @tc.desc Verify 0o77(63) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0o77, 0]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(63);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayReversePart01Test058
     * @tc.desc Verify 0b1010(10) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0b1010]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayReversePart01Test059
     * @tc.desc Verify Int32Array.of reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayReversePart01Test060
     * @tc.desc Verify [10,20,30,40]reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(40);
      expect(arr.$_get(1)).assertEqual(30);
      expect(arr.$_get(2)).assertEqual(20);
      expect(arr.$_get(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayReversePart01Test061
     * @tc.desc Verify 7 [-3,-2,-1,0,1,2,3]reverse 3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, -2, -1, 0, 1, 2, 3]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(0);
      expect(arr.$_get(6)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayReversePart01Test062
     * @tc.desc Verify NaN ToInt32 0 reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([Number.NaN, 1]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayReversePart01Test063
     * @tc.desc Verify +Infinity ToInt32 0 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([Number.POSITIVE_INFINITY, 2]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayReversePart01Test064
     * @tc.desc Verify -Infinity ToInt32 0 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([(-Number.POSITIVE_INFINITY), 3]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayReversePart01Test065
     * @tc.desc Verify 3.999 ToInt32 3 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3.999, 10]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayReversePart01Test066
     * @tc.desc Verify -3.999 ToInt32 -3 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3.999, -10]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-10);
      expect(arr.$_get(1)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayReversePart01Test067
     * @tc.desc Verify 2147483648(MAX+1) ToInt32 -2147483648 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483648 as number, 1]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayReversePart01Test068
     * @tc.desc Verify 2147483649(MAX+2) ToInt32 -2147483647 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483649 as number, 2]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayReversePart01Test069
     * @tc.desc Verify -2147483649(MIN-1) ToInt32 2147483647 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483649 as number, 3]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayReversePart01Test070
     * @tc.desc Verify 4294967295(0xFFFFFFFF) ToInt32 -1 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4294967295 as number, 4]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayReversePart01Test071
     * @tc.desc Verify 4294967296(2^32) ToInt32 0 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4294967296 as number, 5]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayReversePart01Test072
     * @tc.desc Verify reverse ToInt32 int32 MAX reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 0]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayReversePart01Test073
     * @tc.desc Verify reverse ToInt32 int32 MIN reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -2147483648 as number]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayReversePart01Test074
     * @tc.desc Verify reverse ToInt32 0 NaN/Infinity/-Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([Number.NaN, Number.POSITIVE_INFINITY, (-Number.POSITIVE_INFINITY)]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_7500
     * @tc.name int32ArrayReversePart01Test075
     * @tc.desc Verify [3.5,-3.5] [3,-3]reverse [-3,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3.5, -3.5]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-3);
      expect(arr.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_7600
     * @tc.name int32ArrayReversePart01Test076
     * @tc.desc Verify zero-init reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_7700
     * @tc.name int32ArrayReversePart01Test077
     * @tc.desc Verify -2147483648(MAX+1) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648 as number, 1, 2]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_7800
     * @tc.name int32ArrayReversePart01Test078
     * @tc.desc Verify 3(3.5 ) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 10, 20]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART01_TEST_MINDMAP_7900
     * @tc.name int32ArrayReversePart01Test079
     * @tc.desc Verify -3(-3.5 ) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, -10, -20]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-20);
      expect(arr.$_get(2)).assertEqual(-3);
    });

  });
}
