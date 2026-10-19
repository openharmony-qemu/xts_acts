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

export default function sparseArrayUnshiftTestPart01(): void {
  describe("SparseArrayUnshiftTestPart01", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_PART01_0100
     * @tc.name sparseArrayUnshiftTestPart01001
     * @tc.desc unshift on empty arrays, no-arg, and single-arg prepend (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayUnshiftTestPart01001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. unshift 99 into empty int SparseArray -> returns 1, arr[0]=99
      const arr1 = new SparseArray<int>();
      const ret1 = arr1.unshift(99);
      expect(ret1).assertEqual(1);
      expect(arr1[0]).assertEqual(99);
      // 2. unshift 5,6,7,8 into empty SparseArray -> returns 4, arr[3]=8
      const arr2 = new SparseArray<int>();
      const ret2 = arr2.unshift(5, 6, 7, 8);
      expect(ret2).assertEqual(4);
      expect(arr2[3]).assertEqual(8);
      // 3. unshift 0 into empty int SparseArray -> arr[0]=0, length=1
      const arr3 = new SparseArray<int>();
      arr3.unshift(0);
      expect(arr3[0]).assertEqual(0);
      expect(arr3.length).assertEqual(1);
      // 4. unshift int extremes 2147483647, -2147483648 into empty -> arr[0]=MAX, arr[1]=MIN, length=2
      const arr4 = new SparseArray<int>();
      arr4.unshift(2147483647, -2147483648);
      expect(arr4[0]).assertEqual(2147483647);
      expect(arr4[1]).assertEqual(-2147483648);
      expect(arr4.length).assertEqual(2);
      // 5. unshift tab into empty string SparseArray -> arr[0]='\t'
      const arr5 = new SparseArray<string>();
      arr5.unshift('\t');
      expect(arr5[0]).assertEqual('\t');
      // 6. unshift emoji before 'a' in string SparseArray -> arr[0]='🎉'
      const arr6 = new SparseArray<string>('a');
      arr6.unshift('🎉');
      expect(arr6[0]).assertEqual('🎉');
      // 7. unshift() no args on empty int SparseArray -> returns 0, length=0
      const arr7 = new SparseArray<int>();
      const len7 = arr7.unshift();
      expect(len7).assertEqual(0);
      expect(arr7.length).assertEqual(0);
      // 8. unshift 10000-char string into empty string SparseArray -> arr[0]=LONG_STR
      const arr8 = new SparseArray<string>();
      const LONG_STR8: string = 'x'.repeat(10000);
      arr8.unshift(LONG_STR8);
      expect(arr8[0]).assertEqual(LONG_STR8);
      // 9. unshift 99 before single 42 -> arr[1]=42
      const arr9 = SparseArray.of<int>(42);
      arr9.unshift(99);
      expect(arr9[1]).assertEqual(42);
      // 10. unshift 99 into (5,10,15) -> length=4, arr[0]=99, arr[3]=15
      const arr10 = new SparseArray<int>(5, 10, 15);
      arr10.unshift(99);
      expect(arr10.length).assertEqual(4);
      expect(arr10[0]).assertEqual(99);
      expect(arr10[3]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_PART01_0200
     * @tc.name sparseArrayUnshiftTestPart01002
     * @tc.desc multi-arg unshift insertion order and original element shifting (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayUnshiftTestPart01002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. unshift 10,20 before single 30 -> returns 3, arr[0]=10, arr[1]=20
      const arr1 = SparseArray.of<int>(30);
      const ret1 = arr1.unshift(10, 20);
      expect(ret1).assertEqual(3);
      expect(arr1[0]).assertEqual(10);
      expect(arr1[1]).assertEqual(20);
      // 2. unshift 11,33 into length-4 sparse SparseArray -> returns 6, arr[0]=11, arr[1]=33
      const arr2 = new SparseArray<int>(4);
      arr2[1] = 22;
      arr2[3] = 44;
      const ret2 = arr2.unshift(11, 33);
      expect(ret2).assertEqual(6);
      expect(arr2[0]).assertEqual(11);
      expect(arr2[1]).assertEqual(33);
      // 3. unshift 1,2,3 before 100,200 -> returns 5, arr[3]=100, arr[4]=200
      const arr3 = new SparseArray<int>(100, 200);
      const ret3 = arr3.unshift(1, 2, 3);
      expect(ret3).assertEqual(5);
      expect(arr3[3]).assertEqual(100);
      expect(arr3[4]).assertEqual(200);
      // 4. unshift 5 before 10,20 -> returns 3, arr[0]=5
      const arr4 = new SparseArray<int>(10, 20);
      const ret4 = arr4.unshift(5);
      expect(ret4).assertEqual(3);
      expect(arr4[0]).assertEqual(5);
      // 5. unshift 0.5 before 1.5,2.5 (double) -> returns 3, arr[0]=0.5
      const arr5 = new SparseArray<double>(1.5, 2.5);
      const ret5 = arr5.unshift(0.5);
      expect(ret5).assertEqual(3);
      expect(arr5[0]).assertEqual(0.5);
      // 6. unshift 1,2,3 before 10,20 -> returns 5, order 1,2,3,10,20
      const arr6 = new SparseArray<int>(10, 20);
      const ret6 = arr6.unshift(1, 2, 3);
      expect(ret6).assertEqual(5);
      expect(arr6[0]).assertEqual(1);
      expect(arr6[2]).assertEqual(3);
      expect(arr6[3]).assertEqual(10);
      expect(arr6[4]).assertEqual(20);
      // 7. unshift 0 before 1,2,3,4,5 -> returns 6, arr[0]=0, arr[1]=1, arr[5]=5
      const arr7 = new SparseArray<int>(1, 2, 3, 4, 5);
      const ret7 = arr7.unshift(0);
      expect(ret7).assertEqual(6);
      expect(arr7[0]).assertEqual(0);
      expect(arr7[1]).assertEqual(1);
      expect(arr7[5]).assertEqual(5);
      // 8. unshift 0,0,0 before 7,14,21,28 -> arr[6]=28
      const arr8 = new SparseArray<int>(7, 14, 21, 28);
      arr8.unshift(0, 0, 0);
      expect(arr8[6]).assertEqual(28);
      // 9. unshift 0,1,2 before 5,6 -> length=5, order 0,1,2,5,6
      const arr9 = new SparseArray<int>(5, 6);
      arr9.unshift(0, 1, 2);
      expect(arr9.length).assertEqual(5);
      expect(arr9[0]).assertEqual(0);
      expect(arr9[2]).assertEqual(2);
      expect(arr9[3]).assertEqual(5);
      expect(arr9[4]).assertEqual(6);
      // 10. unshift 10,20 before 30,40,50 -> order 10,20,30,40,50
      const arr10 = new SparseArray<int>(30, 40, 50);
      arr10.unshift(10, 20);
      expect(arr10[0]).assertEqual(10);
      expect(arr10[1]).assertEqual(20);
      expect(arr10[2]).assertEqual(30);
      expect(arr10[3]).assertEqual(40);
      expect(arr10[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_PART01_0300
     * @tc.name sparseArrayUnshiftTestPart01003
     * @tc.desc typed elements, special values, and spread unshift (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayUnshiftTestPart01003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. unshift false into boolean SparseArray (true,false,true) -> arr[3]=true
      const arr1 = new SparseArray<boolean>(true, false, true);
      arr1.unshift(false);
      expect(arr1[3]!).assertTrue();
      // 2. unshift 1.0 before NaN,3.14 (double) -> arr[1] is NaN
      const arr2 = new SparseArray<double>(Double.NaN, 3.14);
      arr2.unshift(1.0);
      expect(isNaN(arr2[1]!)).assertTrue();
      // 3. unshift 0 before 1,2 -> returns 3, arr[0]=0, arr[2]=2
      const arr3 = new SparseArray<int>(1, 2);
      const ret3 = arr3.unshift(0);
      expect(ret3).assertEqual(3);
      expect(arr3[0]).assertEqual(0);
      expect(arr3[2]).assertEqual(2);
      // 4. unshift spread of 100 negative ints before 1,2,3 -> arr[0]=-1, arr[100]=1, arr[101]=2, arr[102]=3
      const arr4 = new SparseArray<int>(1, 2, 3);
      const PUSH_COUNT4: int = 100;
      let values4: int[] = [];
      for (let i: int = 0; i < PUSH_COUNT4; i++) {
        values4.push(-(i + 1));
      }
      arr4.unshift(...values4);
      expect(arr4[0]).assertEqual(-1);
      expect(arr4[100]).assertEqual(1);
      expect(arr4[101]).assertEqual(2);
      expect(arr4[102]).assertEqual(3);
      // 5. unshift int extremes -2147483648,0,2147483647 -> length=3, arr[0]=MIN, arr[1]=0, arr[2]=MAX
      const arr5 = new SparseArray<int>();
      arr5.unshift(-2147483648, 0, 2147483647);
      expect(arr5.length).assertEqual(3);
      expect(arr5[0]).assertEqual(-2147483648);
      expect(arr5[1]).assertEqual(0);
      expect(arr5[2]).assertEqual(2147483647);
      // 6. unshift tab before 'x' (string) -> arr[0]='\t'
      const arr6 = new SparseArray<string>('x');
      arr6.unshift('\t');
      expect(arr6[0]).assertEqual('\t');
      // 7. unshift NaN,+Inf,-Inf before 100.0 (double) -> length=4, arr[0]=NaN, arr[1]=+Inf, arr[2]=-Inf
      const arr7 = new SparseArray<double>(100.0);
      arr7.unshift(Double.NaN, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY);
      expect(arr7.length).assertEqual(4);
      expect(isNaN(arr7[0]!)).assertTrue();
      expect(arr7[1]).assertEqual(Double.POSITIVE_INFINITY);
      expect(arr7[2]).assertEqual(Double.NEGATIVE_INFINITY);
    });
  });
}
