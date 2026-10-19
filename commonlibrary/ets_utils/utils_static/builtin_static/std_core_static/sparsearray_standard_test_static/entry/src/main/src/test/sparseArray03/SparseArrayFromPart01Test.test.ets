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

interface Item00801 {
  id: int;
}

// Merged from SparseArrayFromPart01Test (10 scenarios -> 1 case, <=10 each)
export default function sparseArrayFromTestPart01(): void {
  describe('SparseArrayFromPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_PART01_0100
     * @tc.name sparseArrayFromTestPart01001
     * @tc.desc from() input types, mapFn, copy & reference semantics (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFromTestPart01001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. from(Item00801[]) preserves object id fields [1,2]
      const obj1: Item00801 = { id: 1 };
      const obj2: Item00801 = { id: 2 };
      const src1: Item00801[] = [obj1, obj2];
      const arr1 = SparseArray.from<Item00801>(src1);
      expect(arr1[0]!.id).assertEqual(1);
      expect(arr1[1]!.id).assertEqual(2);
      // 2. from(boolean[]) and from with mapFn both preserve [true,false]
      const src2: boolean[] = [true, false];
      const arr2 = SparseArray.from<boolean>(src2);
      const arr2m = SparseArray.from<boolean, boolean>(src2, (v: boolean, k: int): boolean => v);
      expect(arr2[0]!).assertEqual(arr2m[0]!);
      expect(arr2[1]!).assertEqual(arr2m[1]!);
      // 3. from(Set<string>) and from with mapFn both preserve ['p','q','r']
      const set3: Set<string> = new Set<string>(['p', 'q', 'r']);
      const arr3 = SparseArray.from<string>(set3);
      const arr3m = SparseArray.from<string, string>(set3, (v: string, k: int): string => v);
      expect(arr3[0]!).assertEqual(arr3m[0]!);
      expect(arr3[1]!).assertEqual(arr3m[1]!);
      expect(arr3[2]!).assertEqual(arr3m[2]!);
      // 4. from(Map.keys()) creates [10,20] with length 2 in insertion order
      const map4: Map<int, string> = new Map<int, string>();
      map4.set(10, 'x');
      map4.set(20, 'y');
      const arr4 = SparseArray.from<int>(map4.keys());
      expect(arr4.length).assertEqual(2);
      expect(arr4[0]!).assertEqual(10);
      expect(arr4[1]!).assertEqual(20);
      // 5. from(int[]) on [10,20,30] yields length 3 with elements 10,20,30
      const arr5 = SparseArray.from<int>([10, 20, 30]);
      expect(arr5.length).assertEqual(3);
      expect(arr5[0]!).assertEqual(10);
      expect(arr5[1]!).assertEqual(20);
      expect(arr5[2]!).assertEqual(30);
      // 6. from(int[], mapFn doubler) on [1,2,3] yields [2,4,6]
      const arr6 = SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => v * 2);
      expect(arr6.length).assertEqual(3);
      expect(arr6[0]!).assertEqual(2);
      expect(arr6[1]!).assertEqual(4);
      expect(arr6[2]!).assertEqual(6);
      // 7. from(string[], mapFn index) on ['a','b','c'] yields [0,1,2]
      const arr7 = SparseArray.from<string, int>(['a', 'b', 'c'], (v: string, k: int): int => k);
      expect(arr7.length).assertEqual(3);
      expect(arr7[0]!).assertEqual(0);
      expect(arr7[1]!).assertEqual(1);
      expect(arr7[2]!).assertEqual(2);
      // 8. from(int[]) on [-1,0,1] preserves negative and zero
      const arr8 = SparseArray.from<int>([-1, 0, 1]);
      expect(arr8[0]!).assertEqual(-1);
      expect(arr8[1]!).assertEqual(0);
      expect(arr8[2]!).assertEqual(1);
      // 9. from(int[]) copies elements so result mutation leaves source unchanged
      const src9: int[] = [1, 2, 3];
      const arr9 = SparseArray.from<int>(src9);
      arr9[0] = 99;
      expect(arr9[0]!).assertEqual(99);
      expect(src9[0]).assertEqual(1);
      // 10. from(Date[]) keeps element references (same Date instance)
      const date1: Date = new Date(0);
      const date2: Date = new Date(1000);
      const src10: Date[] = [date1, date2];
      const arr10 = SparseArray.from<Date>(src10);
      expect(arr10[0]! === date1).assertEqual(true);
    });
  });
}
