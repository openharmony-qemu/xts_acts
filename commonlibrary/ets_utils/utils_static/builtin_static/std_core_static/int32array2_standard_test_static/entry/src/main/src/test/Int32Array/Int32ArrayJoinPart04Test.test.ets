'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

export default function int32ArrayJoinPart04Test(): void {
  describe('Int32ArrayJoinPart04Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayJoinPart04TestMindmapTest001
     * @tc.desc Verify join() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let lenBefore: number = arr.length;
      arr.join();
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayJoinPart04TestMindmapTest002
     * @tc.desc Verify join(separator) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let lenBefore: number = arr.length;
      arr.join('-');
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayJoinPart04TestMindmapTest003
     * @tc.desc Verify join() $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 2147483647, -2147483648]);
      let firstVal: number = arr.$_get(0);
      let secondVal: number = arr.$_get(1);
      let thirdVal: number = arr.$_get(2);
      let fourthVal: number = arr.$_get(3);
      arr.join();
      expect(arr.$_get(0)).assertEqual(firstVal);
      expect(arr.$_get(1)).assertEqual(secondVal);
      expect(arr.$_get(2)).assertEqual(thirdVal);
      expect(arr.$_get(3)).assertEqual(fourthVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayJoinPart04TestMindmapTest004
     * @tc.desc Verify join('')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      arr.join('');
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayJoinPart04TestMindmapTest005
     * @tc.desc Verify join() ArrayBuffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let bl: number = arr.buffer.byteLength;
      arr.join();
      expect(arr.buffer.byteLength).assertEqual(bl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayJoinPart04TestMindmapTest006
     * @tc.desc Verify join() byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let off: number = arr.byteOffset;
      arr.join();
      expect(arr.byteOffset).assertEqual(off);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayJoinPart04TestMindmapTest007
     * @tc.desc Verify join() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.join();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayJoinPart04TestMindmapTest008
     * @tc.desc Verify separator join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sDash: string = arr.join('-');
      let sPipe: string = arr.join('|');
      expect(sDash).assertEqual('1-2-3');
      expect(sPipe).assertEqual('1|2|3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayJoinPart04TestMindmapTest009
     * @tc.desc Verify join() join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let s1: string = arr.join();
      arr.$_set(0, 99);
      let s2: string = arr.join();
      expect(s1).assertEqual('1,2,3');
      expect(s2).assertEqual('99,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayJoinPart04TestMindmapTest010
     * @tc.desc Verify join() length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      arr.join(',');
      expect(arr.$_get(0)).assertEqual(42);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayJoinPart04TestMindmapTest011
     * @tc.desc Verify reverse() join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let s: string = arr.reverse().join();
      expect(s).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayJoinPart04TestMindmapTest012
     * @tc.desc Verify reverse().join() Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let s: string = arr.reverse().join();
      expect(s).assertEqual('2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayJoinPart04TestMindmapTest013
     * @tc.desc Verify reverse().join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reverse().join();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayJoinPart04TestMindmapTest014
     * @tc.desc Verify sort() join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let s: string = arr.sort().join();
      expect(s).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayJoinPart04TestMindmapTest015
     * @tc.desc Verify fill(0) join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let s: string = arr.fill(0).join();
      expect(s).assertEqual('0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayJoinPart04TestMindmapTest016
     * @tc.desc Verify fill(-1).join() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let s: string = arr.fill(-1).join();
      expect(s).assertEqual('-1,-1,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayJoinPart04TestMindmapTest017
     * @tc.desc Verify copyWithin join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let s: string = arr.copyWithin(2, 0, 2).join();
      expect(s).assertEqual('1,2,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayJoinPart04TestMindmapTest018
     * @tc.desc Verify reverse join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reverse();
      arr.reverse();
      expect(arr.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayJoinPart04TestMindmapTest019
     * @tc.desc Verify fill join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      let s: string = arr.fill(2147483647).join();
      expect(s).assertEqual('2147483647,2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayJoinPart04TestMindmapTest020
     * @tc.desc Verify set(array) join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let src: Int32Array = new Int32Array([10, 20]);
      arr.set(src, 1);
      expect(arr.join()).assertEqual('0,10,20,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayJoinPart04TestMindmapTest021
     * @tc.desc Verify $_set Number.NaN join '0' Number.NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, Number.NaN);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayJoinPart04TestMindmapTest022
     * @tc.desc Verify Number.NaN ToInt32 0 join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([Number.NaN]);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayJoinPart04TestMindmapTest023
     * @tc.desc Verify $_set +Number.POSITIVE_INFINITY join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayJoinPart04TestMindmapTest024
     * @tc.desc Verify $_set -Number.POSITIVE_INFINITY join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, Number.NEGATIVE_INFINITY);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayJoinPart04TestMindmapTest025
     * @tc.desc Verify $_set 3.5 3 join '3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 3.5);
      expect(arr.join()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayJoinPart04TestMindmapTest026
     * @tc.desc Verify $_set -3.5 -3 join '-3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -3.5);
      expect(arr.join()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayJoinPart04TestMindmapTest027
     * @tc.desc Verify $_set 3.999 3 join '3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 3.999);
      expect(arr.join()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayJoinPart04TestMindmapTest028
     * @tc.desc Verify $_set 2147483648 -2147483648 join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483648);
      expect(arr.join()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayJoinPart04TestMindmapTest029
     * @tc.desc Verify $_set 2147483649 -2147483647 join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483649);
      expect(arr.join()).assertEqual('-2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayJoinPart04TestMindmapTest030
     * @tc.desc Verify $_set -2147483649 2147483647 join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -2147483649);
      expect(arr.join()).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayJoinPart04TestMindmapTest031
     * @tc.desc Verify $_set 4294967295 (0xFFFFFFFF) -1 join '-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 4294967295);
      expect(arr.join()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayJoinPart04TestMindmapTest032
     * @tc.desc Verify $_set 4294967296 (0x100000000) 0 join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 4294967296);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayJoinPart04TestMindmapTest033
     * @tc.desc Verify $_set -0 join '0' -0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -0);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayJoinPart04TestMindmapTest034
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483648, -2147483649, 4294967295]);
      let s: string = arr.join(',');
      expect(s).assertEqual('-2147483648,2147483647,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayJoinPart04TestMindmapTest035
     * @tc.desc Verify $_set 0.1 0 join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 0.1);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayJoinPart04TestMindmapTest036
     * @tc.desc Verify $_set -0.9 0 join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -0.9);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayJoinPart04TestMindmapTest037
     * @tc.desc Verify ArrayBuffer join 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      expect(arr.join()).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayJoinPart04TestMindmapTest038
     * @tc.desc Verify A B buffer join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 0, 2);
      a.$_set(0, 77);
      a.$_set(1, 88);
      expect(b.join()).assertEqual('77,88');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayJoinPart04TestMindmapTest039
     * @tc.desc Verify subarray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub: Int32Array = arr.subarray(1, 3);
      expect(sub.join()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayJoinPart04TestMindmapTest040
     * @tc.desc Verify subarray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub: Int32Array = arr.subarray(1, 3);
      arr.$_set(1, 99);
      expect(sub.join()).assertEqual('99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayJoinPart04TestMindmapTest041
     * @tc.desc Verify subarray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub: Int32Array = arr.subarray(1, 3);
      sub.$_set(0, 55);
      expect(arr.join()).assertEqual('1,55,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayJoinPart04TestMindmapTest042
     * @tc.desc Verify byteOffset subarray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      arr.$_set(3, 40);
      let sub: Int32Array = arr.subarray(2);
      expect(sub.join()).assertEqual('30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayJoinPart04TestMindmapTest043
     * @tc.desc Verify buffer offset Int32Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      a.$_set(0, 1);
      a.$_set(1, 2);
      b.$_set(0, 3);
      b.$_set(1, 4);
      expect(a.join()).assertEqual('1,2');
      expect(b.join()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayJoinPart04TestMindmapTest044
     * @tc.desc Verify slice buffer slice join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let cp: Int32Array = arr.slice();
      cp.$_set(0, 999);
      expect(arr.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayJoinPart04TestMindmapTest045
     * @tc.desc Verify subarray buffer subarray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray();
      sub.$_set(0, 999);
      expect(arr.join()).assertEqual('999,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayJoinPart04TestMindmapTest046
     * @tc.desc Verify 0 subarray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray(1, 1);
      expect(sub.join()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayJoinPart04TestMindmapTest047
     * @tc.desc Verify subarray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray(1, 2);
      expect(sub.join(',')).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArrayJoinPart04TestMindmapTest048
     * @tc.desc Verify subarray(0) join join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray(0);
      expect(sub.join()).assertEqual(arr.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArrayJoinPart04TestMindmapTest049
     * @tc.desc Verify buffer join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 4, 1);
      a.$_set(1, -2147483648);
      expect(b.join()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArrayJoinPart04TestMindmapTest050
     * @tc.desc Verify of(1,2,3).join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArrayJoinPart04TestMindmapTest051
     * @tc.desc Verify from([1,2,3]).join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int32Array = new Int32Array([1, 2, 3]);
      let arr: Int32Array = Int32Array.from(source);
      expect(arr.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArrayJoinPart04TestMindmapTest052
     * @tc.desc Verify [7,7,7,7] join '7,7,7,7'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
      expect(arr.join()).assertEqual('7,7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArrayJoinPart04TestMindmapTest053
     * @tc.desc Verify [0,-0,0] join '0,0,0' -0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 0);
      arr.$_set(1, -0);
      arr.$_set(2, 0);
      expect(arr.join()).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArrayJoinPart04TestMindmapTest054
     * @tc.desc Verify join length-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(100);
      let s: string = arr.join();
      let commaCount: number = 0;
      for (let i: int = 0; i < s.length; i++) {
        if (s.charAt(i).toString() === ',') {
          commaCount = commaCount + 1;
        }
      }
      expect(commaCount).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArrayJoinPart04TestMindmapTest055
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let s: string = '[' + arr.join(',') + ']';
      expect(s).assertEqual('[1,2]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArrayJoinPart04TestMindmapTest056
     * @tc.desc Verify join('-') length + (n-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 22, 333]);
      let s: string = arr.join('-');
      expect(s.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArrayJoinPart04TestMindmapTest057
     * @tc.desc Verify toString() join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3]);
      expect(arr.toString()).assertEqual(arr.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArrayJoinPart04TestMindmapTest058
     * @tc.desc Verify join split
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let s: string = arr.join(',');
      let parts: string[] = s.split(',');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual('10');
      expect(parts[2]).assertEqual('30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArrayJoinPart04TestMindmapTest059
     * @tc.desc Verify join() separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let s1: string = arr.join(',');
      let s2: string = arr.join('---');
      let s3: string = arr.join('');
      expect(s1).assertEqual('1,2');
      expect(s2).assertEqual('1---2');
      expect(s3).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArrayJoinPart04TestMindmapTest060
     * @tc.desc Verify int32 MIN fill join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(-2147483648);
      let s: string = arr.join(',');
      expect(s).assertEqual('-2147483648,-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArrayJoinPart04TestMindmapTest061
     * @tc.desc Verify set join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array([2147483648, 4294967295]);
      dst.set(src, 1);
      expect(dst.join()).assertEqual('0,-2147483648,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArrayJoinPart04TestMindmapTest062
     * @tc.desc Verify from Number.NaN/Number.POSITIVE_INFINITY join 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int32Array = new Int32Array(3);
      source.$_set(0, Number.NaN);
      source.$_set(1, Number.POSITIVE_INFINITY);
      source.$_set(2, Number.NEGATIVE_INFINITY);
      let arr: Int32Array = Int32Array.from(source);
      expect(arr.join()).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArrayJoinPart04TestMindmapTest063
     * @tc.desc Verify reverse join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648, 0, -1]);
      let s: string = arr.reverse().join(',');
      expect(s).assertEqual('-1,0,-2147483648,2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArrayJoinPart04TestMindmapTest064
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let a: Int32Array = new Int32Array(buf, 0, 1);
      let b: Int32Array = new Int32Array(buf, 0, 1);
      a.$_set(0, 11);
      b.$_set(0, 22);
      expect(a.join()).assertEqual('22');
      expect(b.join()).assertEqual('22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArrayJoinPart04TestMindmapTest065
     * @tc.desc Verify reverse/join reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let s: string = arr.reverse().join();
      expect(s).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArrayJoinPart04TestMindmapTest066
     * @tc.desc Verify fill join fill length=0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let s: string = arr.fill(9).join();
      expect(s).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArrayJoinPart04TestMindmapTest067
     * @tc.desc Verify join join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      let s1: string = arr.join();
      arr.$_set(0, 100);
      arr.$_set(1, 200);
      let s2: string = arr.join();
      expect(s1).assertEqual('0,0');
      expect(s2).assertEqual('100,200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArrayJoinPart04TestMindmapTest068
     * @tc.desc Verify [0] join join('-') join('') '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      expect(arr.join()).assertEqual('0');
      expect(arr.join('-')).assertEqual('0');
      expect(arr.join('')).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArrayJoinPart04TestMindmapTest069
     * @tc.desc Verify ArrayBuffer Int32Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let b: Int32Array = new Int32Array([3, 4]);
      let sa: string = a.join('-');
      let sb: string = b.join('-');
      expect(sa).assertEqual('1-2');
      expect(sb).assertEqual('3-4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArrayJoinPart04TestMindmapTest070
     * @tc.desc Verify join() preserves INT32_MAX-1 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483646);
      expect(arr.join()).assertEqual('2147483646');
    });
  });
}
