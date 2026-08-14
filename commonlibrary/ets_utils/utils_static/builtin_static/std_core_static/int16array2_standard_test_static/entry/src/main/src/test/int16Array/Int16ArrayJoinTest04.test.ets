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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int16ArrayJoinTestFourTest(): void {
  describe('Int16ArrayJoinTestFourTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_0100
     * @tc.name testInt16ArrayJoinTestFour001
     * @tc.desc Verify join does not modify middle element of original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      arr.join();
      let actual1: number = arr.$_get(1);
      expect(actual1).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_0200
     * @tc.name testInt16ArrayJoinTestFour002
     * @tc.desc Verify join does not modify last element of original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      arr.join();
      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_0300
     * @tc.name testInt16ArrayJoinTestFour003
     * @tc.desc Verify multiple join calls on same array produce identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let r1 = arr.join('|');
      let r2 = arr.join('|');
      let r3 = arr.join('|');
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_0400
     * @tc.name testInt16ArrayJoinTestFour004
     * @tc.desc Verify join after join on same array with different separators yields correct second result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      arr.join(',');
      let result = arr.join('|');
      expect(result).assertEqual('10|20|30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_0500
     * @tc.name testInt16ArrayJoinTestFour005
     * @tc.desc Verify join reflects element changed via $_set at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      arr.$_set(0, 99);
      let result = arr.join();
      expect(result).assertEqual('99,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_0600
     * @tc.name testInt16ArrayJoinTestFour006
     * @tc.desc Verify join reflects element changed via $_set at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      arr.$_set(2, 88);
      let result = arr.join();
      expect(result).assertEqual('10,20,88');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_0700
     * @tc.name testInt16ArrayJoinTestFour007
     * @tc.desc Verify join reflects element changed via $_set at middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      arr.$_set(1, 55);
      let result = arr.join('-');
      expect(result).assertEqual('10-55-30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_0800
     * @tc.name testInt16ArrayJoinTestFour008
     * @tc.desc Verify join after fill entire array with -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      arr.fill(-1);
      let result = arr.join('|');
      expect(result).assertEqual('-1|-1|-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_0900
     * @tc.name testInt16ArrayJoinTestFour009
     * @tc.desc Verify join after fill partial range from index 1 to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40, 50);
      arr.fill(99, 1, 3);
      let result = arr.join();
      expect(result).assertEqual('10,99,99,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_1000
     * @tc.name testInt16ArrayJoinTestFour010
     * @tc.desc Verify join after fill with int16.MIN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      arr.fill(-32768);
      let result = arr.join(',');
      expect(result).assertEqual('-32768,-32768,-32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_1100
     * @tc.name testInt16ArrayJoinTestFour011
     * @tc.desc Verify join after sort with negative and positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-5, 100, -300, 50);
      arr.sort();
      let result = arr.join('|');
      expect(result).assertEqual('-300|-5|50|100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_1200
     * @tc.name testInt16ArrayJoinTestFour012
     * @tc.desc Verify join after copyWithin reflects moved elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40);
      arr.copyWithin(0, 2);
      let result = arr.join();
      expect(result).assertEqual('30,40,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_1300
     * @tc.name testInt16ArrayJoinTestFour013
     * @tc.desc Verify join after copyWithin with negative target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40, 50);
      arr.copyWithin(-2, 0);
      let result = arr.join();
      expect(result).assertEqual('10,20,30,10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_1400
     * @tc.name testInt16ArrayJoinTestFour014
     * @tc.desc Verify join after set from another Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40);
      let src = Int16Array.of(99, 88);
      arr.set(src, 1);
      let result = arr.join();
      expect(result).assertEqual('10,99,88,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_1500
     * @tc.name testInt16ArrayJoinTestFour015
     * @tc.desc Verify join after multiple $_set mutations reflects final state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40);
      arr.$_set(0, 1);
      arr.$_set(2, 3);
      arr.$_set(3, 5);
      let result = arr.join();
      expect(result).assertEqual('1,20,3,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_1600
     * @tc.name testInt16ArrayJoinTestFour016
     * @tc.desc Verify two non-overlapping views on same buffer, write through first, join on second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view1 = new Int16Array(buf, 0, 2);
      let view2 = new Int16Array(buf, 4, 2);
      view1.$_set(0, 99);
      view1.$_set(1, 88);
      view2.$_set(0, 11);
      view2.$_set(1, 22);
      let result = view2.join();
      expect(result).assertEqual('11,22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_1700
     * @tc.name testInt16ArrayJoinTestFour017
     * @tc.desc Verify write through view1 then check join on view2 for overlapping region at offset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view1 = new Int16Array(buf, 0, 4);
      let view2 = new Int16Array(buf, 2, 2);
      view1.$_set(0, 100);
      view1.$_set(1, 200);
      let secondResult = view2.join();
      expect(secondResult).assertEqual('200,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_1800
     * @tc.name testInt16ArrayJoinTestFour018
     * @tc.desc Verify write through view2 then check join on view1 for shared element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view1 = new Int16Array(buf, 0, 4);
      let view2 = new Int16Array(buf, 2, 2);
      view2.$_set(0, 77);
      let firstResult = view1.join();
      expect(firstResult).assertEqual('0,77,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_1900
     * @tc.name testInt16ArrayJoinTestFour019
     * @tc.desc Verify parent view join reflects subarray modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = Int16Array.of(10, 20, 30, 40);
      let sub = parent.subarray(1, 3);
      sub.$_set(0, 99);
      let result = parent.join();
      expect(result).assertEqual('10,99,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_2000
     * @tc.name testInt16ArrayJoinTestFour020
     * @tc.desc Verify subarray join reflects parent modification at shared index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = Int16Array.of(10, 20, 30, 40);
      let sub = parent.subarray(1, 3);
      parent.$_set(1, 55);
      let result = sub.join();
      expect(result).assertEqual('55,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_2100
     * @tc.name testInt16ArrayJoinTestFour021
     * @tc.desc Verify modify parent at index outside subarray range, subarray join unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = Int16Array.of(10, 20, 30, 40);
      let sub = parent.subarray(1, 3);
      parent.$_set(0, 999);
      let result = sub.join();
      expect(result).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_2200
     * @tc.name testInt16ArrayJoinTestFour022
     * @tc.desc Verify two subarrays from same parent, modify one, check join on other (non-overlapping)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = Int16Array.of(10, 20, 30, 40, 50);
      let sub1 = parent.subarray(0, 2);
      let sub2 = parent.subarray(3, 5);
      sub1.$_set(0, 99);
      let result = sub2.join();
      expect(result).assertEqual('40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_2300
     * @tc.name testInt16ArrayJoinTestFour023
     * @tc.desc Verify two overlapping subarrays, modify first, check join on second at overlapping index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = Int16Array.of(10, 20, 30, 40);
      let sub1 = parent.subarray(0, 3);
      let sub2 = parent.subarray(1, 4);
      sub1.$_set(1, 77);
      let result = sub2.join();
      expect(result).assertEqual('77,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_2400
     * @tc.name testInt16ArrayJoinTestFour024
     * @tc.desc Verify fill through parent in subarray visible range, join on subarray reflects it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = Int16Array.of(10, 20, 30, 40, 50);
      let sub = parent.subarray(1, 4);
      parent.fill(88, 1, 4);
      let result = sub.join();
      expect(result).assertEqual('88,88,88');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_2500
     * @tc.name testInt16ArrayJoinTestFour025
     * @tc.desc Verify reverse through parent, join on subarray reflects reversed order in its range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = Int16Array.of(10, 20, 30, 40);
      let sub = parent.subarray(1, 3);
      parent.reverse();
      let result = sub.join();
      expect(result).assertEqual('30,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_2600
     * @tc.name testInt16ArrayJoinTestFour026
     * @tc.desc Verify single-element subarray join after parent modification at that index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = Int16Array.of(10, 20, 30);
      let sub = parent.subarray(1, 2);
      parent.$_set(1, 55);
      let result = sub.join();
      expect(result).assertEqual('55');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_2700
     * @tc.name testInt16ArrayJoinTestFour027
     * @tc.desc Verify join on view at byteOffset 2 with length 2 after writing through byteOffset 0 view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view1 = new Int16Array(buf, 0, 4);
      let view2 = new Int16Array(buf, 2, 2);
      view1.fill(5);
      let result = view2.join();
      expect(result).assertEqual('5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_2800
     * @tc.name testInt16ArrayJoinTestFour028
     * @tc.desc Verify three views on same buffer, modify middle via fill, check join on outer views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let left = new Int16Array(buf, 0, 2);
      let mid = new Int16Array(buf, 4, 2);
      let right = new Int16Array(buf, 8, 2);
      left.fill(1);
      mid.fill(2);
      right.fill(3);
      let mResult = mid.join();
      let rResult = right.join();
      expect(mResult).assertEqual('2,2');
      expect(rResult).assertEqual('3,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_2900
     * @tc.name testInt16ArrayJoinTestFour029
     * @tc.desc Verify join on view constructed with explicit byteOffset and length after parent fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let full = new Int16Array(buf, 0, 5);
      let part = new Int16Array(buf, 4, 2);
      full.fill(7);
      let result = part.join(',');
      expect(result).assertEqual('7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_3000
     * @tc.name testInt16ArrayJoinTestFour030
     * @tc.desc Verify write through view at byteOffset 0, join on view at byteOffset 0 verifies start alignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let view = new Int16Array(buf, 0, 2);
      view.$_set(0, 42);
      view.$_set(1, 84);
      let result = view.join();
      expect(result).assertEqual('42,84');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_3100
     * @tc.name testInt16ArrayJoinTestFour031
     * @tc.desc Verify subarray fill with boundary value, parent join reflects it in subarray range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = Int16Array.of(10, 20, 30, 40);
      let sub = parent.subarray(1, 3);
      sub.fill(-32768);
      let result = parent.join();
      expect(result).assertEqual('10,-32768,-32768,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_3200
     * @tc.name testInt16ArrayJoinTestFour032
     * @tc.desc Verify join shows truncated floating -3.7 as -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(1);
      arr.$_set(0, -3.7);
      let result = arr.join();
      expect(result).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_3300
     * @tc.name testInt16ArrayJoinTestFour033
     * @tc.desc Verify join on array with multiple overflow values shows all truncations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(3);
      arr.$_set(0, 32768);
      arr.$_set(1, 32769);
      arr.$_set(2, -32769);
      let result = arr.join('|');
      expect(result).assertEqual('-32768|-32767|32767');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_3400
     * @tc.name testInt16ArrayJoinTestFour034
     * @tc.desc Verify join on array with mixed normal and overflow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr2 = new Int16Array(6);
      arr2.$_set(0, 0);
      arr2.$_set(1, 1);
      arr2.$_set(2, -1);
      arr2.$_set(3, 32768);
      arr2.$_set(4, -32769);
      arr2.$_set(5, 32767);
      let result = arr2.join();
      expect(result).assertEqual('0,1,-1,-32768,32767,32767');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_3500
     * @tc.name testInt16ArrayJoinTestFour035
     * @tc.desc Verify join on array constructed from of() with extreme values at boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-32768, -1, 0, 1, 32767);
      let result = arr.join();
      expect(result).assertEqual('-32768,-1,0,1,32767');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_3600
     * @tc.name testInt16ArrayJoinTestFour036
     * @tc.desc Verify reverse then join chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40);
      let result = arr.reverse().join('|');
      expect(result).assertEqual('40|30|20|10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_3700
     * @tc.name testInt16ArrayJoinTestFour037
     * @tc.desc Verify fill then reverse then join chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40);
      let result = arr.fill(0, 2).reverse().join('-');
      expect(result).assertEqual('0-0-20-10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_3800
     * @tc.name testInt16ArrayJoinTestFour038
     * @tc.desc Verify sort then reverse then join chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(40, 10, 50, 20);
      let result = arr.sort().reverse().join();
      expect(result).assertEqual('50,40,20,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_3900
     * @tc.name testInt16ArrayJoinTestFour039
     * @tc.desc Verify copyWithin then reverse then join chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40);
      let result = arr.copyWithin(0, 2).reverse().join();
      expect(result).assertEqual('40,30,40,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_4000
     * @tc.name testInt16ArrayJoinTestFour040
     * @tc.desc Verify subarray then fill then join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40, 50);
      let result = arr.subarray(1, 4).fill(0).join('|');
      expect(result).assertEqual('0|0|0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_4100
     * @tc.name testInt16ArrayJoinTestFour041
     * @tc.desc Verify slice then join does not affect original array join output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40, 50);
      arr.slice(1, 4);
      let result = arr.join();
      expect(result).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_4200
     * @tc.name testInt16ArrayJoinTestFour042
     * @tc.desc Verify toReversed then join returns reversed string without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let result = arr.toReversed().join();
      let origResult = arr.join();
      expect(result).assertEqual('30,20,10');
      expect(origResult).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_4300
     * @tc.name testInt16ArrayJoinTestFour043
     * @tc.desc Verify toSorted then join returns sorted string without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(30, 10, 20);
      let result = arr.toSorted().join();
      let origResult = arr.join();
      expect(result).assertEqual('10,20,30');
      expect(origResult).assertEqual('30,10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_4400
     * @tc.name testInt16ArrayJoinTestFour044
     * @tc.desc Verify with then join returns string with replaced element, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let replaced = arr.with(1, 99);
      let replacedResult = replaced.join();
      let origResult = arr.join();
      expect(replacedResult).assertEqual('10,99,30');
      expect(origResult).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_4500
     * @tc.name testInt16ArrayJoinTestFour045
     * @tc.desc Verify join then split round-trip preserves element count with default separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let joined = arr.join();
      let parts = joined.split(',');
      let actual1: int = parts.length;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_4600
     * @tc.name testInt16ArrayJoinTestFour046
     * @tc.desc Verify join then split round-trip with custom separator preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let joined = arr.join('|');
      let parts = joined.split('|');
      let actual1: int = parts.length;
      expect(actual1).assertEqual(3);
      let actual2: string = parts[0];
      expect(actual2).assertEqual('10');
      let actual3: string = parts[1];
      expect(actual3).assertEqual('20');
      let actual4: string = parts[2];
      expect(actual4).assertEqual('30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_4700
     * @tc.name testInt16ArrayJoinTestFour047
     * @tc.desc Verify join with empty string separator then split returns each digit separately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20);
      let joined = arr.join('');
      let length = joined.length;
      expect(length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_4800
     * @tc.name testInt16ArrayJoinTestFour048
     * @tc.desc Verify join result split then parseInt and reconstruct new Int16Array, re-join yields same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let joined = arr.join(',');
      let parts = joined.split(',');
      let firstPart: number = parseInt(parts[0]);
      let secondPart: number = parseInt(parts[1]);
      let thirdPart: number = parseInt(parts[2]);
      let newArr = Int16Array.of(firstPart.toInt(), secondPart.toInt(), thirdPart.toInt());
      let result = newArr.join(',');
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_4900
     * @tc.name testInt16ArrayJoinTestFour049
     * @tc.desc Verify join on view at non-zero byteOffset within ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let full = new Int16Array(buf, 0, 5);
      full.fill(1);
      let part = new Int16Array(buf, 4, 2);
      part.$_set(0, 99);
      part.$_set(1, 88);
      let result = part.join();
      expect(result).assertEqual('99,88');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_5000
     * @tc.name testInt16ArrayJoinTestFour050
     * @tc.desc Verify join on array where elements built via loop $_set with ascending values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(5);
      for (let i = 0; i < 5; i++) {
        arr.$_set(i, i * 10);
      }
      let result = arr.join();
      expect(result).assertEqual('0,10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_5100
     * @tc.name testInt16ArrayJoinTestFour051
     * @tc.desc Verify join on array where elements built via loop $_set with descending values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(4);
      for (let i = 0; i < 4; i++) {
        arr.$_set(i, 40 - i * 10);
      }
      let result = arr.join('-');
      expect(result).assertEqual('40-30-20-10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_5200
     * @tc.name testInt16ArrayJoinTestFour052
     * @tc.desc Verify join on array of all identical values from of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(7, 7, 7, 7);
      let result = arr.join();
      expect(result).assertEqual('7,7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_5300
     * @tc.name testInt16ArrayJoinTestFour053
     * @tc.desc Verify join on array with alternating MAX and MIN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(32767, -32768, 32767, -32768);
      let result = arr.join('|');
      expect(result).assertEqual('32767|-32768|32767|-32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_5400
     * @tc.name testInt16ArrayJoinTestFour054
     * @tc.desc Verify join on array after set with offset into middle of target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40, 50);
      let src = Int16Array.of(99, 88);
      arr.set(src, 2);
      let result = arr.join();
      expect(result).assertEqual('10,20,99,88,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_5500
     * @tc.name testInt16ArrayJoinTestFour055
     * @tc.desc Verify join after fill range then sort chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(50, 40, 30, 20, 10);
      let result = arr.fill(0, 3).sort().join();
      expect(result).assertEqual('0,0,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_5600
     * @tc.name testInt16ArrayJoinTestFour056
     * @tc.desc Verify join on array after sequential fill with different values per region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(6);
      arr.fill(1, 0, 2);
      arr.fill(2, 2, 4);
      arr.fill(3, 4, 6);
      let result = arr.join();
      expect(result).assertEqual('1,1,2,2,3,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_FOUR_5700
     * @tc.name testInt16ArrayJoinTestFour057
     * @tc.desc Verify parent fill then subarray join then parent join consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = Int16Array.of(10, 20, 30, 40);
      let sub = parent.subarray(1, 3);
      parent.fill(99, 1, 3);
      let subResult = sub.join();
      let parentResult = parent.join();
      expect(subResult).assertEqual('99,99');
      expect(parentResult).assertEqual('10,99,99,40');
    });
  });
}
