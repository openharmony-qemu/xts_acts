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

export default function sparseArraySomeTestPart01(): void {
  describe("SparseArraySomeTestPart01", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_PART01_0100
     * @tc.name sparseArraySomeTestPart01001
     * @tc.desc some returns true when a matching element exists (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("sparseArraySomeTestPart01001", Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. some v === 10 on (5,10,15) returns true and short-circuits after 2 visits
      const arr1 = new SparseArray<int>(5, 10, 15);
      let callCount1: int = 0;
      const result1 = arr1.some((v: int): boolean => {
        callCount1 = callCount1 + 1;
        return v === 10;
      });
      expect(result1).assertTrue();
      expect(callCount1).assertEqual(2);
      // 2. some v % 2 !== 0 on (2,4,6,7) returns true and visits all 4 elements
      const arr2 = new SparseArray<int>(2, 4, 6, 7);
      let callCount2: int = 0;
      const result2 = arr2.some((v: int): boolean => {
        callCount2 = callCount2 + 1;
        return v % 2 !== 0;
      });
      expect(result2).assertTrue();
      expect(callCount2).assertEqual(4);
      // 3. some v === ' ' on ('a',' ','b') returns true and short-circuits after 2 visits
      const arr3 = new SparseArray<string>('a', ' ', 'b');
      let callCount3: int = 0;
      const result3 = arr3.some((v: string): boolean => {
        callCount3 = callCount3 + 1;
        return v === ' ';
      });
      expect(result3).assertTrue();
      expect(callCount3).assertEqual(2);
      // 4. some v.includes("world") on ("foo","hello world","bar") returns true and short-circuits after 2 visits
      const arr4 = new SparseArray<string>("foo", "hello world", "bar");
      let callCount4: int = 0;
      const result4 = arr4.some((v: string): boolean => {
        callCount4 = callCount4 + 1;
        return v.includes("world");
      });
      expect(result4).assertTrue();
      expect(callCount4).assertEqual(2);
      // 5. some v === Double.POSITIVE_INFINITY on (1.0, Infinity, 2.0) returns true and short-circuits after 2 visits
      const arr5 = new SparseArray<double>(1.0, Double.POSITIVE_INFINITY, 2.0);
      let callCount5: int = 0;
      const result5 = arr5.some((v: double): boolean => {
        callCount5 = callCount5 + 1;
        return v === Double.POSITIVE_INFINITY;
      });
      expect(result5).assertTrue();
      expect(callCount5).assertEqual(2);
      // 6. some identity predicate on (false, true, false) returns true because the middle element is true
      const arr6 = new SparseArray<boolean>(false, true, false);
      const result6 = arr6.some((value: boolean): boolean => value);
      expect(result6).assertTrue();
      // 7. some value > 0 on (0,0,5,0,0) returns true because element 5 matches
      const arr7 = new SparseArray<int>(0, 0, 5, 0, 0);
      const result7 = arr7.some((value: int): boolean => value > 0);
      expect(result7).assertTrue();
      // 8. some identity predicate on single-element (true) returns true
      const arr8 = new SparseArray<boolean>(true);
      const result8 = arr8.some((value: boolean): boolean => value);
      expect(result8).assertTrue();
      // 9. some v === 42 on SparseArray.of<int>(42) invokes the callback exactly once and returns true
      const arr9 = SparseArray.of<int>(42);
      let callCount9: int = 0;
      const result9 = arr9.some((v: int, i: int, a: SparseArray<int>): boolean => {
        callCount9 = callCount9 + 1;
        return v === 42;
      });
      expect(result9).assertTrue();
      expect(callCount9).assertEqual(1);
      // 10. some on (true, true, true) short-circuits at index 0 leaving lastIndex === 0
      const arr10 = new SparseArray<boolean>(true, true, true);
      let lastIndex10: int = -1;
      const result10 = arr10.some((v: boolean, i: int, a: SparseArray<boolean>): boolean => {
        lastIndex10 = i;
        return v;
      });
      expect(result10).assertTrue();
      expect(lastIndex10).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_PART01_0200
     * @tc.name sparseArraySomeTestPart01002
     * @tc.desc some returns false when no element matches, including all-hole arrays (6 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("sparseArraySomeTestPart01002", Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. some !v on (true, true, true) returns false because no element is falsy
      const arr1 = new SparseArray<boolean>(true, true, true);
      const result1 = arr1.some((v: boolean): boolean => !v);
      expect(result1).assertFalse();
      // 2. some on all-hole SparseArray<int>(3) returns false, then true after assigning 5 at index 1
      const arr2 = new SparseArray<int>(3);
      const result2 = arr2.some((v: int): boolean => true);
      expect(result2).assertFalse();
      arr2[1] = 5;
      const resultAfterFill2 = arr2.some((v: int): boolean => true);
      expect(resultAfterFill2).assertTrue();
      // 3. some value > 10.0 on (0.1, 0.2) returns false because no value exceeds 10
      const arr3 = new SparseArray<double>(0.1, 0.2);
      const result3 = arr3.some((value: double): boolean => value > 10.0);
      expect(result3).assertFalse();
      // 4. some value.length > 10 on ('a','b','c') returns false because all strings are short
      const arr4 = new SparseArray<string>('a', 'b', 'c');
      const result4 = arr4.some((value: string): boolean => value.length > 10);
      expect(result4).assertFalse();
      // 5. some value > 100.0 on single-element (1.1) returns false
      const arr5 = new SparseArray<double>(1.1);
      const result5 = arr5.some((value: double): boolean => value > 100.0);
      expect(result5).assertFalse();
      // 6. some value > 100 on length-5 sparse holding 1 at index 0 and 2 at index 3 returns false
      const arr6 = new SparseArray<int>(5);
      arr6[0] = 1;
      arr6[3] = 2;
      const result6 = arr6.some((value: int): boolean => value > 100);
      expect(result6).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_PART01_0300
     * @tc.name sparseArraySomeTestPart01003
     * @tc.desc callback args, no mutation, and throw stops iteration (6 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("sparseArraySomeTestPart01003", Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. some callback receives index i and array a, matching value 20 at index 1 on (10,20,30)
      const arr1 = new SparseArray<int>(10, 20, 30);
      let matchedIndex1: int = -1;
      let matchedValue1: int = 0;
      let seenLength1: int = 0;
      const result1 = arr1.some((v: int, i: int, a: SparseArray<int>): boolean => {
        matchedIndex1 = i;
        matchedValue1 = v;
        seenLength1 = a.length;
        return v === 20;
      });
      expect(result1).assertTrue();
      expect(matchedIndex1).assertEqual(1);
      expect(matchedValue1).assertEqual(20);
      expect(seenLength1).assertEqual(3);
      // 2. some value === 'a' on ('a','b') does not mutate the array, length and elements intact
      const arr2 = new SparseArray<string>('a', 'b');
      arr2.some((value: string): boolean => value === 'a');
      let actualInt2: int = arr2.length;
      let expectedInt2: int = 2;
      expect(actualInt2).assertEqual(expectedInt2);
      let first2: string = arr2[0]!;
      expect(first2).assertEqual('a');
      let second2: string = arr2[1]!;
      expect(second2).assertEqual('b');
      // 3. some value > 0 on SparseArray.of<int>(42) leaves the original array length and element unchanged
      const arr3 = SparseArray.of<int>(42);
      arr3.some((value: int): boolean => value > 0);
      let actualInt3: int = arr3.length;
      let expectedInt3: int = 1;
      expect(actualInt3).assertEqual(expectedInt3);
      let first3: int = arr3[0]!;
      expect(first3).assertEqual(42);
      // 4. some callback receives the source array as its third argument so a === arr evaluates to true
      const arr4 = SparseArray.of<int>(1);
      let arraysMatch4: boolean = false;
      arr4.some((v: int, i: int, a: SparseArray<int>): boolean => {
        arraysMatch4 = a === arr4;
        return false;
      });
      expect(arraysMatch4).assertTrue();
      // 5. some on (1,2,3,4,5) stops iteration when callback throws Error at value 3, visitedCount === 2
      const arr5 = new SparseArray<int>(1, 2, 3, 4, 5);
      let visitedCount5: int = 0;
      try {
        arr5.some((v: int, i: int, a: SparseArray<int>): boolean => {
          if (v === 3) {
            throw new Error("error at value 3");
          }
          visitedCount5 = visitedCount5 + 1;
          return false;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("Error");
      }
      expect(visitedCount5).assertEqual(2);
      // 6. some on (1,2,-1,4,5) throws Error at value -1 so elements after index 2 are never visited
      const arr6 = new SparseArray<int>(1, 2, -1, 4, 5);
      let afterThrowVisited6: boolean = false;
      try {
        arr6.some((v: int, i: int, a: SparseArray<int>): boolean => {
          if (v === -1) {
            throw new Error("negative value detected");
          }
          if (i > 2) {
            afterThrowVisited6 = true;
          }
          return false;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("Error");
      }
      expect(afterThrowVisited6).assertFalse();
    });
  });
}
