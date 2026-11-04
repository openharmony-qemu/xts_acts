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
} from "@ohos/hypium-static/src/main/indexStatic";
import Utils from "../Util.test";

// Merged from SparseArrayReversePart01Test (29 scenarios -> 3 cases, each <=10)
export default function sparseArrayReverseTestPart01(): void {
  describe("SparseArrayReverseTestPart01", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_PART01_0100
     * @tc.name sparseArrayReverseTestPart01001
     * @tc.desc reverse in-place returns same instance & elements reversed (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayReverseTestPart01001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. reverse mutates in place; arr and returned share first element 3
      const arr1 = new SparseArray<int>(1, 2, 3);
      const returned1 = arr1.reverse();
      expect(arr1[0]!).assertEqual(3);
      expect(returned1[0]!).assertEqual(3);
      expect(arr1[0]!).assertEqual(returned1[0]!);
      // 2. reverse twice on (1,2,3) restores 1,2,3
      const arr2 = new SparseArray<int>(1, 2, 3);
      arr2.reverse();
      arr2.reverse();
      expect(arr2[0]!).assertEqual(1);
      expect(arr2[1]!).assertEqual(2);
      expect(arr2[2]!).assertEqual(3);
      // 3. reverse three times on (1..5) yields 5,4,3,2,1
      const arr3 = new SparseArray<int>(1, 2, 3, 4, 5);
      arr3.reverse();
      arr3.reverse();
      arr3.reverse();
      expect(arr3[0]!).assertEqual(5);
      expect(arr3[1]!).assertEqual(4);
      expect(arr3[2]!).assertEqual(3);
      expect(arr3[3]!).assertEqual(2);
      expect(arr3[4]!).assertEqual(1);
      // 4. reverse on (10,20,30,40,50): arr[1..3] = 40,30,20
      const arr4 = new SparseArray<int>(10, 20, 30, 40, 50);
      arr4.reverse();
      expect(arr4[1]!).assertEqual(40);
      expect(arr4[2]!).assertEqual(30);
      expect(arr4[3]!).assertEqual(20);
      // 5. reverse on (10,20) -> 20,10; length stays 2
      const arr5 = new SparseArray<int>(10, 20);
      arr5.reverse();
      expect(arr5[0]!).assertEqual(20);
      expect(arr5[1]!).assertEqual(10);
      expect(arr5.length).assertEqual(2);
      // 6. reverse on (-1,-2,-3) -> -3,-2,-1
      const arr6 = new SparseArray<int>(-1, -2, -3);
      arr6.reverse();
      expect(arr6[0]!).assertEqual(-3);
      expect(arr6[1]!).assertEqual(-2);
      expect(arr6[2]!).assertEqual(-1);
      // 7. reverse on (1,2,3,4) -> 4,3,2,1
      const arr7 = new SparseArray<int>(1, 2, 3, 4);
      arr7.reverse();
      expect(arr7[0]!).assertEqual(4);
      expect(arr7[1]!).assertEqual(3);
      expect(arr7[2]!).assertEqual(2);
      expect(arr7[3]!).assertEqual(1);
      // 8. reverse on (1..6): length 6, arr[0]=6, arr[5]=1
      const arr8 = new SparseArray<int>(1, 2, 3, 4, 5, 6);
      arr8.reverse();
      expect(arr8.length).assertEqual(6);
      expect(arr8[0]!).assertEqual(6);
      expect(arr8[5]!).assertEqual(1);
      // 9. reverse before join() -> "3,2,1"
      const arr9 = new SparseArray<int>(1, 2, 3);
      arr9.reverse();
      expect(arr9.join()).assertEqual('3,2,1');
      // 10. reverse then toReversed() restores 1,2,3
      const arr10 = new SparseArray<int>(1, 2, 3);
      arr10.reverse();
      const result10 = arr10.toReversed();
      expect(result10[0]!).assertEqual(1);
      expect(result10[1]!).assertEqual(2);
      expect(result10[2]!).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_PART01_0200
     * @tc.name sparseArrayReverseTestPart01002
     * @tc.desc reverse on typed arrays (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayReverseTestPart01002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. reverse on (start, LONG_STR, end) -> end, LONG_STR, start
      const LONG_STR: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.repeat(200);
      const arr1 = new SparseArray<string>('start', LONG_STR, 'end');
      arr1.reverse();
      expect(arr1[0]!).assertEqual('end');
      expect(arr1[1]!).assertEqual(LONG_STR);
      expect(arr1[2]!).assertEqual('start');
      // 2. reverse on (false, false): both stay false
      const arr2 = new SparseArray<boolean>(false, false);
      arr2.reverse();
      expect(arr2[0]!).assertFalse();
      expect(arr2[1]!).assertFalse();
      // 3. reverse on (1.0, Double.MAX_VALUE, 2.0) -> 2.0, MAX, 1.0
      const arr3 = new SparseArray<double>(1.0, Double.MAX_VALUE, 2.0);
      arr3.reverse();
      expect(arr3[0]!).assertEqual(2.0);
      expect(arr3[1]!).assertEqual(Double.MAX_VALUE);
      expect(arr3[2]!).assertEqual(1.0);
      // 4. reverse on (MIN_BIGINT, 0n, 100n) -> 100n, 0n, MIN_BIGINT
      const MIN_BIGINT: bigint = -9223372036854775808n;
      const arr4 = new SparseArray<bigint>(MIN_BIGINT, 0n, 100n);
      arr4.reverse();
      expect(arr4[0]!).assertEqual(100n);
      expect(arr4[1]!).assertEqual(0n);
      expect(arr4[2]!).assertEqual(MIN_BIGINT);
      // 5. reverse on (true, false, false): [0] false, [2] true
      const arr5 = new SparseArray<boolean>(true, false, false);
      const returned5 = arr5.reverse();
      expect(returned5[0]!).assertFalse();
      expect(returned5[2]!).assertTrue();
      // 6. reverse on (Date 0, Date 1000) swaps getTime -> 1000, 0
      const arr6 = new SparseArray<Date>(new Date(0), new Date(1000));
      arr6.reverse();
      expect(arr6[0]!.getTime()).assertEqual(1000);
      expect(arr6[1]!.getTime()).assertEqual(0);
      // 7. reverse on (1.0, NaN, 3.0) -> 3.0, NaN, 1.0
      const arr7 = new SparseArray<double>(1.0, Double.NaN, 3.0);
      arr7.reverse();
      expect(arr7[0]!).assertEqual(3.0);
      expect(arr7[2]!).assertEqual(1.0);
      expect(isNaN(arr7[1]!)).assertTrue();
      // 8. reverse on (中文, abc, 😀) -> 😀, abc, 中文
      const arr8 = new SparseArray<string>('中文', 'abc', '😀');
      arr8.reverse();
      expect(arr8[0]!).assertEqual('😀');
      expect(arr8[1]!).assertEqual('abc');
      expect(arr8[2]!).assertEqual('中文');
      // 9. reverse on long (10, 20) -> 20, 10
      const arr9 = new SparseArray<long>(10 as long, 20 as long);
      arr9.reverse();
      expect(arr9[0]!).assertEqual(20 as long);
      expect(arr9[1]!).assertEqual(10 as long);
      // 10. reverse on (aa, bb) -> bb, aa
      const arr10 = new SparseArray<string>('aa', 'bb');
      arr10.reverse();
      expect(arr10[0]!).assertEqual('bb');
      expect(arr10[1]!).assertEqual('aa');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_PART01_0300
     * @tc.name sparseArrayReverseTestPart01003
     * @tc.desc reverse with undefined/null holes, on empty/single & via construction methods (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayReverseTestPart01003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. reverse on empty array keeps length 0
      const arr1 = new SparseArray<int>();
      arr1.reverse();
      expect(arr1.length).assertEqual(0);
      // 2. reverse on SparseArray.of(7): length 1, arr[0]=7
      const arr2 = SparseArray.of<int>(7);
      arr2.reverse();
      expect(arr2.length).assertEqual(1);
      expect(arr2[0]!).assertEqual(7);
      // 3. reverse on all-hole len=4 array: all undefined, length 4
      const arr3 = new SparseArray<int>(4);
      arr3.reverse();
      expect(arr3[0]).assertUndefined();
      expect(arr3[1]).assertUndefined();
      expect(arr3[2]).assertUndefined();
      expect(arr3[3]).assertUndefined();
      expect(arr3.length).assertEqual(4);
      // 4. reverse on sparse {0:1, 3:4} len=4: arr[0]=4, arr[3]=1, middle undefined
      const arr4 = new SparseArray<int>(4);
      arr4[0] = 1;
      arr4[3] = 4;
      arr4.reverse();
      expect(arr4.length).assertEqual(4);
      expect(arr4[0]!).assertEqual(4);
      expect(arr4[1]).assertUndefined();
      expect(arr4[2]).assertUndefined();
      expect(arr4[3]!).assertEqual(1);
      // 5. reverse on sparse {0:100, 1:200} len=4: arr[2]=200, arr[3]=100, [0..1] undefined
      const arr5 = new SparseArray<int>(4);
      arr5[0] = 100;
      arr5[1] = 200;
      arr5.reverse();
      expect(arr5[0]).assertUndefined();
      expect(arr5[1]).assertUndefined();
      expect(arr5[2]!).assertEqual(200);
      expect(arr5[3]!).assertEqual(100);
      // 6. reverse on len=3 filled only at index 1 (5): arr[1]=5, [0]&[2] undefined
      const arr6 = new SparseArray<int>(3);
      arr6[1] = 5;
      arr6.reverse();
      expect(arr6[0]).assertUndefined();
      expect(arr6[1]!).assertEqual(5);
      expect(arr6[2]).assertUndefined();
      // 7. reverse on sparse {0:1, 100:2}: arr[0]=2, arr[100]=1, length 101
      const arr7 = new SparseArray<int>();
      arr7[0] = 1;
      arr7[100] = 2;
      arr7.reverse();
      expect(arr7.length).assertEqual(101);
      expect(arr7[0]!).assertEqual(2);
      expect(arr7[100]!).assertEqual(1);
      // 8. reverse on (MAX_INT, 2, 1) -> 1, 2, MAX_INT; length 3
      const arr8 = new SparseArray<int>(2147483647, 2, 1);
      arr8.reverse();
      expect(arr8[0]!).assertEqual(1);
      expect(arr8[1]!).assertEqual(2);
      expect(arr8[2]!).assertEqual(2147483647);
      expect(arr8.length).assertEqual(3);
      // 9. reverse on ('', 'a') -> 'a', ''
      const arr9 = new SparseArray<string>('', 'a');
      arr9.reverse();
      expect(arr9[0]!).assertEqual('a');
      expect(arr9[1]!).assertEqual('');
    });
  });
}
