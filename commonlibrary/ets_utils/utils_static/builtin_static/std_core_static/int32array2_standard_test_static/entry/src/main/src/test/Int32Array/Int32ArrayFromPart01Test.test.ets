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

export default function int32ArrayFromPart01Test(): void {
  describe('Int32ArrayFromPart01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayFromPart01TestMindmapTest001
     * @tc.desc Verify from() FixedArray [] length=0, byteLength=0, byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([]);
      expect(a.length).assertEqual(0);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
      expect(a.buffer.byteLength).assertEqual(0);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayFromPart01TestMindmapTest002
     * @tc.desc Verify from() FixedArray [0] length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([0] as number[]);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayFromPart01TestMindmapTest003
     * @tc.desc Verify from() FixedArray [1,2] length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([1, 2] as number[]);
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.byteOffset).assertEqual(0);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayFromPart01TestMindmapTest004
     * @tc.desc Verify from() FixedArray [10,20,30,40] length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([10, 20, 30, 40]);
      expect(a.length).assertEqual(4);
      expect(a.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayFromPart01TestMindmapTest005
     * @tc.desc Verify from() FixedArray [1,2,3,4,5,6,7] length=7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([1, 2, 3, 4, 5, 6, 7]);
      expect(a.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayFromPart01TestMindmapTest006
     * @tc.desc Verify from() [-1] 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([-1]);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayFromPart01TestMindmapTest007
     * @tc.desc Verify from() [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([10, 20, 30]);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayFromPart01TestMindmapTest008
     * @tc.desc Verify from() 0 [-5,0,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([-5, 0, 5]);
      expect(a.$_get(0)).assertEqual(-5);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayFromPart01TestMindmapTest009
     * @tc.desc Verify from() int32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([2147483647 as number]);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayFromPart01TestMindmapTest010
     * @tc.desc Verify from() int32 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([-2147483648]);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayFromPart01TestMindmapTest011
     * @tc.desc Verify from() [7,7,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([7, 7, 7] as number[]);
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(1)).assertEqual(7);
      expect(a.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayFromPart01TestMindmapTest012
     * @tc.desc Verify from() [-1,0,1,-1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([-1, 0, 1, -1, 0]);
      expect(a.$_get(0)).assertEqual(-1);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(1);
      expect(a.$_get(3)).assertEqual(-1);
      expect(a.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayFromPart01TestMindmapTest013
     * @tc.desc Verify from() [1..8] 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
      expect(a.$_get(7)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayFromPart01TestMindmapTest014
     * @tc.desc Verify from() 0 [0,0,0,0,0,0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([0, 0, 0, 0, 0, 0]);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(0);
      expect(a.$_get(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayFromPart01TestMindmapTest015
     * @tc.desc Verify from() [INT_MAX, INT_MIN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([2147483647, -2147483648]);
      expect(a.$_get(0)).assertEqual(2147483647);
      expect(a.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayFromPart01TestMindmapTest016
     * @tc.desc Verify from() FixedArray Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([1, 2, 3] as number[]);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayFromPart01TestMindmapTest017
     * @tc.desc Verify from() FixedArray buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([1] as number[]);
      expect(a.buffer.byteLength).assertEqual(4);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayFromPart01TestMindmapTest018
     * @tc.desc Verify from() buffer.byteLength byteLength=20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([1, 2, 3, 4, 5] as number[]);
      expect(a.buffer.byteLength).assertEqual(a.byteLength);
      expect(a.buffer.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayFromPart01TestMindmapTest019
     * @tc.desc Verify from Int32Array FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [1, 2, 3];
      let a: Int32Array = Int32Array.from(src);
      a.$_set(0, 99);
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayFromPart01TestMindmapTest020
     * @tc.desc Verify FixedArray from Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [1, 2, 3];
      let a: Int32Array = Int32Array.from(src);
      src[0] = 77;
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayFromPart01TestMindmapTest021
     * @tc.desc Verify from buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([1, 2] as number[]);
      let b: Int32Array = Int32Array.from([1, 2] as number[]);
      a.$_set(0, 99);
      expect(b.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayFromPart01TestMindmapTest022
     * @tc.desc Verify from() FixedArray length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [10, 20, 30];
      let srcLen: number = src.length;
      let a: Int32Array = Int32Array.from(src);
      expect(src.length).assertEqual(srcLen);
      expect(a.length).assertEqual(srcLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayFromPart01TestMindmapTest023
     * @tc.desc Verify from() Iterable mapfn Map.values() length=0, byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayFromPart01TestMindmapTest024
     * @tc.desc Verify from() Iterable mapfn Map.values() + mapfn length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => v + 1);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayFromPart01TestMindmapTest025
     * @tc.desc Verify from() Iterable Map.values() length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 5);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayFromPart01TestMindmapTest026
     * @tc.desc Verify from() Iterable Map.values() length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 10);
      m.set(1, 20);
      m.set(2, 30);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayFromPart01TestMindmapTest027
     * @tc.desc Verify from() Iterable Map.values() + mapfn length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      m.set(1, 2);
      m.set(2, 3);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => v * 2);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(2);
      expect(a.$_get(1)).assertEqual(4);
      expect(a.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayFromPart01TestMindmapTest028
     * @tc.desc Verify from() Map.values() [10,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 10);
      m.set(1, 20);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayFromPart01TestMindmapTest029
     * @tc.desc Verify from() Map.values() -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, -100);
      m.set(1, 100);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(-100);
      expect(a.$_get(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayFromPart01TestMindmapTest030
     * @tc.desc Verify from() Map.values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 0);
      m.set(1, 1);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayFromPart01TestMindmapTest031
     * @tc.desc Verify from() Map.values() length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 10);
      m.set(1, 20);
      m.set(2, 30);
      m.set(3, 40);
      m.set(4, 50);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.length).assertEqual(5);
      expect(a.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayFromPart01TestMindmapTest032
     * @tc.desc Verify from() Iterable int32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 2147483647);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayFromPart01TestMindmapTest033
     * @tc.desc Verify from() Iterable int32 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, -2147483648);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayFromPart01TestMindmapTest034
     * @tc.desc Verify from() Iterable 3.5 ToInt32 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 3.5);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayFromPart01TestMindmapTest035
     * @tc.desc Verify from() Iterable -3.5 ToInt32 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, -3.5);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayFromPart01TestMindmapTest036
     * @tc.desc Verify from() Iterable 0.999 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 0.999);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayFromPart01TestMindmapTest037
     * @tc.desc Verify from() Iterable -0.999 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, -0.999);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayFromPart01TestMindmapTest038
     * @tc.desc Verify from() Iterable Number.NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, Number.NaN);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayFromPart01TestMindmapTest039
     * @tc.desc Verify from() Iterable +Number.POSITIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, Number.POSITIVE_INFINITY);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayFromPart01TestMindmapTest040
     * @tc.desc Verify from() Iterable -Number.POSITIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, -Number.POSITIVE_INFINITY);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayFromPart01TestMindmapTest041
     * @tc.desc Verify from() Iterable 2147483648 ToInt32 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 2147483648);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayFromPart01TestMindmapTest042
     * @tc.desc Verify from() Iterable 2147483649 ToInt32 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 2147483649);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayFromPart01TestMindmapTest043
     * @tc.desc Verify from() Iterable -2147483649 ToInt32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, -2147483649);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayFromPart01TestMindmapTest044
     * @tc.desc Verify from() Iterable 4294967295 (0xFFFFFFFF) ToInt32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 4294967295);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayFromPart01TestMindmapTest045
     * @tc.desc Verify from() Iterable 4294967296 (0x100000000) ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 4294967296);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayFromPart01TestMindmapTest046
     * @tc.desc Verify from() Map.keys() Iterable<number> key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(7, 70);
      m.set(8, 80);
      m.set(9, 90);
      let a: Int32Array = Int32Array.from(m.keys());
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(1)).assertEqual(8);
      expect(a.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayFromPart01TestMindmapTest047
     * @tc.desc Verify from() Set<number> mapfn Iterable mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let a: Int32Array = Int32Array.from(s, (v: number, k: number): number => v * 10);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayFromPart01TestMindmapTest048
     * @tc.desc Verify from() Map.values() Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 5);
      m.set(1, 5);
      m.set(2, 5);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(5);
      expect(a.$_get(1)).assertEqual(5);
      expect(a.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayFromPart01TestMindmapTest049
     * @tc.desc Verify from() Iterable -0.0 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, -0.0);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayFromPart01TestMindmapTest050
     * @tc.desc Verify from() mapfn v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 10);
      m.set(1, 20);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => v);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayFromPart01TestMindmapTest051
     * @tc.desc Verify from() mapfn 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 100);
      m.set(1, 200);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(k === 0 ? 100 : 200);
        return 0;
      });
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayFromPart01TestMindmapTest052
     * @tc.desc Verify from() mapfn k [0,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 99);
      m.set(1, 88);
      m.set(2, 77);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(k === 0 ? 99 : k === 1 ? 88 : 77);
        return k;
      });
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayFromPart01TestMindmapTest053
     * @tc.desc Verify from() mapfn v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(777, 42);
      let capturedV: number = 0;
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        capturedV = v;
        return v;
      });
      expect(capturedV).assertEqual(42);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayFromPart01TestMindmapTest054
     * @tc.desc Verify from() mapfn k 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 10);
      m.set(1, 20);
      m.set(2, 30);
      let seenKs: number[] = [];
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        seenKs.push(k);
        return v;
      });
      expect(seenKs.length).assertEqual(3);
      expect(seenKs[0]).assertEqual(0);
      expect(seenKs[1]).assertEqual(1);
      expect(seenKs[2]).assertEqual(2);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayFromPart01TestMindmapTest055
     * @tc.desc Verify from() mapfn length 3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      m.set(1, 2);
      m.set(2, 3);
      let count: number = 0;
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        count++;
        return v;
      });
      expect(count).assertEqual(3);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayFromPart01TestMindmapTest056
     * @tc.desc Verify from() Iterable + mapfn mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      let count: number = 0;
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        count++;
        return v;
      });
      expect(count).assertEqual(0);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayFromPart01TestMindmapTest057
     * @tc.desc Verify from() mapfn v+k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 10);
      m.set(1, 20);
      m.set(2, 30);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => v + k);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(21);
      expect(a.$_get(2)).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayFromPart01TestMindmapTest058
     * @tc.desc Verify from() mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 100);
      m.set(1, 200);
      m.set(2, 300);
      let acc: number = 0;
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        acc = acc + v;
        return acc;
      });
      expect(a.$_get(0)).assertEqual(100);
      expect(a.$_get(1)).assertEqual(300);
      expect(a.$_get(2)).assertEqual(600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayFromPart01TestMindmapTest059
     * @tc.desc Verify from() mapfn 3.5 ToInt32 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 10);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(10);
        return 3.5;
      });
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayFromPart01TestMindmapTest060
     * @tc.desc Verify from() mapfn -3.5 ToInt32 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 10);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(10);
        return -3.5;
      });
      expect(a.$_get(0)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayFromPart01TestMindmapTest061
     * @tc.desc Verify from() mapfn 0.5 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 10);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(10);
        return 0.5;
      });
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayFromPart01TestMindmapTest062
     * @tc.desc Verify from() mapfn -0.5 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 10);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(10);
        return -0.5;
      });
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayFromPart01TestMindmapTest063
     * @tc.desc Verify from() mapfn Number.NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(1);
        return Number.NaN;
      });
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayFromPart01TestMindmapTest064
     * @tc.desc Verify from() mapfn +Number.POSITIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(1);
        return Number.POSITIVE_INFINITY;
      });
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayFromPart01TestMindmapTest065
     * @tc.desc Verify from() mapfn -Number.POSITIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(1);
        return -Number.POSITIVE_INFINITY;
      });
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayFromPart01TestMindmapTest066
     * @tc.desc Verify from() mapfn 2147483648 ToInt32 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 0);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(0);
        return 2147483648;
      });
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayFromPart01TestMindmapTest067
     * @tc.desc Verify from() mapfn -2147483649 ToInt32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 0);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(0);
        return -2147483649;
      });
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayFromPart01TestMindmapTest068
     * @tc.desc Verify from() mapfn 4294967295 ToInt32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 0);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(0);
        return 4294967295;
      });
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayFromPart01TestMindmapTest069
     * @tc.desc Verify from() mapfn 4294967296 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 0);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(0);
        return 4294967296;
      });
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayFromPart01TestMindmapTest070
     * @tc.desc Verify from() mapfn int32 MIN -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 0);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(0);
        return -2147483648;
      });
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayFromPart01TestMindmapTest071
     * @tc.desc Verify from() mapfn int32 MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 0);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(0);
        return 2147483647;
      });
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayFromPart01TestMindmapTest072
     * @tc.desc Verify from() mapfn -0.0 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(1);
        return -0.0;
      });
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayFromPart01TestMindmapTest073
     * @tc.desc Verify from() mapfn 2147483647.9 ToInt32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 0);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => {
        expect(v).assertEqual(0);
        return 2147483647.9;
      });
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayFromPart01TestMindmapTest074
     * @tc.desc Verify from() Iterable Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.byteOffset).assertEqual(0);
      expect(a.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_7500
     * @tc.name int32ArrayFromPart01TestMindmapTest075
     * @tc.desc Verify from() byteLength=12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      m.set(1, 2);
      m.set(2, 3);
      let a: Int32Array = Int32Array.from(m.values());
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_7600
     * @tc.name int32ArrayFromPart01TestMindmapTest076
     * @tc.desc Verify from() Map Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      let a: Int32Array = Int32Array.from(m.values());
      a.$_set(0, 99);
      expect(m.get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_7700
     * @tc.name int32ArrayFromPart01TestMindmapTest077
     * @tc.desc Verify from() mapfn Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => v);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_7800
     * @tc.name int32ArrayFromPart01TestMindmapTest078
     * @tc.desc Verify from() mapfn byteLength=12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      m.set(1, 2);
      m.set(2, 3);
      let a: Int32Array = Int32Array.from(m.values(), (v: number, k: number): number => v + 1);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_7900
     * @tc.name int32ArrayFromPart01TestMindmapTest079
     * @tc.desc Verify from() Map Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      m.set(1, 2);
      let a: Int32Array = Int32Array.from(m.values());
      m.set(2, 3);
      expect(a.length).assertEqual(2);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_8000
     * @tc.name int32ArrayFromPart01TestMindmapTest080
     * @tc.desc Verify from [1, 11, 21]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([1, 11, 21]);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(11);
      expect(a.$_get(2)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_8100
     * @tc.name int32ArrayFromPart01TestMindmapTest081
     * @tc.desc Verify from [0, 1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([0, 1, 2, 3] as number[]);
      expect(a.length).assertEqual(4);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_8200
     * @tc.name int32ArrayFromPart01TestMindmapTest082
     * @tc.desc Verify from with mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([1, 2] as number[], (v: number, k: number): number => v * 100);
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(100);
      expect(a.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_8300
     * @tc.name int32ArrayFromPart01TestMindmapTest083
     * @tc.desc Verify from() mapfn throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from([1, 2, 3] as number[], (v: number, k: number): number => {
          expect(v).assertEqual(1);
          throw new Error('iter throw on first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_8400
     * @tc.name int32ArrayFromPart01TestMindmapTest084
     * @tc.desc Verify from() mapfn throws on third
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from([10, 20, 30] as number[], (v: number, k: number): number => {
          if (k === 2) {
            throw new Error('iter throw on third');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_8500
     * @tc.name int32ArrayFromPart01TestMindmapTest085
     * @tc.desc Verify from() mapfn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      m.set(1, 2);
      try {
        Int32Array.from(m.values(), (v: number, k: number): number => {
          throw new Error('mapfn throw at 0');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_8600
     * @tc.name int32ArrayFromPart01TestMindmapTest086
     * @tc.desc Verify from() mapfn 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      m.set(1, 2);
      m.set(2, 3);
      m.set(3, 4);
      try {
        Int32Array.from(m.values(), (v: number, k: number): number => {
          if (k === 2) {
            throw new Error('mapfn throw at k=2');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_8700
     * @tc.name int32ArrayFromPart01TestMindmapTest087
     * @tc.desc Verify from() Iterable + mapfn mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from([0, 1, 2, 3, 4] as number[], (v: number, k: number): number => {
          if (k === 3) {
            throw new Error('mapfn middle throw');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_8800
     * @tc.name int32ArrayFromPart01TestMindmapTest088
     * @tc.desc Verify from() mapfn TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      try {
        Int32Array.from(m.values(), (v: number, k: number): number => {
          expect(v).assertEqual(1);
          throw new TypeError('bad type in mapfn');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_8900
     * @tc.name int32ArrayFromPart01TestMindmapTest089
     * @tc.desc Verify Symbol.iterator from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.from([]);
      let a2: Int32Array = Int32Array.from([]);
      expect(a1.length).assertEqual(0);
      expect(a2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART01_TEST_MINDMAP_9000
     * @tc.name int32ArrayFromPart01TestMindmapTest090
     * @tc.desc Verify from() mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart01TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 1);
      m.set(1, 2);
      m.set(2, 3);
      try {
        Int32Array.from(m.values(), (v: number, k: number): number => {
          if (k === 2) {
            throw new Error('mapfn throw at last');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });
  });
}
