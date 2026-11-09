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

// Merged from SparseArrayToSortedPart01Test (29 scenarios -> 3 cases, each <=10)
export default function sparseArrayToSortedTestPart01(): void {
  describe("SparseArrayToSortedTestPart01", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_PART01_0100
     * @tc.name sparseArrayToSortedTestPart01001
     * @tc.desc toSorted default returns new sorted copy, source unchanged (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("sparseArrayToSortedTestPart01001", Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. toSorted on (7,7) returns two identical 7 elements
      const arr1 = new SparseArray<int>(7, 7);
      const result1 = arr1.toSorted();
      expect(result1[0]).assertEqual(7);
      expect(result1[1]).assertEqual(7);
      // 2. toSorted on (5,5,5,5) keeps all four equal elements equal to 5
      const arr2 = new SparseArray<int>(5, 5, 5, 5);
      const result2 = arr2.toSorted();
      expect(result2[0]).assertEqual(5);
      expect(result2[1]).assertEqual(5);
      expect(result2[2]).assertEqual(5);
      expect(result2[3]).assertEqual(5);
      // 3. toSorted on ("apple","banana") returns ["apple","banana"] ascending
      const arr3 = new SparseArray<string>("apple", "banana");
      const result3 = arr3.toSorted();
      expect(result3[0]).assertEqual("apple");
      expect(result3[1]).assertEqual("banana");
      // 4. toSorted on ('a',' ','b') orders space first -> [' ','a','b']
      const arr4 = new SparseArray<string>('a', ' ', 'b');
      const result4 = arr4.toSorted();
      expect(result4[0]).assertEqual(' ');
      expect(result4[1]).assertEqual('a');
      expect(result4[2]).assertEqual('b');
      // 5. toSorted on ('a','B','c','D') yields ['B','D','a','c'] Unicode code point order
      const arr5 = new SparseArray<string>('a', 'B', 'c', 'D');
      const result5 = arr5.toSorted();
      expect(result5[0]).assertEqual('B');
      expect(result5[1]).assertEqual('D');
      expect(result5[2]).assertEqual('a');
      expect(result5[3]).assertEqual('c');
      // 6. toSorted on sparse length-5 (idx 1=5, 3=1) keeps length 5, value 1 at idx 1, source unchanged
      const arr6 = new SparseArray<int>(5);
      arr6[1] = 5;
      arr6[3] = 1;
      const r6a = arr6.toSorted();
      const r6b = arr6.toSorted((a: int, b: int): int => a - b);
      expect(r6a.length).assertEqual(5);
      expect(r6a[0]).assertUndefined();
      expect(r6a[1]).assertEqual(1);
      expect(r6a[2]).assertUndefined();
      expect(r6a[4]).assertUndefined();
      expect(r6b[0]).assertUndefined();
      expect(r6b[1]).assertEqual(1);
      expect(r6b[2]).assertUndefined();
      expect(r6b[4]).assertUndefined();
      expect(arr6[1]).assertEqual(5);
      expect(arr6[3]).assertEqual(1);
      // 7. toSorted on SparseArray.of(9) single-element returns length 1 with 9 at idx 0
      const arr7 = SparseArray.of<int>(9);
      const result7 = arr7.toSorted();
      expect(result7.length).assertEqual(1);
      expect(result7[0]).assertEqual(9);
      // 8. toSorted on array built by push(3,1,2) orders into [1,2,3]
      const arr8 = new SparseArray<int>();
      arr8.push(3);
      arr8.push(1);
      arr8.push(2);
      const result8 = arr8.toSorted();
      expect(result8[0]).assertEqual(1);
      expect(result8[1]).assertEqual(2);
      expect(result8[2]).assertEqual(3);
      // 9. toSorted returns a newly allocated array not the same instance as the source
      const arr9 = new SparseArray<int>(3, 1, 2);
      const result9 = arr9.toSorted();
      expect(result9 === arr9).assertFalse();
      // 10. overwriting result[0]=99 after toSorted leaves source arr[0]=3 untouched
      const arr10 = new SparseArray<int>(3, 1, 2);
      const result10 = arr10.toSorted();
      result10[0] = 99;
      expect(arr10[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_PART01_0200
     * @tc.name sparseArrayToSortedTestPart01002
     * @tc.desc toSorted with comparator (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("sparseArrayToSortedTestPart01002", Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. toSorted with descending comparator (b-a) on (5,2,8,1) returns [8,5,2,1]
      const arr1 = new SparseArray<int>(5, 2, 8, 1);
      const result1 = arr1.toSorted((a: int, b: int): int => b - a);
      expect(result1[0]).assertEqual(8);
      expect(result1[1]).assertEqual(5);
      expect(result1[2]).assertEqual(2);
      expect(result1[3]).assertEqual(1);
      // 2. toSorted with ascending comparator (a-b) on (5,3,1,4,2) returns [1,2,3,4,5]
      const arr2 = new SparseArray<int>(5, 3, 1, 4, 2);
      const result2 = arr2.toSorted((a: int, b: int): int => a - b);
      expect(result2[0]).assertEqual(1);
      expect(result2[1]).assertEqual(2);
      expect(result2[2]).assertEqual(3);
      expect(result2[3]).assertEqual(4);
      expect(result2[4]).assertEqual(5);
      // 3. toSorted with reverse string comparator on ("apple","banana","cherry") returns ["cherry","banana","apple"]
      const arr3 = new SparseArray<string>("apple", "banana", "cherry");
      const result3 = arr3.toSorted((a: string, b: string): int => {
        if (a > b) {
          return -1;
        }
        if (a < b) {
          return 1;
        }
        return 0;
      });
      expect(result3[0]).assertEqual("cherry");
      expect(result3[1]).assertEqual("banana");
      expect(result3[2]).assertEqual("apple");
      // 4. toSorted with ascending string comparator on sparse length-4 (idx 0='z',2='a') keeps slots, source unchanged
      const arr4 = new SparseArray<string>(4);
      arr4[0] = 'z';
      arr4[2] = 'a';
      const result4 = arr4.toSorted((a: string, b: string): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      expect(result4.length).assertEqual(4);
      expect(result4[0]).assertEqual('a');
      expect(result4[1]).assertUndefined();
      expect(result4[2]).assertEqual('z');
      expect(result4[3]).assertUndefined();
      expect(arr4[0]).assertEqual('z');
      expect(arr4[2]).assertEqual('a');
      // 5. toSorted with always-zero comparator (a-a) on (3,1,2) keeps [3,1,2] stable
      const arr5 = new SparseArray<int>(3, 1, 2);
      const result5 = arr5.toSorted((a: int, b: int): int => a - a);
      expect(result5[0]).assertEqual(3);
      expect(result5[1]).assertEqual(1);
      expect(result5[2]).assertEqual(2);
      // 6. toSorted default vs comparator on (-1,-10,0,2): default keeps order, comparator sorts, source unchanged
      const arr6 = new SparseArray<int>(-1, -10, 0, 2);
      const r6a = arr6.toSorted();
      const r6b = arr6.toSorted((a: int, b: int): int => a - b);
      expect(r6a[0]).assertEqual(-1);
      expect(r6a[1]).assertEqual(-10);
      expect(r6a[2]).assertEqual(0);
      expect(r6a[3]).assertEqual(2);
      expect(r6b[0]).assertEqual(-10);
      expect(r6b[1]).assertEqual(-1);
      expect(r6b[2]).assertEqual(0);
      expect(r6b[3]).assertEqual(2);
      expect(arr6[0]).assertEqual(-1);
      // 7. toSorted with numeric comparator on (10,9,100) returns [9,10,100] numeric not lexicographic
      const arr7 = new SparseArray<int>(10, 9, 100);
      const result7 = arr7.toSorted((a: int, b: int): int => a - b);
      expect(result7[0]).assertEqual(9);
      expect(result7[1]).assertEqual(10);
      expect(result7[2]).assertEqual(100);
      // 8. toSorted with numeric comparator on (6,5,4,3,2,1) reverses into ascending [1..6]
      const arr8 = new SparseArray<int>(6, 5, 4, 3, 2, 1);
      const result8 = arr8.toSorted((a: int, b: int): int => a - b);
      expect(result8.length).assertEqual(6);
      expect(result8[0]).assertEqual(1);
      expect(result8[5]).assertEqual(6);
      // 9. two successive toSorted with same comparator on (5,1,3) produce identical [1,3,5]
      const arr9 = new SparseArray<int>(5, 1, 3);
      const first9 = arr9.toSorted((a: int, b: int): int => a - b);
      const second9 = arr9.toSorted((a: int, b: int): int => a - b);
      expect(first9.join(',')).assertEqual("1,3,5");
      expect(second9.join(',')).assertEqual("1,3,5");
      // 10. toSorted with string length comparator on ("ccc",'a',"bb") -> ['a',"bb","ccc"]
      const arr10 = new SparseArray<string>("ccc", 'a', "bb");
      const result10 = arr10.toSorted((a: string, b: string): int => a.length - b.length);
      expect(result10[0]).assertEqual('a');
      expect(result10[1]).assertEqual("bb");
      expect(result10[2]).assertEqual("ccc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_PART01_0300
     * @tc.name sparseArrayToSortedTestPart01003
     * @tc.desc toSorted on typed/special & error handling (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("sparseArrayToSortedTestPart01003", Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. toSorted with comparator on doubles incl infinities -> [NEG_INF, 1.0, POS_INF], source unchanged
      const arr1 = new SparseArray<double>(Double.POSITIVE_INFINITY, 1.0, Double.NEGATIVE_INFINITY);
      const result1 = arr1.toSorted((a: double, b: double): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      expect(result1[0]).assertEqual(Double.NEGATIVE_INFINITY);
      expect(result1[1]).assertEqual(1.0);
      expect(result1[2]).assertEqual(Double.POSITIVE_INFINITY);
      expect(arr1[0]).assertEqual(Double.POSITIVE_INFINITY);
      // 2. toSorted with comparator on doubles (1e2,1e1,1,1e3) -> [1,1e1,1e2,1e3] ascending
      const arr2 = new SparseArray<double>(1e2, 1e1, 1, 1e3);
      const result2 = arr2.toSorted((a: double, b: double): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      expect(result2[0]).assertEqual(1.0);
      expect(result2[1]).assertEqual(1e1);
      expect(result2[2]).assertEqual(1e2);
      expect(result2[3]).assertEqual(1e3);
      // 3. toSorted with bigint comparator on (300n,100n,200n) -> [100n,200n,300n] ascending
      const arr3 = new SparseArray<bigint>(300n, 100n, 200n);
      const result3 = arr3.toSorted((a: bigint, b: bigint): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      expect(result3[0]!).assertEqual(100n);
      expect(result3[1]!).assertEqual(200n);
      expect(result3[2]!).assertEqual(300n);
      // 4. toSorted with long comparator on (3,1,2) -> [1,2,3] ascending
      const arr4 = new SparseArray<long>(3 as long, 1 as long, 2 as long);
      const result4 = arr4.toSorted((a: long, b: long): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      expect(result4[0]!).assertEqual(1 as long);
      expect(result4[2]!).assertEqual(3 as long);
      // 5. toSorted with double comparator on (-3.5,-1.5,-2.5) -> [-3.5,-2.5,-1.5] ascending
      const arr5 = new SparseArray<double>(-3.5, -1.5, -2.5);
      const result5 = arr5.toSorted((a: double, b: double): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      expect(result5[0]).assertEqual(-3.5);
      expect(result5[1]).assertEqual(-2.5);
      expect(result5[2]).assertEqual(-1.5);
      // 6. toSorted comparator throwing Error on (3,1,4) propagates Error, source unchanged
      const arr6 = new SparseArray<int>(3, 1, 4);
      try {
        arr6.toSorted((a: int, b: int): int => {
          throw new Error("cmp fail " + a.toString());
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
      expect(arr6[0]).assertEqual(3);
      expect(arr6[1]).assertEqual(1);
      expect(arr6[2]).assertEqual(4);
      // 7. toSorted comparator throwing Error on (5,4,3,2,1) propagates Error, source order preserved
      const arr7 = new SparseArray<int>(5, 4, 3, 2, 1);
      try {
        arr7.toSorted((a: int, b: int): int => {
          throw new Error(`mid-cmp fail: ${a}-${b}`);
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
      expect(arr7[0]).assertEqual(5);
      expect(arr7[1]).assertEqual(4);
      expect(arr7[2]).assertEqual(3);
      expect(arr7[3]).assertEqual(2);
      expect(arr7[4]).assertEqual(1);
      // 8. after comparator throws on (3,1,4), default toSorted recovers -> [1,3,4]
      const arr8 = new SparseArray<int>(3, 1, 4);
      try {
        arr8.toSorted((a: int, b: int): int => {
          throw new Error("first attempt fail " + a.toString());
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
      const result8 = arr8.toSorted();
      expect(result8[0]).assertEqual(1);
      expect(result8[1]).assertEqual(3);
      expect(result8[2]).assertEqual(4);
      // 9. after comparator throws on (4,2,3,1), comparator toSorted recovers -> [1,...,4]
      const arr9 = new SparseArray<int>(4, 2, 3, 1);
      try {
        arr9.toSorted((a: int, b: int): int => {
          throw new Error("fail at " + a.toString());
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
      const result9 = arr9.toSorted((a: int, b: int): int => a - b);
      expect(result9[0]).assertEqual(1);
      expect(result9[3]).assertEqual(4);
    });
  });
}
