'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
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

export default function int32ArrayToSortedPart03Test(): void {
  describe('int32ArrayToSortedPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayToSortedPart03Test001
     * @tc.desc Verify toSorted 0; Also verify verify toSorted buffer buffer; Also verify verify toSorted byteOffset 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(3, 1, 2);
      const r: Int32Array = src.toSorted();
      expect(r.length).assertEqual(3);

      {
      const src: Int32Array = Int32Array.of(3, 1, 2);
      const r: Int32Array = src.toSorted();
      expect(r.buffer).not().assertEqual(src.buffer);
      }

      {
      const src: Int32Array = Int32Array.of(3, 1, 2);
      const r: Int32Array = src.toSorted();
      expect(r.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayToSortedPart03Test002
     * @tc.desc Verify Int32Array(length=0) toSorted length=0; Also verify verify toSorted; Also verify verify at(0) on an empty result returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = new Int32Array(0);
      const r: Int32Array = src.toSorted();
      expect(r.length).assertEqual(0);

      {
      const src: Int32Array = new Int32Array(0);
      const r: Int32Array = src.toSorted();
      expect(r).not().assertEqual(src);
      }

      {
      const src: Int32Array = new Int32Array(0);
      const r: Int32Array = src.toSorted();
      expect(r.at(0)).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayToSortedPart03Test003
     * @tc.desc Verify [0] toSorted 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(0);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayToSortedPart03Test004
     * @tc.desc Verify [-1] toSorted -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(-1);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayToSortedPart03Test005
     * @tc.desc Verify [1] toSorted length=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(1);
      const r: Int32Array = src.toSorted();
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayToSortedPart03Test006
     * @tc.desc Verify [INT_MAX] toSorted INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(2147483647);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayToSortedPart03Test007
     * @tc.desc Verify [INT_MIN] toSorted INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(-2147483648);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayToSortedPart03Test008
     * @tc.desc Verify [5,5,5,5] toSorted 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(5, 5, 5, 5);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(5);
      expect(r.$_get(2)).assertEqual(5);
      expect(r.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayToSortedPart03Test009
     * @tc.desc Verify [0,0,0] toSorted 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(0, 0, 0);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayToSortedPart03Test010
     * @tc.desc Verify INT_MAX toSorted INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(2147483647, 2147483647);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayToSortedPart03Test011
     * @tc.desc Verify [-1,-1,-1,-1,-1] toSorted length=5 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(-1, -1, -1, -1, -1);
      const r: Int32Array = src.toSorted();
      expect(r.length).assertEqual(5);
      expect(r.$_get(4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayToSortedPart03Test012
     * @tc.desc Verify [1,2] toSorted [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(1, 2);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayToSortedPart03Test013
     * @tc.desc Verify [2,1] toSorted [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(2, 1);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayToSortedPart03Test014
     * @tc.desc Verify [3,3] toSorted 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(3, 3);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayToSortedPart03Test015
     * @tc.desc Verify from Number.NaN 0 toSorted,[-1,0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.from([Number.NaN, 1, -1] as number[]);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayToSortedPart03Test016
     * @tc.desc Verify 0.5 0 [-1,0,1] toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.from([0.5, 1, -1] as number[]);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayToSortedPart03Test017
     * @tc.desc Verify -0.9 0 [-2,0,2] toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.from([-0.9, 2, -2] as number[]);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-2);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayToSortedPart03Test018
     * @tc.desc Verify 2147483647.9 2147483647 0/-1 toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.from([2147483647.9, 0, -1] as number[]);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayToSortedPart03Test019
     * @tc.desc Verify 2^32=4294967296 0 [-1,0,1] toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.from([4294967296, 1, -1] as number[]);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayToSortedPart03Test020
     * @tc.desc Verify 2^32+1=4294967297 1 [0,1,2] toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.from([4294967297, 2, 0] as number[]);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayToSortedPart03Test021
     * @tc.desc Verify INT_MAX INT_MIN toSorted INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(2147483647, -2147483648);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayToSortedPart03Test022
     * @tc.desc Verify INT_MAX/INT_MIN/0/-1/1 toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(0, -2147483648, 2147483647, 1, -1);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayToSortedPart03Test023
     * @tc.desc Verify [-1,-5,-3,-2,-4] toSorted [-5,-4,-3,-2,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(-1, -5, -3, -2, -4);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-5);
      expect(r.$_get(1)).assertEqual(-4);
      expect(r.$_get(2)).assertEqual(-3);
      expect(r.$_get(3)).assertEqual(-2);
      expect(r.$_get(4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayToSortedPart03Test024
     * @tc.desc Verify [7,3,9,1,5] toSorted [1,3,5,7,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(7, 3, 9, 1, 5);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(5);
      expect(r.$_get(3)).assertEqual(7);
      expect(r.$_get(4)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayToSortedPart03Test025
     * @tc.desc Verify [1,2,3,4,5] toSorted 2 3 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayToSortedPart03Test026
     * @tc.desc Verify [5,4,3,2,1] toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(5, 4, 3, 2, 1);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(3)).assertEqual(4);
      expect(r.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayToSortedPart03Test027
     * @tc.desc Verify toSorted INT_MIN INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(2147483647, -2147483648, 2147483647, -2147483648);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(-2147483648);
      expect(r.$_get(2)).assertEqual(2147483647);
      expect(r.$_get(3)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayToSortedPart03Test028
     * @tc.desc Verify toSorted 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(3, -1, 0, 2, -3, 1, -2);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(3)).assertEqual(0);
      expect(r.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayToSortedPart03Test029
     * @tc.desc Verify toSorted 1 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(8, 3, 5, 1, 7, 2, 6, 4);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(7)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayToSortedPart03Test030
     * @tc.desc Verify toSorted byteLength 4*length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(3, 1, 2, 4);
      const r: Int32Array = src.toSorted();
      expect(r.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayToSortedPart03Test031
     * @tc.desc Verify toSorted buffer byteLength=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(42);
      const r: Int32Array = src.toSorted();
      expect(r.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayToSortedPart03Test032
     * @tc.desc Verify $_set; Also verify verify toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(3, 1, 2);
      const r: Int32Array = src.toSorted();
      r.$_set(0, 999);
      expect(src.$_get(0)).assertEqual(3);
      expect(src.$_get(1)).assertEqual(1);
      expect(src.$_get(2)).assertEqual(2);

      {
      const src: Int32Array = Int32Array.of(3, 1, 2);
      const r: Int32Array = src.toSorted();
      src.$_set(0, 999);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayToSortedPart03Test033
     * @tc.desc Verify toSorted returns sorted values in a new Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(1, 2);
      const r: Int32Array = src.toSorted();
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayToSortedPart03Test034
     * @tc.desc Verify length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(7, 5, 3, 1, 9, 2, 8, 4, 6);
      const r: Int32Array = src.toSorted();
      expect(r.length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayToSortedPart03Test035
     * @tc.desc Verify ArrayBuffer toSorted buf buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const src: Int32Array = new Int32Array(buf, 0, 3);
      src.$_set(0, 5);
      src.$_set(1, 1);
      src.$_set(2, 3);
      const r: Int32Array = src.toSorted();
      const view: Int32Array = new Int32Array(buf, 0, 3);
      expect(view.$_get(0)).assertEqual(5);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayToSortedPart03Test036
     * @tc.desc Verify toSorted [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(3, 1, 2);
      src.toSorted();
      expect(src.$_get(0)).assertEqual(3);
      expect(src.$_get(1)).assertEqual(1);
      expect(src.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayToSortedPart03Test037
     * @tc.desc Verify toSorted length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(5, 3, 8, 1);
      const lenBefore: int = src.length;
      src.toSorted();
      expect(src.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayToSortedPart03Test038
     * @tc.desc Verify toSorted byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(1, 2, 3);
      const blBefore: int = src.byteLength;
      src.toSorted();
      expect(src.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayToSortedPart03Test039
     * @tc.desc Verify [5,4,3,2,1] toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(5, 4, 3, 2, 1);
      src.toSorted();
      expect(src.$_get(0)).assertEqual(5);
      expect(src.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayToSortedPart03Test040
     * @tc.desc Verify toSorted length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = new Int32Array(0);
      src.toSorted();
      expect(src.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayToSortedPart03Test041
     * @tc.desc Verify new Int32Array(4) toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = new Int32Array(4);
      const r: Int32Array = src.toSorted();
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayToSortedPart03Test042
     * @tc.desc Verify ArrayBuffer [9,-3,0,7] toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const src: Int32Array = new Int32Array(buf, 0, 4);
      src.$_set(0, 9);
      src.$_set(1, -3);
      src.$_set(2, 0);
      src.$_set(3, 7);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-3);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(7);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayToSortedPart03Test043
     * @tc.desc Verify ArrayBuffer byteOffset=4 [5,1] toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const src: Int32Array = new Int32Array(buf, 4, 2);
      src.$_set(0, 5);
      src.$_set(1, 1);
      const r: Int32Array = src.toSorted();
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayToSortedPart03Test044
     * @tc.desc Verify ArrayBuffer byteOffset=4 toSorted byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const src: Int32Array = new Int32Array(buf, 4, 2);
      const r: Int32Array = src.toSorted();
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayToSortedPart03Test045
     * @tc.desc Verify Int32Array.from toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.from([-10, 20, -30, 40, 0] as number[]);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-30);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(4)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayToSortedPart03Test046
     * @tc.desc Verify subarray toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const full: Int32Array = Int32Array.of(100, 3, 1, 2, 200);
      const src: Int32Array = full.subarray(1, 4);
      const r: Int32Array = src.toSorted();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayToSortedPart03Test047
     * @tc.desc Verify subarray toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const full: Int32Array = Int32Array.of(9, 3, 1, 9);
      const src: Int32Array = full.subarray(1, 3);
      const r: Int32Array = src.toSorted();
      r.$_set(0, 77);
      expect(full.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayToSortedPart03Test048
     * @tc.desc Verify 1 ArrayBuffer [-7] toSorted [-7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const src: Int32Array = new Int32Array(buf, 0, 1);
      src.$_set(0, -7);
      const r: Int32Array = src.toSorted();
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayToSortedPart03Test049
     * @tc.desc Verify ArrayBuffer src toSorted buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const src: Int32Array = new Int32Array(buf, 0, 3);
      const other: Int32Array = new Int32Array(buf, 4, 3);
      src.$_set(0, 8);
      src.$_set(1, 2);
      src.$_set(2, 5);
      other.$_set(0, 99);
      other.$_set(1, 99);
      other.$_set(2, 99);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(8);
      expect(r.$_get(1)).assertEqual(99);
      expect(r.$_get(2)).assertEqual(99);
      expect(other.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayToSortedPart03Test050
     * @tc.desc Verify toSorted toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(5, 2, 8, 1);
      const r1: Int32Array = src.toSorted();
      const r2: Int32Array = r1.toSorted();
      expect(r2.$_get(0)).assertEqual(1);
      expect(r2.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayToSortedPart03Test051
     * @tc.desc Verify toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(1, 3, 2);
      const r1: Int32Array = src.toSorted();
      const r2: Int32Array = r1.toSorted();
      expect(r2.$_get(0)).assertEqual(r1.$_get(0));
      expect(r2.$_get(1)).assertEqual(r1.$_get(1));
      expect(r2.$_get(2)).assertEqual(r1.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayToSortedPart03Test052
     * @tc.desc Verify toSorted buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(3, 1);
      const r1: Int32Array = src.toSorted();
      const r2: Int32Array = r1.toSorted();
      expect(r1.buffer).not().assertEqual(r2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayToSortedPart03Test053
     * @tc.desc Verify toSorted join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(9, 4, 7, 2);
      const s: string = src.toSorted().join(',');
      expect(s).assertEqual('2,4,7,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayToSortedPart03Test054
     * @tc.desc Verify toSorted $_get(0); Also verify verify toSorted $_get(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(42, -7, 0, 13, -99);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-99);

      {
      const src: Int32Array = Int32Array.of(42, -7, 0, 13, -99);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(r.length - 1)).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayToSortedPart03Test055
     * @tc.desc Verify toSorted $_get(0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src: Int32Array = new Int32Array(0);
        const r: Int32Array = src.toSorted();
        r.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayToSortedPart03Test056
     * @tc.desc Verify 2 $_get(2) throws RangeError; Also verify verify 2 $_get(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src: Int32Array = Int32Array.of(2, 1);
        const r: Int32Array = src.toSorted();
        r.$_get(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }

      {
      try {
        const src: Int32Array = Int32Array.of(2, 1);
        const r: Int32Array = src.toSorted();
        r.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayToSortedPart03Test057
     * @tc.desc Verify at(-2) returns undefined; Also verify verify at(1) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(7);
      const r: Int32Array = src.toSorted();
      expect(r.at(-2)).assertUndefined();

      {
      const src: Int32Array = Int32Array.of(7);
      const r: Int32Array = src.toSorted();
      expect(r.at(1)).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayToSortedPart03Test058
     * @tc.desc Verify $_set at result length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src: Int32Array = Int32Array.of(2, 1);
        const r: Int32Array = src.toSorted();
        r.$_set(2, 99);
        expect().assertFail();
        expect(r.length).assertEqual(2);
        expect(r.$_get(0)).assertEqual(1);
        expect(r.$_get(1)).assertEqual(2);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayToSortedPart03Test059
     * @tc.desc Verify $_set at index -1 on the sorted result throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const src: Int32Array = Int32Array.of(3, 1);
        const r: Int32Array = src.toSorted();
        r.$_set(-1, 99);
        expect().assertFail();
        expect(r.$_get(0)).assertEqual(1);
        expect(r.$_get(1)).assertEqual(3);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayToSortedPart03Test060
     * @tc.desc Verify toSorted with(length, v) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(2, 1);
      const r: Int32Array = src.toSorted();
      try {
        r.with(2, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayToSortedPart03Test061
     * @tc.desc Verify toSorted with(-(length+1), v) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(3, 1, 2);
      const r: Int32Array = src.toSorted();
      try {
        r.with(-4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayToSortedPart03Test062
     * @tc.desc Verify toSorted with(0, v) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = new Int32Array(0);
      const r: Int32Array = src.toSorted();
      try {
        r.with(0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayToSortedPart03Test063
     * @tc.desc Verify toSorted set offset=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(2, 1);
      const r: Int32Array = src.toSorted();
      const other: Int32Array = Int32Array.of(10, 20, 30);
      try {
        r.set(other, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayToSortedPart03Test064
     * @tc.desc Verify toSorted set offset=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(3, 1);
      const r: Int32Array = src.toSorted();
      const other: Int32Array = Int32Array.of(9);
      try {
        r.set(other, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayToSortedPart03Test065
     * @tc.desc Verify toSorted reduce initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = new Int32Array(0);
      const r: Int32Array = src.toSorted();
      try {
        r.reduce((acc: number, v: number, _i: int, _arr: Int32Array): number => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArrayToSortedPart03Test066
     * @tc.desc Verify [0,0,INT_MAX,INT_MIN,-1,1] toSorted INT_MIN INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(0, 0, 2147483647, -2147483648, -1, 1);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(5)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArrayToSortedPart03Test067
     * @tc.desc Verify [10,-10,20,-20,30,-30] toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(10, -10, 20, -20, 30, -30);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-30);
      expect(r.$_get(1)).assertEqual(-20);
      expect(r.$_get(2)).assertEqual(-10);
      expect(r.$_get(3)).assertEqual(10);
      expect(r.$_get(4)).assertEqual(20);
      expect(r.$_get(5)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArrayToSortedPart03Test068
     * @tc.desc Verify [1,-1,2,-2,0] toSorted [-2,-1,0,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(1, -1, 2, -2, 0);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-2);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArrayToSortedPart03Test069
     * @tc.desc Verify 1 toSorted -4 0 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(4, -1, 3, -2, 2, -3, 1, -4, 0);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-4);
      expect(r.$_get(4)).assertEqual(0);
      expect(r.$_get(8)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArrayToSortedPart03Test070
     * @tc.desc Verify toSorted for
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(9, 4, 6, 2, 8);
      const r1: Int32Array = src.toSorted();
      const r2: Int32Array = r1.toSorted();
      let allEq: boolean = true;
      for (let i = 0; i < r1.length; i++) {
        if (r1.$_get(i) !== r2.$_get(i)) {
          allEq = false;
          break;
        }
      }
      expect(allEq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArrayToSortedPart03Test071
     * @tc.desc Verify toSorted forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(7, 2, 9, 1, 5, 3, 8, 4, 6);
      const r: Int32Array = src.toSorted();
      let ok: boolean = true;
      let prev: int = -2147483648;
      r.forEach((v: number, _i: int, _arr: Int32Array): void => {
        if ((Double.toInt(v)) < prev) {
          ok = false;
        }
        prev = Double.toInt(v);
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArrayToSortedPart03Test072
     * @tc.desc Verify INT_MIN+1=-2147483647 toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(-2147483647);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArrayToSortedPart03Test073
     * @tc.desc Verify INT_MAX-1=2147483646 INT_MAX toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(2147483647, 2147483646);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(2147483646);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_7400
     * @tc.name int32ArrayToSortedPart03Test074
     * @tc.desc Verify [-2147483648,-1,-2147483647] toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(-2147483648, -1, -2147483647);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(-2147483647);
      expect(r.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_7500
     * @tc.name int32ArrayToSortedPart03Test075
     * @tc.desc Verify toSorted at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(50, -50, 0);
      const r: Int32Array = src.toSorted();
      const v: number | undefined = r.at(0);
      expect(v).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_7600
     * @tc.name int32ArrayToSortedPart03Test076
     * @tc.desc Verify toSorted at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(50, -50, 0);
      const r: Int32Array = src.toSorted();
      const v: number | undefined = r.at(-1);
      expect(v).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_7700
     * @tc.name int32ArrayToSortedPart03Test077
     * @tc.desc Verify toSorted includes(0) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(50, -50, 0);
      const r: Int32Array = src.toSorted();
      expect(r.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_7800
     * @tc.name int32ArrayToSortedPart03Test078
     * @tc.desc Verify Number.NaN 0 indexOf(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.from([Number.NaN, 1, -1] as number[]);
      const r: Int32Array = src.toSorted();
      expect(r.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART03_TEST_MINDMAP_7900
     * @tc.name int32ArrayToSortedPart03Test079
     * @tc.desc Verify byteOffset=8 toSorted [-8,0,16]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const src: Int32Array = new Int32Array(buf, 8, 3);
      src.$_set(0, -8);
      src.$_set(1, 16);
      src.$_set(2, 0);
      const r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(-8);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(16);
    });
  });
}
