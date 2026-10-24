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

interface SparseArrayIsArrayPartEmptyObject {}
interface SparseArrayIsArrayPartObjectItem {
  id: number;
}

// Merged from SparseArrayIsArrayPart01Test + SparseArrayIsArrayPart03Test (27 scenarios -> 3 cases, each <=10)
export default function sparseArrayIsArrayPartTest(): void {
  describe('SparseArrayIsArrayPartTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_PART_0100
     * @tc.name sparseArrayIsArrayPartTest001
     * @tc.desc isArray returns true on SparseArray instances (constructor & factory, various types) (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIsArrayPartTest001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new SparseArray<int>(5) -> true
      const arr1: SparseArray<int> = new SparseArray<int>(5);
      expect(SparseArray.isArray(arr1)).assertTrue();
      // 2. new SparseArray<string>('a','b') -> true
      const arr2: SparseArray<string> = new SparseArray<string>('a', 'b');
      expect(SparseArray.isArray(arr2)).assertTrue();
      // 3. new SparseArray<bigint>(0n,1n) -> true
      const arr3: SparseArray<bigint> = new SparseArray<bigint>(0n, 1n);
      expect(SparseArray.isArray(arr3)).assertTrue();
      // 4. SparseArray.from(int[]) -> true
      const like1: int[] = [];
      const arr4: SparseArray<int> = SparseArray.from<int>(like1);
      expect(SparseArray.isArray(arr4)).assertTrue();
      // 5. SparseArray.of(42) -> true
      const arr5: SparseArray<int> = SparseArray.of<int>(42);
      expect(SparseArray.isArray(arr5)).assertTrue();
      // 6. SparseArray.from(SparseArray) -> true
      const src1: SparseArray<int> = new SparseArray<int>(1, 2, 3);
      const arr6: SparseArray<int> = SparseArray.from<int>(src1);
      expect(SparseArray.isArray(arr6)).assertTrue();
      // 7. SparseArray.from(Array) -> true
      const srcArr1: int[] = [100, 200];
      const arr7: SparseArray<int> = SparseArray.from<int>(srcArr1);
      expect(SparseArray.isArray(arr7)).assertTrue();
      // 8. SparseArray.map() -> true
      const base1: SparseArray<int> = new SparseArray<int>(1, 2, 3);
      const arr8: SparseArray<int> = base1.map((v: int, k: int, a: SparseArray<int>): int => v * 2);
      expect(SparseArray.isArray(arr8)).assertTrue();
      // 9. SparseArray.flat() -> true
      const inner1: SparseArray<int> = new SparseArray<int>(1, 2);
      const wrap1: SparseArray<SparseArray<int>> = new SparseArray<SparseArray<int>>();
      wrap1.push(inner1);
      const arr9: SparseArray<int> = wrap1.flat<int>(1);
      expect(SparseArray.isArray(arr9)).assertTrue();
      // 10. SparseArray as Object -> true
      const arr10: SparseArray<int> = new SparseArray<int>(1, 2);
      const obj10: Object = arr10;
      expect(SparseArray.isArray(obj10)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_PART_0200
     * @tc.name sparseArrayIsArrayPartTest002
     * @tc.desc isArray returns false on non-array primitives & other objects (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIsArrayPartTest002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. isArray(42) -> false (number primitive)
      expect(SparseArray.isArray(42)).assertFalse();
      // 2. isArray(Number.NaN) -> false (NaN)
      expect(SparseArray.isArray(Number.NaN)).assertFalse();
      // 3. isArray(0n) -> false (bigint primitive)
      expect(SparseArray.isArray(0n)).assertFalse();
      // 4. isArray('​') -> false (zero-width space string)
      expect(SparseArray.isArray('​')).assertFalse();
      // 5. isArray('\0') -> false (null char string)
      expect(SparseArray.isArray('\0')).assertFalse();
      // 6. isArray(Date) -> false
      const date1: Date = new Date(0);
      expect(SparseArray.isArray(date1)).assertFalse();
      // 7. isArray(RegExp) -> false
      const regex1: RegExp = new RegExp('abc');
      expect(SparseArray.isArray(regex1)).assertFalse();
      // 8. isArray(Error) -> false
      const err1: Error = new Error('test');
      expect(SparseArray.isArray(err1)).assertFalse();
      // 9. isArray({}) -> false (empty plain object)
      const emptyObj1: SparseArrayIsArrayPartEmptyObject = {};
      expect(SparseArray.isArray(emptyObj1)).assertFalse();
      // 10. isArray(Int8Array) -> false (typed array)
      const ta1: Int8Array = new Int8Array(1);
      expect(SparseArray.isArray(ta1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_PART_0300
     * @tc.name sparseArrayIsArrayPartTest003
     * @tc.desc isArray with objects: true for object-element SparseArrays, false for other object types (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIsArrayPartTest003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. SparseArray<object-element> -> true
      const obj1: SparseArrayIsArrayPartObjectItem = { id: 1 as number };
      const arr1: SparseArray<SparseArrayIsArrayPartObjectItem> = new SparseArray<SparseArrayIsArrayPartObjectItem>(obj1);
      expect(SparseArray.isArray(arr1)).assertTrue();
      // 2. SparseArray<Date> -> true
      const dateA: Date = new Date(0);
      const arr2: SparseArray<Date> = new SparseArray<Date>(dateA);
      expect(SparseArray.isArray(arr2)).assertTrue();
      // 3. SparseArray<int[]> -> true
      const inner1: int[] = [1, 2];
      const arr3: SparseArray<int[]> = new SparseArray<int[]>(inner1);
      expect(SparseArray.isArray(arr3)).assertTrue();
      // 4. isArray(function) -> false
      const fn1: () => number = () => 0;
      expect(SparseArray.isArray(fn1)).assertFalse();
      // 5. isArray(ArrayBuffer) -> false
      const ab1: ArrayBuffer = new ArrayBuffer(8);
      expect(SparseArray.isArray(ab1)).assertFalse();
      // 6. isArray(DataView) -> false
      const ab2: ArrayBuffer = new ArrayBuffer(8);
      const dv1: DataView = new DataView(ab2);
      expect(SparseArray.isArray(dv1)).assertFalse();
      // 7. isArray(keys() iterator) -> false
      const arr4: SparseArray<int> = new SparseArray<int>(1, 2);
      const iter1: IterableIterator<int> = arr4.keys();
      expect(SparseArray.isArray(iter1)).assertFalse();
    });
  });
}
