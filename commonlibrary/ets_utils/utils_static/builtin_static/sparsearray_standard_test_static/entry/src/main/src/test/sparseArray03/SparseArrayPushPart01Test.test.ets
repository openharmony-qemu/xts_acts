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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

interface Obj04902 {
  id: int;
}

// Consolidated SparseArrayPushPart01Test (28 scenarios -> 3 merged cases, each <=10)
export default function sparseArrayPushTestPart01(): void {
  describe('SparseArrayPushTestPart01', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_PART01_0100
     * @tc.name sparseArrayPushPart01Test001
     * @tc.desc push() single element on empty SparseArray returns new length & appends (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayPushPart01Test001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. push(0) on empty SparseArray<int> -> 1
      const arr1 = new SparseArray<int>();
      expect(arr1.push(0)).assertEqual(1);
      // 2. push zero-width space on empty SparseArray<string> -> 1
      const arr2 = new SparseArray<string>();
      expect(arr2.push('\u200B')).assertEqual(1);
      // 3. push(0.0) on empty SparseArray<double> -> 1
      const arr3 = new SparseArray<double>();
      expect(arr3.push(0.0)).assertEqual(1);
      // 4. push(0n) on empty SparseArray<bigint> -> 1
      const arr4 = new SparseArray<bigint>();
      expect(arr4.push(0n)).assertEqual(1);
      // 5. push(new Date(0)) on empty SparseArray<Date> -> 1
      const arr5 = new SparseArray<Date>();
      expect(arr5.push(new Date(0))).assertEqual(1);
      // 6. push empty number[] on empty SparseArray<number[]> -> 1
      const arr6 = new SparseArray<number[]>();
      const emptyArr6: number[] = [];
      expect(arr6.push(emptyArr6)).assertEqual(1);
      // 7. push(1000) on empty SparseArray<int> stores 1000 at index 0
      const arr7 = new SparseArray<int>();
      arr7.push(1000);
      expect(arr7[0]!).assertEqual(1000);
      // 8. push('中文') on empty SparseArray<string> stores at index 0
      const arr8 = new SparseArray<string>();
      arr8.push('\u4E2D\u6587');
      expect(arr8[0]!).assertEqual('\u4E2D\u6587');
      // 9. push 10000-char string on empty SparseArray<string> -> length 1, intact
      const longStr9: string = 'a'.repeat(10000);
      const arr9 = new SparseArray<string>();
      arr9.push(longStr9);
      expect(arr9.length).assertEqual(1);
      expect(arr9[0]!).assertEqual(longStr9);
      // 10. push('hello') on empty SparseArray<string> -> 1, stores hello
      const arr10 = new SparseArray<string>();
      expect(arr10.push('hello')).assertEqual(1);
      expect(arr10[0]!).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_PART01_0200
     * @tc.name sparseArrayPushPart01Test002
     * @tc.desc multi-arg & sequential push appends elements in order and returns new length (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayPushPart01Test002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. push(1,2,3) on empty SparseArray<int> -> 3, in order
      const arr1 = new SparseArray<int>();
      expect(arr1.push(1, 2, 3)).assertEqual(3);
      expect(arr1[0]!).assertEqual(1);
      expect(arr1[1]!).assertEqual(2);
      expect(arr1[2]!).assertEqual(3);
      // 2. push(40,50,60) on SparseArray<int>(10,20,30) -> 6
      const arr2 = new SparseArray<int>(10, 20, 30);
      expect(arr2.push(40, 50, 60)).assertEqual(6);
      expect(arr2.length).assertEqual(6);
      // 3. push(4,5) on SparseArray<int>(1,2,3) -> 5, stores 4,5 at indices 3,4
      const arr3 = new SparseArray<int>(1, 2, 3);
      expect(arr3.push(4, 5)).assertEqual(5);
      expect(arr3.length).assertEqual(5);
      expect(arr3[3]!).assertEqual(4);
      expect(arr3[4]!).assertEqual(5);
      // 4. push(true,false,true) on empty SparseArray<boolean> -> 3, in order
      const arr4 = new SparseArray<boolean>();
      arr4.push(true, false, true);
      expect(arr4.length).assertEqual(3);
      expect(arr4[0]!).assertTrue();
      expect(arr4[1]!).assertFalse();
      expect(arr4[2]!).assertTrue();
      // 5. push(true,false) on empty SparseArray<boolean> -> 2
      const arr5 = new SparseArray<boolean>();
      expect(arr5.push(true, false)).assertEqual(2);
      expect(arr5[0]!).assertTrue();
      expect(arr5[1]!).assertFalse();
      // 6. sequential push(10) then push(20,30) on empty SparseArray<int> -> 3, values 10,20,30
      const arr6 = new SparseArray<int>();
      arr6.push(10);
      arr6.push(20, 30);
      expect(arr6.length).assertEqual(3);
      expect(arr6[0]!).assertEqual(10);
      expect(arr6[1]!).assertEqual(20);
      expect(arr6[2]!).assertEqual(30);
      // 7. push two SparseArray<int> on empty SparseArray<SparseArray<int>> -> 2, nested 10,20
      const arr7 = new SparseArray<SparseArray<int>>();
      const innerArr7a: SparseArray<int> = SparseArray.of<int>(10);
      const innerArr7b: SparseArray<int> = SparseArray.of<int>(20);
      expect(arr7.push(innerArr7a, innerArr7b)).assertEqual(2);
      expect(arr7[0]![0]!).assertEqual(10);
      expect(arr7[1]![0]!).assertEqual(20);
      // 8. push(0) on SparseArray<int>(-2147483648, 2147483647) -> 3
      const arr8 = new SparseArray<int>(-2147483648, 2147483647);
      expect(arr8.push(0)).assertEqual(3);
      // 9. push(new Date(0)) on empty SparseArray<Date> -> 1, getTime 0
      const arr9 = new SparseArray<Date>();
      expect(arr9.push(new Date(0))).assertEqual(1);
      expect(arr9[0]!.getTime()).assertEqual(0);
      // 10. push(99) on length-3 SparseArray<int> with index 1 empty -> index 1 stays undefined
      const arr10 = new SparseArray<int>(3);
      arr10[0] = 1;
      arr10.push(99);
      expect(arr10[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_PART01_0300
     * @tc.name sparseArrayPushPart01Test003
     * @tc.desc push() no-args & special values: return value vs arr.length & element preservation (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayPushPart01Test003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. push() no args on SparseArray<int>(1,2,3) -> length 3, ret 3, unchanged
      const arr1 = new SparseArray<int>(1, 2, 3);
      expect(arr1.push()).assertEqual(3);
      expect(arr1.length).assertEqual(3);
      expect(arr1[0]!).assertEqual(1);
      expect(arr1[1]!).assertEqual(2);
      expect(arr1[2]!).assertEqual(3);
      // 2. push() then push(30) on SparseArray<int>(10,20) -> length 3, ret 3, 30 at index 2
      const arr2 = new SparseArray<int>(10, 20);
      expect(arr2.push()).assertEqual(2);
      expect(arr2.push(30)).assertEqual(3);
      expect(arr2.length).assertEqual(3);
      expect(arr2[2]!).assertEqual(30);
      // 3. push() on length-5 SparseArray<int> with [2]=99 -> ret 5, preserves 99
      const arr3 = new SparseArray<int>(5);
      arr3[2] = 99;
      expect(arr3.push()).assertEqual(5);
      expect(arr3.length).assertEqual(5);
      expect(arr3[2]!).assertEqual(99);
      // 4. push() on SparseArray<double>(1.1) -> ret 1, value unchanged
      const arr4 = new SparseArray<double>(1.1);
      expect(arr4.push()).assertEqual(1);
      expect(arr4[0]!).assertEqual(1.1);
      // 5. push() on SparseArray<Date>(firstDate, secondDate) -> ret 2, identity preserved
      const firstDate5: Date = new Date(1);
      const secondDate5: Date = new Date(2);
      const arr5 = new SparseArray<Date>(firstDate5, secondDate5);
      expect(arr5.push()).assertEqual(2);
      const sameHead5: boolean = arr5[0]! === firstDate5;
      expect(sameHead5).assertTrue();
      const sameTail5: boolean = arr5[1]! === secondDate5;
      expect(sameTail5).assertTrue();
      // 6. push(Double.NaN) on empty SparseArray<double> -> length 1, NaN
      const arr6 = new SparseArray<double>();
      arr6.push(Double.NaN);
      expect(arr6.length).assertEqual(1);
      const nan6: boolean = isNaN(arr6[0]!);
      expect(nan6).assertTrue();
      // 7. push(Double.EPSILON) on empty SparseArray<double> -> length 1, > 0
      const arr7 = new SparseArray<double>();
      arr7.push(Double.EPSILON);
      expect(arr7.length).assertEqual(1);
      const positive7: boolean = arr7[0]! > 0;
      expect(positive7).assertTrue();
      // 8. push(undefined) on empty SparseArray<Obj04902 | undefined> -> length 1, index 0 undefined
      const arr8 = new SparseArray<Obj04902 | undefined>();
      arr8.push(undefined);
      expect(arr8.length).assertEqual(1);
      expect(arr8[0]).assertUndefined();
    });
  });
}
