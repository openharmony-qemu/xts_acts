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

// Merged from SparseArrayAtPart01Test + SparseArrayAtPart03Test01 (28 scenarios -> 4 cases, each <=10)
export default function sparseArrayAtPartTest(): void {
  describe('SparseArrayAtPartTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_PART_0100
     * @tc.name sparseArrayAtPartTest001
     * @tc.desc at() positive index & sparse access (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayAtPartTest001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. at(0) on (10,20,30) -> 10
      const arr1 = new SparseArray<int>(10, 20, 30);
      expect(arr1.at(0)).assertEqual(10);
      // 2. at(1) on (100,200) -> 200
      const arr2 = new SparseArray<int>(100, 200);
      expect(arr2.at(1)).assertEqual(200);
      // 3. at(length-2) on (5,10,15) -> 10
      const arr3 = new SparseArray<int>(5, 10, 15);
      expect(arr3.at(arr3.length - 2)).assertEqual(10);
      // 4. at(0) on len=5 sparse {1,3} -> undefined
      const arr4 = new SparseArray<int>(5);
      arr4[1] = 10;
      arr4[3] = 30;
      expect(arr4.at(0)).assertUndefined();
      // 5. at(0) after arr[0]=99 -> 99
      const arr5 = new SparseArray<int>();
      arr5[0] = 99;
      expect(arr5.at(0)).assertEqual(99);
      // 6. at(2) on len=4 sparse {0,2} -> 77
      const arr6 = new SparseArray<int>(4);
      arr6[0] = 55;
      arr6[2] = 77;
      expect(arr6.at(2)).assertEqual(77);
      // 7. at(lastIdx) on (11,22,33,44) -> 44
      const arr7 = new SparseArray<int>(11, 22, 33, 44);
      expect(arr7.at(arr7.length - 1)).assertEqual(44);
      // 8. at(lastIdx) on len=5 sparse {0,4} -> 50
      const arr8 = new SparseArray<int>(5);
      arr8[0] = 10;
      arr8[4] = 50;
      expect(arr8.at(arr8.length - 1)).assertEqual(50);
      // 9. at(0) on single-element ('only') -> 'only'
      const arr9 = new SparseArray<string>('only');
      expect(arr9.at(0)).assertEqual('only');
      // 10. from([100,200,300]) then at(0) -> 100
      const arr10 = SparseArray.from<int>([100, 200, 300]);
      expect(arr10.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_PART_0200
     * @tc.name sparseArrayAtPartTest002
     * @tc.desc at() negative index (5 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayAtPartTest002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. at(-1) on ('x','y','z') -> 'z'
      const arr1 = new SparseArray<string>('x', 'y', 'z');
      expect(arr1.at(-1)).assertEqual('z');
      // 2. at(-2) on ('p','q','r','s') -> 'r'
      const arr2 = new SparseArray<string>('p', 'q', 'r', 's');
      expect(arr2.at(-2)).assertEqual('r');
      // 3. at(-length) on (100,200,300) -> 100
      const arr3 = new SparseArray<int>(100, 200, 300);
      expect(arr3.at(-arr3.length)).assertEqual(100);
      // 4. at(-length) after arr[0]=42 -> 42
      const arr4 = new SparseArray<int>();
      arr4[0] = 42;
      expect(arr4.at(-arr4.length)).assertEqual(42);
      // 5. at(-1) === at(length-1)
      const arr5 = new SparseArray<string>('first', 'middle', 'last');
      expect(arr5.at(-1)).assertEqual(arr5.at(arr5.length - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_PART_0300
     * @tc.name sparseArrayAtPartTest003
     * @tc.desc at() out-of-bounds positive & length-change (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayAtPartTest003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. at(length) on (10,20,30) -> undefined
      const arr1 = new SparseArray<int>(10, 20, 30);
      expect(arr1.at(arr1.length)).assertUndefined();
      // 2. at(length+1) on (1,2,3,4,5) -> undefined
      const arr2 = new SparseArray<int>(1, 2, 3, 4, 5);
      expect(arr2.at(arr2.length + 1)).assertUndefined();
      // 3. at(10000) on (1,2,3) -> undefined
      const arr3 = new SparseArray<int>(1, 2, 3);
      expect(arr3.at(10000)).assertUndefined();
      // 4. at(0x7fffffff) MAX on (10,20) -> undefined
      const arr4 = new SparseArray<int>(10, 20);
      expect(arr4.at(0x7fffffff)).assertUndefined();
      // 5. at(-2147483648) INT_MIN on ('a','b','c') -> undefined
      const arr5 = new SparseArray<string>('a', 'b', 'c');
      expect(arr5.at(-2147483648)).assertUndefined();
      // 6. at(4) after length=5 on (1,2,3) -> undefined
      const arr6 = new SparseArray<int>(1, 2, 3);
      arr6.length = 5;
      expect(arr6.at(4)).assertUndefined();
      // 7. at(4) after shrink length=2 on (10,20,30,40,50) -> undefined
      const arr7 = new SparseArray<int>(10, 20, 30, 40, 50);
      arr7.length = 2;
      expect(arr7.at(4)).assertUndefined();
      // 8. at(3) after length=5 on (10,20) -> undefined
      const arr8 = new SparseArray<int>(10, 20);
      arr8.length = 5;
      expect(arr8.at(3)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_PART_0400
     * @tc.name sparseArrayAtPartTest004
     * @tc.desc at() negative out-of-bounds & typed at(length) (5 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayAtPartTest004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. at(-length-1) on (10,20,30) -> undefined
      const arr1 = new SparseArray<int>(10, 20, 30);
      expect(arr1.at(-arr1.length - 1)).assertUndefined();
      // 2. byte: at(length) on (1,2,3) -> undefined
      const arr2 = new SparseArray<byte>(Int.toByte(1), Int.toByte(2), Int.toByte(3));
      expect(arr2.at(arr2.length)).assertUndefined();
      // 3. char: at(length) on (A,B) -> undefined
      const arr3 = new SparseArray<char>(c'A', c'B');
      expect(arr3.at(arr3.length)).assertUndefined();
      // 4. Map: at(length) on (m) -> undefined
      const m: Map<string, int> = new Map<string, int>();
      m.set('k', 1);
      const arr4 = new SparseArray<Map<string, int>>(m);
      expect(arr4.at(arr4.length)).assertUndefined();
      // 5. Array<int>: at(length) on (sub) -> undefined
      const sub: Array<int> = [100, 200];
      const arr5 = new SparseArray<Array<int>>(sub);
      expect(arr5.at(arr5.length)).assertUndefined();
    });
  });
}
