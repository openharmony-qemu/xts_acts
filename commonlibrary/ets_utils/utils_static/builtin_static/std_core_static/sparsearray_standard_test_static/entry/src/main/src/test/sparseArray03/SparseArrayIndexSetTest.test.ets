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

export default function sparseArrayIndexSetTest(): void {
  describe('SparseArrayIndexSetTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSEARRAY_INDEXSET_0100
     * @tc.name sparseArrayIndexSetTest001
     * @tc.desc index-set grows length & iterator interaction (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIndexSetTest001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. empty int: arr[0]=42 grows length 0->1 and arr[0] reads 42
      const arr1 = new SparseArray<int>();
      expect(arr1.length).assertEqual(0);
      arr1[0] = 42;
      expect(arr1.length).assertEqual(1);
      expect(arr1[0]!).assertEqual(42);
      // 2. overwrite arr[0]=1 then 2 then 3 keeps length 1 and arr[0]==3
      const arr2 = new SparseArray<int>();
      arr2[0] = 1;
      arr2[0] = 2;
      arr2[0] = 3;
      expect(arr2.length).assertEqual(1);
      expect(arr2[0]!).assertEqual(3);
      // 3. arr[2]=3 on (1,2) grows length 2->3 and arr[2]==3
      const arr3 = new SparseArray<int>(1, 2);
      arr3[2] = 3;
      expect(arr3.length).assertEqual(3);
      expect(arr3[2]!).assertEqual(3);
      // 4. keys() after arr[0]=1 and arr[4]=5 yields 0 then 4 then done
      const arr4 = new SparseArray<int>();
      arr4[0] = 1;
      arr4[4] = 5;
      const iter4 = arr4.keys();
      let r4 = iter4.next();
      expect(r4.done).assertFalse();
      expect(r4.value!).assertEqual(0);
      r4 = iter4.next();
      expect(r4.done).assertFalse();
      expect(r4.value!).assertEqual(4);
      r4 = iter4.next();
      expect(r4.done).assertTrue();
      // 5. forEach after arr[0]=100 and arr[4]=500 runs callback twice
      const arr5 = new SparseArray<int>();
      arr5[0] = 100;
      arr5[4] = 500;
      let count5: int = 0;
      arr5.forEach((v: int, k: int) => {
        count5 = count5 + 1;
      });
      expect(count5).assertEqual(2);
      // 6. values() on (1,2) then arr[4]=5 yields 1,2,5 then done
      const arr6 = new SparseArray<int>(1, 2);
      const iter6 = arr6.values();
      arr6[4] = 5;
      let r6 = iter6.next();
      expect(r6.value!).assertEqual(1);
      r6 = iter6.next();
      expect(r6.value!).assertEqual(2);
      r6 = iter6.next();
      expect(r6.value!).assertEqual(5);
      r6 = iter6.next();
      expect(r6.done).assertTrue();
      // 7. live values() on ('a','b','c'): replace arr[2]='z' mid-iter yields a,b,z then done
      const arr7 = new SparseArray<string>('a', 'b', 'c');
      const iter7 = arr7.values();
      let r7 = iter7.next();
      expect(r7.value!).assertEqual('a');
      r7 = iter7.next();
      arr7[2] = 'z';
      expect(r7.value!).assertEqual('b');
      r7 = iter7.next();
      expect(r7.value!).assertEqual('z');
      r7 = iter7.next();
      expect(r7.done).assertTrue();
      // 8. live entries() on (10,20,30): replace arr[2]=99 mid-iter yields 10,20,99 then done
      const arr8 = new SparseArray<int>(10, 20, 30);
      const iter8 = arr8.entries();
      let r8 = iter8.next();
      expect(r8.value![1]).assertEqual(10);
      arr8[2] = 99;
      r8 = iter8.next();
      expect(r8.value![1]).assertEqual(20);
      r8 = iter8.next();
      expect(r8.value![1]).assertEqual(99);
      r8 = iter8.next();
      expect(r8.done).assertTrue();
      // 9. forEach on (1,2,3): adding arr[5]=6 at key 2 makes count 4 and arr[5]==6
      const arr9 = new SparseArray<int>(1, 2, 3);
      let count9: int = 0;
      arr9.forEach((v: int, k: int) => {
        count9 = count9 + 1;
        if (k === 2) {
          arr9[5] = 6;
        }
      });
      expect(count9).assertEqual(4);
      expect(arr9[5]!).assertEqual(6);
      // 10. arr[2]=arr[1] on (10,20,30) leaves both arr[2] and arr[1] equal to 20
      const arr10 = new SparseArray<int>(10, 20, 30);
      arr10[2] = arr10[1]!;
      expect(arr10[2]!).assertEqual(20);
      expect(arr10[1]!).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSEARRAY_INDEXSET_0200
     * @tc.name sparseArrayIndexSetTest002
     * @tc.desc index-set beyond length (holes) & string results (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIndexSetTest002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. arr[3]=99 after shrink length=2 on (10,20,30,40) keeps length 4, arr[2] undefined, arr[3]==99
      const arr1 = new SparseArray<int>(10, 20, 30, 40);
      arr1.length = 2;
      arr1[3] = 99;
      expect(arr1.length).assertEqual(4);
      expect(arr1[0]!).assertEqual(10);
      expect(arr1[1]!).assertEqual(20);
      expect(arr1[2]).assertUndefined();
      expect(arr1[3]!).assertEqual(99);
      // 2. arr[0]='a' and arr[2]='c' leaves middle hole so join() returns 'a,,c'
      const arr2 = new SparseArray<string>();
      arr2[0] = 'a';
      arr2[2] = 'c';
      expect(arr2.join()).assertEqual('a,,c');
      // 3. arr[0]='a' and arr[3]='d' makes length 4, includes('d') true, includes('b') false
      const arr3 = new SparseArray<string>();
      arr3[0] = 'a';
      arr3[3] = 'd';
      expect(arr3.length).assertEqual(4);
      expect(arr3.includes('d')).assertTrue();
      expect(arr3.includes('b')).assertFalse();
      // 4. arr[0]=1,arr[1]=2,arr[2]=3 then join() returns '1,2,3'
      const arr4 = new SparseArray<int>();
      arr4[0] = 1;
      arr4[1] = 2;
      arr4[2] = 3;
      expect(arr4.join()).assertEqual('1,2,3');
      // 5. arr[0]='hello',arr[1]='world' makes includes('hello') true and includes('missing') false
      const arr5 = new SparseArray<string>();
      arr5[0] = 'hello';
      arr5[1] = 'world';
      expect(arr5.includes('hello')).assertTrue();
      expect(arr5.includes('missing')).assertFalse();
      // 6. arr[0]=undefined on (1,2) of int|undefined keeps length 2, forEach count 2, arr[0] undefined
      const arr6 = new SparseArray<int | undefined>(1, 2);
      arr6[0] = undefined;
      let count6: int = 0;
      arr6.forEach((v: int | undefined, k: int) => {
        count6 = count6 + 1;
      });
      expect(arr6.length).assertEqual(2);
      expect(count6).assertEqual(2);
      expect(arr6[0]).assertUndefined();
      // 7. arr[0]='x',arr[1]='y' makes at(0)=='x' and at(1)=='y'
      const arr7 = new SparseArray<string>();
      arr7[0] = 'x';
      arr7[1] = 'y';
      expect(arr7.at(0)!).assertEqual('x');
      expect(arr7.at(1)!).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSEARRAY_INDEXSET_0300
     * @tc.name sparseArrayIndexSetTest003
     * @tc.desc negative index ignored & typed elements (4 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIndexSetTest003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. arr[-1]=99 on (1,2,3) leaves length 3 with arr[0]==1 and arr[2]==3
      const arr1 = new SparseArray<int>(1, 2, 3);
      arr1[-1] = 99;
      expect(arr1.length).assertEqual(3);
      expect(arr1[0]!).assertEqual(1);
      expect(arr1[2]!).assertEqual(3);
      // 2. arr[0..2]='first','second','third' makes at(-1)=='third' and at(-3)=='first'
      const arr2 = new SparseArray<string>();
      arr2[0] = 'first';
      arr2[1] = 'second';
      arr2[2] = 'third';
      expect(arr2.at(-1)!).assertEqual('third');
      expect(arr2.at(-3)!).assertEqual('first');
      // 3. arr[0]=1.5,arr[1]=2.25 on double makes length 2 and both values read back unchanged
      const arr3 = new SparseArray<double>();
      arr3[0] = 1.5;
      arr3[1] = 2.25;
      expect(arr3.length).assertEqual(2);
      expect(arr3[0]!).assertEqual(1.5);
      expect(arr3[1]!).assertEqual(2.25);
      // 4. arr[0]=100n on bigint makes length 1 and arr[0] reads 100n
      const arr4 = new SparseArray<bigint>();
      arr4[0] = 100n;
      expect(arr4.length).assertEqual(1);
      expect(arr4[0]!).assertEqual(100n);
    });
  });
}
