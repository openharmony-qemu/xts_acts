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
} from '../../../../hypium/index';
import Utils from '../Util.test';

interface SparseArrayFillPart01Item {
  id: number;
  name: string;
}

interface SparseArrayFillPart03Object {
  id: int;
}

// Merged from SparseArrayFillPart01Test + SparseArrayFillPart03Test (39 scenarios -> 4 cases, each <=10)
export default function sparseArrayFillPartTest(): void {
  describe('SparseArrayFillPartTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_PART_0100
     * @tc.name sparseArrayFillPartTest001
     * @tc.desc full-range fill, empty no-op & fill returns this (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFillPartTest001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. fill(9) on empty -> length 0, returns this
      const arr1 = new SparseArray<int>();
      const r1 = arr1.fill(9);
      expect(r1).assertEqual(arr1);
      expect(arr1.length).assertEqual(0);
      // 2. fill(5) default on empty -> length 0 (no-op)
      const arr2 = new SparseArray<int>();
      arr2.fill(5);
      expect(arr2.length).assertEqual(0);
      // 3. fill(9) on (1,2,3,4) -> 9,9,9,9
      const arr3 = new SparseArray<int>(1, 2, 3, 4);
      arr3.fill(9);
      expect(arr3[0]).assertEqual(9);
      expect(arr3[3]).assertEqual(9);
      // 4. fill(9) on len=5 sparse@{0,4} -> 9,9,9
      const arr4 = new SparseArray<int>(5);
      arr4[0] = 1;
      arr4[4] = 5;
      arr4.fill(9);
      expect(arr4[0]).assertEqual(9);
      expect(arr4[1]).assertEqual(9);
      expect(arr4[4]).assertEqual(9);
      // 5. fill(INT_MAX) on (1,2) -> INT_MAX,INT_MAX
      const arr5 = new SparseArray<int>(1, 2);
      arr5.fill(2147483647);
      expect(arr5[0]).assertEqual(2147483647);
      expect(arr5[1]).assertEqual(2147483647);
      // 6. fill('中文') on ('en','us') -> '中文','中文'
      const arr6 = new SparseArray<string>('en', 'us');
      arr6.fill('中文');
      expect(arr6[0]).assertEqual('中文');
      expect(arr6[1]).assertEqual('中文');
      // 7. fill(0.0) on (1.5,2.5) -> 0.0,0.0
      const arr7 = new SparseArray<number>(1.5, 2.5);
      arr7.fill(0.0);
      expect(arr7[0]).assertEqual(0.0);
      expect(arr7[1]).assertEqual(0.0);
      // 8. fill(0n) on (1n,2n,3n) -> 0n,0n,0n
      const arr8 = new SparseArray<bigint>(1n, 2n, 3n);
      arr8.fill(0n);
      expect(arr8[0]).assertEqual(0n);
      expect(arr8[2]).assertEqual(0n);
      // 9. fill(9,0,2) on (1,2,3) -> 9,9,3, result===arr (returns this)
      const arr9 = new SparseArray<int>(1, 2, 3);
      const r9 = arr9.fill(9, 0, 2);
      expect(r9).assertEqual(arr9);
      expect(arr9[0]).assertEqual(9);
      expect(arr9[1]).assertEqual(9);
      expect(arr9[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_PART_0200
     * @tc.name sparseArrayFillPartTest002
     * @tc.desc typed fill special & object types (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFillPartTest002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. fill(true) on (false,false,false) -> true,true,true
      const arr1 = new SparseArray<boolean>(false, false, false);
      arr1.fill(true);
      expect(arr1[0]).assertTrue();
      expect(arr1[2]).assertTrue();
      // 2. fill(false) on (true,true,true) -> false,false,false
      const arr2 = new SparseArray<boolean>(true, true, true);
      arr2.fill(false);
      expect(arr2[0]).assertFalse();
      expect(arr2[2]).assertFalse();
      // 3. fill(Double.NaN) on (1.0,2.0) -> NaN,NaN
      const arr3 = new SparseArray<number>(1.0, 2.0);
      arr3.fill(Double.NaN);
      expect(isNaN(arr3[0]!)).assertTrue();
      expect(isNaN(arr3[1]!)).assertTrue();
      // 4. fill(Double.POSITIVE_INFINITY) on (1.0,2.0)
      const arr4 = new SparseArray<number>(1.0, 2.0);
      arr4.fill(Double.POSITIVE_INFINITY);
      expect(arr4[0]).assertEqual(Double.POSITIVE_INFINITY);
      expect(arr4[1]).assertEqual(Double.POSITIVE_INFINITY);
      // 5. fill(Double.MAX_VALUE) on (1.0,2.0)
      const arr5 = new SparseArray<number>(1.0, 2.0);
      arr5.fill(Double.MAX_VALUE);
      expect(arr5[0]).assertEqual(Double.MAX_VALUE);
      expect(arr5[1]).assertEqual(Double.MAX_VALUE);
      // 6. fill(bigint MIN) on (0n,0n) -> MIN,MIN
      const arr6 = new SparseArray<bigint>(0n, 0n);
      arr6.fill(-9223372036854775807n - 1n);
      expect(arr6[0]).assertEqual(-9223372036854775807n - 1n);
      expect(arr6[1]).assertEqual(-9223372036854775807n - 1n);
      // 7. fill(replacement obj) on (obj,obj) -> 99,'filled'
      const obj7: SparseArrayFillPart01Item = { id: 1, name: 'test' };
      const arr7 = new SparseArray<SparseArrayFillPart01Item>(obj7, obj7);
      const rep7: SparseArrayFillPart01Item = { id: 99, name: 'filled' };
      arr7.fill(rep7);
      expect(arr7[0]!.id).assertEqual(99);
      expect(arr7[0]!.name).assertEqual('filled');
      expect(arr7[1]!.id).assertEqual(99);
      expect(arr7[1]!.name).assertEqual('filled');
      // 8. fill(fillDate) on (d1,d2) -> 5000,5000
      const arr8 = new SparseArray<Date>(new Date(1000), new Date(2000));
      const fd8: Date = new Date(5000);
      arr8.fill(fd8);
      expect(arr8[0]!.getTime()).assertEqual(5000);
      expect(arr8[1]!.getTime()).assertEqual(5000);
      // 9. fill(fillRe) on (r1,r2) -> 'fill','fill'
      const arr9 = new SparseArray<RegExp>(new RegExp('abc'), new RegExp('xyz'));
      const fr9: RegExp = new RegExp('fill');
      arr9.fill(fr9);
      expect(arr9[0]!.source).assertEqual('fill');
      expect(arr9[1]!.source).assertEqual('fill');
      // 10. fill(fillArr) on (inner1,inner2) -> 9,9,9,9
      const arr10 = new SparseArray<int[]>([1, 2], [3, 4]);
      const fa10: int[] = [9, 9];
      arr10.fill(fa10);
      expect(arr10[0]![0]).assertEqual(9);
      expect(arr10[0]![1]).assertEqual(9);
      expect(arr10[1]![0]).assertEqual(9);
      expect(arr10[1]![1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_PART_0300
     * @tc.name sparseArrayFillPartTest003
     * @tc.desc partial range fill(start,end) (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFillPartTest003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. fill(9,1) on (1,2,3) -> 1,9,9
      const arr1 = new SparseArray<int>(1, 2, 3);
      arr1.fill(9, 1);
      expect(arr1[0]).assertEqual(1);
      expect(arr1[1]).assertEqual(9);
      expect(arr1[2]).assertEqual(9);
      // 2. fill(9,0,-2) on (1,2,3,4) -> 9,9,3,4
      const arr2 = new SparseArray<int>(1, 2, 3, 4);
      arr2.fill(9, 0, -2);
      expect(arr2[0]).assertEqual(9);
      expect(arr2[1]).assertEqual(9);
      expect(arr2[2]).assertEqual(3);
      expect(arr2[3]).assertEqual(4);
      // 3. fill(9,0,5) on len=5 sparse@{0,4} -> 9,9,9
      const arr3 = new SparseArray<int>(5);
      arr3[0] = 1;
      arr3[4] = 5;
      arr3.fill(9, 0, 5);
      expect(arr3[0]).assertEqual(9);
      expect(arr3[1]).assertEqual(9);
      expect(arr3[4]).assertEqual(9);
      expect(arr3.length).assertEqual(5);
      // 4. fill(9,2,200) on len=6 sparse@{0,5} -> 1,9,9,9,9,9 (end clamp)
      const arr4 = new SparseArray<int>(6);
      arr4[0] = 1;
      arr4[5] = 6;
      arr4.fill(9, 2, 200);
      expect(arr4[0]).assertEqual(1);
      expect(arr4[2]).assertEqual(9);
      expect(arr4[3]).assertEqual(9);
      expect(arr4[4]).assertEqual(9);
      expect(arr4[5]).assertEqual(9);
      // 5. fill(5,0,3) on empty -> no extend, length 0
      const arr5 = new SparseArray<int>();
      arr5.fill(5, 0, 3);
      expect(arr5.length).assertEqual(0);
      expect(arr5[0]).assertUndefined();
      expect(arr5[2]).assertUndefined();
      // 6. fill(5,2,5) on len=5 sparse arr[0]=99 -> preserve 99, fill arr[2..4]=5
      const arr6 = new SparseArray<int>(5);
      arr6[0] = 99;
      arr6.fill(5, 2, 5);
      expect(arr6.length).assertEqual(5);
      expect(arr6[0]).assertEqual(99);
      expect(arr6[1]).assertUndefined();
      expect(arr6[2]).assertEqual(5);
      expect(arr6[4]).assertEqual(5);
      // 7. fill(0,4,5) on (1,2,3,4,5) -> only last becomes 0
      const arr7 = new SparseArray<int>(1, 2, 3, 4, 5);
      arr7.fill(0, 4, 5);
      expect(arr7.length).assertEqual(5);
      expect(arr7[3]).assertEqual(4);
      expect(arr7[4]).assertEqual(0);
      // 8. fill(7,1,5) on len=5 sparse@{0,4} -> arr[1]=7,arr[3]=7,arr[4]=7
      const arr8 = new SparseArray<int>(5);
      arr8[0] = 1;
      arr8[4] = 5;
      arr8.fill(7, 1, 5);
      expect(arr8[1]).assertEqual(7);
      expect(arr8[3]).assertEqual(7);
      expect(arr8[4]).assertEqual(7);
      // 9. fill(7,2,8) on len=6 sparse@{0,5} arr[0]=10,arr[5]=50 -> clamp end, length 6
      const arr9 = new SparseArray<int>(6);
      arr9[0] = 10;
      arr9[5] = 50;
      arr9.fill(7, 2, 8);
      expect(arr9.length).assertEqual(6);
      expect(arr9[1]).assertUndefined();
      expect(arr9[2]).assertEqual(7);
      expect(arr9[5]).assertEqual(7);
      expect(arr9[7]).assertUndefined();
      // 10. compound: fill(5,0,6) on (1,2); length=4; fill(7,0,4) -> 7,7,7,7
      const arr10 = new SparseArray<int>(1, 2);
      arr10.fill(5, 0, 6);
      arr10.length = 4;
      arr10.fill(7, 0, 4);
      expect(arr10.length).assertEqual(4);
      expect(arr10[0]).assertEqual(7);
      expect(arr10[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_PART_0400
     * @tc.name sparseArrayFillPartTest004
     * @tc.desc negative start, no-op start, end clamp & typed no-op/clamp (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFillPartTest004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. fill(0,-2,5) on (8,8,8,8,8) -> 8,8,8,0,0 (negative start)
      const arr1 = new SparseArray<int>(8, 8, 8, 8, 8);
      arr1.fill(0, -2, 5);
      expect(arr1[0]).assertEqual(8);
      expect(arr1[2]).assertEqual(8);
      expect(arr1[3]).assertEqual(0);
      expect(arr1[4]).assertEqual(0);
      // 2. fill(0,5,8) on (4,4,4) -> no-op, length 3
      const arr2 = new SparseArray<int>(4, 4, 4);
      arr2.fill(0, 5, 8);
      expect(arr2.length).assertEqual(3);
      expect(arr2[0]).assertEqual(4);
      expect(arr2[4]).assertUndefined();
      expect(arr2[5]).assertUndefined();
      expect(arr2[7]).assertUndefined();
      // 3. fill(1,0,6) on (6,6,6) -> clamp end, length 3, all 1
      const arr3 = new SparseArray<int>(6, 6, 6);
      arr3.fill(1, 0, 6);
      expect(arr3.length).assertEqual(3);
      expect(arr3[0]).assertEqual(1);
      expect(arr3[2]).assertEqual(1);
      // 4. fill(7,-3,6) on (11,22,33,44,55,66) -> 11,22,33,7,7,7 (negative start)
      const arr4 = new SparseArray<int>(11, 22, 33, 44, 55, 66);
      arr4.fill(7, -3, 6);
      expect(arr4[0]).assertEqual(11);
      expect(arr4[2]).assertEqual(33);
      expect(arr4[3]).assertEqual(7);
      expect(arr4[5]).assertEqual(7);
      // 5. fill(7,INT_MAX) on (1,2,3) -> no-op (start boundary)
      const arr5 = new SparseArray<int>(1, 2, 3);
      arr5.fill(7, 2147483647);
      expect(arr5[0]).assertEqual(1);
      expect(arr5[2]).assertEqual(3);
      expect(arr5.length).assertEqual(3);
      // 6. fill(7,-2,7) on (10,20,30,40,50) -> clamp both, length 5, arr[3..4]=7
      const arr6 = new SparseArray<int>(10, 20, 30, 40, 50);
      arr6.fill(7, -2, 7);
      expect(arr6.length).assertEqual(5);
      expect(arr6[1]).assertEqual(20);
      expect(arr6[3]).assertEqual(7);
      expect(arr6[4]).assertEqual(7);
      expect(arr6[6]).assertUndefined();
      // 7. fill('x',2,5) on ('a','b') -> no extend, length 2 (string)
      const arr7 = new SparseArray<string>('a', 'b');
      arr7.fill('x', 2, 5);
      expect(arr7.length).assertEqual(2);
      expect(arr7[0]).assertEqual('a');
      expect(arr7[2]).assertUndefined();
      expect(arr7[4]).assertUndefined();
      // 8. fill(true,0,4) on (true,false) -> clamp end, length 2, arr[0]=true (boolean)
      const arr8 = new SparseArray<boolean>(true, false);
      arr8.fill(true, 0, 4);
      expect(arr8.length).assertEqual(2);
      expect(arr8[0]).assertTrue();
      expect(arr8[3]).assertUndefined();
      // 9. fill(newObj,1,4) on (obj) -> no extend, length 1 (object)
      const obj9: SparseArrayFillPart03Object = { id: 99 };
      const arr9 = new SparseArray<SparseArrayFillPart03Object>(obj9);
      const newObj9: SparseArrayFillPart03Object = { id: 88 };
      arr9.fill(newObj9, 1, 4);
      expect(arr9.length).assertEqual(1);
      expect(arr9[0]!.id).assertEqual(99);
      expect(arr9[1]).assertUndefined();
      expect(arr9[3]).assertUndefined();
      // 10. fill(d,0,3) on (new Date(0)) -> clamp end, length 1, arr[0].getTime()=5000 (Date)
      const dateA: Date = new Date(5000);
      const arr10 = new SparseArray<Date>(new Date(0));
      arr10.fill(dateA, 0, 3);
      expect(arr10.length).assertEqual(1);
      expect(arr10[0]!.getTime()).assertEqual(5000);
      expect(arr10[2]).assertUndefined();
    });
  });
}
