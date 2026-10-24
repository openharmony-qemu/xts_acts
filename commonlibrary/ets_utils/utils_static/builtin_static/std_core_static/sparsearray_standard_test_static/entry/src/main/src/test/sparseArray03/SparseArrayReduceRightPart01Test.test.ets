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
} from "../../../../hypium/index";
import Utils from "../Util.test";

interface Item02102 {
  id: int;
  label: string;
}

// Merged from 23 it() scenarios -> 3 cases (9 + 10 + 4), each <=10
export default function sparseArrayReduceRightTestPart01(): void {
  describe("SparseArrayReduceRightTestPart01", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_PART01_0100
     * @tc.name sparseArrayReduceRightTestPart01001
     * @tc.desc reduceRight sum/subtract on numeric arrays (int/long/double) incl. sparse & mutation (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("sparseArrayReduceRightTestPart01001", Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. reduceRight on (10,20,30) leaves final accumulated prev as 50
      let capturedPrev1: int = 0;
      const arr1 = new SparseArray<int>(10, 20, 30);
      arr1.reduceRight((prev: int, curr: int, i: int, a: SparseArray<int>): int => {
        capturedPrev1 = prev;
        return prev + curr;
      });
      expect(capturedPrev1).assertEqual(50);
      // 2. reduceRight subtracts right-to-left on (1,2,3) yielding 0
      const arr2 = new SparseArray<int>(1, 2, 3);
      const result2: int = arr2.reduceRight((prev: int, curr: int) => prev - curr);
      expect(result2).assertEqual(0);
      // 3. reduceRight sums sparse elements 30 and 10 skipping holes into 40
      const arr3 = new SparseArray<int>(5);
      arr3[1] = 10;
      arr3[3] = 30;
      const result3 = arr3.reduceRight((prev: int, curr: int, idx: int, a: SparseArray<int>): int => prev + curr);
      expect(result3).assertEqual(40);
      // 4. reduceRight subtracts 0.1 from 0.2 yielding 0.1 (double)
      const arr4 = new SparseArray<double>(0.1, 0.2);
      const result4: double = arr4.reduceRight((prev: double, curr: double) => prev - curr);
      expect(result4).assertEqual(0.1);
      // 5. reduceRight subtracts longs 200 minus 100 yielding 100
      const arr5 = new SparseArray<long>(100 as long, 200 as long);
      const result5: long = arr5.reduceRight((prev: long, curr: long) => prev - curr);
      expect(result5).assertEqual(100 as long);
      // 6. reduceRight on single long element 999 returns 999
      const arr6 = SparseArray.of<long>(999 as long);
      const result6: long = arr6.reduceRight((prev: long, curr: long) => prev + curr);
      expect(result6).assertEqual(999 as long);
      // 7. reduceRight zeroing visited indexes still sums (1,2,3,4) into 10
      const arr7 = new SparseArray<int>(1, 2, 3, 4);
      const result7 = arr7.reduceRight((prev: int, curr: int, idx: int, a: SparseArray<int>): int => {
        const r7: int = prev + curr;
        a[idx] = 0;
        return r7;
      });
      expect(result7).assertEqual(10);
      // 8. reduceRight growing length to 6 during callback still reduces (1,2,3) into 6
      const arr8 = new SparseArray<int>(1, 2, 3);
      const result8 = arr8.reduceRight((prev: int, curr: int, idx: int, a: SparseArray<int>): int => {
        if (idx === 1) {
          a.length = 6;
          a[5] = 999;
          a[3] = 888;
        }
        return prev + curr;
      });
      expect(result8).assertEqual(6);
      expect(arr8.length).assertEqual(6);
      // 9. reduceRight mutating unvisited element a[1] to 0 sums (10,20,30,40) into 80
      const arr9 = new SparseArray<int>(4);
      arr9[0] = 10;
      arr9[1] = 20;
      arr9[2] = 30;
      arr9[3] = 40;
      const result9 = arr9.reduceRight((prev: int, curr: int, idx: int, a: SparseArray<int>): int => {
        const r9: int = prev + curr;
        if (idx === 2) {
          a[1] = 0;
        }
        return r9;
      });
      expect(result9).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_PART01_0200
     * @tc.name sparseArrayReduceRightTestPart01002
     * @tc.desc reduceRight right-to-left order verification & string/boolean/Date concatenation (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("sparseArrayReduceRightTestPart01002", Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. reduceRight uses rightmost element as initial prev on Chinese strings
      let prevStr1: string = '';
      const arr1 = new SparseArray<string>("测试", "中文");
      arr1.reduceRight((prev: string, curr: string, i: int, a: SparseArray<string>): string => {
        prevStr1 = prev;
        return prev + curr;
      });
      expect(prevStr1).assertEqual("中文");
      // 2. reduceRight captures rightmost object id 2 label right as initial prev
      let captured2: Item02102 = { id: 0, label: '' } as Item02102;
      const arr2 = new SparseArray<Item02102>(
        { id: 1, label: "left" } as Item02102,
        { id: 2, label: "right" } as Item02102,
      );
      arr2.reduceRight((prev: Item02102, curr: Item02102, i: int, a: SparseArray<Item02102>): Item02102 => {
        captured2 = prev;
        return curr;
      });
      expect(captured2.id).assertEqual(2);
      expect(captured2.label).assertEqual("right");
      // 3. reduceRight with doubles uses accumulated prev 1.5 on second callback
      let prevDouble3: double = -1.0;
      const arr3 = new SparseArray<double>(2.5, 1.5, 0.0);
      arr3.reduceRight((prev: double, curr: double, i: int, a: SparseArray<double>): double => {
        prevDouble3 = prev;
        return prev + curr;
      });
      expect(prevDouble3).assertEqual(1.5);
      // 4. reduceRight visits leftmost element c as curr including empty string
      let currStr4: string = 'x';
      const arr4 = new SparseArray<string>('c', "", 'a');
      arr4.reduceRight((prev: string, curr: string, i: int, a: SparseArray<string>): string => {
        currStr4 = curr;
        return prev + curr;
      });
      expect(currStr4).assertEqual('c');
      // 5. reduceRight with boolean OR leaves final curr true on (true,false,true)
      let currBool5: boolean = false;
      const arr5 = new SparseArray<boolean>(true, false, true);
      arr5.reduceRight((prev: boolean, curr: boolean, i: int, a: SparseArray<boolean>): boolean => {
        currBool5 = curr;
        return prev || curr;
      });
      expect(currBool5).assertTrue();
      // 6. reduceRight returning curr picks leftmost Date epoch whose time is 0
      const epoch6: Date = new Date(0);
      const later6: Date = new Date(1000000000000);
      const arr6 = new SparseArray<Date>(epoch6, later6);
      const result6: Date = arr6.reduceRight((prev: Date, curr: Date) => curr);
      expect(result6.getTime()).assertEqual(0);
      // 7. reduceRight concatenates Chinese strings right-to-left producing reversed order
      const arr7 = new SparseArray<string>("你好", "世界");
      const result7: string = arr7.reduceRight((prev: string, curr: string) => prev + curr);
      expect(result7).assertEqual("世界你好");
      // 8. reduceRight concatenates A with tab-wrapped B right-to-left keeping tab characters
      const arr8 = new SparseArray<string>('A', "\tB\t");
      const result8: string = arr8.reduceRight((prev: string, curr: string) => prev + curr);
      expect(result8).assertEqual("\tB\tA");
      // 9. reduceRight with OR over (false,false) returns false
      const arr9 = new SparseArray<boolean>(false, false);
      const result9: boolean = arr9.reduceRight((prev: boolean, curr: boolean) => prev || curr);
      expect(result9).assertFalse();
      // 10. reduceRight with AND over all-true booleans returns true
      const arr10 = new SparseArray<boolean>(true, true, true);
      const result10 = arr10.reduceRight(
        (prev: boolean, curr: boolean, idx: int, a: SparseArray<boolean>): boolean => prev && curr,
      );
      expect(result10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_PART01_0300
     * @tc.name sparseArrayReduceRightTestPart01003
     * @tc.desc reduceRight single-element skip & callback error throwing (4 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("sparseArrayReduceRightTestPart01003", Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. reduceRight on single element only skips callback so callCount stays 0
      const arr1 = new SparseArray<string>("only");
      let callCount1: int = 0;
      const result1 = arr1.reduceRight((prev: string, curr: string, idx: int, a: SparseArray<string>): string => {
        callCount1 = callCount1 + 1;
        return prev + curr;
      });
      expect(result1).assertEqual("only");
      expect(callCount1).assertEqual(0);
      // 2. reduceRight throws Error with message "last callback error" on second callback
      const arr2 = new SparseArray<int>(10, 20, 30);
      let callCount2: int = 0;
      try {
        arr2.reduceRight((prev: int, curr: int, idx: int, a: SparseArray<int>): int => {
          callCount2 = callCount2 + 1;
          if (callCount2 === 2) {
            throw new Error("last callback error");
          }
          return prev + curr;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.message).assertEqual("last callback error");
      }
      // 3. reduceRight on sparse (40,10) throws Error when encountering rightmost element 10
      const arr3 = new SparseArray<int>(5);
      arr3[0] = 10;
      arr3[4] = 40;
      try {
        arr3.reduceRight((prev: int, curr: int, idx: int, a: SparseArray<int>): int => {
          if (curr === 10) {
            throw new Error("error on rightmost element");
          }
          return prev + curr;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.message).assertEqual("error on rightmost element");
      }
      // 4. reduceRight throws Error stop at index 3 on first callback leaving callCount 1
      const arr4 = new SparseArray<int>(1, 2, 3, 4, 5);
      let callCount4: int = 0;
      try {
        arr4.reduceRight((prev: int, curr: int, idx: int, a: SparseArray<int>): int => {
          callCount4 = callCount4 + 1;
          if (idx === 3) {
            throw new Error("stop at index 3");
          }
          return prev + curr;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.message).assertEqual("stop at index 3");
      }
      expect(callCount4).assertEqual(1);
    });

  });
}
