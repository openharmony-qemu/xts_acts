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

export default function sparseArrayLastIndexOfTestPart02(): void {
  describe("SparseArrayLastIndexOfPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_PART02_0100
     * @tc.name sparseArrayLastIndexOfTestPart02001
     * @tc.desc lastIndexOf found/not-found, fromIndex, mutation & sparse (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayLastIndexOfTestPart02001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. lastIndexOf(null, 3) on (0, null, 2, null, 4) -> 3
      const arr1 = new SparseArray<int | null>(0, null, 2, null, 4);
      expect(arr1.lastIndexOf(null, 3)).assertEqual(3);
      // 2. lastIndexOf(99) on (99, 1, 2, 99, 3) -> 3; (99, 0) -> 0
      const arr2 = new SparseArray<int>(99, 1, 2, 99, 3);
      expect(arr2.lastIndexOf(99)).assertEqual(3);
      expect(arr2.lastIndexOf(99, 0)).assertEqual(0);
      // 3. lastIndexOf('target') on ('target', 'other1', 'other2') -> 0; ('target', 0) -> 0
      const arr3 = new SparseArray<string>('target', 'other1', 'other2');
      expect(arr3.lastIndexOf('target')).assertEqual(0);
      expect(arr3.lastIndexOf('target', 0)).assertEqual(0);
      // 4. lastIndexOf(0.0) on (0.0, 1.1, 2.2, 3.3, 0.0) -> 4; (0.0, 0) -> 0
      const arr4 = new SparseArray<double>(0.0, 1.1, 2.2, 3.3, 0.0);
      expect(arr4.lastIndexOf(0.0)).assertEqual(4);
      expect(arr4.lastIndexOf(0.0, 0)).assertEqual(0);
      // 5. lastIndexOf('dog') on ('cat', 'dog', 'bird', 'dog') leaves elements unchanged
      const arr5 = new SparseArray<string>('cat', 'dog', 'bird', 'dog');
      arr5.lastIndexOf('dog');
      expect(arr5[0]!).assertEqual('cat');
      expect(arr5[1]!).assertEqual('dog');
      expect(arr5[2]!).assertEqual('bird');
      expect(arr5[3]!).assertEqual('dog');
      // 6. lastIndexOf('d', 4) on sparse {0:'a', 3:'d'} leaves holes at 1, 2 undefined
      const arr6 = new SparseArray<string>(4);
      arr6[0] = 'a';
      arr6[3] = 'd';
      arr6.lastIndexOf('d', 4);
      expect(arr6[1]).assertUndefined();
      expect(arr6[2]).assertUndefined();
      // 7. lastIndexOf(9) on (1, 2, 3) -> -1; (9, 2) -> -1
      const arr7 = new SparseArray<int>(1, 2, 3);
      expect(arr7.lastIndexOf(9)).assertEqual(-1);
      expect(arr7.lastIndexOf(9, 2)).assertEqual(-1);
      // 8. fromIndex 100 beyond length on (1, 2, 3, 1) -> 1 at 3, 2 at 1
      const arr8 = new SparseArray<int>(1, 2, 3, 1);
      expect(arr8.lastIndexOf(1, 100)).assertEqual(3);
      expect(arr8.lastIndexOf(2, 100)).assertEqual(1);
      // 9. fromIndex = length on (5, 6, 7, 5) -> 5 at 3, equals lastIndexOf(5) -> 3
      const arr9 = new SparseArray<int>(5, 6, 7, 5);
      expect(arr9.lastIndexOf(5, 4)).assertEqual(3);
      expect(arr9.lastIndexOf(5)).assertEqual(3);
      // 10. fromIndex 0 on ('a', 'b', 'c') -> 'c' at -1, 'a' at 0
      const arr10 = new SparseArray<string>('a', 'b', 'c');
      expect(arr10.lastIndexOf('c', 0)).assertEqual(-1);
      expect(arr10.lastIndexOf('a', 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_PART02_0200
     * @tc.name sparseArrayLastIndexOfTestPart02002
     * @tc.desc lastIndexOf repeated elements, negative/overflow fromIndex & typed/special values (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayLastIndexOfTestPart02002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. lastIndexOf('x') on ('x', 'y', 'x', 'z') -> 2; ('x', 1) -> 0
      const arr1 = new SparseArray<string>('x', 'y', 'x', 'z');
      expect(arr1.lastIndexOf('x')).assertEqual(2);
      expect(arr1.lastIndexOf('x', 1)).assertEqual(0);
      // 2. lastIndexOf('yes') on ('yes', 'no', 'yes') -> 2; ('yes', 0) -> 0
      const arr2 = new SparseArray<string>('yes', 'no', 'yes');
      expect(arr2.lastIndexOf('yes')).assertEqual(2);
      expect(arr2.lastIndexOf('yes', 0)).assertEqual(0);
      // 3. lastIndexOf on (4, 5, 4, 5, 4): (4) -> 4, (4, 0) -> 0, (5) -> 3, (5, 1) -> 1
      const arr3 = new SparseArray<int>(4, 5, 4, 5, 4);
      expect(arr3.lastIndexOf(4)).assertEqual(4);
      expect(arr3.lastIndexOf(4, 0)).assertEqual(0);
      expect(arr3.lastIndexOf(5)).assertEqual(3);
      expect(arr3.lastIndexOf(5, 1)).assertEqual(1);
      // 4. lastIndexOf(7) on (7, 7, 7, 7) -> 3; (7, 1) -> 1
      const arr4 = new SparseArray<int>(7, 7, 7, 7);
      expect(arr4.lastIndexOf(7)).assertEqual(3);
      expect(arr4.lastIndexOf(7, 1)).assertEqual(1);
      // 5. negative fromIndex: lastIndexOf(3, -1) on (3, 1, 3, 2, 4) -> 2, equals lastIndexOf(3) -> 2
      const arr5 = new SparseArray<int>(3, 1, 3, 2, 4);
      expect(arr5.lastIndexOf(3, -1)).assertEqual(2);
      expect(arr5.lastIndexOf(3)).assertEqual(2);
      // 6. fromIndex INT_MAX 2147483647 on (8, 9, 8) -> 8 at 2, 9 at 1 (no overflow)
      const arr6 = new SparseArray<int>(8, 9, 8);
      expect(arr6.lastIndexOf(8, 2147483647)).assertEqual(2);
      expect(arr6.lastIndexOf(9, 2147483647)).assertEqual(1);
      // 7. booleans: lastIndexOf(true) on (false, true, false, true) -> 3; (false) -> 2
      const arr7 = new SparseArray<boolean>(false, true, false, true);
      expect(arr7.lastIndexOf(true)).assertEqual(3);
      expect(arr7.lastIndexOf(false)).assertEqual(2);
      // 8. bigints: lastIndexOf(200n) on (100n, 200n, 200n) -> 2; (100n) -> 0
      const arr8 = new SparseArray<bigint>(100n, 200n, 200n);
      expect(arr8.lastIndexOf(200n)).assertEqual(2);
      expect(arr8.lastIndexOf(100n)).assertEqual(0);
      const dateA: Date = new Date(0);
      const dateB: Date = new Date(1000);
      const arr9 = new SparseArray<Date>(dateA, dateB, dateA);
      expect(arr9.lastIndexOf(dateA)).assertEqual(2);
      expect(arr9.lastIndexOf(new Date(0))).assertEqual(-1);
    });
  });
}
