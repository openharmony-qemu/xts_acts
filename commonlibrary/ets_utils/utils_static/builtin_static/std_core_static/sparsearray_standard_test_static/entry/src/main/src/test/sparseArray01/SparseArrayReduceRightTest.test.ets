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


class CustomError004 extends Error {
  constructor(message: string) {
    super(message);
    this.name = "CustomError004";
  }
}

function reduceRightIntSum(arr: SparseArray<int>): int {
  return arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
}

export default function SparseArrayReduceRightTest(): void {
  describe('SparseArrayReduceRightTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_0100
     * @tc.name testSparseArrayReduceRight001
     * @tc.desc reduceRightIntSum on dense array and instance check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3);
      expect(arr instanceof SparseArray).assertTrue();
      expect(reduceRightIntSum(arr)).assertEqual(6);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_0200
     * @tc.name testSparseArrayReduceRight002
     * @tc.desc without initialValue reduceRight callback indices are 1 and 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3);
      const indices: Array<int> = [];
      const sum = arr.reduceRight((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
        indices.push(index);
        return acc + curr;
      });
      expect(sum).assertEqual(6);
      expect(indices.length).assertEqual(2);
      expect(indices[0]).assertEqual(1);
      expect(indices[1]).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_0300
     * @tc.name testSparseArrayReduceRight003
     * @tc.desc reduceRight sums four elements to 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3, 4);
      const result = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(result).assertEqual(10);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_0400
     * @tc.name testSparseArrayReduceRight004
     * @tc.desc string reduceRight concatenates in reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<string>("a", "b", "c");
      const result = arr.reduceRight((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
      expect(result).assertEqual("cba");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_0500
     * @tc.name testSparseArrayReduceRight005
     * @tc.desc string reduceRight with empty initialValue yields zyx
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<string>("x", "y", "z");
      const out = arr.reduceRight((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
      expect(out).assertEqual("zyx");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_0600
     * @tc.name testSparseArrayReduceRight006
     * @tc.desc reduceRight on sparse holes sums present elements to 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(5);
      arr[0] = 1;
      arr[2] = 2;
      arr[4] = 3;
      const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(sum).assertEqual(6);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_0700
     * @tc.name testSparseArrayReduceRight007
     * @tc.desc reduceRight sums mixed positive and negative ints to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(-1, 2, -3, 4);
      const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(sum).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_0800
     * @tc.name testSparseArrayReduceRight008
     * @tc.desc boolean reduceRight short-circuits to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<boolean>(true, true, false);
      const allTrue = arr.reduceRight((acc: boolean, curr: boolean, _i: int, _a: SparseArray<boolean>): boolean => acc && curr);
      expect(allTrue).assertFalse();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_0900
     * @tc.name testSparseArrayReduceRight009
     * @tc.desc reduceRight propagates Error from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.reduceRight((_acc: int, _curr: int, _i: int, _a: SparseArray<int>): int => {
          throw new Error("callback error");
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("Error");
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_1000
     * @tc.name testSparseArrayReduceRight010
     * @tc.desc reduceRight without initialValue uses first element 10 as acc and sums to 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(10, 1, 2, 3);
      const result = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(result).assertEqual(16);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_1100
     * @tc.name testSparseArrayReduceRight011
     * @tc.desc number reduceRight sums fractional values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<number>(1.5, 2.5, 3.5);
      const result = arr.reduceRight((acc: number, curr: number, _i: int, _a: SparseArray<number>): number => acc + curr);
      expect(result).assertEqual(7.5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_1200
     * @tc.name testSparseArrayReduceRight012
     * @tc.desc reduceRight on empty array throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>();
      try {
        arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("TypeError");
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_1300
     * @tc.name testSparseArrayReduceRight013
     * @tc.desc single pushed element reduceRight returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>();
      arr.push(42);
      const result = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(result).assertEqual(42);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_1400
     * @tc.name testSparseArrayReduceRight014
     * @tc.desc reduceRight sums five elements to 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3, 4, 5);
      const result = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(result).assertEqual(15);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_1500
     * @tc.name testSparseArrayReduceRight015
     * @tc.desc reduceRightIntSum on three-element array yields 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(10, 20, 30);
      expect(reduceRightIntSum(arr)).assertEqual(60);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_1600
     * @tc.name testSparseArrayReduceRight016
     * @tc.desc reduceRight without initialValue returns minimum element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(3, 1, 4, 2);
      const minVal = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => (curr < acc ? curr : acc));
      expect(minVal).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_1700
     * @tc.name testSparseArrayReduceRight017
     * @tc.desc reduceRight records callback indices right-to-left on dense array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3, 4);
      const indices: Array<int> = [];
      arr.reduceRight((acc: int, _curr: int, index: int, _a: SparseArray<int>): int => {
        indices.push(index);
        return acc;
      });
      expect(indices.length).assertEqual(3);
      expect(indices[0]).assertEqual(2);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_1800
     * @tc.name testSparseArrayReduceRight018
     * @tc.desc four-char string reduceRight yields dcba
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<string>("a", "b", "c", "d");
      const result = arr.reduceRight((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
      expect(result).assertEqual("dcba");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_1900
     * @tc.name testSparseArrayReduceRight019
     * @tc.desc reduceRight without initialValue sums three elements to 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3);
      const result = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(result).assertEqual(6);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_2000
     * @tc.name testSparseArrayReduceRight020
     * @tc.desc reduceRight without initialValue multiplies four elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3, 4);
      const product = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc * curr);
      expect(product).assertEqual(24);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_2100
     * @tc.name testSparseArrayReduceRight021
     * @tc.desc three-part string reduceRight inserts spaces in reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<string>("Hello", " ", "World");
      const result = arr.reduceRight((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
      expect(result).assertEqual("World Hello");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_2200
     * @tc.name testSparseArrayReduceRight022
     * @tc.desc reduceRight callback receives same array reference as receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3);
      const sum = arr.reduceRight((acc: int, curr: int, _index: int, array: SparseArray<int>): int => {
        expect(array === arr).assertTrue();
        return acc + curr;
      });
      expect(sum).assertEqual(6);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_2300
     * @tc.name testSparseArrayReduceRight023
     * @tc.desc reduceRight without initialValue multiplies four elements to 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3, 4);
      const product = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc * curr);
      expect(product).assertEqual(24);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_2400
     * @tc.name testSparseArrayReduceRight024
     * @tc.desc at index 0 accumulator is left neighbor before adding curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3);
      const result = arr.reduceRight((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
        if (index === 0) {
          expect(acc).assertEqual(5);
        }
        return acc + curr;
      });
      expect(result).assertEqual(6);
      expect(arr.length).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_2500
     * @tc.name testSparseArrayReduceRight025
     * @tc.desc without initialValue curr sequence is 20 then 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(10, 20, 30);
      const values: Array<int> = [];
      arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => {
        values.push(curr);
        return acc;
      });
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(20);
      expect(values[1]).assertEqual(10);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_2600
     * @tc.name testSparseArrayReduceRight026
     * @tc.desc reduceRight without initialValue returns maximum element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(3, 1, 4, 2);
      const maxVal = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => (curr > acc ? curr : acc));
      expect(maxVal).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_2700
     * @tc.name testSparseArrayReduceRight027
     * @tc.desc reduceRight callback sees receiver length on array param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3);
      arr.reduceRight((acc: int, _c: int, _i: int, array: SparseArray<int>): int => {
        expect(array.length).assertEqual(3);
        return acc;
      });
      expect(arr instanceof SparseArray).assertTrue();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_2800
     * @tc.name testSparseArrayReduceRight028
     * @tc.desc reduceRight sums 100 pushed integers (smoke, not huge loop)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>();
      for (let i = 0; i < 100; i++) {
        arr.push(i);
      }
      const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(sum).assertEqual(4950);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_2900
     * @tc.name testSparseArrayReduceRight029
     * @tc.desc reduceRight sums dense array including zero values to 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 0, 2, 0, 3);
      const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(sum).assertEqual(6);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_3000
     * @tc.name testSparseArrayReduceRight030
     * @tc.desc reduceRight sums alternating-sign array to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, -2, 3, -4, 5);
      const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(sum).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_3100
     * @tc.name testSparseArrayReduceRight031
     * @tc.desc reduceRight sums two large ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1000, 2000);
      const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
      expect(sum).assertEqual(3000);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_3200
     * @tc.name testSparseArrayReduceRight032
     * @tc.desc reduceRight concatenates digits into string 321
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3);
      const combined = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc * 10 + curr);
      expect(combined).assertEqual(321);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_3300
     * @tc.name testSparseArrayReduceRight033
     * @tc.desc reduceRight propagates custom Error subclass name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.reduceRight((_acc: int, _curr: int, _i: int, _a: SparseArray<int>): int => {
          throw new CustomError004("Custom reduce error");
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("CustomError004");
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_3400
     * @tc.name testSparseArrayReduceRight034
     * @tc.desc reduceRight weighted by index on four elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3, 4);
      const weighted = arr.reduceRight((acc: int, curr: int, index: int, _a: SparseArray<int>): int => acc + curr * index);
      // 无初值时末元为 acc，自右向左累加 curr*index → 4+6+2+0=12
      expect(weighted).assertEqual(12);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_3500
     * @tc.name testSparseArrayReduceRight035
     * @tc.desc reduceRight without initialValue multiplies three elements to 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(2, 3, 4);
      const product = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc * curr);
      expect(product).assertEqual(24);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_3600
     * @tc.name testSparseArrayReduceRight036
     * @tc.desc sparse reduceRight records indices 2 and 0 only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(5);
      arr[0] = 1;
      arr[2] = 2;
      arr[4] = 3;
      const indices: Array<int> = [];
      arr.reduceRight((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
        indices.push(index);
        return acc;
      });
      expect(indices.length).assertEqual(2);
      expect(indices[0]).assertEqual(2);
      expect(indices[1]).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_3700
     * @tc.name testSparseArrayReduceRight037
     * @tc.desc reduceRight sum times two on four elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3, 4);
      const result = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr) * 2;
      expect(result).assertEqual(20);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_3800
     * @tc.name testSparseArrayReduceRight038
     * @tc.desc reduceRight accumulates long elements sum in reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<long>(10000000000 as long, 20000000000 as long, 30000000000 as long);
      const sum = arr.reduceRight((acc: long, curr: long, _i: int, _a: SparseArray<long>): long => (acc + curr) as long);
      expect(sum).assertEqual(60000000000 as long);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_3900
     * @tc.name testSparseArrayReduceRight039
     * @tc.desc reduceRight accumulates float elements product in reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<float>(2.0f, 3.0f, 4.0f);
      const product = arr.reduceRight((acc: float, curr: float, _i: int, _a: SparseArray<float>): float => acc * curr);
      expect(product).assertEqual(24.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_4000
     * @tc.name testSparseArrayReduceRight040
     * @tc.desc reduceRight skips null elements when summing int|null array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 3, null, 5);
        const sum = arr.reduceRight((acc: int | null, curr: int | null, _i: int, _a: SparseArray<int | null>): int | null => {
          if (curr === null) {
            return acc;
          }
          const base = acc === null ? 0 : acc;
          return base + curr;
        });
        expect(sum).assertEqual(9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_4100
     * @tc.name testSparseArrayReduceRight041
     * @tc.desc reduceRight on int|undefined treats undefined slot as skip in accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(2, undefined, 4);
        const sum = arr.reduceRight((acc: int | undefined, curr: int | undefined, _i: int, _a: SparseArray<int | undefined>): int | undefined => {
          if (curr === undefined) {
            return acc;
          }
          const base = acc === undefined ? 0 : acc;
          return base + curr;
        });
        expect(sum).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_4200
     * @tc.name testSparseArrayReduceRight042
     * @tc.desc reduceRight on single undefined slot uses callback skip logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(4, undefined, 6);
        const sum = arr.reduceRight((acc: int | undefined, curr: int | undefined, _i: int, _a: SparseArray<int | undefined>): int | undefined => {
          if (curr === undefined) {
            return acc;
          }
          const base = acc === undefined ? 0 : acc;
          return base + curr;
        });
        expect(sum).assertEqual(10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_4300
     * @tc.name testSparseArrayReduceRight043
     * @tc.desc map null slots to zero then reduceRight sum on int|null array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 4);
        const sum = arr.reduceRight((acc: int | null, curr: int | null, _i: int, _a: SparseArray<int | null>): int | null => {
          const v = curr === null ? 0 : curr;
          const base = acc === null ? 0 : acc;
          return base + v;
        });
        expect(sum).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_4400
     * @tc.name testSparseArrayReduceRight044
     * @tc.desc reduceRight sums hex 0x1 binary 0b10 octal 0o3 literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0x1, 0b10, 0o3);
        const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(0x1 + 0b10 + 0o3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_4500
     * @tc.name testSparseArrayReduceRight045
     * @tc.desc reduceRight without initialValue sums three int elements to 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(60);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_4600
     * @tc.name testSparseArrayReduceRight046
     * @tc.desc reduceRight on single undefined element without initialValue (API single-arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(undefined);
        const out = arr.reduceRight((acc: int | undefined, curr: int | undefined, _i: int, _a: SparseArray<int | undefined>): int | undefined => {
          return acc;
        });
        expect(out).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_4700
     * @tc.name testSparseArrayReduceRight047
     * @tc.desc reduceRight single-arg API: numeric sum uses last element as implicit acc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight047', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(2, 3, 4);
      const indices: Array<int> = [];
      const sum = arr.reduceRight((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
        indices.push(index);
        return acc + curr;
      });
      expect(sum).assertEqual(9);
      expect(indices.length).assertEqual(2);
      expect(indices[0]).assertEqual(1);
      expect(indices[1]).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_4800
     * @tc.name testSparseArrayReduceRight048
     * @tc.desc reduceRight single-arg API: string concat uses last element as implicit acc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight048', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<string>("pre-", "fix", "-end");
      const result = arr.reduceRight((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
      expect(result).assertEqual("-endfixpre-");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_4900
     * @tc.name testSparseArrayReduceRight049
     * @tc.desc reduceRight on empty array throws TypeError (API has no initialValue overload)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight049', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>();
      try {
        arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_5000
     * @tc.name testSparseArrayReduceRight050
     * @tc.desc reduceRight boolean values with logical or operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight050', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<boolean>(false, false, true);
      const result = arr.reduceRight((acc: boolean, curr: boolean, _i: int, _a: SparseArray<boolean>): boolean => acc || curr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_5100
     * @tc.name testSparseArrayReduceRight051
     * @tc.desc reduceRight char values returns highest char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight051', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<char>(c'A', c'C', c'B');
      const result = arr.reduceRight((acc: char, curr: char, _i: int, _a: SparseArray<char>): char => {
        if (curr > acc) {
          return curr;
        }
        return acc;
      });
      expect(result).assertEqual(c'C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_RIGHT_5200
     * @tc.name testSparseArrayReduceRight052
     * @tc.desc reduceRight skips sparse holes when summing assigned values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReduceRight052', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(6);
      arr[1] = 10;
      arr[5] = 30;
      let callCount = 0;
      const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => {
        callCount++;
        return acc + curr;
      });
      expect(sum).assertEqual(40);
      expect(callCount).assertEqual(1);
    });


  });
}
