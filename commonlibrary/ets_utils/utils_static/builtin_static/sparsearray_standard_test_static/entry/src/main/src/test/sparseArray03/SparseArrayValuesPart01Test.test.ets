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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

export default function sparseArrayValuesTestPart01(): void {
  describe('SparseArrayValuesTestPart01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_PART01_0100
     * @tc.name sparseArrayValuesTestPart01001
     * @tc.desc values iterator yields elements in order (6 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayValuesTestPart01001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. first next on (10,20) yields done=false and value=10
      const arr1 = new SparseArray<int>(10, 20);
      const iter1 = arr1.values();
      const r1 = iter1.next();
      expect(r1.done).assertFalse();
      expect(r1.value!).assertEqual(10);
      // 2. 'a','b','c' yields all three then done=true
      const arr2 = new SparseArray<string>('a', 'b', 'c');
      const iter2 = arr2.values();
      expect(iter2.next().value!).assertEqual('a');
      expect(iter2.next().value!).assertEqual('b');
      expect(iter2.next().value!).assertEqual('c');
      expect(iter2.next().done).assertTrue();
      // 3. count exactly 3 iterations on (10,20,30) until done=true
      const arr3 = new SparseArray<int>(10, 20, 30);
      const iter3 = arr3.values();
      let count3: int = 0;
      let r3 = iter3.next();
      while (!r3.done) {
        count3 = count3 + 1;
        r3 = iter3.next();
      }
      expect(count3).assertEqual(3);
      // 4. drained iter leaves source (10,20) unmodified: length=2 and elements intact
      const arr4 = new SparseArray<int>(10, 20);
      const iter4 = arr4.values();
      iter4.next();
      iter4.next();
      iter4.next();
      expect(arr4.length).assertEqual(2);
      expect(arr4[0]!).assertEqual(10);
      expect(arr4[1]!).assertEqual(20);
      // 5. push(9) then values yields 9 then done=true
      const arr5 = new SparseArray<int>();
      arr5.push(9);
      const iter5 = arr5.values();
      expect(iter5.next().value!).assertEqual(9);
      expect(iter5.next().done).assertTrue();
      // 6. drained (1,2,3,4,5) counts 5 iterations and last value=5
      const arr6 = new SparseArray<int>(1, 2, 3, 4, 5);
      const iter6 = arr6.values();
      let count6: int = 0;
      let last6: int = 0;
      let r6 = iter6.next();
      while (!r6.done) {
        count6 = count6 + 1;
        last6 = r6.value!;
        r6 = iter6.next();
      }
      expect(count6).assertEqual(5);
      expect(last6).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_PART01_0200
     * @tc.name sparseArrayValuesTestPart01002
     * @tc.desc typed elements (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayValuesTestPart01002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. string with tab and newline characters yielded unchanged
      const arr1 = new SparseArray<string>("line1\tcol2\nline2");
      const iter1 = arr1.values();
      const r1 = iter1.next();
      expect(r1.done).assertFalse();
      expect(r1.value!).assertEqual("line1\tcol2\nline2");
      // 2. boolean false element yields done=false and value=false
      const arr2 = new SparseArray<boolean>(false);
      const iter2 = arr2.values();
      const r2 = iter2.next();
      expect(r2.done).assertFalse();
      expect(r2.value!).assertFalse();
      // 3. single-element string SparseArray yields "hello"
      const arr3 = new SparseArray<string>("hello");
      const iter3 = arr3.values();
      expect(iter3.next().value!).assertEqual("hello");
      // 4. single-element bigint SparseArray yields 0n
      const arr4 = new SparseArray<bigint>(0n);
      const iter4 = arr4.values();
      expect(iter4.next().value!).assertEqual(0n);
      // 5. Error element yields same instance with message "something wrong"
      const e5 = new Error("something wrong");
      const arr5 = new SparseArray<Error>(e5);
      const iter5 = arr5.values();
      const v5 = iter5.next().value;
      expect(v5!.message).assertEqual("something wrong");
      // 6. double elements (1.5, 2.5) yielded in order
      const arr6 = new SparseArray<double>(1.5, 2.5);
      const iter6 = arr6.values();
      expect(iter6.next().value!).assertEqual(1.5);
      expect(iter6.next().value!).assertEqual(2.5);
      // 7. Date element yields the same Date instance that was stored
      const dateA: Date = new Date(0);
      const arr7 = new SparseArray<Date>(dateA);
      const iter7 = arr7.values();
      const actualDate7: Date = iter7.next().value!;
      expect(actualDate7 === dateA).assertTrue();
      // 8. single empty string yields "" rather than undefined
      const arr8 = new SparseArray<string>("");
      const iter8 = arr8.values();
      expect(iter8.next().value!).assertEqual("");
      // 9. negative ints (-5, -6) yielded with signs preserved
      const arr9 = new SparseArray<int>(-5, -6);
      const iter9 = arr9.values();
      expect(iter9.next().value!).assertEqual(-5);
      expect(iter9.next().value!).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_PART01_0300
     * @tc.name sparseArrayValuesTestPart01003
     * @tc.desc empty/all-hole done, sparse-hole skip & multiple iterators (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayValuesTestPart01003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. length-0 int SparseArray yields done=true immediately
      const arr1 = new SparseArray<int>(0);
      const iter1 = arr1.values();
      expect(iter1.next().done).assertTrue();
      // 2. length-42 empty SparseArray yields done=true and value=undefined
      const arr2 = new SparseArray<int>(42);
      const iter2 = arr2.values();
      const r2 = iter2.next();
      expect(r2.done).assertTrue();
      expect(r2.value).assertUndefined();
      // 3. length-42 empty SparseArray stays done=true and value=undefined on second next()
      const arr3 = new SparseArray<int>(42);
      const iter3 = arr3.values();
      iter3.next();
      const r3 = iter3.next();
      expect(r3.done).assertTrue();
      expect(r3.value).assertUndefined();
      // 4. sparse length-4 {0:100, 3:400} yields 100 then 400 then done=true skipping holes
      const arr4 = new SparseArray<int>(4);
      arr4[0] = 100;
      arr4[3] = 400;
      const iter4 = arr4.values();
      expect(iter4.next().value!).assertEqual(100);
      expect(iter4.next().value!).assertEqual(400);
      expect(iter4.next().done).assertTrue();
      // 5. SparseArray<int|undefined>(7, undefined) skips explicit undefined like a hole
      const arr5 = new SparseArray<int | undefined>(7, undefined);
      const iter5 = arr5.values();
      expect(iter5.next().value!).assertEqual(7);
      const r5 = iter5.next();
      expect(r5.value).assertUndefined();
      expect(r5.done).assertTrue();
      // 6. length-2 filled only at index 1 skips leading hole, yields 2 then done=true
      const arr6 = new SparseArray<int>(2);
      arr6[1] = 2;
      const iter6 = arr6.values();
      expect(iter6.next().value!).assertEqual(2);
      expect(iter6.next().done).assertTrue();
      // 7. two independent values iterators over (1,2) advance separately
      const arr7 = new SparseArray<int>(1, 2);
      const it7a = arr7.values();
      const it7b = arr7.values();
      expect(it7a.next().value!).assertEqual(1);
      expect(it7b.next().value!).assertEqual(1);
      expect(it7a.next().value!).assertEqual(2);
    });
  });
}
