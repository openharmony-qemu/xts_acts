/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  affordableInStock1,
  agedUsers3,
  arrayLike,
  data1,
  items,
  largeArr,
  mapped,
  products,
  testFn,
  testFn2,
  testFn3,
  testFn4,
  testFn5,
  testFn7,
  testFn9,
  totalSum,
  users,
  users2,
  users3,
  users5
} from './looper1';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function looper1Test() {
  describe('looper1Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPERR_100
     * @tc.name: testLoop001
     * @tc.desc: Test the difference in iteration behavior between for...in and for...of loops on arrays; verify that for...in iterates over array indices and custom properties, while for...of only iterates over array element values
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fruitArray = ['Apple', 'Banana', 'Cherry'];

      const forInResults: string[] = [];
      for (let key of fruitArray) {
        forInResults.push(`Key: ${key}, Value: ${fruitArray[key]}`);
      }
      const forOfResults: string[] = [];
      for (const value of fruitArray) {
        forOfResults.push(`Element Value: ${value}`);
      }
      expect(forInResults.toString())
        .assertEqual("Key: Apple, Value: undefined,Key: Banana, Value: undefined,Key: Cherry, Value: undefined");
      expect(forOfResults.toString()).assertEqual("Element Value: Apple,Element Value: Banana,Element Value: Cherry");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_0100
     * @tc.name: testForLoopSum
     * @tc.desc: Test that traditional for loop correctly sums all elements in a number array
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testForLoopSum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nums = [1, 2, 3, 4, 5];
      let sum = 0;
      for (let i = 0; i < nums.length; i++) {
        sum += nums[i];
      }
      expect(sum).assertEqual(15);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_0200
     * @tc.name: testForLoopReverseTraversal
     * @tc.desc: Test that traditional for loop traverses array in reverse order correctly
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testForLoopReverseTraversal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['a', 'b', 'c'];
      const reversed: string[] = [];
      for (let i = arr.length - 1; i >= 0; i--) {
        reversed.push(arr[i]);
      }
      expect(reversed.toString()).assertEqual("c,b,a");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_0300
     * @tc.name: testForLoopStepSize
     * @tc.desc: Test that traditional for loop works with step size 2 to traverse array
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testForLoopStepSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nums = [10, 20, 30, 40, 50];
      const result: number[] = [];
      for (let i = 0; i < nums.length; i += 2) {
        result.push(nums[i]);
      }
      expect(result.toString()).assertEqual("10,30,50");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_0400
     * @tc.name: testForLoopEmptyArray
     * @tc.desc: Test that traditional for loop does not execute when array is empty
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testForLoopEmptyArray', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const emptyArr: number[] = [];
      let executed = false;
      for (let i = 0; i < emptyArr.length; i++) {
        executed = true;
      }
      expect(executed).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_0600
     * @tc.name: testForInArrayCustomProps
     * @tc.desc: Test that for...in loop iterates array indices and custom enumerable properties
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForInArrayCustomProps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = [1, 2, 3];
      const keys: string[] = [];
      for (let key of arr) {
        keys.push(key.toString());
      }
      expect(keys.toString()).assertEqual("1,2,3");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_0700
     * @tc.name: testForOfString
     * @tc.desc: Test that for...of loop iterates each character of a string correctly
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testForOfString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = 'hello';
      const chars: string[] = [];
      for (const char of str) {
        chars.push(char);
      }
      expect(chars.toString()).assertEqual("h,e,l,l,o");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_0800
     * @tc.name: testForOfMap
     * @tc.desc: Test that for...of loop iterates [key, value] pairs of a Map correctly
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForOfMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const map = new Map([['a', 1], ['b', 2]]);
      const entries = new Array<string | number>();
      for (let entry of map) {
        for (let en of entry) {
          entries.push(en.valueOf())
        }
      }
      expect(entries.toString()).assertEqual("a,1,b,2");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_0900
     * @tc.name: testForOfSet
     * @tc.desc: Test that for...of loop iterates unique values of a Set correctly
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForOfSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const set = new Set([1, 2, 2, 3]);
      const values: number[] = [];
      for (const val of set) {
        values.push(val);
      }
      expect(values.toString()).assertEqual("1,2,3");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_1000
     * @tc.name: testForEachModifyArray
     * @tc.desc: Test that Array.forEach modifies original array elements correctly
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testForEachModifyArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nums = [1, 2, 3];
      nums.forEach((val, idx, arr) => arr[idx] = val * 2);
      expect(nums.toString()).assertEqual("2,4,6");
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_1100
     * @tc.name: testMapReturnNewArray
     * @tc.desc: Test that Array.map returns a new array without modifying the original
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testMapReturnNewArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const original = [1, 2, 3];
      const doubled = original.map(val => val * 2);
      expect(original.toString()).assertEqual("1,2,3");
      expect(doubled.toString()).assertEqual("2,4,6");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_1200
     * @tc.name: testFilterEvenNumbers
     * @tc.desc: Test that Array.filter returns an array containing only even numbers
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFilterEvenNumbers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nums = [1, 2, 3, 4, 5, 6];
      const evens = nums.filter(val => val % 2 === 0);
      expect(evens.toString()).assertEqual("2,4,6");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_1300
     * @tc.name: testReduceMultiplyAll
     * @tc.desc: Test that Array.reduce calculates the product of all elements in the array
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testReduceMultiplyAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nums = [2, 3, 4];
      const product = nums.reduce((acc, val) => acc * val, 1);
      expect(product).assertEqual(24);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_1400
     * @tc.name: testSomeHasNegative
     * @tc.desc: Test that Array.some returns true if any element in the array is negative
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSomeHasNegative', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nums = [1, -2, 3];
      const hasNegative = nums.some(val => val < 0);
      expect(hasNegative).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_1500
     * @tc.name: testEveryLessThanTen
     * @tc.desc: Test that Array.every returns true if all elements are less than 10
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEveryLessThanTen', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nums = [1, 5, 9];
      const allLessThanTen = nums.every(val => val < 10);
      expect(allLessThanTen).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_1600
     * @tc.name: testBreakInForLoop
     * @tc.desc: Test that break statement exits the for loop when the target condition is met
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBreakInForLoop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nums = [1, 2, 3, 4, 5];
      const result: number[] = [];
      for (let i = 0; i < nums.length; i++) {
        if (nums[i] === 3) {
          break;
        }
        result.push(nums[i]);
      }
      expect(result.toString()).assertEqual("1,2");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_1700
     * @tc.name: testContinueInForLoop
     * @tc.desc: Test that continue statement skips the current iteration in the for loop
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testContinueInForLoop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nums = [1, 2, 3, 4, 5];
      const result: number[] = [];
      for (let i = 0; i < nums.length; i++) {
        if (nums[i] % 2 === 0) {
          continue;
        }
        result.push(nums[i]);
      }
      expect(result.toString()).assertEqual("1,3,5");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_1800
     * @tc.name: testWhileLoopCountdown
     * @tc.desc: Test that while loop implements a countdown from 5 to 1 correctly
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWhileLoopCountdown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count = 5;
      const countdown: number[] = [];
      while (count > 0) {
        countdown.push(count);
        count--;
      }
      expect(countdown.toString()).assertEqual("5,4,3,2,1");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_1900
     * @tc.name: testDoWhileExecuteOnce
     * @tc.desc: Test that do...while loop executes at least once even if the initial condition is false
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testDoWhileExecuteOnce', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let x = 0;
      let execCount = 0;
      do {
        execCount++;
        x++;
      } while (x < 0);
      expect(execCount).assertEqual(1);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_2000
     * @tc.name: testForOfAsyncSequential
     * @tc.desc: Test that for...of loop executes async tasks sequentially with await
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testForOfAsyncSequential', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const nums = [1, 2, 3];
      let res = await asyncloop(nums);
      expect(res.toString()).assertEqual("1,2,3")
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_2100
     * @tc.name: testForEachSparseArray
     * @tc.desc: Test that Array.forEach skips empty slots in a sparse array
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForEachSparseArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sparseArr = [1, 4, 3];
      const visited: number[] = [];
      sparseArr.forEach(val => visited.push(val));
      expect(visited.toString()).assertEqual("1,4,3");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_2200
     * @tc.name: testForLoopSparseArray
     * @tc.desc: Test that traditional for loop iterates over empty slots in a sparse array
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForLoopSparseArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sparseArr = [1, , 3];
      const visited: (number | undefined)[] = [];
      for (let i = 0; i < sparseArr.length; i++) {
        visited.push(sparseArr[i]);
      }
      expect(visited.toString()).assertEqual("1,,3");
    })


    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_2400
     * @tc.name: testForLoopVarScopeLeak
     * @tc.desc: Test that 'var' in for loop causes variable scope leakage outside the loop
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForLoopVarScopeLeak', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result = '';
      for (let i = 0; i < 3; i++) {
        result += i;
      }
      expect(result).assertEqual('012');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_2500
     * @tc.name: testForLoopLetBlockScope
     * @tc.desc: Test that 'let' in for loop has block scope and does not leak outside
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForLoopLetBlockScope', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result = 0;
      for (let i = 0; i < 3; i++) {
        result += i;
      }
      expect(result).assertEqual(3);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_2600
     * @tc.name: testReduceGroupByType
     * @tc.desc: Test that Array.reduce groups array elements by a specified property (e.g., 'type')
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testReduceGroupByType', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const grouped = items.reduce((acc, item) => {
        if (!acc[item.type]) {
          acc[item.type] = [];
        }
        acc[item.type].push(item.name);
        return acc;
      }, {} as Record<string, string[]>);
      expect(JSON.stringify(grouped))
        .assertEqual('{"book":["JS Guide","TS Handbook"],"electronics":["Laptop","Phone"]}');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_2700
     * @tc.name: testForOfStringSurrogatePair
     * @tc.desc: Test that for...of loop correctly handles Unicode surrogate pairs in strings
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForOfStringSurrogatePair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'a𝄞b';
      const chars: string[] = [];
      for (const char of str) {
        chars.push(char);
      }
      expect(chars.toString()).assertEqual("a,𝄞,b");
      expect(chars.length).assertEqual(3);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_2800
     * @tc.name: testLabeledBreakNestedLoop
     * @tc.desc: Test that labeled 'break' exits the outer loop in nested loops
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testLabeledBreakNestedLoop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let count = 0;
      outerLoop: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          count++;
          if (i === 1 && j === 1) {
            break outerLoop;
          }
        }
      }
      expect(count).assertEqual(5);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_3000
     * @tc.name: testForEachThisArgBinding
     * @tc.desc: Test that Array.forEach uses 'thisArg' to bind 'this' in the callback function
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForEachThisArgBinding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: Array<number> = testFn();
      sleep(200);
      expect(result.toString()).assertEqual("10,20,30");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_3100
     * @tc.name: testForLoopModifyArrayLength
     * @tc.desc: Test that modifying array length during traditional for loop affects iteration
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForLoopModifyArrayLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = [1, 2, 3, 4];
      const visited: number[] = [];
      for (let i = 0; i < arr.length; i++) {
        visited.push(arr[i]);
        if (i === 1) {
          arr.length = 2;
        }
      }
      expect(visited.toString()).assertEqual("1,2");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_3200
     * @tc.name: testForEachIgnoreArrayLengthChange
     * @tc.desc: Test that Array.forEach ignores array length modification during iteration
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForEachIgnoreArrayLengthChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = [1, 2, 3, 4];
      const visited: number[] = [];
      arr.forEach(val => {
        visited.push(val);
        if (val === 2) {
          arr.length = 2;
        }
      })
      expect(visited.toString()).assertEqual("1,2");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_3300
     * @tc.name: testForOfArrayLikeObject
     * @tc.desc: Test that for...of loop works on array-like object converted by Array.from
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForOfArrayLikeObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const convertedArr = Array.from(arrayLike);
      const values: string[] = [];
      for (const val of convertedArr) {
        values.push(val.toString());
      }
      expect(values.toString()).assertEqual("foo,bar");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_3400
     * @tc.name: testReduceEmptyArrayWithInit
     * @tc.desc: Test that Array.reduce returns initial value when iterating empty array
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testReduceEmptyArrayWithInit', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr: number[] = [];
      const sum = emptyArr.reduce((acc, val) => acc + val, 0);
      expect(sum).assertEqual(0);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_3500
     * @tc.name: testReduceNoInitSingleElement
     * @tc.desc: Test that Array.reduce returns single element when no initial value and array has one item
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testReduceNoInitSingleElement', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const singleItemArr = [10];
      const result = singleItemArr.reduce((acc, val) => acc + val);
      expect(result).assertEqual(10);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_3600
     * @tc.name: testForEachAsyncNoWait
     * @tc.desc: Test that Array.forEach does not wait for async callbacks to complete
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testForEachAsyncNoWait', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const nums = [1, 2, 3];
      let results: number[] = [];
      results = await asyncLoop2(nums);
      setTimeout(() => {
        expect(results.sort((a, b) => a - b).toString()).assertEqual("1,2,3");
      }, 50);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_3700
     * @tc.name: testCustomIterableObject
     * @tc.desc: Test that for...of loop iterates custom object implementing Iterable protocol
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testCustomIterableObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let values = testFn2();
      expect(values.toString()).assertEqual("x,y,z");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_3900
     * @tc.name: testWhileLoopLinkedList
     * @tc.desc: Test that while loop traverses mock linked list until null
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testWhileLoopLinkedList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let values = testFn3();
      expect(values.toString()).assertEqual("1,2,3");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_4000
     * @tc.name: testDoWhileSumUntilTarget
     * @tc.desc: Test that do...while loop sums numbers until reaching target value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testDoWhileSumUntilTarget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sum = 0;
      let num = 1;
      const target = 15;
      do {
        sum += num;
        num++;
      } while (sum < target);

      expect(sum).assertEqual(15);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_4100
     * @tc.name: testFindFirstMatch
     * @tc.desc: Test that Array.find returns the first element matching the condition
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFindFirstMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const firstBob = users.find(user => user.name === 'Bob');
      expect(JSON.stringify(firstBob)).assertEqual('{"id":2,"name":"Bob"}');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_4200
     * @tc.name: testFindIndexNoMatch
     * @tc.desc: Test that Array.findIndex returns -1 when no element matches the condition
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFindIndexNoMatch', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nums = [2, 4, 6, 8];
      const oddIndex = nums.findIndex(num => num % 2 === 1);
      expect(oddIndex).assertEqual(-1);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_4300
     * @tc.name: testLabeledContinueNestedLoop
     * @tc.desc: Test that labeled 'continue' skips the current outer loop iteration in nested loops
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testLabeledContinueNestedLoop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string[] = [];
      outer: for (let i = 0; i < 2; i++) {
        for (let j = 0; j < 2; j++) {
          if (j === 1) {
            continue outer;
          }
          result.push(`i:${i},j:${j}`);
        }
      }
      expect(result.toString()).assertEqual('i:0,j:0,i:1,j:0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_4500
     * @tc.name: testForOfSetDuplicateRemoval
     * @tc.desc: Test that for...of loop iterates only unique values of a Set (duplicates removed)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForOfSetDuplicateRemoval', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duplicateArr = [1, 2, 2, 3, 3, 3];
      const uniqueSet = new Set(duplicateArr);
      const uniqueValues: number[] = [];
      for (const val of uniqueSet) {
        uniqueValues.push(val);
      }
      expect(uniqueValues.toString()).assertEqual("1,2,3");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_4600
     * @tc.name: testWhileLoopInfinitePrevent
     * @tc.desc: Test that while loop with max iteration limit prevents infinite loop
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testWhileLoopInfinitePrevent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let count = 0;
      const maxIter = 10;
      let condition = true;
      while (condition && count < maxIter) {
        count++;
        if (count === 5) {
          condition = false;
        }
      }
      expect(count).assertEqual(5);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_4700
     * @tc.name: testReduceFlattenNestedArray
     * @tc.desc: Test that Array.reduce flattens a 2D array into a 1D array
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testReduceFlattenNestedArray', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const nestedArr = [[1, 2], [3, 4, 5], [6]];
      const flattened = nestedArr.reduce((acc, curr) => acc.concat(curr), []);
      expect(flattened.toString()).assertEqual("1,2,3,4,5,6");
    })


    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_4900
     * @tc.name: testEveryNegativeNumbers
     * @tc.desc: Test that Array.every returns false if any element does not match "all negative" condition
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEveryNegativeNumbers', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nums = [-1, -2, 3, -4];
      const allNegative = nums.every(num => num < 0);
      expect(allNegative).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_5000
     * @tc.name: testPromiseAllParallelLoop
     * @tc.desc: Test that Promise.all runs async loop tasks in parallel and collects results
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testPromiseAllParallelLoop', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const tasks = [10, 20, 30];
      const promises = await tasks.map((task): Promise<void> => sleep(task));
      await Promise.all(promises).then(results => {
        expect(results.toString()).assertEqual(",,");
      })
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_5100
     * @tc.name: testFilterNullAndUndefined
     * @tc.desc: Test that Array.filter removes null and undefined values from array
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFilterNullAndUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const mixedArr = [1, null, 2, undefined, 3, null, 4];
      const cleaned = mixedArr.filter(val => val != null);
      expect(cleaned.toString()).assertEqual("1,2,3,4");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_5200
     * @tc.name: testForLoopVarClosureIssue
     * @tc.desc: Test that 'var' in for loop causes closure to reference final variable value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForLoopVarClosureIssue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const funcs: (() => number)[] = [];
      for (let i = 1; i <= 3; i++) {
        funcs.push(() => i);
      }
      const results = funcs.map(fn => fn());
      expect(results.toString()).assertEqual("1,2,3");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_5300
     * @tc.name: testForLoopLetClosureFix
     * @tc.desc: Test that 'let' in for loop fixes closure issue (each iteration has unique variable)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForLoopLetClosureFix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const funcs: (() => number)[] = [];
      for (let i = 1; i <= 3; i++) {
        funcs.push(() => i);
      }
      const results = funcs.map(fn => fn());
      expect(results.toString()).assertEqual("1,2,3");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_5400
     * @tc.name: testIteratorReturnMethod
     * @tc.desc: Test that iterator's 'return' method is called when for...of loop is broken
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testIteratorReturnMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let isReturnCalled = testFn4();
      expect(isReturnCalled).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_5500
     * @tc.name: testSomeWithEmptyArray
     * @tc.desc: Test that Array.some returns false when called on empty array
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSomeWithEmptyArray', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr: number[] = [];
      const hasMatch = emptyArr.some(val => val > 0);
      expect(hasMatch).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_5600
     * @tc.name: testEveryWithEmptyArray
     * @tc.desc: Test that Array.every returns true when called on empty array (vacuous truth)
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEveryWithEmptyArray', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr: number[] = [];
      const allMatch = emptyArr.every(val => val > 0);
      expect(allMatch).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_5700
     * @tc.name: testForOfArgumentsObject
     * @tc.desc: Test that for...of loop iterates over arguments object (array-like)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForOfArgumentsObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = collectArgs(1, 'a', true);
      expect(result.toString()).assertEqual("1,a,true");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_5800
     * @tc.name: testMapWithUndefinedReturn
     * @tc.desc: Test that Array.map retains undefined values when callback returns nothing
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testMapWithUndefinedReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(mapped.toString()).assertEqual(",4,");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_5900
     * @tc.name: testWhileLoopDynamicCondition
     * @tc.desc: Test that while loop responds to dynamically changing condition
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWhileLoopDynamicCondition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count = 0;
      let target = 5;
      const values: number[] = [];
      while (count < target) {
        values.push(count);
        count++;
        if (count === 3) {
          target = 6;
        }
      }
      expect(values.toString()).assertEqual("0,1,2,3,4,5");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_6000
     * @tc.name: testReduceCalculateAverage
     * @tc.desc: Test that Array.reduce calculates average of number array (handles empty array)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testReduceCalculateAverage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const calcAverage = (nums: number[]) => {
        if (nums.length === 0) {
          return 0;
        }
        const sum = nums.reduce((acc, val) => acc + val, 0);
        return sum / nums.length;
      };
      expect(calcAverage([2, 4, 6, 8])).assertEqual(5);
      expect(calcAverage([])).assertEqual(0);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_6100
     * @tc.name: testForEachCallbackParams
     * @tc.desc: Test that Array.forEach callback receives (value, index, array) params correctly
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testForEachCallbackParams', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['x', 'y', 'z'];
      const log: string[] = [];
      arr.forEach((val, idx, currArr) => {
        log.push(`val:${val}, idx:${idx}, arrLen:${currArr.length}`);
      })
      expect(JSON.stringify(log))
        .assertEqual("[\"val:x, idx:0, arrLen:3\",\"val:y, idx:1, arrLen:3\",\"val:z, idx:2, arrLen:3\"]");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_6200
     * @tc.name: testForLoopNestedMatrixSum
     * @tc.desc: Test that nested for loops calculate sum of all elements in 2D matrix
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForLoopNestedMatrixSum', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const matrix = [
        [1, 2, 3],
        [4, 5],
        [6, 7, 8, 9]
      ];
      let total = 0;
      for (let i = 0; i < matrix.length; i++) {
        for (let j = 0; j < matrix[i].length; j++) {
          total += matrix[i][j];
        }
      }
      expect(total).assertEqual(45);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_6400
     * @tc.name: testMapWithObjectElements
     * @tc.desc: Test that Array.map modifies object elements (reference type) in array
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testMapWithObjectElements', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const agedUsers = users2.map(user => {
        user.age += 5;
        return user;
      })
      expect(JSON.stringify(agedUsers)).assertEqual('[{"name":"Alice","age":30},{"name":"Bob","age":35}]');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_6500
     * @tc.name: testFilterWithObjectCondition
     * @tc.desc: Test that Array.filter selects objects matching property condition
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFilterWithObjectCondition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const affordable = products.filter(prod => prod.price < 100);
      expect(JSON.stringify(affordable)).assertEqual('[{"name":"Mouse","price":25},{"name":"Keyboard","price":50}]');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_6600
     * @tc.name: testDoWhileLoopWithDynamicValue
     * @tc.desc: Test that do...while loop uses dynamically updated value in condition
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testDoWhileLoopWithDynamicValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value = 1;
      let multiplier = 2;
      const results: number[] = [];
      do {
        results.push(value);
        value *= multiplier;
        if (results.length === 1) {
          multiplier = 3;
        }
      } while (value < 20);
      expect(results.toString()).assertEqual("1,2,6,18");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_6700
     * @tc.name: testForInArrayNonEnumerableProp
     * @tc.desc: Test that for...in loop skips non-enumerable properties added to array
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testForInArrayNonEnumerableProp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let keys = testFn5();
      expect(keys.toString()).assertEqual("0,1");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_6800
     * @tc.name: testReduceBuildString
     * @tc.desc: Test that Array.reduce builds a concatenated string from array elements
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testReduceBuildString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const words = ['Hello', ' ', 'World', '!'];
      const sentence = words.reduce((acc, curr) => acc + curr, '');
      expect(sentence).assertEqual('Hello World!');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_6900
     * @tc.name: testForLoopWithNegativeStep
     * @tc.desc: Test that traditional for loop traverses array with negative step (reverse)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testForLoopWithNegativeStep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const reversed: number[] = [];
      for (let i = arr.length - 1; i >= 0; i -= 2) {
        reversed.push(arr[i]);
      }
      expect(reversed.toString()).assertEqual("5,3,1");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_7000
     * @tc.name: testForOfStringEmoji
     * @tc.desc: Test that for...of loop correctly iterates string with multi-code-unit emojis
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForOfStringEmoji', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = '👋🌍✨';
      const chars: string[] = [];
      for (const char of str) {
        chars.push(char);
      }
      expect(chars.toString()).assertEqual('👋,🌍,✨');
      expect(chars.length).assertEqual(3);
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_7100
     * @tc.name: testFindWithFalsyValues
     * @tc.desc: Test that Array.find correctly returns falsy matching elements (0, '', false)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testFindWithFalsyValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const mixedArr = [1, 0, 2, '', 3, false, 4];
      const findZero = mixedArr.find(val => val === 0);
      const findEmptyStr = mixedArr.find(val => val === '');
      const findFalse = mixedArr.find(val => val === false);
      expect(findZero).assertEqual(0);
      expect(findEmptyStr).assertEqual('');
      expect(findFalse).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_7200
     * @tc.name: testForLoopAvoidLengthRecalculation
     * @tc.desc: Test that caching array length in for loop improves efficiency (avoids repeated length lookup)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForLoopAvoidLengthRecalculation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sum = 0;
      const arrLength = largeArr.length;
      for (let i = 0; i < arrLength; i++) {
        sum += largeArr[i];
      }
      expect(sum).assertEqual(499500);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_7400
     * @tc.name: testFilterWithRegExp
     * @tc.desc: Test that Array.filter uses regular expression to match string elements
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testFilterWithRegExp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const strings = ['apple', 'banana', 'apricot', 'orange', 'pineapple'];
      const regExp = /^ap/;
      const matched = strings.filter(str => regExp.test(str));
      expect(JSON.stringify(matched)).assertEqual('["apple","apricot"]');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_7600
     * @tc.name: testReduceCountElementOccurrences
     * @tc.desc: Test that Array.reduce counts occurrences of each element in array
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testReduceCountElementOccurrences', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fruits = ['apple', 'banana', 'apple', 'orange', 'banana', 'apple'];
      const countMap = fruits.reduce((acc, fruit) => {
        acc[fruit] = (acc[fruit] || 0) + 1;
        return acc;
      }, {} as Record<string, number>);
      expect(JSON.stringify(countMap)).assertEqual('{"apple":3,"banana":2,"orange":1}');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_7800
     * @tc.name: testForOfMapKeysAndValues
     * @tc.desc: Test that for...of loop iterates Map keys (via keys()) and values (via values())
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForOfMapKeysAndValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const map = new Map([['a', 1], ['b', 2], ['c', 3]]);
      const keys: string[] = [];
      const values: number[] = [];
      for (const key of map.keys()) {
        keys.push(key);
      }
      for (const val of map.values()) {
        values.push(val);
      }
      expect(keys.toString()).assertEqual('a,b,c');
      expect(values.toString()).assertEqual('1,2,3');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_7900
     * @tc.name: testMapWithNestedObjects
     * @tc.desc: Test that Array.map creates new nested objects (avoids reference sharing)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testMapWithNestedObjects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(agedUsers3[0].details.age).assertEqual(30);
      expect(users3[0].details.age).assertEqual(25);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_8000
     * @tc.name: testDoWhileLoopErrorRecovery
     * @tc.desc: Test that do...while loop recovers from error in iteration (continues execution)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testDoWhileLoopErrorRecovery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let count = 0;
      const maxCount = 3;
      const results: number[] = [];
      do {
        try {
          count++;
          if (count === 2) {
            throw new Error('Temporary error');
          }
          results.push(count);
        } catch (e) {
        }
      } while (count < maxCount);
      expect(results.toString()).assertEqual('1,3');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_8100
     * @tc.name: testSomeWithFalsyCondition
     * @tc.desc: Test that Array.some returns true for falsy element matching "is falsy" condition
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSomeWithFalsyCondition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = [1, 2, 0, 3];
      const hasFalsy = arr.some(val => !val);
      expect(hasFalsy).assertEqual(true);
      const allTruthy = [1, 'a', true];
      const noFalsy = allTruthy.some(val => !val);
      expect(noFalsy).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_8200
     * @tc.name: testForLoopMultiCondition
     * @tc.desc: Test that traditional for loop works with multiple conditions in loop header
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForLoopMultiCondition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = [1, 2, 3, 4, 5, 6, 7];
      const result: number[] = [];
      for (let i = 0; i < arr.length && arr[i] < 5; i++) {
        result.push(arr[i]);
      }
      expect(result.toString()).assertEqual("1,2,3,4");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_8300
     * @tc.name: testCustomIterableWithLimit
     * @tc.desc: Test that custom iterable object stops iteration after specified limit
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testCustomIterableWithLimit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let values = testFn7()
      expect(values.toString()).assertEqual('1,2,3');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_8400
     * @tc.name: testReduceWithNestedArrays
     * @tc.desc: Test that Array.reduce processes nested arrays (sum all elements in 3D array)
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testReduceWithNestedArrays', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      expect(totalSum).assertEqual(12);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_8600
     * @tc.name: testWhileLoopResourceCleanup
     * @tc.desc: Test that while loop executes cleanup logic after loop termination
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testWhileLoopResourceCleanup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isCleaned = false;
      let count = 0;
      const maxCount = 2;
      try {
        while (count < maxCount) {
          count++;
          if (count === maxCount) {
            throw new Error('Terminate loop');
          }
        }
      } catch (e) {
        isCleaned = true;
      }
      expect(count).assertEqual(2);
      expect(isCleaned).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_8700
     * @tc.name: testMapPreserveArrayLength
     * @tc.desc: Test that Array.map returns new array with same length as original (even with undefined)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testMapPreserveArrayLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = [1, 2, 3, 4];
      const mapped = original.map(val => val % 2 === 1 ? val * 2 : undefined);
      expect(mapped.length).assertEqual(original.length);
      expect(mapped.toString()).assertEqual('2,,6,');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_8800
     * @tc.name: testForOfSetOrder
     * @tc.desc: Test that for...of loop iterates Set elements in insertion order
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForOfSetOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const set = new Set<string>();
      set.add('first');
      set.add('second');
      set.add('third');
      set.add('second');
      const order: string[] = [];
      for (const val of set) {
        order.push(val);
      }
      expect(order.toString()).assertEqual('first,second,third');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_8900
     * @tc.name: testFilterWithMultipleConditions
     * @tc.desc: Test that Array.filter uses multiple combined conditions to select elements
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testFilterWithMultipleConditions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(JSON.stringify(affordableInStock1))
        .assertEqual('[{"name":"Shirt","price":25,"inStock":true},{"name":"Socks","price":10,"inStock":true}]');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_9100
     * @tc.name: testFindIndexWithNestedObject
     * @tc.desc: Test that Array.findIndex locates index of nested object matching property condition
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testFindIndexWithNestedObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetIndex = data1.findIndex(item => item.details.city === 'Shanghai');
      expect(targetIndex).assertEqual(1);
      const nonExistentIndex = data1.findIndex(item => item.details.city === 'Chengdu');
      expect(nonExistentIndex).assertEqual(-1);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_9200
     * @tc.name: testNestedForLoopDiagonalMatrix
     * @tc.desc: Test that nested for loops extract diagonal elements of a square matrix
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testNestedForLoopDiagonalMatrix', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const squareMatrix = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ];
      const diagonal: number[] = [];
      for (let i = 0; i < squareMatrix.length; i++) {
        for (let j = 0; j < squareMatrix[i].length; j++) {
          if (i === j) {
            diagonal.push(squareMatrix[i][j]);
          }
        }
      }
      expect(diagonal.toString()).assertEqual("1,5,9");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_9400
     * @tc.name: testMapWithFunctionReturn
     * @tc.desc: Test that Array.map uses callback returning function (creates array of functions)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testMapWithFunctionReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nums = [1, 2, 3];
      const multipliers = nums.map(num => (x: number) => x * num);
      expect(multipliers[0](5)).assertEqual(5);
      expect(multipliers[1](5)).assertEqual(10);
      expect(multipliers[2](5)).assertEqual(15);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_9600
     * @tc.name: testWhileLoopWithMultipleVariables
     * @tc.desc: Test that while loop uses multiple variables in condition and iteration
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testWhileLoopWithMultipleVariables', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let a = 0;
      let b = 5;
      const results: string[] = [];
      while (a < 3 && b > 2) {
        results.push(`a:${a}, b:${b}`);
        a++;
        b--;
      }
      expect(results.toString()).assertEqual("a:0, b:5,a:1, b:4,a:2, b:3");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_9700
     * @tc.name: testFilterWithNullishCoalescing
     * @tc.desc: Test that Array.filter uses nullish coalescing to handle optional properties
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testFilterWithNullishCoalescing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const adults = users5.filter(user => (user.age ?? 0) >= 28);
      expect(JSON.stringify(adults)).assertEqual('[{"name":"Dave","age":30}]');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_9800
     * @tc.name: testForOfStringWithCombiningMarks
     * @tc.desc: Test that for...of loop correctly handles string with combining diacritical marks
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testForOfStringWithCombiningMarks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'e\u0301clair';
      const chars: string[] = [];
      for (const char of str) {
        chars.push(char);
      }
      expect(chars.toString()).assertEqual('e,́,c,l,a,i,r');
      expect(chars.length).assertEqual(7);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_9900
     * @tc.name: testReduceMergeObjects
     * @tc.desc: Test that Array.reduce merges array of objects into a single object
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testReduceMergeObjects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let merged = testFn9();
      expect(JSON.stringify(merged)).assertEqual('{"a":1,"b":3,"c":5,"d":6}');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER_10000
     * @tc.name: testDoWhileLoopFinalIteration
     * @tc.desc: Test that do...while loop executes final iteration when condition becomes false inside loop
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testDoWhileLoopFinalIteration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let count = 0;
      const maxCount = 3;
      const results: number[] = [];
      do {
        results.push(count);
        count++;
        if (count === maxCount) {
          break;
        }
      } while (count < maxCount);
      expect(results.toString()).assertEqual('0,1,2');
      expect(count).assertEqual(3);
    })

  })
}


async function asyncloop(nums: number[]) {
  let list: Array<number> = new Array<number>();
  for (let num of nums) {
    await sleep(num);
    list.push(num);
  }
  return list;
};


async function asyncLoop2(nums: number[]) {
  let result = new Array<number>();
  nums.forEach(async val => {
    await sleep(val);
    result.push(val);
  })
  return result;
}

function collectArgs(a: number, b: string, c: boolean): Array<boolean | number | string> {
  let res = new Array<boolean | number | string>();
  res.push(a);
  res.push(b);
  res.push(c)
  return res;
}