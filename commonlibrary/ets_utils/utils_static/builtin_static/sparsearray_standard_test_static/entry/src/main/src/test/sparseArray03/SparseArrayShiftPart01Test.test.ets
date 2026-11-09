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

// Merged SparseArrayShiftPart01Test scenarios (25 scenarios -> 3 cases, each <=10)
export default function sparseArrayShiftTestPart01(): void {
  describe('SparseArrayShiftPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_PART01_0100
     * @tc.name sparseArrayShiftTestPart01001
     * @tc.desc shift returns first & shrinks length, typed elements (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayShiftTestPart01001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. shift on SparseArray.of<int>(1) removes and returns the only element 1 leaving length 0
      const arr1 = SparseArray.of<int>(1);
      const shifted1 = arr1.shift();
      expect(shifted1).assertEqual(1);
      expect(arr1.length).assertEqual(0);
      // 2. shift on SparseArray<int>(5, 10, 15) returns the first element 5 and promotes 10 to index 0
      const arr2 = new SparseArray<int>(5, 10, 15);
      const result2: int | undefined = arr2.shift();
      expect(result2).assertEqual(5);
      expect(arr2[0]).assertEqual(10);
      // 3. shift on SparseArray<long>(100, 200) returns 100 and leaves 200 at index 0 with length 1
      const arr3 = new SparseArray<long>(Int.toLong(100), Int.toLong(200));
      const result3 = arr3.shift();
      expect(result3).assertEqual(Int.toLong(100));
      expect(arr3.length).assertEqual(1);
      expect(arr3[0]).assertEqual(Int.toLong(200));
      // 4. shift on SparseArray<short>(100, 200) returns the short 100 and leaves 200 at index 0
      const v4: short = Int.toShort(100);
      const arr4 = new SparseArray<short>(v4, Int.toShort(200));
      const result4 = arr4.shift();
      expect(result4).assertEqual(v4);
      expect(arr4[0]).assertEqual(Int.toShort(200));
      // 5. shift on SparseArray<boolean>(true, false, true) returns the first true and reduces length to 2
      const arr5 = new SparseArray<boolean>(true, false, true);
      const removed5 = arr5.shift();
      expect(removed5).assertTrue();
      expect(arr5.length).assertEqual(2);
      // 6. shift on SparseArray<double>(NaN, 1.5) returns the NaN first element verified by isNaN
      const arr6 = new SparseArray<double>(Double.NaN, 1.5);
      const result6 = arr6.shift();
      expect(isNaN(result6!)).assertTrue();
      // 7. shift on SparseArray<double>(MAX_VALUE, 0.0) returns Double.MAX_VALUE as the removed first element
      const arr7 = new SparseArray<double>(Double.MAX_VALUE, 0.0);
      const result7 = arr7.shift();
      expect(result7).assertEqual(Double.MAX_VALUE);
      // 8. shift on SparseArray<int>(-5, -6) returns the negative first element -5 with sign preserved
      const arr8 = new SparseArray<int>(-5, -6);
      const result8 = arr8.shift();
      expect(result8).assertEqual(-5);
      expect(arr8[0]).assertEqual(-6);
      // 9. shift on SparseArray<int>(7, 7, 7) returns 7 and leaves the two remaining equal 7s with length 2
      const arr9 = new SparseArray<int>(7, 7, 7);
      const result9 = arr9.shift();
      expect(result9).assertEqual(7);
      expect(arr9.length).assertEqual(2);
      expect(arr9[0]).assertEqual(7);
      expect(arr9[1]).assertEqual(7);
      // 10. shift on SparseArray<string>('a', '') returns 'a' and leaves the empty string at index 0 with length 1
      const arr10 = new SparseArray<string>('a', '');
      const result10 = arr10.shift();
      expect(result10).assertEqual('a');
      expect(arr10.length).assertEqual(1);
      expect(arr10[0]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_PART01_0200
     * @tc.name sparseArrayShiftTestPart01002
     * @tc.desc shift on empty/all-hole/undefined & multi-shift sequence (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayShiftTestPart01002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. shift on an empty SparseArray<int> returns undefined because no first element exists
      const arr1 = new SparseArray<int>();
      const result1 = arr1.shift();
      expect(result1).assertUndefined();
      // 2. shift on sparse SparseArray<int>(3) with only index 1 set to 42 returns undefined and shifts 42 to index 0
      const arr2 = new SparseArray<int>(3);
      arr2[1] = 42;
      const result2 = arr2.shift();
      expect(result2).assertUndefined();
      expect(arr2.length).assertEqual(2);
      expect(arr2[0]).assertEqual(42);
      // 3. shift twice on a sparse length-5 array with 99 at index 2 returns undefined on the second call leaving length 3
      const arr3 = new SparseArray<int>(5);
      arr3[2] = 99;
      arr3.shift();
      const second3 = arr3.shift();
      expect(second3).assertUndefined();
      expect(arr3.length).assertEqual(3);
      // 4. shift once on an all-hole SparseArray<int>(4) decreases the length from 4 to 3
      const arr4 = new SparseArray<int>(4);
      arr4.shift();
      expect(arr4.length).assertEqual(3);
      // 5. shift three times on a sparse array with 10, 30, 50 at indices 0, 2, 4 returns 10 then undefined then 30
      const arr5 = new SparseArray<int>(5);
      arr5[0] = 10;
      arr5[2] = 30;
      arr5[4] = 50;
      const r5a = arr5.shift();
      const r5b = arr5.shift();
      const r5c = arr5.shift();
      expect(r5a).assertEqual(10);
      expect(r5b).assertUndefined();
      expect(r5c).assertEqual(30);
      // 6. shift on SparseArray<int | undefined>(undefined, 5) returns undefined yet shortens length to 1 with 5 at index 0
      const arr6 = new SparseArray<int | undefined>(undefined, 5);
      const result6 = arr6.shift();
      expect(result6).assertUndefined();
      expect(arr6.length).assertEqual(1);
      expect(arr6[0]).assertEqual(5);
      // 7. shift four times on SparseArray<int>(10, 20, 30) returns undefined on the fourth call once the array is empty
      const arr7 = new SparseArray<int>(10, 20, 30);
      arr7.shift();
      arr7.shift();
      arr7.shift();
      const r7d = arr7.shift();
      expect(r7d).assertUndefined();
      // 8. shift three times on SparseArray<int>(5, 10, 15) returns the last remaining element 15
      const arr8 = new SparseArray<int>(5, 10, 15);
      arr8.shift();
      arr8.shift();
      const last8 = arr8.shift();
      expect(last8).assertEqual(15);
      // 9. shift on an empty SparseArray<int> followed by push(9) yields length 1 with 9 readable at index 0
      const arr9 = new SparseArray<int>();
      const empty9 = arr9.shift();
      expect(empty9).assertUndefined();
      arr9.push(9);
      expect(arr9.length).assertEqual(1);
      expect(arr9[0]).assertEqual(9);
      // 10. shift on SparseArray<int>(1, 2, 3) followed by push(4) restores length 3 with join yielding '2,3,4'
      const arr10 = new SparseArray<int>(1, 2, 3);
      arr10.shift();
      arr10.push(4);
      expect(arr10.length).assertEqual(3);
      expect(arr10.join(',')).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_PART01_0300
     * @tc.name sparseArrayShiftTestPart01003
     * @tc.desc shift on object/regexp/date elements & remaining elements re-indexed (5 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayShiftTestPart01003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. shift on a one-element SparseArray<RegExp> returns the identical RegExp object reference
      const regexp1: RegExp = new RegExp('abc');
      const arr1 = new SparseArray<RegExp>(regexp1);
      const result1 = arr1.shift();
      expect(result1).assertEqual(regexp1);
      // 2. shift on a one-element SparseArray<RegExp> with flags 'g' returns a RegExp whose source is 'abc' and flags is 'g'
      const regexp2: RegExp = new RegExp('abc', 'g');
      const arr2 = new SparseArray<RegExp>(regexp2);
      const result2 = arr2.shift();
      expect(result2!.source).assertEqual('abc');
      expect(result2!.flags).assertEqual('g');
      // 3. shift on a one-element SparseArray<string> holding a Chinese character string returns the same Chinese string
      const arr3 = new SparseArray<string>('中文测试');
      const result3 = arr3.shift();
      expect(result3).assertEqual('中文测试');
      // 4. shift on SparseArray<Date>(d1, d2) returns the identical Date instance d1 and leaves d2 at index 0
      const dateA: Date = new Date(0);
      const dateB: Date = new Date(1000);
      const arr4 = new SparseArray<Date>(dateA, dateB);
      const result4 = arr4.shift();
      expect(result4 === dateA).assertTrue();
      expect(arr4[0] === dateB).assertTrue();
      // 5. shift on SparseArray<int>(1, 2, 3, 4) keeps the last element 4 reachable at index 2
      const arr5 = new SparseArray<int>(1, 2, 3, 4);
      const result5 = arr5.shift();
      expect(result5).assertEqual(1);
      expect(arr5.length).assertEqual(3);
      expect(arr5.lastIndexOf(4)).assertEqual(2);
    });
  });
}
