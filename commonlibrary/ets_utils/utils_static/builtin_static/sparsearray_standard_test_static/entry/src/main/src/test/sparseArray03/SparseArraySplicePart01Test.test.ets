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

export default function sparseArraySpliceTestPart01(): void {
  describe("SparseArraySpliceTestPart01", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_PART01_0100
     * @tc.name sparseArraySpliceTestPart01001
     * @tc.desc splice delete returns removed elements & negative/out-of-bounds start (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArraySpliceTestPart01001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. splice(1) on [10,20,30,40,50] -> deletes tail, deleted.length=4, arr.length=1
      const arr1 = new SparseArray<int>(10, 20, 30, 40, 50);
      const deleted1 = arr1.splice(1);
      expect(arr1.length).assertEqual(1);
      expect(deleted1.length).assertEqual(4);
      expect(deleted1[0]).assertEqual(20);
      expect(arr1[0]).assertEqual(10);
      // 2. splice(start,0) on 3/5-elem arrays -> deletes nothing, keeps length & middle
      const arr2a = new SparseArray<int>(10, 20, 30);
      const deleted2a = arr2a.splice(1, 0);
      expect(deleted2a.length).assertEqual(0);
      expect(arr2a.length).assertEqual(3);
      expect(arr2a[1]).assertEqual(20);
      const arr2b = new SparseArray<int>(10, 20, 30, 40, 50);
      const deleted2b = arr2b.splice(2, 0);
      expect(deleted2b.length).assertEqual(0);
      expect(arr2b.length).assertEqual(5);
      expect(arr2b[2]).assertEqual(30);
      // 3. splice(0,1) on [10,20,30] -> removes first, deleted[0]=10, arr[0]=20
      const arr3 = new SparseArray<int>(10, 20, 30);
      const deleted3 = arr3.splice(0, 1);
      expect(deleted3[0]).assertEqual(10);
      expect(arr3[0]).assertEqual(20);
      expect(arr3.length).assertEqual(2);
      // 4. splice(len-1,1) on [10,20,30] -> removes last, deleted[0]=30, arr.length=2
      const arr4 = new SparseArray<int>(10, 20, 30);
      const deleted4 = arr4.splice(arr4.length - 1, 1);
      expect(deleted4[0]).assertEqual(30);
      expect(arr4.length).assertEqual(2);
      // 5. splice(2,2) on [10,20,30,40,50] -> removes two, deleted.length=2, arr.length=3
      const arr5 = new SparseArray<int>(10, 20, 30, 40, 50);
      const deleted5 = arr5.splice(2, 2);
      expect(deleted5.length).assertEqual(2);
      expect(arr5.length).assertEqual(3);
      // 6. splice(1,2) on [10,20,30,40] -> removes [20,30], deleted.length=2, arr[1]=40
      const arr6 = new SparseArray<int>(10, 20, 30, 40);
      const deleted6 = arr6.splice(1, 2);
      expect(deleted6.length).assertEqual(2);
      expect(arr6[0]).assertEqual(10);
      expect(arr6[1]).assertEqual(40);
      // 7. splice(2) on [10,20,30,40] -> deletes tail, deleted.length=2, arr.length=2
      const arr7 = new SparseArray<int>(10, 20, 30, 40);
      const deleted7 = arr7.splice(2);
      expect(arr7.length).assertEqual(2);
      expect(deleted7.length).assertEqual(2);
      expect(deleted7[0]).assertEqual(30);
      expect(deleted7[1]).assertEqual(40);
      // 8. splice(-1) and splice(2) on [10,20,30] -> both delete only 30, length 2
      const arr8a = new SparseArray<int>(10, 20, 30);
      const deleted8a = arr8a.splice(-1);
      expect(deleted8a.length).assertEqual(1);
      expect(deleted8a[0]).assertEqual(30);
      expect(arr8a.length).assertEqual(2);
      const arr8b = new SparseArray<int>(10, 20, 30);
      const deleted8b = arr8b.splice(2);
      expect(deleted8b.length).assertEqual(1);
      expect(deleted8b[0]).assertEqual(30);
      expect(arr8b.length).assertEqual(2);
      // 9. splice(-5,2) on [10,20,30,40,50] -> negative start, deleted[0]=10, deleted.length=2
      const arr9 = new SparseArray<int>(10, 20, 30, 40, 50);
      const deleted9 = arr9.splice(-5, 2);
      expect(deleted9.length).assertEqual(2);
      expect(deleted9[0]).assertEqual(10);
      // 10. splice(999,1) on [10,20,30] -> out-of-range, deleted.length=0
      const arr10 = new SparseArray<int>(10, 20, 30);
      const deleted10 = arr10.splice(999, 1);
      expect(deleted10.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_PART01_0200
     * @tc.name sparseArraySpliceTestPart01002
     * @tc.desc splice insert grows length & replace (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArraySpliceTestPart01002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. splice(0,0,10,20) on empty -> inserts 10,20, deleted.length=0, arr.length=2
      const arr1 = new SparseArray<int>();
      const deleted1 = arr1.splice(0, 0, 10, 20);
      expect(deleted1.length).assertEqual(0);
      expect(arr1.length).assertEqual(2);
      expect(arr1[0]).assertEqual(10);
      expect(arr1[1]).assertEqual(20);
      // 2. splice(1,0,30,40,50) on [10,20] -> inserts 3, deleted.length=0, arr.length=5
      const arr2 = new SparseArray<int>(10, 20);
      const deleted2 = arr2.splice(1, 0, 30, 40, 50);
      expect(deleted2.length).assertEqual(0);
      expect(arr2.length).assertEqual(5);
      expect(arr2[1]).assertEqual(30);
      expect(arr2[2]).assertEqual(40);
      expect(arr2[3]).assertEqual(50);
      // 3. splice(1,0,20,30) on [10,40] -> inserts 2, deleted.length=0, arr.length=4
      const arr3 = new SparseArray<int>(10, 40);
      const deleted3 = arr3.splice(1, 0, 20, 30);
      expect(deleted3.length).assertEqual(0);
      expect(arr3.length).assertEqual(4);
      expect(arr3[0]).assertEqual(10);
      expect(arr3[1]).assertEqual(20);
      expect(arr3[2]).assertEqual(30);
      expect(arr3[3]).assertEqual(40);
      // 4. splice(1,0,99) on sparse holes [10,_,30] -> inserts 99, deleted.length=0, arr.length=4
      const arr4 = new SparseArray<int>(3);
      arr4[0] = 10;
      arr4[2] = 30;
      const deleted4 = arr4.splice(1, 0, 99);
      expect(deleted4.length).assertEqual(0);
      expect(arr4.length).assertEqual(4);
      expect(arr4[1]).assertEqual(99);
      // 5. splice(1,0,2147483647) on [10,20] -> inserts INT_MAX, arr[1]=2147483647, arr.length=3
      const arr5 = new SparseArray<int>(10, 20);
      const deleted5 = arr5.splice(1, 0, 2147483647);
      expect(deleted5.length).assertEqual(0);
      expect(arr5[1]).assertEqual(2147483647);
      expect(arr5.length).assertEqual(3);
      // 6. splice(1,0,2,3,4,5,6,7) on [1,8] -> inserts 6, deleted.length=0, arr.length=8
      const arr6 = new SparseArray<int>(1, 8);
      const deleted6 = arr6.splice(1, 0, 2, 3, 4, 5, 6, 7);
      expect(deleted6.length).assertEqual(0);
      expect(arr6.length).assertEqual(8);
      // 7. splice(0,2,100,200) on [10,20,30,40] -> replaces first two, deleted[0]=10, arr[0]=100
      const arr7 = new SparseArray<int>(10, 20, 30, 40);
      const deleted7 = arr7.splice(0, 2, 100, 200);
      expect(deleted7.length).assertEqual(2);
      expect(deleted7[0]).assertEqual(10);
      expect(arr7[0]).assertEqual(100);
      expect(arr7[1]).assertEqual(200);
      // 8. splice(1,10,40,50) on [10,20,30] -> count exceeds tail, deleted.length=2, arr.length=3
      const arr8 = new SparseArray<int>(10, 20, 30);
      const deleted8 = arr8.splice(1, 10, 40, 50);
      expect(deleted8.length).assertEqual(2);
      expect(arr8.length).assertEqual(3);
      expect(arr8[1]).assertEqual(40);
      expect(arr8[2]).assertEqual(50);
      // 9. splice(1,2,71,72) on [10,20,30,40,50] -> replaces two, deleted.length=2, arr[1]=71
      const arr9 = new SparseArray<int>(10, 20, 30, 40, 50);
      const deleted9 = arr9.splice(1, 2, 71, 72);
      expect(deleted9.length).assertEqual(2);
      expect(arr9[1]).assertEqual(71);
      expect(arr9[2]).assertEqual(72);
      // 10. splice(1,1,99) on [10,20,30] -> replaces one, deleted[0]=20, arr[1]=99
      const arr10 = new SparseArray<int>(10, 20, 30);
      const deleted10 = arr10.splice(1, 1, 99);
      expect(deleted10.length).assertEqual(1);
      expect(deleted10[0]).assertEqual(20);
      expect(arr10.length).assertEqual(3);
      expect(arr10[0]).assertEqual(10);
      expect(arr10[1]).assertEqual(99);
      expect(arr10[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_PART01_0300
     * @tc.name sparseArraySpliceTestPart01003
     * @tc.desc splice return value & length with count 0/negative (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArraySpliceTestPart01003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. splice(1,0,99) and splice(1,-1,99) on [10,20,30] -> both delete nothing, arr.length=4
      const arr1a = new SparseArray<int>(10, 20, 30);
      const deleted1a = arr1a.splice(1, 0, 99);
      expect(deleted1a.length).assertEqual(0);
      expect(arr1a.length).assertEqual(4);
      expect(arr1a[1]).assertEqual(99);
      expect(arr1a[2]).assertEqual(20);
      const arr1b = new SparseArray<int>(10, 20, 30);
      const deleted1b = arr1b.splice(1, -1, 99);
      expect(deleted1b.length).assertEqual(0);
      expect(arr1b.length).assertEqual(4);
      expect(arr1b[1]).assertEqual(99);
      expect(arr1b[2]).assertEqual(20);
      // 2. splice(1) vs splice(1,0) vs splice(1,undefined) on [10,20,30] -> omitted deletes 2, 0/undefined deletes 0
      const arr2a = new SparseArray<int>(10, 20, 30);
      const deleted2a = arr2a.splice(1);
      const arr2b = new SparseArray<int>(10, 20, 30);
      const deleted2b = arr2b.splice(1, 0);
      expect(deleted2a.length).assertEqual(2);
      expect(deleted2b.length).assertEqual(0);
      expect(arr2a.length).assertEqual(1);
      expect(arr2b.length).assertEqual(3);
      const arr2c = new SparseArray<int>(10, 20, 30);
      const deleted2c = arr2c.splice(1, undefined);
      expect(deleted2c.length).assertEqual(deleted2b.length);
      expect(arr2c.length).assertEqual(arr2b.length);
      // 3. splice(1) vs splice(1,0) on [10,20] -> omitted length 1, count 0 length 2
      const arr3a = new SparseArray<int>(10, 20);
      arr3a.splice(1);
      const arr3b = new SparseArray<int>(10, 20);
      arr3b.splice(1, 0);
      expect(arr3a.length).assertEqual(1);
      expect(arr3b.length).assertEqual(2);
      // 4. splice(1) vs splice(1,3) and splice(1,100) on [10,20,30] -> omitted matches count 3 and 100
      const arr4a = new SparseArray<int>(10, 20, 30);
      const deleted4a = arr4a.splice(1);
      const arr4b = new SparseArray<int>(10, 20, 30);
      const deleted4b = arr4b.splice(1, 3);
      expect(deleted4a.length).assertEqual(deleted4b.length);
      expect(arr4a.length).assertEqual(arr4b.length);
      const arr4c = new SparseArray<int>(10, 20, 30);
      const deleted4c = arr4c.splice(1, 100);
      expect(deleted4a.length).assertEqual(deleted4c.length);
      expect(arr4a.length).assertEqual(arr4c.length);
      // 5. splice(1) vs splice(1,3) on [10,20,30,40] -> identical toString
      const arr5a = new SparseArray<int>(10, 20, 30, 40);
      arr5a.splice(1);
      const arr5b = new SparseArray<int>(10, 20, 30, 40);
      arr5b.splice(1, 3);
      expect(arr5a.toString()).assertEqual(arr5b.toString());
      // 6. splice(1,-1) vs splice(1,0) on [10,20,30] -> negative count matches count 0
      const arr6a = new SparseArray<int>(10, 20, 30);
      const deleted6a = arr6a.splice(1, -1);
      const arr6b = new SparseArray<int>(10, 20, 30);
      const deleted6b = arr6b.splice(1, 0);
      expect(deleted6a.length).assertEqual(deleted6b.length);
      expect(arr6a.length).assertEqual(arr6b.length);
      // 7. splice(1,2) on [10,20,30] -> deleted modifiable to 999, arr[0] stays 10
      const arr7 = new SparseArray<int>(10, 20, 30);
      const deleted7 = arr7.splice(1, 2);
      deleted7[0] = 999;
      expect(deleted7[0]).assertEqual(999);
      expect(arr7[0]).assertEqual(10);
    });
  });
}
