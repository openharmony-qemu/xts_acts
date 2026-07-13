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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';


interface Item015 {
  value: int | null
}

function nullToZero(v: int | null): int {
  if (v === null) {
    return 0;
  }
  return v;
}

class CustomError019 extends Error {
  constructor(message: string) {
    super(message);
    this.name = "CustomError019";
  }
}

interface Item019 {
  category: string
  value: int
}

function reduceIntSum(arr: SparseArray<int>): int {
  return arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
}

export default function SparseArrayReduceTest(): void {
  describe('SparseArrayReduceTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);

    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_0100
     * @tc.name testSparseArrayReduce001
     * @tc.desc reduce on dense int array sums to 6 and instance check passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3);
      expect(arr instanceof SparseArray).assertTrue();
      const s = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(s).assertEqual(6);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_0200
     * @tc.name testSparseArrayReduce002
     * @tc.desc without initialValue callback indices are 1 and 2 only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3);
      const indices: Array<int> = [];
      const sum = arr.reduce((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
        indices.push(index);
        return acc + curr;
      });
      expect(sum).assertEqual(6);
      expect(indices.length).assertEqual(2);
      expect(indices[0]).assertEqual(1);
      expect(indices[1]).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_0300
     * @tc.name testSparseArrayReduce003
     * @tc.desc Test SparseArray.reduce, verify method result (sum equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3, 4);
      const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(sum).assertEqual(10);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_0400
     * @tc.name testSparseArrayReduce004
     * @tc.desc Test SparseArray.reduce, verify method result (result equals "abc")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<string>("a", "b", "c");
      const result = arr.reduce((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
      expect(result).assertEqual("abc");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_0500
     * @tc.name testSparseArrayReduce005
     * @tc.desc Test SparseArray.reduce on single-element array, verify result equals 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>();
      arr.push(42);
      const only = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(only).assertEqual(42);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_0600
     * @tc.name testSparseArrayReduce006
     * @tc.desc reduceIntSum helper sums a three-element array to 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(10, 20, 30);
      expect(reduceIntSum(arr)).assertEqual(60);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_0700
     * @tc.name testSparseArrayReduce007
     * @tc.desc Test SparseArray.reduce on sparse array with holes, verify sum of defined elements is 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(5);
      arr[0] = 1;
      arr[2] = 2;
      arr[4] = 3;
      const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(sum).assertEqual(6);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_0800
     * @tc.name testSparseArrayReduce008
     * @tc.desc Test SparseArray.reduce on array with negative values, verify sum is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(-1, 2, -3, 4);
      const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(sum).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_0900
     * @tc.name testSparseArrayReduce009
     * @tc.desc Test SparseArray.reduce, verify method result (sum equals 15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3, 4, 5);
      const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(sum).assertEqual(15);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_1000
     * @tc.name testSparseArrayReduce010
     * @tc.desc reduce without initialValue uses first element 10 as acc and sums to 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(10, 1, 2, 3);
      const result = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(result).assertEqual(16);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_1100
     * @tc.name testSparseArrayReduce011
     * @tc.desc Test SparseArray.reduce, verify method result (result equals "中文测试🎉")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<string>("中文", "测试", "🎉");
      const result = arr.reduce((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
      expect(result).assertEqual("中文测试🎉");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_1200
     * @tc.name testSparseArrayReduce012
     * @tc.desc Test SparseArray.reduce, verify method result (result equals "ab")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<string>("a", "", "b");
      const result = arr.reduce((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
      expect(result).assertEqual("ab");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_1300
     * @tc.name testSparseArrayReduce013
     * @tc.desc Test SparseArray.reduce, verify method result (result!.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<string>("a\u200B", "b");
      const result = arr.reduce((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
      expect(result!.length).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_1400
     * @tc.name testSparseArrayReduce014
     * @tc.desc Test SparseArray.reduce flattens nested SparseArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<SparseArray<int>>(new SparseArray<int>(1, 2), new SparseArray<int>(3, 4));
      const merged = arr.reduce((acc: SparseArray<int>, curr: SparseArray<int>, _i: int, _a: SparseArray<SparseArray<int>>): SparseArray<int> => {
        for (let j = 0; j < curr.length; j++) {
          acc.push(curr[j] as int);
        }
        return acc;
      });
      expect(merged.length).assertEqual(4);
      expect(merged[0]).assertEqual(1);
      expect(merged[3]).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_1500
     * @tc.name testSparseArrayReduce015
     * @tc.desc Test SparseArray.reduce on object elements and verify accumulated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Item015>({ value: 1 }, { value: null }, { value: 3 });
      const result = arr.reduce((acc: Item015, curr: Item015, _i: int, _a: SparseArray<Item015>): Item015 => {
        return { value: nullToZero(acc.value) + nullToZero(curr.value) };
      });
      expect(result.value).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_1600
     * @tc.name testSparseArrayReduce016
     * @tc.desc Test SparseArray.reduce, verify method result (weightedSum equals 21)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3, 4);
      const weightedSum = arr.reduce((acc: int, curr: int, index: int, _a: SparseArray<int>): int => acc + curr * index);
      expect(weightedSum).assertEqual(21);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_1700
     * @tc.name testSparseArrayReduce017
     * @tc.desc reduce callback receives the same array reference as the receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3);
      const sum = arr.reduce((acc: int, curr: int, _index: int, array: SparseArray<int>): int => {
        expect(array === arr).assertTrue();
        return acc + curr;
      });
      expect(sum).assertEqual(6);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_1800
     * @tc.name testSparseArrayReduce018
     * @tc.desc Test SparseArray.reduce with boolean AND callback, verify result is false when any element is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<boolean>(true, true, false);
      const allTrue = arr.reduce((acc: boolean, curr: boolean, _i: int, _a: SparseArray<boolean>): boolean => acc && curr);
      expect(allTrue).assertFalse();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_1900
     * @tc.name testSparseArrayReduce019
     * @tc.desc string reduce with empty initialValue concatenates xyz
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<string>("x", "y", "z");
      const out = arr.reduce((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
      expect(out).assertEqual("xyz");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_2000
     * @tc.name testSparseArrayReduce020
     * @tc.desc reduce without initialValue returns minimum element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(3, 1, 4, 2);
      const minVal = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => (curr < acc ? curr : acc));
      expect(minVal).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_2100
     * @tc.name testSparseArrayReduce021
     * @tc.desc Test SparseArray.reduce, verify method result (sum equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(5, -5);
      const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(sum).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_2200
     * @tc.name testSparseArrayReduce022
     * @tc.desc Test SparseArray.reduce, verify method result (sum equals -6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(-1, -2, -3);
      const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(sum).assertEqual(-6);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_2300
     * @tc.name testSparseArrayReduce023
     * @tc.desc reduce without initialValue returns maximum element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(3, 1, 4, 2);
      const maxVal = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => (curr > acc ? curr : acc));
      expect(maxVal).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_2400
     * @tc.name testSparseArrayReduce024
     * @tc.desc reduce on empty SparseArray throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>();
      try {
        arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("TypeError");
      }

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_2500
     * @tc.name testSparseArrayReduce025
     * @tc.desc reduce propagates Error thrown inside callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => {
          if (curr === 2) {
            throw new Error("Test error");
          }
          return acc + curr;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("Error");
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_2600
     * @tc.name testSparseArrayReduce026
     * @tc.desc reduce propagates custom Error subclass from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.reduce((_acc: int, _curr: int, _i: int, _a: SparseArray<int>): int => {
          throw new CustomError019("Custom error message");
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("CustomError019");
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_2700
     * @tc.name testSparseArrayReduce027
     * @tc.desc reduce stops and throws when callback rejects large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => {
          if (curr > 1) {
            throw new Error("Value too large");
          }
          return acc + curr;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("Error");
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_2800
     * @tc.name testSparseArrayReduce028
     * @tc.desc reduce without initialValue multiplies four elements to 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3, 4);
      const product = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc * curr);
      expect(product).assertEqual(24);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_2900
     * @tc.name testSparseArrayReduce029
     * @tc.desc reduce always throws when callback throws on first step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3);
      let errorThrown = false;
      try {
        arr.reduce((_acc: int, _curr: int, _i: int, _a: SparseArray<int>): int => {
          throw new Error("Uncaught error");
        });
      } catch (error) {
        errorThrown = true;
        expect(error.name).assertEqual("Error");
      }
      expect(errorThrown).assertTrue();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_3000
     * @tc.name testSparseArrayReduce030
     * @tc.desc Test SparseArray.reduce, verify method result (sum equals 150)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(10, 20, 30, 40, 50);
      const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(sum).assertEqual(150);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_3100
     * @tc.name testSparseArrayReduce031
     * @tc.desc reduce without initialValue multiplies all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(2, 3, 4);
      const product = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc * curr);
      expect(product).assertEqual(24);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_3200
     * @tc.name testSparseArrayReduce032
     * @tc.desc reduce concatenates int digits into string 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3);
      const combined = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc * 10 + curr);
      expect(combined).assertEqual(123);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_3300
     * @tc.name testSparseArrayReduce033
     * @tc.desc reduce aggregates Item019 values by category
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Item019>(
        { category: "A", value: 1 },
        { category: "B", value: 2 },
        { category: "A", value: 3 }
      );
      let aSum = 0;
      let bSum = 0;
      arr.reduce((acc: Item019, curr: Item019, index: int, _a: SparseArray<Item019>): Item019 => {
        if (index === 1) {
          const first = acc;
          aSum = first.category === "A" ? first.value : 0;
          bSum = first.category === "B" ? first.value : 0;
        }
        if (index >= 1) {
          if (curr.category === "A") {
            aSum += curr.value;
          } else {
            bSum += curr.value;
          }
        }
        return curr;
      });
      expect(aSum).assertEqual(4);
      expect(bSum).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_3400
     * @tc.name testSparseArrayReduce034
     * @tc.desc reduce fold acc + curr*curr - curr matches expected 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3, 4, 5);
      const result = arr.reduce((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
        if (index === 1) {
          const first = acc;
          return first * first - first + curr * curr - curr;
        }
        return acc + curr * curr - curr;
      });
      expect(result).assertEqual(40);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_3500
     * @tc.name testSparseArrayReduce035
     * @tc.desc reduce long elements sum, verify accumulated long result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<long>(10000000000 as long, 20000000000 as long, 30000000000 as long);
      const sum = arr.reduce((acc: long, curr: long, _i: int, _a: SparseArray<long>): long => (acc + curr) as long);
      expect(sum).assertEqual(60000000000 as long);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_3600
     * @tc.name testSparseArrayReduce036
     * @tc.desc reduce short elements sum, verify accumulated short result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short);
      const sum = arr.reduce((acc: short, curr: short, _i: int, _a: SparseArray<short>): short => (Short.toInt(acc) + Short.toInt(curr)).toShort());
      expect(sum).assertEqual(60 as short);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_3700
     * @tc.name testSparseArrayReduce037
     * @tc.desc reduce skips undefined element when summing int|undefined array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, undefined, 3, 4);
        const sum = arr.reduce((acc: int | undefined, curr: int | undefined, _i: int, _a: SparseArray<int | undefined>): int | undefined => {
          if (curr === undefined) {
            return acc;
          }
          const base = acc === undefined ? 0 : acc;
          return base + curr;
        });
        expect(sum).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_3800
     * @tc.name testSparseArrayReduce038
     * @tc.desc reduce treats undefined slot as skip when summing int|undefined array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(undefined, 5, undefined, 7);
        const sum = arr.reduce((acc: int | undefined, curr: int | undefined, _i: int, _a: SparseArray<int | undefined>): int | undefined => {
          if (curr === undefined) {
            return acc;
          }
          const base = acc === undefined ? 0 : acc;
          return base + curr;
        });
        expect(sum).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_3900
     * @tc.name testSparseArrayReduce039
     * @tc.desc reduce sums hex 0x2 and binary 0b11 literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0x2, 0b11);
        const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(0x2 + 0b11);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_4000
     * @tc.name testSparseArrayReduce040
     * @tc.desc reduce single-arg API: numeric sum uses first element as implicit acc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(2, 3, 4);
      const indices: Array<int> = [];
      const sum = arr.reduce((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
        indices.push(index);
        return acc + curr;
      });
      expect(sum).assertEqual(9);
      expect(indices.length).assertEqual(2);
      expect(indices[0]).assertEqual(1);
      expect(indices[1]).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_4100
     * @tc.name testSparseArrayReduce041
     * @tc.desc reduce single-arg API: string concat uses first element as implicit acc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<string>("pre-", "fix", "-end");
      const result = arr.reduce((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
      expect(result).assertEqual("pre-fix-end");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_4200
     * @tc.name testSparseArrayReduce042
     * @tc.desc reduce on empty array throws TypeError (API has no initialValue overload)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>();
      try {
        arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_4300
     * @tc.name testSparseArrayReduce043
     * @tc.desc reduce boolean values with logical and operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<boolean>(true, true, false);
      const result = arr.reduce((acc: boolean, curr: boolean, _i: int, _a: SparseArray<boolean>): boolean => acc && curr);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_4400
     * @tc.name testSparseArrayReduce044
     * @tc.desc reduce char values keeps later char when current value is greater
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<char>(c'A', c'C', c'B');
      const result = arr.reduce((acc: char, curr: char, _i: int, _a: SparseArray<char>): char => {
        if (curr > acc) {
          return curr;
        }
        return acc;
      });
      expect(result).assertEqual(c'C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_4500
     * @tc.name testSparseArrayReduce045
     * @tc.desc reduce skips sparse holes when summing assigned values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduce045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(6);
      arr[1] = 10;
      arr[5] = 30;
      let callCount = 0;
      const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => {
        callCount++;
        return acc + curr;
      });
      expect(sum).assertEqual(40);
      expect(callCount).assertEqual(1);
    });


  });
}
