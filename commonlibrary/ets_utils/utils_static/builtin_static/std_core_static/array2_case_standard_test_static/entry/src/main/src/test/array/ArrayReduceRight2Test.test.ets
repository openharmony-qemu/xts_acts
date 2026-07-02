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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class ReduceRightTwoItem024 {
  value: number = 0;
}

class ReduceRightTwoData043 {
  sum: number = 0;
  count: number = 0;
}

class ReduceRightTwoIndexMap {
  a: number = -1;
  b: number = -1;
  c: number = -1;
}

function createLargeNumberArrayTwo(size: int): Array<number> {
  const arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function reduceRightAnyNumberArrayTwo(value: Any): number {
  const arr = value as Array<number>;
  return arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
}

export default function ArrayReduceRight2Test(): void {
  describe('ArrayReduceRight2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_0100
     * @tc.name testArrayReduceRightTwo001
     * @tc.desc Verify reduceRight accepts a required callback function without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const callbackfn = (
        previousValue: string,
        currentValue: string,
        _index: int,
        _array: Array<string>
      ): string => previousValue + currentValue;
      const result = arr.reduceRight(callbackfn);
      expect(result).assertEqual('cba');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_0200
     * @tc.name testArrayReduceRightTwo002
     * @tc.desc Verify the callback function type matches the array element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const callbackfn: (
        previousValue: number,
        currentValue: number,
        index: int,
        array: Array<number>
      ) => number = (
        prev: number,
        curr: number,
        _index: int,
        _array: Array<number>
      ): number => prev + curr;
      const result = arr.reduceRight(callbackfn);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_0300
     * @tc.name testArrayReduceRightTwo003
     * @tc.desc Verify reduceRight with a summing callback combines all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduceRight((a: number, b: number): number => a + b);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_0400
     * @tc.name testArrayReduceRightTwo004
     * @tc.desc Verify reduceRight can multiply numeric values without an explicit initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.reduceRight((a: number, b: number): number => a * b);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_0500
     * @tc.name testArrayReduceRightTwo005
     * @tc.desc Verify the previous value parameter receives the accumulated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduceRight((prev: string, curr: string): string => {
        expect(typeof prev).assertEqual('string');
        return prev + curr;
      });
      expect(result).assertEqual('cba');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_0600
     * @tc.name testArrayReduceRightTwo006
     * @tc.desc Verify the current value parameter receives each processed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduceRight((prev: number, curr: number): number => {
        expect(typeof curr).assertEqual('number');
        return prev + curr;
      });
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_0700
     * @tc.name testArrayReduceRightTwo007
     * @tc.desc Verify the callback receives the current element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let firstIndex = -1;
      const result = arr.reduceRight((prev: number, curr: number, i: int): number => {
        if (firstIndex < 0) {
          firstIndex = i;
        }
        expect(typeof i).assertEqual('int');
        return prev + curr;
      });
      expect(firstIndex).assertEqual(1);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_0800
     * @tc.name testArrayReduceRightTwo008
     * @tc.desc Verify the callback receives the source array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduceRight(
        (prev: number, curr: number, _i: int, a: Array<number>): number => {
          expect(a === arr).assertTrue();
          return prev + curr;
        }
      );
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_0900
     * @tc.name testArrayReduceRightTwo009
     * @tc.desc Verify the callback parameter order is previous current index and array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduceRight(
        (
          previousValue: number,
          currentValue: number,
          index: int,
          array: Array<number>
        ): number => {
          expect(typeof previousValue).assertEqual('number');
          expect(typeof currentValue).assertEqual('number');
          expect(typeof index).assertEqual('int');
          expect(Array.isArray(array)).assertTrue();
          return previousValue + currentValue;
        }
      );
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_1000
     * @tc.name testArrayReduceRightTwo010
     * @tc.desc Verify the return type matches the element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduceRight((a: number, b: number): number => a + b);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_1100
     * @tc.name testArrayReduceRightTwo011
     * @tc.desc Verify reduceRight returns the accumulated result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_1200
     * @tc.name testArrayReduceRightTwo012
     * @tc.desc Verify the last element becomes the initial accumulator when no initial value exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let firstPrev: number = -1;
      let firstCurr: number = -1;
      let firstIndex: int = -1;
      const result = arr.reduceRight((prev: number, curr: number, i: int): number => {
        if (firstIndex < 0) {
          firstPrev = prev;
          firstCurr = curr;
          firstIndex = i;
        }
        return prev + curr;
      });
      expect(firstPrev).assertEqual(3);
      expect(firstCurr).assertEqual(2);
      expect(firstIndex).assertEqual(1);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_1300
     * @tc.name testArrayReduceRightTwo013
     * @tc.desc Verify empty arrays throw without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      let thrown = false;
      try {
        arr.reduceRight((a: number, b: number): number => a + b);
      } catch (e) {
        thrown = true;
        expect(e !== null && e !== undefined).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_1400
     * @tc.name testArrayReduceRightTwo014
     * @tc.desc Verify a single-element array returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(42);
      let callbackCount = 0;
      const result = arr.reduceRight((prev: number, curr: number): number => {
        callbackCount++;
        return prev + curr;
      });
      expect(result).assertEqual(42);
      expect(callbackCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_1500
     * @tc.name testArrayReduceRightTwo015
     * @tc.desc Verify a two-element array reduces from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_1600
     * @tc.name testArrayReduceRightTwo016
     * @tc.desc Verify large arrays can be reduced from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArrayTwo(10000);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr);
      expect(result).assertEqual(49995000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_1700
     * @tc.name testArrayReduceRightTwo017
     * @tc.desc Verify reduceRight works with arrow function callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduceRight((prev: string, curr: string): string => prev + curr);
      expect(result).assertEqual('cba');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_1800
     * @tc.name testArrayReduceRightTwo018
     * @tc.desc Verify typed callback variables can be passed without using function expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const callbackfn = (prev: number, curr: number): number => prev + curr;
      const result = arr.reduceRight(callbackfn);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_1900
     * @tc.name testArrayReduceRightTwo019
     * @tc.desc Verify callbacks can use the current index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.reduceRight((prev: number, _curr: number, i: int): number => prev + i);
      expect(result).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_2000
     * @tc.name testArrayReduceRightTwo020
     * @tc.desc Verify callbacks can use the source array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduceRight(
        (prev: number, curr: number, _i: int, a: Array<number>): number => {
          expect(a.length).assertEqual(3);
          return prev + curr;
        }
      );
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_2100
     * @tc.name testArrayReduceRightTwo021
     * @tc.desc Verify callbacks can implement more complex accumulation logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.reduceRight((prev: number, curr: number, i: int): number => {
        if (i % 2 === 0) {
          return prev + curr;
        }
        return prev - curr;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_2200
     * @tc.name testArrayReduceRightTwo022
     * @tc.desc Verify reduceRight can accumulate object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new ReduceRightTwoItem024();
      item1.value = 1;
      const item2 = new ReduceRightTwoItem024();
      item2.value = 2;
      const item3 = new ReduceRightTwoItem024();
      item3.value = 3;
      const arr = new Array<ReduceRightTwoItem024>(item1, item2, item3);
      const result = arr.reduceRight(
        (prev: ReduceRightTwoItem024, curr: ReduceRightTwoItem024): ReduceRightTwoItem024 => {
          const newItem = new ReduceRightTwoItem024();
          newItem.value = prev.value + curr.value;
          return newItem;
        }
      );
      expect(result.value).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_2300
     * @tc.name testArrayReduceRightTwo023
     * @tc.desc Verify compatible string reductions can represent transformed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('1', '2', '3');
      const result = arr.reduceRight((prev: string, curr: string): string => `${prev},${curr}`);
      expect(result).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_2400
     * @tc.name testArrayReduceRightTwo024
     * @tc.desc Verify reduceRight and reduce traverse string arrays in opposite directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const r1 = arr.reduceRight((prev: string, curr: string): string => prev + curr);
      const r2 = arr.reduce((prev: string, curr: string): string => prev + curr);
      expect(r1).assertEqual('cba');
      expect(r2).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_2500
     * @tc.name testArrayReduceRightTwo025
     * @tc.desc Verify noncommutative operations expose order differences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const r1 = arr.reduceRight((prev: number, curr: number): number => prev - curr);
      const r2 = arr.reduce((prev: number, curr: number): number => prev - curr);
      expect(r1).assertEqual(0);
      expect(r2).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_2600
     * @tc.name testArrayReduceRightTwo026
     * @tc.desc Verify commutative additions give equal results for reduce and reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const r1 = arr.reduceRight((a: number, b: number): number => a + b);
      const r2 = arr.reduce((a: number, b: number): number => a + b);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_2700
     * @tc.name testArrayReduceRightTwo027
     * @tc.desc Verify reduceRight does not modify the original array by itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const originalStr = arr.toString();
      arr.reduceRight((a: number, b: number): number => a + b);
      expect(arr.toString()).assertEqual(originalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_2800
     * @tc.name testArrayReduceRightTwo028
     * @tc.desc Verify callback mutations can change the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduceRight(
        (prev: number, curr: number, _i: int, a: Array<number>): number => {
          a.pushOne(999);
          return prev + curr;
        }
      );
      expect(result).assertEqual(6);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_2900
     * @tc.name testArrayReduceRightTwo029
     * @tc.desc Verify the returned value remains stable after later source mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr);
      arr.pushOne(999);
      expect(result).assertEqual(6);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_3000
     * @tc.name testArrayReduceRightTwo030
     * @tc.desc Verify exceptions thrown by the callback propagate to the caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let thrown = false;
      try {
        arr.reduceRight((a: number, b: number): number => {
          if (b === 2) {
            throw new Error('Test error');
          }
          return a + b;
        });
        expect().assertFail();
      } catch (e) {
        thrown = e.name === 'Error' && e.message === 'Test error';
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_3100
     * @tc.name testArrayReduceRightTwo031
     * @tc.desc Verify reduceRight supports reverse cumulative subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.reduceRight((prev: number, curr: number): number => prev - curr);
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_3200
     * @tc.name testArrayReduceRightTwo032
     * @tc.desc Verify reduceRight can concatenate strings in reverse-facing scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', 'world', '!');
      const result = arr.reduceRight((prev: string, curr: string): string => `${prev} ${curr}`);
      expect(result).assertEqual('! world hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_3300
     * @tc.name testArrayReduceRightTwo033
     * @tc.desc Verify reduceRight can evaluate right-associative exponent expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.reduceRight((prev: number, curr: number): number => Math.pow(curr, prev));
      expect(result).assertEqual(Math.pow(2, Math.pow(3, 4)));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_3400
     * @tc.name testArrayReduceRightTwo034
     * @tc.desc Verify reduceRight can search from right to left without an explicit initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const visited = new Array<string>();
      const result = arr.reduceRight((found: number, curr: number): number => {
        visited.pushOne(curr.toString() + ':' + found.toString());
        if (found > 3) {
          return found;
        }
        return curr > 3 ? curr : found;
      });
      expect(result).assertEqual(5);
      expect(visited.toString()).assertEqual('4:5,3:5,2:5,1:5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_3500
     * @tc.name testArrayReduceRightTwo035
     * @tc.desc Verify large arrays support reduceRight efficiently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArrayTwo(10000);
      const start = Date.now();
      const result = arr.reduceRight((a: number, b: number): number => a + b);
      const end = Date.now();
      expect(result).assertEqual(49995000);
      expect(end >= start).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_3600
     * @tc.name testArrayReduceRightTwo036
     * @tc.desc Verify callback complexity still produces a valid positive result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArrayTwo(1000);
      const result = arr.reduceRight((prev: number, curr: number): number => {
        let sum = 0;
        for (let j: int = 0; j < 10; j++) {
          sum += curr;
        }
        return prev + sum;
      });
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_3700
     * @tc.name testArrayReduceRightTwo037
     * @tc.desc Verify no-initial and initial-value overloads use different starting accumulators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const r1 = arr.reduceRight((a: number, b: number): number => a + b);
      const r2 = arr.reduceRight((a: number, b: number): number => a + b, 10);
      expect(r1).assertEqual(6);
      expect(r2).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_3800
     * @tc.name testArrayReduceRightTwo038
     * @tc.desc Verify empty-array behavior differs between overloads with and without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      let thrown = false;
      try {
        arr.reduceRight((a: number, b: number): number => a + b);
      } catch (e) {
        thrown = true;
        expect(e !== null && e !== undefined).assertTrue();
      }
      const r2 = arr.reduceRight((a: number, b: number): number => a + b, 10);
      expect(thrown).assertTrue();
      expect(r2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_3900
     * @tc.name testArrayReduceRightTwo039
     * @tc.desc Verify callback parameter types can be inferred for string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduceRight((prev: string, curr: string): string => {
        expect(typeof prev).assertEqual('string');
        expect(typeof curr).assertEqual('string');
        return prev + curr;
      });
      expect(result).assertEqual('cba');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_4000
     * @tc.name testArrayReduceRightTwo040
     * @tc.desc Verify callback return values stay compatible with the element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduceRight((prev: number, curr: number): number => {
        expect(typeof prev).assertEqual('number');
        expect(typeof curr).assertEqual('number');
        return prev + curr;
      });
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_4100
     * @tc.name testArrayReduceRightTwo041
     * @tc.desc Verify reduceRight can reverse-join string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      const reversed = arr.reduceRight((prev: string, curr: string): string => prev + curr);
      expect(reversed).assertEqual('dcba');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_4200
     * @tc.name testArrayReduceRightTwo042
     * @tc.desc Verify reduceRight can perform conditional accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      const result = arr.reduceRight((prev: number, curr: number): number => {
        if (curr % 2 === 0) {
          return prev + curr;
        }
        return prev;
      });
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_4300
     * @tc.name testArrayReduceRightTwo043
     * @tc.desc Verify reduceRight can accumulate object properties across object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data1 = new ReduceRightTwoData043();
      data1.sum = 1;
      data1.count = 1;
      const data2 = new ReduceRightTwoData043();
      data2.sum = 2;
      data2.count = 1;
      const data3 = new ReduceRightTwoData043();
      data3.sum = 3;
      data3.count = 1;
      const arr = new Array<ReduceRightTwoData043>(data1, data2, data3);
      const result = arr.reduceRight(
        (prev: ReduceRightTwoData043, curr: ReduceRightTwoData043): ReduceRightTwoData043 => {
          const merged = new ReduceRightTwoData043();
          merged.sum = prev.sum + curr.sum;
          merged.count = prev.count + curr.count;
          return merged;
        }
      );
      expect(result.sum).assertEqual(6);
      expect(result.count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_4400
     * @tc.name testArrayReduceRightTwo044
     * @tc.desc Verify reduceRight can flatten nested arrays without an explicit initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<number>(1, 2, 3);
      const nested = new Array<Array<number>>(inner, inner);
      const result = nested.reduceRight(
        (prev: Array<number>, curr: Array<number>): Array<number> => curr.concat(prev)
      );
      expect(result.length).assertEqual(6);
      expect(result.toString()).assertEqual('1,2,3,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_4500
     * @tc.name testArrayReduceRightTwo045
     * @tc.desc Verify reduceRight matches reverse plus reduce for addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const r1 = arr.reduceRight((a: number, b: number): number => a + b);
      const r2 = arr.toReversed().reduce((a: number, b: number): number => a + b);
      expect(r1).assertEqual(6);
      expect(r2).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_4600
     * @tc.name testArrayReduceRightTwo046
     * @tc.desc Verify reduceRight and reversed-plus-reduce produce equal sums on large arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = createLargeNumberArrayTwo(1000);
      const arr2 = createLargeNumberArrayTwo(1000);
      const start1 = Date.now();
      const r1 = arr1.reduceRight((a: number, b: number): number => a + b);
      const end1 = Date.now();
      const start2 = Date.now();
      const r2 = arr2.toReversed().reduce((a: number, b: number): number => a + b);
      const end2 = Date.now();
      expect(r1).assertEqual(r2);
      expect(end1 >= start1).assertTrue();
      expect(end2 >= start2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_4700
     * @tc.name testArrayReduceRightTwo047
     * @tc.desc Verify callback indices decrease from length minus two to zero without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const indices = new Array<int>();
      arr.reduceRight((prev: number, curr: number, i: int): number => {
        indices.pushOne(i);
        return prev + curr;
      });
      expect(indices.toString()).assertEqual('1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_4800
     * @tc.name testArrayReduceRightTwo048
     * @tc.desc Verify current values are processed from right to left after the initial accumulator element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const processed = new Array<number>();
      arr.reduceRight((prev: number, curr: number): number => {
        processed.pushOne(curr);
        return prev + curr;
      });
      expect(processed.toString()).assertEqual('2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_4900
     * @tc.name testArrayReduceRightTwo049
     * @tc.desc Verify string reduceRight callbacks concatenate elements from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('1', '2', '3');
      const result = arr.reduceRight((prev: string, curr: string): string => prev + curr);
      expect(result).assertEqual('321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_5000
     * @tc.name testArrayReduceRightTwo050
     * @tc.desc Verify reduceRight can concatenate numeric triple 2, 3, 4 from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.reduceRight((acc: number, value: number): number => acc * 10 + value);
      expect(result).assertEqual(432);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_5100
     * @tc.name testArrayReduceRightTwo051
     * @tc.desc Verify reduceRight sums a number array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_5200
     * @tc.name testArrayReduceRightTwo052
     * @tc.desc Verify reduceRight concatenates string values in right-to-left order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduceRight((acc: string, cur: string): string => acc + cur);
      expect(result).assertEqual("cba");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_5300
     * @tc.name testArrayReduceRightTwo053
     * @tc.desc Verify reduceRight exposes the source array to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7);
      let same = false;
      arr.reduceRight((acc: number, cur: number, index: int, source: Array<number>): number => {
        same = source === arr;
        return acc + cur;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_5400
     * @tc.name testArrayReduceRightTwo054
     * @tc.desc Verify reduceRight records traversal indexes in callback order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      let text = '';
      arr.reduceRight((acc: number, cur: number, index: int): number => {
        text += index.toString();
        return acc + cur;
      });
      expect(text).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_5500
     * @tc.name testArrayReduceRightTwo055
     * @tc.desc Verify reduceRight multiplies numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.reduceRight((acc: number, cur: number): number => acc * cur);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_5600
     * @tc.name testArrayReduceRightTwo056
     * @tc.desc Verify reduceRight can accumulate into an object map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduceRight((acc: ReduceRightTwoIndexMap, cur: string, index: int): ReduceRightTwoIndexMap => {
        if (cur === 'a') {
          acc.a = index;
        } else if (cur === 'b') {
          acc.b = index;
        } else {
          acc.c = index;
        }
        return acc;
      }, new ReduceRightTwoIndexMap());
      expect(result.a).assertEqual(0);
      expect(result.c).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_5700
     * @tc.name testArrayReduceRightTwo057
     * @tc.desc Verify reduceRight reads nested array groups from the last group to the first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const groups = new Array<Array<string>>(
        new Array<string>('oh', 'xts'),
        Array.create<string>(1, 'ark'),
        new Array<string>('ts', 'array')
      );
      const result = groups.reduceRight((acc: string, group: Array<string>, index: int): string => {
        const part = index.toString() + ':' + group.join('-');
        return acc.length === 0 ? part : acc + '|' + part;
      }, '');
      expect(result).assertEqual('2:ts-array|1:ark|0:oh-xts');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_5800
     * @tc.name testArrayReduceRightTwo058
     * @tc.desc Verify reduceRight works on a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 9);
      let calls = 0;
      const result = arr.reduceRight((acc: number, cur: number): number => {
        calls++;
        return acc + cur;
      });
      expect(result).assertEqual(9);
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_5900
     * @tc.name testArrayReduceRightTwo059
     * @tc.desc Verify reduceRight handles duplicate numbers without collapsing iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_6000
     * @tc.name testArrayReduceRightTwo060
     * @tc.desc Verify reduceRight handles negative values and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-2, 0, 5);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_6100
     * @tc.name testArrayReduceRightTwo061
     * @tc.desc Verify reduceRight can encode boolean values in right-to-left order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, false);
      let indexes = '';
      const result = arr.reduceRight((acc: string, cur: boolean, index: int): string => {
        indexes += index.toString();
        return acc + (cur ? 'T' : 'F');
      }, '');
      expect(result).assertEqual('FTFT');
      expect(indexes).assertEqual('3210');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_6200
     * @tc.name testArrayReduceRightTwo062
     * @tc.desc Verify reduceRight keeps the initial string before indexed numeric fragments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      const result = arr.reduceRight((acc: string, cur: number, index: int): string => {
        return acc + '[' + index.toString() + '=' + cur.toString() + ']';
      }, 'seed');
      expect(result).assertEqual('seed[2=6][1=5][0=4]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_6300
     * @tc.name testArrayReduceRightTwo063
     * @tc.desc Verify reduceRight can read arrays produced by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).slice(1, 4);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_6400
     * @tc.name testArrayReduceRightTwo064
     * @tc.desc Verify reduceRight can read arrays produced by filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value >= 3);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_6500
     * @tc.name testArrayReduceRightTwo065
     * @tc.desc Verify reduceRight can read arrays produced by concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4));
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_6600
     * @tc.name testArrayReduceRightTwo066
     * @tc.desc Verify reduceRight receives the toReversed copy as the callback source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      const arr = source.toReversed();
      let callbackSource = false;
      const result = arr.reduceRight((acc: string, cur: number, index: int, array: Array<number>): string => {
        if (index === 1) {
          callbackSource = array === arr;
        }
        return acc + cur.toString();
      }, '');
      expect(result).assertEqual('123');
      expect(callbackSource).assertTrue();
      expect(source.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_6700
     * @tc.name testArrayReduceRightTwo067
     * @tc.desc Verify reduceRight can read arrays produced by with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).with(1, 9);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_6800
     * @tc.name testArrayReduceRightTwo068
     * @tc.desc Verify reduceRight can read arrays produced by toSpliced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toSpliced(1, 1, 7, 8);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_6900
     * @tc.name testArrayReduceRightTwo069
     * @tc.desc Verify reduceRight without an initial value starts from the reversed array tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      let indexes = '';
      const result = arr.reduceRight((acc: number, cur: number, index: int): number => {
        indexes += index.toString();
        return acc * 10 + cur;
      });
      expect(result).assertEqual(123);
      expect(indexes).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_7000
     * @tc.name testArrayReduceRightTwo070
     * @tc.desc Verify reduceRight visits a sorted array from the last sorted index to the first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return 1;
        }
        if (left > right) {
          return -1;
        }
        return 0;
      });
      const result = arr.reduceRight((acc: string, cur: number, index: int): string => {
        return acc + index.toString() + ':' + cur.toString() + ';';
      }, '');
      expect(result).assertEqual('2:1;1:2;0:3;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_7100
     * @tc.name testArrayReduceRightTwo071
     * @tc.desc Verify reduceRight can read arrays after shift changes the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shift();
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_7200
     * @tc.name testArrayReduceRightTwo072
     * @tc.desc Verify reduceRight can read arrays after pop changes the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.pop();
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_7300
     * @tc.name testArrayReduceRightTwo073
     * @tc.desc Verify reduceRight can read arrays after unshift prepends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      arr.unshift(1, 2);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_7400
     * @tc.name testArrayReduceRightTwo074
     * @tc.desc Verify reduceRight can read arrays after push appends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.push(3, 4);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_7500
     * @tc.name testArrayReduceRightTwo075
     * @tc.desc Verify reduceRight can read arrays after splice replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.splice(1, 1, 8, 9);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_7600
     * @tc.name testArrayReduceRightTwo076
     * @tc.desc Verify reduceRight can read arrays after shrinkTo truncates the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_7700
     * @tc.name testArrayReduceRightTwo077
     * @tc.desc Verify reduceRight can read arrays rebuilt after clearing length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(7);
      arr.pushOne(8);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_7800
     * @tc.name testArrayReduceRightTwo078
     * @tc.desc Verify reduceRight can read arrays created by Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(4, 5, 6);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_7900
     * @tc.name testArrayReduceRightTwo079
     * @tc.desc Verify reduceRight can read arrays created by Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Array<number>(2, 4, 6));
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_8000
     * @tc.name testArrayReduceRightTwo080
     * @tc.desc Verify reduceRight can count callback calls on a large generated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 0; i < 15; i++) {
        arr.pushOne(i);
      }
      let calls = 0;
      arr.reduceRight((acc: number, cur: number): number => {
        calls++;
        return acc + cur;
      });
      expect(calls).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_8100
     * @tc.name testArrayReduceRightTwo081
     * @tc.desc Verify reduceRight preserves the source array text after accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      const before = arr.toString();
      arr.reduceRight((acc: number, cur: number): number => acc + cur);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_8200
     * @tc.name testArrayReduceRightTwo082
     * @tc.desc Verify reduceRight can keep the rightmost matching index while still visiting every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      let visited = '';
      const result = arr.reduceRight((acc: number, cur: number, index: int): number => {
        visited += cur.toString();
        if (acc >= 0) {
          return acc;
        }
        return cur % 2 === 0 ? index : acc;
      }, -1);
      expect(result).assertEqual(5);
      expect(visited).assertEqual('654321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_8300
     * @tc.name testArrayReduceRightTwo083
     * @tc.desc Verify reduceRight can encode numeric signs from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-2, 0, 3, -4);
      const result = arr.reduceRight((acc: string, cur: number): string => {
        const sign = cur < 0 ? 'N' : cur === 0 ? 'Z' : 'P';
        return acc + sign + Math.abs(cur).toString();
      }, '');
      expect(result).assertEqual('N4P3Z0N2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_8400
     * @tc.name testArrayReduceRightTwo084
     * @tc.desc Verify reduceRight without an initial value uses the tail of a toSorted copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(4, 1, 3, 2);
      const arr = source.toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      let indexes = '';
      const result = arr.reduceRight((acc: number, cur: number, index: int): number => {
        indexes += index.toString();
        return acc * 10 + cur;
      });
      expect(result).assertEqual(4321);
      expect(indexes).assertEqual('210');
      expect(source.toString()).assertEqual('4,1,3,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_8500
     * @tc.name testArrayReduceRightTwo085
     * @tc.desc Verify reduceRight receives the sliced copy and its local indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(9, 8, 7, 6);
      const arr = source.slice(1, 3);
      let callbackSource = true;
      const result = arr.reduceRight((acc: string, cur: number, index: int, array: Array<number>): string => {
        callbackSource = callbackSource && array === arr;
        const part = index.toString() + ':' + cur.toString();
        return acc.length === 0 ? part : acc + '|' + part;
      }, '');
      expect(result).assertEqual('1:7|0:8');
      expect(callbackSource).assertTrue();
      expect(source.toString()).assertEqual('9,8,7,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_8600
     * @tc.name testArrayReduceRightTwo086
     * @tc.desc Verify reduceRight can append characters with their original indexes from Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<string>('code');
      const result = arr.reduceRight((acc: string, cur: string, index: int): string => {
        return acc + cur + index.toString();
      }, '');
      expect(result).assertEqual('e3d2o1c0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_8700
     * @tc.name testArrayReduceRightTwo087
     * @tc.desc Verify reduceRight can weight values from a concat plus with pipeline by source index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4)).with(2, 8);
      let text = '';
      const result = arr.reduceRight((acc: number, cur: number, index: int, source: Array<number>): number => {
        text += index.toString() + ':' + source[index].toString() + ';';
        return acc + cur * (index + 1);
      }, 0);
      expect(text).assertEqual('3:4;2:8;1:2;0:1;');
      expect(result).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_8800
     * @tc.name testArrayReduceRightTwo088
     * @tc.desc Verify reduceRight with initial value works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(reduceRightAnyNumberArrayTwo(anyValue)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_TWO_8900
     * @tc.name testArrayReduceRightTwo089
     * @tc.desc Verify reduceRight with initial value supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>('a', 'b', 'c');
      const result = anyArr.reduceRight((acc: int, _cur: Any): int => acc + 1, 0);
      expect(result).assertEqual(3);
    });

  });
}

