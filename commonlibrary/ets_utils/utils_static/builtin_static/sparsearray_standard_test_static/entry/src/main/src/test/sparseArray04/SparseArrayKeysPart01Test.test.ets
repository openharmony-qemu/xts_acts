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

// Merged from 19 SparseArrayKeysPart01Test scenarios -> 2 cases, each <=10
export default function sparseArrayKeysPart01Test(): void {
  describe('SparseArrayKeysPart01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_PART01_0100
     * @tc.name sparseArrayKeysPart01Test001
     * @tc.desc keys() yields contiguous 0..n-1 across single/multi/length-change/reindex/for-of (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayKeysPart01Test001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. keys() on of(42) -> [0] then done
      const arr1 = SparseArray.of<int>(42);
      const iter1 = arr1.keys();
      expect(iter1.next().value).assertEqual(0);
      expect(iter1.next().done).assertTrue();
      // 2. keys() on (1,2,3) -> [0,1,2] then done
      const arr2 = new SparseArray<int>(1, 2, 3);
      const iter2 = arr2.keys();
      expect(iter2.next().value).assertEqual(0);
      expect(iter2.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(2);
      expect(iter2.next().done).assertTrue();
      // 3. keys() after length=3 on (1,2,3,4,5) -> [0,1,2] then done
      const arr3 = new SparseArray<int>(1, 2, 3, 4, 5);
      arr3.length = 3;
      const iter3 = arr3.keys();
      expect(iter3.next().value).assertEqual(0);
      expect(iter3.next().value).assertEqual(1);
      expect(iter3.next().value).assertEqual(2);
      expect(iter3.next().done).assertTrue();
      // 4. keys() after length=10 on (1,2) -> [0,1] then done
      const arr4 = new SparseArray<int>(1, 2);
      arr4.length = 10;
      const iter4 = arr4.keys();
      expect(iter4.next().value).assertEqual(0);
      expect(iter4.next().value).assertEqual(1);
      expect(iter4.next().done).assertTrue();
      // 5. keys() on overwrite arr[0]=1,2,3 -> [0] then done
      const arr5 = new SparseArray<int>();
      arr5[0] = 1;
      arr5[0] = 2;
      arr5[0] = 3;
      const iter5 = arr5.keys();
      expect(iter5.next().value).assertEqual(0);
      expect(iter5.next().done).assertTrue();
      // 6. keys() after push(30) on (10,20) -> [0,1,2] then done
      const arr6 = new SparseArray<int>(10, 20);
      arr6.push(30);
      const iter6 = arr6.keys();
      expect(iter6.next().value).assertEqual(0);
      expect(iter6.next().value).assertEqual(1);
      expect(iter6.next().value).assertEqual(2);
      expect(iter6.next().done).assertTrue();
      // 7. keys() after pop() on (10,20,30) -> [0,1] then done
      const arr7 = new SparseArray<int>(10, 20, 30);
      arr7.pop();
      const iter7 = arr7.keys();
      expect(iter7.next().value).assertEqual(0);
      expect(iter7.next().value).assertEqual(1);
      expect(iter7.next().done).assertTrue();
      // 8. keys() after splice(1,1) on (10,20,30) -> [0,1] then done
      const arr8 = new SparseArray<int>(10, 20, 30);
      arr8.splice(1, 1);
      const iter8 = arr8.keys();
      expect(iter8.next().value).assertEqual(0);
      expect(iter8.next().value).assertEqual(1);
      expect(iter8.next().done).assertTrue();
      // 9. for-of over keys() on (10,20,30) -> 3 keys
      const arr9 = new SparseArray<int>(10, 20, 30);
      const iter9 = arr9.keys();
      let count9 = 0;
      for (let k of iter9) {
        count9++;
      }
      expect(count9).assertEqual(3);
      // 10. keys() on len=100 fully filled -> [0..99] then done
      const arr10 = new SparseArray<int>(100);
      for (let i = 0; i < 100; i++) {
        arr10[i] = i;
      }
      const iter10 = arr10.keys();
      for (let i = 0; i < 100; i++) {
        let expected10: number = i;
        expect(iter10.next().value).assertEqual(expected10);
      }
      expect(iter10.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_PART01_0200
     * @tc.name sparseArrayKeysPart01Test002
     * @tc.desc keys() sparse-hole/high-index/empty + multiple & parallel iterators (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayKeysPart01Test002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. keys() on len=10 sparse@{2,5} -> [2,5] then done
      const arr1 = new SparseArray<int>(10);
      arr1[2] = 42;
      arr1[5] = 99;
      const iter1 = arr1.keys();
      expect(iter1.next().value).assertEqual(2);
      expect(iter1.next().value).assertEqual(5);
      expect(iter1.next().done).assertTrue();
      // 2. keys() on len=10 sparse@{9} -> [9] then done
      const arr2 = new SparseArray<int>(10);
      arr2[9] = 42;
      const iter2 = arr2.keys();
      expect(iter2.next().value).assertEqual(9);
      expect(iter2.next().done).assertTrue();
      // 3. keys() on len=10 sparse@{2,5,7} -> [2,5,7] then done
      const arr3 = new SparseArray<int>(10);
      arr3[7] = 1;
      arr3[2] = 2;
      arr3[5] = 3;
      const iter3 = arr3.keys();
      expect(iter3.next().value).assertEqual(2);
      expect(iter3.next().value).assertEqual(5);
      expect(iter3.next().value).assertEqual(7);
      expect(iter3.next().done).assertTrue();
      // 4. keys() on (1,1)+arr[100]=42 -> [0,1,100] then done
      const arr4 = new SparseArray<int>(1, 1);
      arr4[100] = 42;
      const iter4 = arr4.keys();
      expect(iter4.next().value).assertEqual(0);
      expect(iter4.next().value).assertEqual(1);
      expect(iter4.next().value).assertEqual(100);
      expect(iter4.next().done).assertTrue();
      // 5. keys() on empty -> done true, value undefined
      const arr5 = new SparseArray<int>();
      const iter5 = arr5.keys();
      let r5 = iter5.next();
      expect(r5.done).assertTrue();
      expect(r5.value).assertUndefined();
      // 6. exhaust it1 then fresh it2 on (10,20,30) -> [0] not done
      const arr6 = new SparseArray<int>(10, 20, 30);
      const it6a = arr6.keys();
      while (!it6a.next().done) {}
      const it6b = arr6.keys();
      let r6 = it6b.next();
      expect(r6.value).assertEqual(0);
      expect(r6.done).assertFalse();
      // 7. parallel it1+1 / it2+2 on (10,20,30) -> [1] and [2]
      const arr7 = new SparseArray<int>(10, 20, 30);
      const it7a = arr7.keys();
      const it7b = arr7.keys();
      it7a.next();
      it7b.next();
      it7b.next();
      expect(it7a.next().value).assertEqual(1);
      expect(it7b.next().value).assertEqual(2);
      // 8. it1 before & it2 after arr[2]=3 on (1,2) -> both [0]
      const arr8 = new SparseArray<int>(1, 2);
      const it8a = arr8.keys();
      arr8[2] = 3;
      const it8b = arr8.keys();
      expect(it8a.next().value).assertEqual(0);
      expect(it8b.next().value).assertEqual(0);
      // 9. two keys() calls on (1,2) -> distinct iterators
      const arr9 = new SparseArray<int>(1, 2);
      const it9a = arr9.keys();
      const it9b = arr9.keys();
      expect(it9a === it9b).assertFalse();
    });
  });
}
