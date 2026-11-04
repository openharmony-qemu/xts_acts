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

// Merged from SparseArrayConstructorPart01Test + SparseArrayConstructorPart04Test (44 scenarios -> 5 cases, each <=10)
interface SparseArrayConstructorPartBox {
  id: int;
}
interface SparseArrayConstructorPartData {
  val: int;
}
export default function sparseArrayConstructorPartTest(): void {
  describe('SparseArrayConstructorPartTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_PART_0100
     * @tc.name sparseArrayConstructorPartTest001
     * @tc.desc no-arg constructor: length setter, element storage, holes & instance identity (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayConstructorPartTest001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. length setter on empty SparseArray creates holes (arr[0] undefined)
      const arr1 = new SparseArray<int>();
      arr1.length = 3;
      expect(arr1[0]).assertUndefined();
      // 2. two empty SparseArrays are distinct instances
      const arr2a = new SparseArray<int>();
      const arr2b = new SparseArray<int>();
      expect(arr2a === arr2b).assertFalse();
      // 3. empty SparseArray arr[0]=5 -> length 1
      const arr3 = new SparseArray<int>();
      arr3[0] = 5;
      expect(arr3.length).assertEqual(1);
      // 4. empty SparseArray arr[0]=7 -> arr[0]=7
      const arr4 = new SparseArray<int>();
      arr4[0] = 7;
      expect(arr4[0]).assertEqual(7);
      // 5. empty SparseArray push(11) -> length 1
      const arr5 = new SparseArray<int>();
      arr5.push(11);
      expect(arr5.length).assertEqual(1);
      // 6. empty SparseArray arr[-1]=1 -> length 0, arr[0] undefined
      const arr6 = new SparseArray<int>();
      arr6[-1] = 1;
      expect(arr6.length).assertEqual(0);
      expect(arr6[0]).assertUndefined();
      // 7. empty SparseArray b[0]=99 -> b[0]=99
      const arr7 = new SparseArray<int>();
      arr7[0] = 99;
      expect(arr7[0]).assertEqual(99);
      // 8. two SparseArray<int>(1,2) are distinct instances
      const arr8a = new SparseArray<int>(1, 2);
      const arr8b = new SparseArray<int>(1, 2);
      expect(arr8a === arr8b).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_PART_0200
     * @tc.name sparseArrayConstructorPartTest002
     * @tc.desc no-arg constructor: type coverage, length 0 across types (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayConstructorPartTest002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. SparseArray<long>() -> length 0
      const arr1 = new SparseArray<long>();
      expect(arr1.length).assertEqual(0);
      // 2. SparseArray<string>() -> length 0
      const arr2 = new SparseArray<string>();
      expect(arr2.length).assertEqual(0);
      // 3. SparseArray<boolean>() -> length 0
      const arr3 = new SparseArray<boolean>();
      expect(arr3.length).assertEqual(0);
      // 4. SparseArray<number>() -> length 0
      const arr4 = new SparseArray<number>();
      expect(arr4.length).assertEqual(0);
      // 5. SparseArray<int[]>() -> length 0
      const arr5 = new SparseArray<int[]>();
      expect(arr5.length).assertEqual(0);
      // 6. SparseArray<Map<string, int>>() -> length 0
      const arr6 = new SparseArray<Map<string, int>>();
      expect(arr6.length).assertEqual(0);
      // 7. SparseArray<Set<int>>() -> length 0
      const arr7 = new SparseArray<Set<int>>();
      expect(arr7.length).assertEqual(0);
      // 8. SparseArray<Uint8Array>() -> length 0
      const arr8 = new SparseArray<Uint8Array>();
      expect(arr8.length).assertEqual(0);
      // 9. SparseArray<SparseArray<int>>() -> length 0
      const arr9 = new SparseArray<SparseArray<int>>();
      expect(arr9.length).assertEqual(0);
      // 10. SparseArray<Record<string, int>>() -> length 0
      const arr10 = new SparseArray<Record<string, int>>();
      expect(arr10.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_PART_0300
     * @tc.name sparseArrayConstructorPartTest003
     * @tc.desc no-arg typed element storage & single-arg string/boolean spread (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayConstructorPartTest003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. empty SparseArray<string> arr[0]='hello' -> 'hello'
      const arr1 = new SparseArray<string>();
      arr1[0] = 'hello';
      expect(arr1[0]).assertEqual('hello');
      // 2. empty SparseArray<boolean> arr[0]=true -> true
      const arr2 = new SparseArray<boolean>();
      arr2[0] = true;
      expect(arr2[0]).assertTrue();
      // 3. empty SparseArray<bigint> arr[0]=max bigint -> max bigint
      const arr3 = new SparseArray<bigint>();
      arr3[0] = 9223372036854775807n;
      expect(arr3[0]).assertEqual(9223372036854775807n);
      // 4. empty SparseArray<Date> arr[0]=Date(0) -> same reference
      const arr4 = new SparseArray<Date>();
      const dateA: Date = new Date(0);
      arr4[0] = dateA;
      expect(arr4[0] === dateA).assertTrue();
      // 5. empty SparseArray<Box> arr[0]=obj -> same reference
      const arr5 = new SparseArray<SparseArrayConstructorPartBox>();
      const obj5: SparseArrayConstructorPartBox = { id: 1 };
      arr5[0] = obj5;
      expect(arr5[0] === obj5).assertTrue();
      // 6. empty SparseArray<double> arr[0]=NaN -> NaN
      const arr6 = new SparseArray<double>();
      arr6[0] = Number.NaN;
      expect(arr6[0]).assertNaN();
      // 7. empty SparseArray<double> arr[0]=Infinity -> +Infinity
      const arr7 = new SparseArray<double>();
      arr7[0] = Number.POSITIVE_INFINITY;
      expect(arr7[0]).assertPosUnlimited();
      // 8. new SparseArray<string>('hello') -> length 1, arr[0]='hello'
      const arr8 = new SparseArray<string>('hello');
      expect(arr8.length).assertEqual(1);
      expect(arr8[0]).assertEqual('hello');
      // 9. new SparseArray<boolean>(true) -> length 1, arr[0]=true
      const arr9 = new SparseArray<boolean>(true);
      expect(arr9.length).assertEqual(1);
      expect(arr9[0]).assertTrue();
      // 10. new SparseArray<boolean>(false) -> length 1, arr[0]=false
      const arr10 = new SparseArray<boolean>(false);
      expect(arr10.length).assertEqual(1);
      expect(arr10[0]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_PART_0400
     * @tc.name sparseArrayConstructorPartTest004
     * @tc.desc single-arg spread (object/numeric/variadic) & derived ops (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayConstructorPartTest004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new SparseArray<Box>(obj) -> length 1, arr[0]===obj
      const obj1: SparseArrayConstructorPartBox = { id: 99 };
      const arr1 = new SparseArray<SparseArrayConstructorPartBox>(obj1);
      expect(arr1.length).assertEqual(1);
      expect(arr1[0] === obj1).assertTrue();
      // 2. new SparseArray<Date>(d) -> length 1, arr[0]===d
      const dateA: Date = new Date(0);
      const arr2 = new SparseArray<Date>(dateA);
      expect(arr2.length).assertEqual(1);
      expect(arr2[0] === dateA).assertTrue();
      // 3. new SparseArray<bigint>(0n) -> length 1, arr[0]=0n
      const arr3 = new SparseArray<bigint>(0n);
      expect(arr3.length).assertEqual(1);
      expect(arr3[0]).assertEqual(0n);
      // 4. new SparseArray<double>(0.0) -> length 1, arr[0]=0.0
      const arr4 = new SparseArray<double>(0.0);
      expect(arr4.length).assertEqual(1);
      expect(arr4[0]).assertEqual(0.0);
      // 5. new SparseArray<double>(NaN) -> length 1, arr[0]=NaN
      const arr5 = new SparseArray<double>(Number.NaN);
      expect(arr5.length).assertEqual(1);
      expect(arr5[0]).assertNaN();
      // 6. new SparseArray<number | string | boolean>(42, 'hello', true) -> length 3
      const arr6 = new SparseArray<number | string | boolean>(42, 'hello', true);
      expect(arr6.length).assertEqual(3);
      expect(arr6[0]).assertEqual(42);
      expect(arr6[1]).assertEqual('hello');
      expect(arr6[2]).assertTrue();
      // 7. new SparseArray<int>(1,2,3).slice(0, 2) -> length 2, [1,2]
      const arr7 = new SparseArray<int>(1, 2, 3);
      const result7: SparseArray<int> = arr7.slice(0, 2);
      expect(result7.length).assertEqual(2);
      expect(result7[0]).assertEqual(1);
      expect(result7[1]).assertEqual(2);
      // 8. new SparseArray<int>(1,2,3).pop() -> 3
      const arr8 = new SparseArray<int>(1, 2, 3);
      expect(arr8.pop()).assertEqual(3);
      // 9. new SparseArray<int>(3).push(99) -> length 4, arr[3]=99
      const arr9 = new SparseArray<int>(3);
      arr9.push(99);
      expect(arr9.length).assertEqual(4);
      expect(arr9[3]).assertEqual(99);
      // 10. new SparseArray<Data>(obj) -> arr[0]===obj
      const obj10: SparseArrayConstructorPartData = { val: 10 };
      const arr10 = new SparseArray<SparseArrayConstructorPartData>(obj10);
      expect(arr10[0] === obj10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_PART_0500
     * @tc.name sparseArrayConstructorPartTest005
     * @tc.desc sparse holes, object reference mutation & iterator semantics (6 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayConstructorPartTest005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new SparseArray<int>(3).values().next().done -> true (holes skipped)
      const arr1 = new SparseArray<int>(3);
      expect(arr1.values().next().done).assertTrue();
      // 2. new SparseArray<int>(3).keys().next().done -> true (holes skipped)
      const arr2 = new SparseArray<int>(3);
      expect(arr2.keys().next().done).assertTrue();
      // 3. push(obj) then mutate obj -> arr[0].val reflects mutation (88)
      const obj3: SparseArrayConstructorPartData = { val: 5 };
      const arr3 = new SparseArray<SparseArrayConstructorPartData>();
      arr3.push(obj3);
      obj3.val = 88;
      expect(arr3[0]!.val).assertEqual(88);
      // 4. new SparseArray<Data>(obj), mutate arr[0].val -> original obj.val updated (77)
      const obj4: SparseArrayConstructorPartData = { val: 5 };
      const arr4 = new SparseArray<SparseArrayConstructorPartData>(obj4);
      arr4[0]!.val = 77;
      expect(obj4.val).assertEqual(77);
      // 5. values() on sparse {1:11, 3:33} -> 11, 33, done
      const arr5 = new SparseArray<int>(4);
      arr5[1] = 11;
      arr5[3] = 33;
      const iter5 = arr5.values();
      const first5 = iter5.next();
      expect(first5.done).assertFalse();
      expect(first5.value).assertEqual(11);
      const second5 = iter5.next();
      expect(second5.done).assertFalse();
      expect(second5.value).assertEqual(33);
      const done5 = iter5.next();
      expect(done5.done).assertTrue();
      expect(done5.value).assertUndefined();
      // 6. entries() on sparse {1:11, 3:33} -> [1,11], [3,33], done
      const arr6 = new SparseArray<int>(4);
      arr6[1] = 11;
      arr6[3] = 33;
      const iter6 = arr6.entries();
      const first6 = iter6.next();
      expect(first6.done).assertFalse();
      const firstE6 = first6.value!;
      expect(firstE6[0]).assertEqual(1);
      expect(firstE6[1]).assertEqual(11);
      const second6 = iter6.next();
      expect(second6.done).assertFalse();
      const secondE6 = second6.value!;
      expect(secondE6[0]).assertEqual(3);
      expect(secondE6[1]).assertEqual(33);
      const done6 = iter6.next();
      expect(done6.done).assertTrue();
      expect(done6.value).assertUndefined();
    });
  });
}
