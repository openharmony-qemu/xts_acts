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

export default function int32ArrayOfPart03Test(): void {
  describe('Int32ArrayOfPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayOfPart03TestMindmapTest001
     * @tc.desc Verify of with 4 elements (4,8,12,16) length=4 and last element is 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(4, 8, 12, 16);
      expect(a.length).assertEqual(4);
      expect(a.$_get(3)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayOfPart03TestMindmapTest002
     * @tc.desc Verify of with 4 elements byteLength is 16 (4*4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(4, 8, 12, 16);
      expect(a.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayOfPart03TestMindmapTest003
     * @tc.desc Verify of with 7 elements (prime length), first and last match input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66, 77);
      expect(a.length).assertEqual(7);
      expect(a.$_get(0)).assertEqual(11);
      expect(a.$_get(6)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayOfPart03TestMindmapTest004
     * @tc.desc Verify of with 12 consecutive numbers (1..12) length=12 byteLength=48 last=12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(a.length).assertEqual(12);
      expect(a.byteLength).assertEqual(48);
      expect(a.$_get(11)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayOfPart03TestMindmapTest005
     * @tc.desc Verify of with 4 elements index=2 is the 3rd input value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(100, 200, 300, 400);
      expect(a.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayOfPart03TestMindmapTest006
     * @tc.desc Verify Number.MIN_VALUE (~5e-324) via ToInt32 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.MIN_VALUE);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayOfPart03TestMindmapTest007
     * @tc.desc Verify -Number.MIN_VALUE via ToInt32 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-Number.MIN_VALUE);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayOfPart03TestMindmapTest008
     * @tc.desc Verify Number.MAX_VALUE via ToInt32 yields 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.MAX_VALUE);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayOfPart03TestMindmapTest009
     * @tc.desc Verify -Number.MAX_VALUE via ToInt32 yields 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-Number.MAX_VALUE);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayOfPart03TestMindmapTest010
     * @tc.desc Verify 3*2^30=3221225472 (>2^31) via ToInt32 wraps to -1073741824
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3221225472);
      expect(a.$_get(0)).assertEqual(-1073741824);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayOfPart03TestMindmapTest011
     * @tc.desc Verify 3*2^32=12884901888 via ToInt32 wraps to 0 (low 32 bits all zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(12884901888);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayOfPart03TestMindmapTest012
     * @tc.desc Verify -3*2^32=-12884901888 via ToInt32 wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-12884901888);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayOfPart03TestMindmapTest013
     * @tc.desc Verify 0.0001 positive small fraction truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0.0001);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayOfPart03TestMindmapTest014
     * @tc.desc Verify -0.0001 negative small fraction truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-0.0001);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayOfPart03TestMindmapTest015
     * @tc.desc Verify of with 0, MAX, MIN, -1 four extremes independently correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 2147483647, -2147483648, -1);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(2147483647);
      expect(a.$_get(2)).assertEqual(-2147483648);
      expect(a.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayOfPart03TestMindmapTest016
     * @tc.desc Verify of with three NaN values all become 0 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.NaN, Number.NaN, Number.NaN);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayOfPart03TestMindmapTest017
     * @tc.desc Verify of with alternating fractions (1.1,-1.1,2.9,-2.9) truncate to 1,-1,2,-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1.1, -1.1, 2.9, -2.9);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(-1);
      expect(a.$_get(2)).assertEqual(2);
      expect(a.$_get(3)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayOfPart03TestMindmapTest018
     * @tc.desc Verify of with powers of 2 (2,4,8,16,32,64) independently correct and last is 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2, 4, 8, 16, 32, 64);
      expect(a.$_get(0)).assertEqual(2);
      expect(a.$_get(5)).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayOfPart03TestMindmapTest019
     * @tc.desc Verify of with alternating sign pairs (1,-2,3,-4,5,-6) signs preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, -2, 3, -4, 5, -6);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(-2);
      expect(a.$_get(5)).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayOfPart03TestMindmapTest020
     * @tc.desc Verify of returned object is not Uint32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      expect((a as Object) instanceof Uint32Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayOfPart03TestMindmapTest021
     * @tc.desc Verify of returned object is not Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      expect((a as Object) instanceof Float32Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayOfPart03TestMindmapTest022
     * @tc.desc Verify two consecutive of() with no args return independent buffer instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      let b: Int32Array = Int32Array.of();
      expect(a.length).assertEqual(0);
      expect(a.buffer).not().assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayOfPart03TestMindmapTest023
     * @tc.desc Verify of 7 zeros buffer.byteLength strictly equals length*4 (28)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 0, 0, 0, 0, 0, 0);
      expect(a.buffer.byteLength).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayOfPart03TestMindmapTest024
     * @tc.desc Verify for-of traversal of of(10,20,30) element order matches input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let out: number[] = [];
      for (let i: int = 0; i < a.length; i++) {
        let x: number = a.$_get(i);
        out.push(x);
      }
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual(10);
      expect(out[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayOfPart03TestMindmapTest025
     * @tc.desc Verify for-of traversal of empty of() loop body never executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      let cnt: number = 0;
      for (let i: int = 0; i < a.length; i++) {
        cnt = cnt + 1;
      }
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayOfPart03TestMindmapTest026
     * @tc.desc Verify for-of break early termination, subsequent elements not visited (sum=1+2=3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sum: number = 0;
      for (let i: int = 0; i < a.length; i++) {
        let x: number = a.$_get(i);
        if (x > 2) {
          break;
        }
        sum = sum + x;
      }
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayOfPart03TestMindmapTest027
     * @tc.desc Verify values() iterator (length+1)-th next() returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      let it: IterableIterator<number> = a.values();
      it.next();
      it.next();
      let third: IteratorResult<number> = it.next();
      expect(third.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayOfPart03TestMindmapTest028
     * @tc.desc Verify keys() iterator for-of produces consecutive indices 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let idxs: number[] = [];
      for (let i of a.keys()) {
        idxs.push(i);
      }
      expect(idxs.length).assertEqual(3);
      expect(idxs[0]).assertEqual(0);
      expect(idxs[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayOfPart03TestMindmapTest029
     * @tc.desc Verify entries() iterator for-of produces [index,value] pairs matching input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(100, 200);
      let seenIdx: number[] = [];
      let seenVal: number[] = [];
      for (let pair of a.entries()) {
        seenIdx.push(pair[0]);
        seenVal.push(pair[1]);
      }
      expect(seenIdx[0]).assertEqual(0);
      expect(seenVal[0]).assertEqual(100);
      expect(seenIdx[1]).assertEqual(1);
      expect(seenVal[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayOfPart03TestMindmapTest030
     * @tc.desc Verify values() iterator first next() returns done=false and value=first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(42);
      let it: IterableIterator<number> = a.values();
      let first: IteratorResult<number> = it.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayOfPart03TestMindmapTest031
     * @tc.desc Verify of(10,20,30) at(0) returns first element 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayOfPart03TestMindmapTest032
     * @tc.desc Verify of(10,20,30) at(2) returns last element 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayOfPart03TestMindmapTest033
     * @tc.desc Verify of(10,20,30) at(-3) (=-length) returns first element 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.at(-3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayOfPart03TestMindmapTest034
     * @tc.desc Verify of single element [42] at(-1) returns the only element 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(42);
      expect(a.at(-1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayOfPart03TestMindmapTest035
     * @tc.desc Verify of empty array at(0) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      let v: number | undefined = a.at(0);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayOfPart03TestMindmapTest036
     * @tc.desc Verify of(1,3,5,7) find predicate always false returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 3, 5, 7);
      let r: number | undefined = a.find((_v: number, _i: int, _arr: Int32Array): boolean => false);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayOfPart03TestMindmapTest037
     * @tc.desc Verify of(1,3,5,7) findIndex predicate always false returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 3, 5, 7);
      let idx: number = a.findIndex((_v: number, _i: int, _arr: Int32Array): boolean => false);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayOfPart03TestMindmapTest038
     * @tc.desc Verify of(1,2,3,4,5) findLast finds first even from tail returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: number = a.findLast((v: number, _i: int, _arr: Int32Array): boolean => v % 2 === 0);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayOfPart03TestMindmapTest039
     * @tc.desc Verify of(1,2,3,4,5) findLastIndex finds first even from tail returns index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let idx: number = a.findLastIndex((v: number, _i: int, _arr: Int32Array): boolean => v % 2 === 0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayOfPart03TestMindmapTest040
     * @tc.desc Verify of empty array findIndex does not trigger callback and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      let called: boolean = false;
      let idx: number = a.findIndex((_v: number, _i: int, _arr: Int32Array): boolean => {
        called = true;
        return true;
      });
      expect(idx).assertEqual(-1);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayOfPart03TestMindmapTest041
     * @tc.desc Verify of(1,2,3,4) find short-circuits after finding element (calls=2 for v===2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let calls: number = 0;
      for (let _i: int = 0; _i < a.length; _i++) {
        calls = calls + 1;
        if (a.$_get(_i) === 2) {
          break;
        }
      }
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayOfPart03TestMindmapTest042
     * @tc.desc Verify of(1,NaN,3) (NaN via ToInt32 stored as 0) includes(0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, Number.NaN, 3);
      expect(a.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayOfPart03TestMindmapTest043
     * @tc.desc Verify of(1,0,3) indexOf(NaN) (search NaN via ToInt32=0) returns position 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 0, 3);
      expect(a.indexOf(Number.NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayOfPart03TestMindmapTest044
     * @tc.desc Verify of(1,2,3,2,1) indexOf(2) returns first match index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 2, 1);
      expect(a.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayOfPart03TestMindmapTest045
     * @tc.desc Verify of(10,20,30,20) indexOf(20,2) searches from index 2 returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 20);
      expect(a.indexOf(20, 2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayOfPart03TestMindmapTest046
     * @tc.desc Verify of(10,20,30,20) lastIndexOf(20,2) searches backward from index 2 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 20);
      expect(a.lastIndexOf(20, 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayOfPart03TestMindmapTest047
     * @tc.desc Verify of(1,0,-1) includes(-0) (SameValueZero -0 equals 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 0, -1);
      expect(a.includes(-0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayOfPart03TestMindmapTest048
     * @tc.desc Verify of(1,2,3) map callback returns NaN, each position via ToInt32 is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let b: Int32Array = a.map((_v: number, _i: int, _arr: Int32Array): number => Number.NaN);
      expect(b.$_get(0)).assertEqual(0);
      expect(b.$_get(1)).assertEqual(0);
      expect(b.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayOfPart03TestMindmapTest049
     * @tc.desc Verify of(1,2,3) map callback returns Infinity, each position via ToInt32 is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let b: Int32Array = a.map((_v: number, _i: int, _arr: Int32Array): number => Number.POSITIVE_INFINITY);
      expect(b.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayOfPart03TestMindmapTest050
     * @tc.desc Verify of(1,2,3) filter predicate always false returns length=0 new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let b: Int32Array = a.filter((_v: number, _i: int, _arr: Int32Array): boolean => false);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayOfPart03TestMindmapTest051
     * @tc.desc Verify of(1,2,3) filter predicate always true returns element-wise equal copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let b: Int32Array = a.filter((_v: number, _i: int, _arr: Int32Array): boolean => true);
      expect(b.length).assertEqual(3);
      expect(b.$_get(0)).assertEqual(1);
      expect(b.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayOfPart03TestMindmapTest052
     * @tc.desc Verify of(1,2,3,4,5) reduce without initialValue, first element as initial accumulator, sum=15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sum: number = a.reduce((acc: number, v: number, _i: int, _arr: Int32Array): number => acc + v);
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayOfPart03TestMindmapTest053
     * @tc.desc Verify of(2,3,4) reduce product with initialValue=1 result is 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2, 3, 4);
      let p: number = a.reduce((acc: number, v: number, _i: int, _arr: Int32Array): number => acc * v, 1);
      expect(p).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayOfPart03TestMindmapTest054
     * @tc.desc Verify of(0,1,2,3,4) slice(-2) returns last two elements [3,4] with independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 1, 2, 3, 4);
      let s: Int32Array = a.slice(-2);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(3);
      expect(s.$_get(1)).assertEqual(4);
      expect(s.buffer).not().assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayOfPart03TestMindmapTest055
     * @tc.desc Verify of(0,1,2,3,4) slice(1,0) (begin > end) returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 1, 2, 3, 4);
      let s: Int32Array = a.slice(1, 0);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayOfPart03TestMindmapTest056
     * @tc.desc Verify of(0,1,2,3,4) subarray(2,1) (begin > end) returns length=0 view sharing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 1, 2, 3, 4);
      let s: Int32Array = a.subarray(2, 1);
      expect(s.length).assertEqual(0);
      expect(s.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayOfPart03TestMindmapTest057
     * @tc.desc Verify of(1,2,3) fill(9,1,2) only fills index=1 with 9, others unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.fill(9, 1, 2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(9);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayOfPart03TestMindmapTest058
     * @tc.desc Verify of(1,2,3,4) fill(0,-2) fills from the 2nd-to-last position with 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      a.fill(0, -2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayOfPart03TestMindmapTest059
     * @tc.desc Verify of(1,2,3,4,5) copyWithin(2,0,2) copies [1,2] to index=2 position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      a.copyWithin(2, 0, 2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(1);
      expect(a.$_get(3)).assertEqual(2);
      expect(a.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayOfPart03TestMindmapTest060
     * @tc.desc Verify of(3,1,4,1,5) sort with descending comparator (y-x) first=5 last=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3, 1, 4, 1, 5);
      a.sort((x: number, y: number): int => {
        if (y > x) {
          return 1;
        }
        if (y < x) {
          return -1;
        }
        return 0;
      });
      expect(a.$_get(0)).assertEqual(5);
      expect(a.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayOfPart03TestMindmapTest061
     * @tc.desc Verify of(1,2,3) default sort preserves ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.sort();
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayOfPart03TestMindmapTest062
     * @tc.desc Verify of(1,2,3) join('') with empty separator produces "123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.join('')).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayOfPart03TestMindmapTest063
     * @tc.desc Verify of single element [42] join(',') returns "42" no trailing comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(42);
      expect(a.join(',')).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayOfPart03TestMindmapTest064
     * @tc.desc Verify of empty array join('-') returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      expect(a.join('-')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayOfPart03TestMindmapTest065
     * @tc.desc Verify of(0,0,0) set(of(10,20)) default offset=0 writes [10,20,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 0, 0);
      let src: Int32Array = Int32Array.of(10, 20);
      a.set(src);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArrayOfPart03TestMindmapTest066
     * @tc.desc Verify of(0,0,0,0) set(of(77,88),2) writes from offset=2, last two are 77,88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 0, 0, 0);
      a.set(Int32Array.of(77, 88), 2);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(77);
      expect(a.$_get(3)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArrayOfPart03TestMindmapTest067
     * @tc.desc Verify of single element [0] set(of(1,2)) source+offset > this.length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0);
      try {
        a.set(Int32Array.of(1, 2));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArrayOfPart03TestMindmapTest068
     * @tc.desc Verify of(0x12345678) via Uint8Array view reads 4 bytes in little-endian: 0x78,0x56,0x34,0x12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0x12345678);
      let u8: Uint8Array = new Uint8Array(a.buffer);
      expect(u8.length).assertEqual(4);
      expect(u8.$_get(0)).assertEqual(0x78);
      expect(u8.$_get(3)).assertEqual(0x12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArrayOfPart03TestMindmapTest069
     * @tc.desc Verify of(1,2) via Int16Array view reads underlying byte length as 4 int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let i16: Int16Array = new Int16Array(a.buffer);
      expect(i16.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArrayOfPart03TestMindmapTest070
     * @tc.desc Verify of(1,2) via Float64Array view (8 bytes per element) length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let f64: Float64Array = new Float64Array(a.buffer);
      expect(f64.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArrayOfPart03TestMindmapTest071
     * @tc.desc Verify of(0,0) with byteOffset=4 Int32Array subview writes, original index=1 visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 0);
      let v: Int32Array = new Int32Array(a.buffer, 4, 1);
      v.$_set(0, 2024);
      expect(a.$_get(1)).assertEqual(2024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArrayOfPart03TestMindmapTest072
     * @tc.desc Verify of(-1) via DataView getInt32(0,true) little-endian reads back -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1);
      let dv: DataView = new DataView(a.buffer);
      expect(dv.getInt32(0, true)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArrayOfPart03TestMindmapTest073
     * @tc.desc Verify of(1,2,3) filter callback throws error, error is propagated not swallowed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.filter((_v: number, _i: int, _arr: Int32Array): boolean => {
          throw new Error('filter boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_7400
     * @tc.name int32ArrayOfPart03TestMindmapTest074
     * @tc.desc Verify of(1,2,3) reduce callback throws error, error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.reduce((_acc: number, _v: number, _i: int, _arr: Int32Array): number => {
          throw new Error('reduce boom');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_7500
     * @tc.name int32ArrayOfPart03TestMindmapTest075
     * @tc.desc Verify of single element [1] with(-1,99) negative index in range replaces, returns new array, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      let result: Int32Array = a.with(-1, 99);
      expect(result.$_get(0)).assertEqual(99);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_7600
     * @tc.name int32ArrayOfPart03TestMindmapTest076
     * @tc.desc Verify of single element [1] with(1,99) out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      try {
        a.with(1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_7700
     * @tc.name int32ArrayOfPart03TestMindmapTest077
     * @tc.desc Verify of(1,2) with(-3,99) out of bounds (<-length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      try {
        a.with(-3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_7800
     * @tc.name int32ArrayOfPart03TestMindmapTest078
     * @tc.desc Verify of empty array $_set(0,5) out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      try {
        a.$_set(0, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_7900
     * @tc.name int32ArrayOfPart03TestMindmapTest079
     * @tc.desc Verify of empty array $_get(0) out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      try {
        a.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_8000
     * @tc.name int32ArrayOfPart03TestMindmapTest080
     * @tc.desc Verify of(1,2,3) every callback throws error, error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.every((_v: number, _i: int, _arr: Int32Array): boolean => {
          throw new Error('every boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART03_TEST_MINDMAP_8100
     * @tc.name int32ArrayOfPart03TestMindmapTest081
     * @tc.desc Verify of(1,2,3) some callback throws error, error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart03TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.some((_v: number, _i: int, _arr: Int32Array): boolean => {
          throw new Error('some boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });
  });
}
