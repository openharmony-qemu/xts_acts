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
} from "../../../../hypium/index";
import Utils from "../Util.test";

// Merged from SparseArraySlicePart01Test (25 scenarios -> 3 cases, each <=10)
export default function sparseArraySliceTestPart01(): void {
  describe("SparseArraySlicePart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_PART01_0100
     * @tc.name sparseArraySliceTestPart01001
     * @tc.desc slice() with no arguments returns a full value-preserving copy across element types (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("sparseArraySliceTestPart01001", Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. slice() on (10,20,30,40,50) -> length 5, full copy; mutating copy keeps source first at 10
      const arr1 = new SparseArray<int>(10, 20, 30, 40, 50);
      const res1 = arr1.slice();
      expect(res1.length).assertEqual(5);
      expect(res1[0]!).assertEqual(10);
      expect(res1[1]!).assertEqual(20);
      expect(res1[2]!).assertEqual(30);
      expect(res1[3]!).assertEqual(40);
      expect(res1[4]!).assertEqual(50);
      res1[0] = 999;
      expect(res1[0]!).assertEqual(999);
      expect(arr1[0]!).assertEqual(10);
      // 2. slice() on (1,2,3,4,5) -> length 5, first 1 and last 5
      const arr2 = new SparseArray<int>(1, 2, 3, 4, 5);
      const res2 = arr2.slice();
      expect(res2.length).assertEqual(5);
      expect(res2[0]!).assertEqual(1);
      expect(res2[4]!).assertEqual(5);
      // 3. slice() on SparseArray.of<int>(42) -> length 1, single element 42
      const arr3 = SparseArray.of<int>(42);
      const res3 = arr3.slice();
      expect(res3.length).assertEqual(1);
      expect(res3[0]!).assertEqual(42);
      // 4. slice() on (-1,-2,-3) -> preserves negative values -1 and -2
      const arr4 = new SparseArray<int>(-1, -2, -3);
      const res4 = arr4.slice();
      expect(res4[0]!).assertEqual(-1);
      expect(res4[1]!).assertEqual(-2);
      // 5. slice() on ("hello","world") -> preserves both strings
      const arr5 = new SparseArray<string>("hello", "world");
      const res5 = arr5.slice();
      expect(res5[0]!).assertEqual("hello");
      expect(res5[1]!).assertEqual("world");
      // 6. slice() on emoji ('😀','🎉') -> preserves first emoji
      const arr6 = new SparseArray<string>('😀', '🎉');
      const res6 = arr6.slice();
      expect(res6[0]!).assertEqual('😀');
      // 7. slice() on escape chars ('\t','\n') -> preserved unchanged
      const arr7 = new SparseArray<string>('\t', '\n');
      const res7 = arr7.slice();
      expect(res7[0]!).assertEqual('\t');
      expect(res7[1]!).assertEqual('\n');
      // 8. slice() on (1,2,3,4) -> length 4, order preserved 1..4
      const arr8 = new SparseArray<int>(1, 2, 3, 4);
      const res8 = arr8.slice();
      expect(res8.length).assertEqual(4);
      expect(res8[0]!).assertEqual(1);
      expect(res8[1]!).assertEqual(2);
      expect(res8[2]!).assertEqual(3);
      expect(res8[3]!).assertEqual(4);
      // 9. slice() on (true,false) -> preserves both booleans
      const arr9 = new SparseArray<boolean>(true, false);
      const res9 = arr9.slice();
      expect(res9[0]!).assertTrue();
      expect(res9[1]!).assertFalse();
      // 10. slice() on bigint (100n,200n) -> preserves both bigints
      const arr10 = new SparseArray<bigint>(100n, 200n);
      const res10 = arr10.slice();
      expect(res10[0]!).assertEqual(100n);
      expect(res10[1]!).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_PART01_0200
     * @tc.name sparseArraySliceTestPart01002
     * @tc.desc slice(start)/slice(start,end) sub-range with positive, negative, clamp and out-of-bounds empty results (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("sparseArraySliceTestPart01002", Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. slice(2,4) on doubles (1.1,2.2,3.3,4.4) -> length 2
      const arr1 = new SparseArray<double>(1.1, 2.2, 3.3, 4.4);
      const res1 = arr1.slice(2, 4);
      expect(res1.length).assertEqual(2);
      // 2. slice(0,1) on float (Infinity,1.0) -> element 0 positive unlimited
      const arr2 = new SparseArray<float>(Float.POSITIVE_INFINITY, 1.0 as float);
      const res2 = arr2.slice(0, 1);
      expect(res2[0]).assertPosUnlimited();
      // 3. slice(3) on (1,2,3) start==length -> empty length 0
      const arr3 = new SparseArray<int>(1, 2, 3);
      const res3 = arr3.slice(3);
      expect(res3.length).assertEqual(0);
      // 4. slice(2,0) on long (0,1,2) start>end -> empty length 0
      const arr4 = new SparseArray<long>(0 as long, 1 as long, 2 as long);
      const res4 = arr4.slice(2, 0);
      expect(res4.length).assertEqual(0);
      // 5. slice(2,2147483647) on (10,20,30) clamps end to length -> length 1, 30
      const arr5 = new SparseArray<int>(10, 20, 30);
      const res5 = arr5.slice(2, 2147483647);
      expect(res5.length).assertEqual(1);
      expect(res5[0]!).assertEqual(30);
      // 6. slice(-0x80000000) on (1,2,3,4) clamps min start to 0 -> all 4
      const arr6 = new SparseArray<int>(1, 2, 3, 4);
      const res6 = arr6.slice(-0x80000000);
      expect(res6.length).assertEqual(4);
      expect(res6[0]!).assertEqual(1);
      expect(res6[3]!).assertEqual(4);
      // 7. slice(-4,-1) on bytes (10,20,30,40,50) -> length 3, 20,30,40
      const arr7 = new SparseArray<byte>(10 as byte, 20 as byte, 30 as byte, 40 as byte, 50 as byte);
      const res7 = arr7.slice(-4, -1);
      expect(res7.length).assertEqual(3);
      expect(res7[0]!).assertEqual(20 as byte);
      expect(res7[1]!).assertEqual(30 as byte);
      expect(res7[2]!).assertEqual(40 as byte);
      // 8. slice(-2) on shorts (10,20,30) -> last two 20,30
      const arr8 = new SparseArray<short>(10 as short, 20 as short, 30 as short);
      const res8 = arr8.slice(-2);
      expect(res8[0]!).assertEqual(20 as short);
      expect(res8[1]!).assertEqual(30 as short);
      // 9. slice(-1) on ("aa","bb","cc") -> length 1, "cc"
      const arr9 = new SparseArray<string>("aa", "bb", "cc");
      const res9 = arr9.slice(-1);
      expect(res9.length).assertEqual(1);
      expect(res9[0]!).assertEqual("cc");
      // 10. slice(-3,-2) on (10,20,30,40,50) -> length 1, 30
      const arr10 = new SparseArray<int>(10, 20, 30, 40, 50);
      const res10 = arr10.slice(-3, -2);
      expect(res10.length).assertEqual(1);
      expect(res10[0]!).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_PART01_0300
     * @tc.name sparseArraySliceTestPart01003
     * @tc.desc slice() on edge source shapes (sparse/empty/long/undefined) and shallow reference copy (5 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("sparseArraySliceTestPart01003", Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. slice() on len-5 sparse {0:10} -> length 5, index 0 is 10, holes 1,3,4 undefined
      const arr1 = new SparseArray<int>(5);
      arr1[0] = 10;
      const res1 = arr1.slice();
      expect(res1.length).assertEqual(5);
      expect(res1[0]!).assertEqual(10);
      expect(res1[1]).assertUndefined();
      expect(res1[3]).assertUndefined();
      expect(res1[4]).assertUndefined();
      // 2. slice() on empty -> length 0, source length stays 0, res[0] undefined
      const arr2 = new SparseArray<int>();
      const res2 = arr2.slice();
      expect(res2.length).assertEqual(0);
      expect(arr2.length).assertEqual(0);
      expect(res2[0]).assertUndefined();
      // 3. slice() on long (0,100,200) -> preserves all long elements
      const arr3 = new SparseArray<long>(0 as long, 100 as long, 200 as long);
      const res3 = arr3.slice();
      expect(res3[0]!).assertEqual(0 as long);
      expect(res3[1]!).assertEqual(100 as long);
      expect(res3[2]!).assertEqual(200 as long);
      // 4. slice() shallow-copies references; Date element is the same instance
      const dateA: Date = new Date(0);
      const arr4 = new SparseArray<Date>(dateA);
      const res4 = arr4.slice();
      expect(res4[0]! === dateA).assertTrue();
      // 5. slice() on (5,undefined) -> length 2, 5 preserved, explicit undefined kept
      const arr5 = new SparseArray<int | undefined>(5, undefined);
      const res5 = arr5.slice();
      expect(res5.length).assertEqual(2);
      expect(res5[0]!).assertEqual(5);
      expect(res5[1]).assertUndefined();
    });
  });
}
