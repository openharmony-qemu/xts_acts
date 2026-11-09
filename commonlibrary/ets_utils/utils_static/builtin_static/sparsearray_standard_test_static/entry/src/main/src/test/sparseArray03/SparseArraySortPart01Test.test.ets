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

class SortError01301 extends Error {
  errorCode: int = 100;
}

// Merged from SparseArraySortPart01Test (28 scenarios -> 3 cases, each <=10)
export default function sparseArraySortTestPart01(): void {
  describe("SparseArraySortTestPart01", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_PART01_0100
     * @tc.name sparseArraySortTestPart01001
     * @tc.desc sort default & ascending comparator (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArraySortTestPart01001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. default sort strings ['z','a','M','A'] -> 'A' at [0], 'z' at [3]
      const arr1 = new SparseArray<string>('z', 'a', 'M', 'A');
      const result1 = arr1.sort();
      expect(result1[0]).assertEqual('A');
      expect(result1[3]).assertEqual('z');
      // 2. default sort three Chinese name strings keeps first at index 0
      const arr2 = new SparseArray<string>('张三', '李四', '王五');
      const result2 = arr2.sort();
      expect(result2[0]).assertEqual('张三');
      // 3. default sort doubles [10.5,2.3,100.1] -> arr[0] equal 10.5
      const arr3 = new SparseArray<double>(10.5, 2.3, 100.1);
      const result3 = arr3.sort();
      expect(result3[0]).assertEqual(10.5);
      // 4. default sort strings ['z','a','m'] -> ['a','m','z']
      const arr4 = new SparseArray<string>('z', 'a', 'm');
      const result4 = arr4.sort();
      expect(result4[0]).assertEqual('a');
      expect(result4[1]).assertEqual('m');
      expect(result4[2]).assertEqual('z');
      // 5. default sort ints [100,2,20,3] preserving original order
      const arr5 = new SparseArray<int>(100, 2, 20, 3);
      const result5 = arr5.sort();
      expect(result5[0]).assertEqual(100);
      expect(result5[1]).assertEqual(2);
      expect(result5[2]).assertEqual(20);
      expect(result5[3]).assertEqual(3);
      // 6. ascending comparator (a-b) ints [7,3,9,1] -> [1,3,7,9]
      const arr6 = new SparseArray<int>(7, 3, 9, 1);
      const result6 = arr6.sort((a: int, b: int): int => a - b);
      expect(result6[0]).assertEqual(1);
      expect(result6[1]).assertEqual(3);
      expect(result6[2]).assertEqual(7);
      expect(result6[3]).assertEqual(9);
      // 7. ascending comparator ints [8,3,6,1,9,2] -> 1,2,3,6,8,9
      const arr7 = new SparseArray<int>(8, 3, 6, 1, 9, 2);
      const result7 = arr7.sort((a: int, b: int): int => a - b);
      expect(result7[0]).assertEqual(1);
      expect(result7[1]).assertEqual(2);
      expect(result7[2]).assertEqual(3);
      expect(result7[3]).assertEqual(6);
      expect(result7[4]).assertEqual(8);
      expect(result7[5]).assertEqual(9);
      // 8. ascending comparator two ints [20,10] -> callCount=1, [10,20]
      let callCount8: int = 0;
      const arr8 = new SparseArray<int>(20, 10);
      const result8 = arr8.sort((a: int, b: int): int => {
        callCount8 = callCount8 + 1;
        return a - b;
      });
      expect(callCount8).assertEqual(1);
      expect(result8[0]).assertEqual(10);
      expect(result8[1]).assertEqual(20);
      // 9. ascending comparator ints [60,40,20] -> [20,40,60] with trailing holes undefined
      const arr9 = new SparseArray<int>(60, 40, 20);
      const result9 = arr9.sort((a: int, b: int): int => {
        return a - b;
      });
      expect(result9[0]).assertEqual(20);
      expect(result9[1]).assertEqual(40);
      expect(result9[2]).assertEqual(60);
      expect(result9[3]).assertUndefined();
      expect(result9[4]).assertUndefined();
      expect(result9[5]).assertUndefined();
      // 10. ascending comparator five duplicate ints 5 -> every element equal 5
      const arr10 = new SparseArray<int>(5, 5, 5, 5, 5);
      const result10 = arr10.sort((a: int, b: int): int => {
        return a - b;
      });
      expect(result10[0]).assertEqual(5);
      expect(result10[1]).assertEqual(5);
      expect(result10[2]).assertEqual(5);
      expect(result10[3]).assertEqual(5);
      expect(result10[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_PART01_0200
     * @tc.name sparseArraySortTestPart01002
     * @tc.desc sort with comparator: descending, return 0, throws (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArraySortTestPart01002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. descending comparator (b-a) ints [3,1,4,1,5] -> arr[0] equal 5
      const cmpFn1: (a: int, b: int) => int = (a: int, b: int): int => b - a;
      const arr1 = new SparseArray<int>(3, 1, 4, 1, 5);
      const result1 = arr1.sort(cmpFn1);
      expect(result1[0]).assertEqual(5);
      // 2. descending comparator (b-a) ints [4,3,2,1] -> arr[0] equal 4
      const arr2 = new SparseArray<int>(4, 3, 2, 1);
      const result2 = arr2.sort((a: int, b: int): int => b - a);
      expect(result2[0]).assertEqual(4);
      // 3. comparator always returning 0 ints [2,1,3] keeps original order
      const arr3 = new SparseArray<int>(2, 1, 3);
      const result3 = arr3.sort((a: int, b: int): int => 0);
      expect(result3[0]).assertEqual(2);
      expect(result3[1]).assertEqual(1);
      expect(result3[2]).assertEqual(3);
      // 4. descending comparator strings [apple,banana,cherry] -> cherry,banana,apple
      const arr4 = new SparseArray<string>('apple', 'banana', 'cherry');
      const result4 = arr4.sort((a: string, b: string): int => {
        if (a > b) {
          return -1;
        }
        if (a < b) {
          return 1;
        }
        return 0;
      });
      expect(result4[0]).assertEqual('cherry');
      expect(result4[1]).assertEqual('banana');
      expect(result4[2]).assertEqual('apple');
      // 5. sort surfaces Error when comparator throws 'sort failed' on [3,1,4]
      const arr5 = new SparseArray<int>(3, 1, 4);
      try {
        arr5.sort((a: int, b: int): int => {
          throw new Error('sort failed');
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
      // 6. sort surfaces Error when comparator throws custom SortError01301 on [5,1,3]
      const arr6 = new SparseArray<int>(5, 1, 3);
      try {
        arr6.sort((a: int, b: int): int => {
          throw new SortError01301();
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
      // 7. sort surfaces Error when string comparator throws 'compare failed' on ['c','a','b']
      const arr7 = new SparseArray<string>('c', 'a', 'b');
      try {
        arr7.sort((a: string, b: string): int => {
          throw new Error('compare failed');
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
      // 8. sort surfaces Error when Date comparator throws 'Date cmp fail'
      const arr8 = new SparseArray<Date>(new Date(1000), new Date(0), new Date(500));
      try {
        arr8.sort((a: Date, b: Date): int => {
          throw new Error('Date cmp fail');
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
      // 9. descending comparator (b-a) ints [5,3,1,4,2] -> 5,4,3,2,1
      const arr9 = new SparseArray<int>(5, 3, 1, 4, 2);
      const result9 = arr9.sort((a: int, b: int): int => {
        return b - a;
      });
      expect(result9.length).assertEqual(5);
      expect(result9[0]).assertEqual(5);
      expect(result9[1]).assertEqual(4);
      expect(result9[2]).assertEqual(3);
      expect(result9[3]).assertEqual(2);
      expect(result9[4]).assertEqual(1);
      // 10. comparator returning extreme ints 2147483647/-2147483648 on [3,1,4,2] -> 1,2,3,4
      const arr10 = new SparseArray<int>(3, 1, 4, 2);
      const result10 = arr10.sort((a: int, b: int): int => {
        if (a > b) {
          return 2147483647;
        }
        if (a < b) {
          return -2147483648;
        }
        return 0;
      });
      expect(result10[0]).assertEqual(1);
      expect(result10[1]).assertEqual(2);
      expect(result10[2]).assertEqual(3);
      expect(result10[3]).assertEqual(4);
      expect(result10.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_PART01_0300
     * @tc.name sparseArraySortTestPart01003
     * @tc.desc sort on typed/special values & same instance & single (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArraySortTestPart01003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. ascending comparator doubles [3.5,1.2,4.8,2.0] -> arr[0]=1.2, arr[3]=4.8
      const arr1 = new SparseArray<double>(3.5, 1.2, 4.8, 2.0);
      const result1 = arr1.sort((a: double, b: double): int => (a < b ? -1 : a > b ? 1 : 0));
      expect(result1[0]).assertEqual(1.2);
      expect(result1[3]).assertEqual(4.8);
      // 2. comparator doubles [1.0,Infinity,100.0] placing POSITIVE_INFINITY at arr[2]
      const arr2 = new SparseArray<double>(1.0, Double.POSITIVE_INFINITY, 100.0);
      const result2 = arr2.sort((a: double, b: double): int => (a < b ? -1 : a > b ? 1 : 0));
      expect(result2[2]).assertEqual(Double.POSITIVE_INFINITY);
      // 3. lexicographic comparator strings [hello,abc,xyz] returns same instance -> abc,hello,xyz
      const arr3 = new SparseArray<string>('hello', 'abc', 'xyz');
      const result3 = arr3.sort((a: string, b: string): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      expect(result3[0]).assertEqual('abc');
      expect(result3[1]).assertEqual('hello');
      expect(result3[2]).assertEqual('xyz');
      // 4. ascending comparator bigints [3n,1n,2n] returns same instance -> 1n,2n,3n
      const arr4 = new SparseArray<bigint>(3n, 1n, 2n);
      const result4 = arr4.sort((a: bigint, b: bigint): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      expect(result4[0]).assertEqual(1n);
      expect(result4[1]).assertEqual(2n);
      expect(result4[2]).assertEqual(3n);
      // 5. comparator booleans [false,true,false] returns same instance -> true,false,false
      const arr5 = new SparseArray<boolean>(false, true, false);
      const result5 = arr5.sort((a: boolean, b: boolean): int => {
        if (a === b) {
          return 0;
        }
        return a ? -1 : 1;
      });
      expect(result5[0]).assertTrue();
      expect(result5[1]).assertFalse();
      expect(result5[2]).assertFalse();
      // 6. comparator booleans [false,true,false,true] -> true,true,false,false
      const arr6 = new SparseArray<boolean>(false, true, false, true);
      const result6 = arr6.sort((a: boolean, b: boolean): int => {
        if (a === b) {
          return 0;
        }
        return a ? -1 : 1;
      });
      expect(result6[0]).assertTrue();
      expect(result6[1]).assertTrue();
      expect(result6[2]).assertFalse();
      expect(result6[3]).assertFalse();
      // 7. sparse SparseArray {0:30,3:10} returns same instance, holes undefined -> [10,undef,undef,30]
      const arr7 = new SparseArray<int>(4);
      arr7[0] = 30;
      arr7[3] = 10;
      const result7 = arr7.sort((a: int, b: int): int => a - b);
      expect(result7.length).assertEqual(4);
      expect(result7[0]).assertEqual(10);
      expect(result7[1]).assertUndefined();
      expect(result7[2]).assertUndefined();
      expect(result7[3]).assertEqual(30);
      // 8. single-element SparseArray.of<int>(99) keeps arr[0]=99 and arr.length=1
      const arr8 = SparseArray.of<int>(99);
      const result8 = arr8.sort();
      expect(result8[0]).assertEqual(99);
      expect(result8.length).assertEqual(1);
    });
  });
}
