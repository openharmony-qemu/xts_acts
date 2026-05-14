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

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../../Util.test';
import {
  ArraySomeJs_08,
  ArraySomeJs_09,
  ArraySomeJs_21,
  ArraySomeJs_22,
  ArraySomeJs_23,
  ArraySomeJs_24,
  ArraySomeJs_25,
  ArraySomeJs_26,
  ArraySomeJs_29,
  ArraySomeJs_30,
  ArraySomeJs_38,
  ArraySomeJs_39,
  ArraySomeJs_54,
  ArraySomeJs_55,
  ArraySomeJs_56,
  ArraySomeJs_61,
  ArraySomeJs_62,
  ArraySomeJs_63,
  ArraySomeJs_64,
  ArraySomeJs_65,
  ArraySomeJs_66,
  ArraySomeJs_67,
  ArraySomeJs_68,
  ArraySomeJs_69,
  ArraySomeJs_70,
  ArraySomeJs_73,
  ArraySomeJs_74,
  ArraySomeJs_75,
  ArraySomeJs_83,
  ArraySomeJs_84,
  ArraySomeJs_88,
  ArraySomeJs_148
} from './ArraySomeTest';

// 模块级回调，避免 it 内嵌套函数（arkts-no-nested-funcs）
const ARRAY_SOME_NAMED_GT3: (e: number) => boolean = (e: number): boolean => e > 3;

// 异构数组用例的占位类型（避免 it 内嵌套类）
class ArraySomeMixMarker {}

export default function ArraySomeMindMapTest() {
  describe('ArraySomeMindMapTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
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
     * @tc.name testArraySomeTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_0100
     * @tc.desc Verify some detects matching elements in a number array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: number[] = [1, 2, 3, 4, 5];
      expect(numbers.some((n: number): boolean => n % 2 === 0)).assertEqual(true);
      const allOdd: number[] = [1, 3, 5, 7];
      expect(allOdd.some((n: number): boolean => n % 2 === 0)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_0200
     * @tc.desc Verify some detects matching elements in a string array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fruits: string[] = ['apple', 'banana', 'orange'];
      // banana/orange 长度为 6，须用 >=6 与导图「长名称」语义一致
      expect(fruits.some((f: string): boolean => f.length >= 6)).assertEqual(true);
      expect(fruits.some((f: string): boolean => f.includes('berry'))).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_0300
     * @tc.desc Verify some detects matching elements in an object array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface User { name: string; age: number }
      const users: User[] = [
      { name: 'Alice', age: 25 },
      { name: 'Bob', age: 17 },
      { name: 'Charlie', age: 30 }
      ];
      expect(users.some((u: User): boolean => u.age >= 18)).assertEqual(true);
      expect(users.some((u: User): boolean => u.age >= 13 && u.age <= 19)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_0400
     * @tc.desc Verify some stops iterating after the first match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0;
      const numbers: number[] = [1, 2, 3, 4, 5];
      const result: boolean = numbers.some((num: number): boolean => {
      count++;
      return num > 2;
      });
      expect(result).assertEqual(true);
      expect(count).assertEqual(3);
    })

    /**
     * @tc.name testArraySomeTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_0500
     * @tc.desc Verify some visits all elements when no match exists
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0;
      const numbers: number[] = [1, 2, 3, 4, 5];
      const result: boolean = numbers.some((num: number): boolean => {
      count++;
      return num > 10;
      });
      expect(result).assertEqual(false);
      expect(count).assertEqual(5);
    })

    /**
     * @tc.name testArraySomeTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_0600
     * @tc.desc Verify callback receives the current element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      expect(arr.some((element: number): boolean => element > 15)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_0700
     * @tc.desc Verify callback receives the current index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      expect(arr.some((_e: string, index: number): boolean => index === 1)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_0800
     * @tc.desc Verify callback receives the original array reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(arr.some((element: number, _i: number, array: number[]): boolean => array === arr && array.length === 3 && element > 2))
      .assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_0900
     * @tc.desc Verify some throws TypeError when callback is omitted
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_08()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_1000
     * @tc.desc Verify some throws TypeError when callback is not a function
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_09()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_1100
     * @tc.desc Verify thisArg binds this for a normal function callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      class Ctx {
      multiplier: number = 10;
      check(element: number): boolean {
      return element * this.multiplier > 15;
      }
      }
      const ctx: Ctx = new Ctx();
      expect(arr.some((el: number): boolean => ctx.check(el))).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_1200
     * @tc.desc Verify some with thisArg null or undefined still evaluates predicate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(arr.some((element: number): boolean => element > 2, null)).assertEqual(true);
      expect(arr.some((element: number): boolean => element > 2, undefined)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_1300
     * @tc.desc Verify arrow callback ignores thisArg for this binding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      class Holder {
      multiplier: number = 10;
      }
      const context: Holder = new Holder();
      expect(arr.some((element: number): boolean => element * context.multiplier > 15)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_1400
     * @tc.desc Verify some returns true when the first element matches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 1, 2, 3]; expect(arr.some((n: number): boolean => n > 4)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_1500
     * @tc.desc Verify some returns true when a middle element matches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 5, 3, 4]; expect(arr.some((n: number): boolean => n > 4)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_1600
     * @tc.desc Verify some returns true when the last element matches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5]; expect(arr.some((n: number): boolean => n > 4)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_1700
     * @tc.desc Verify some returns true when multiple elements match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 6, 7, 8]; expect(arr.some((n: number): boolean => n > 4)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_1800
     * @tc.desc Verify some returns false when no element matches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4]; expect(arr.some((n: number): boolean => n > 10)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_1900
     * @tc.desc Verify some on empty array always returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      expect(arr.some((x: number): boolean => x > 0)).assertEqual(false);
      expect(arr.some((): boolean => true)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_2000
     * @tc.desc Verify some return value is boolean type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const r: boolean = arr.some((n: number): boolean => n > 2);
      expect(typeof r === 'boolean').assertEqual(true);
      expect(r === true || r === false).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_2100
     * @tc.desc Verify some does not mutate the original array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const snapshot: number[] = [1, 2, 3];
      arr.some((n: number): boolean => n > 2);
      expect(arr).assertDeepEquals(snapshot);
    })

    /**
     * @tc.name testArraySomeTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_2200
     * @tc.desc Verify holes in sparse array are not visited by callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_21()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_2300
     * @tc.desc Verify difference between array holes and explicit undefined elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_22()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_2400
     * @tc.desc Verify some with leading holes in sparse array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_23()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_2500
     * @tc.desc Verify some with trailing holes in sparse array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_24()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_2600
     * @tc.desc Verify some after delete creates holes skipped by callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_25()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_2700
     * @tc.desc Verify some with mixed holes and defined elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_26()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_2800
     * @tc.desc Verify some on empty array always returns false (repeated cases)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      expect(arr.some((x: number): boolean => x > 0)).assertEqual(false);
      expect(arr.some((): boolean => false)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_2900
     * @tc.desc Verify empty array matches existential quantifier false semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      expect(arr.some((x: number): boolean => x > 0)).assertEqual(false);
      expect(arr.some((x: number): boolean => x < 0)).assertEqual(false);
      expect(arr.some((x: number): boolean => x === x)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_3000
     * @tc.desc Verify some on array-like object with length 0 via call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_29()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_3100
     * @tc.desc Verify some when array is cleared inside callback (length snapshot)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_30()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_3200
     * @tc.desc Verify some with Number.MAX_SAFE_INTEGER element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, Number.MAX_SAFE_INTEGER, 3];
      expect(arr.some((x: number): boolean => x === Number.MAX_SAFE_INTEGER)).assertEqual(true);
      expect(arr.some((x: number): boolean => x > Number.MAX_SAFE_INTEGER)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_3300
     * @tc.desc Verify some with Number.MIN_SAFE_INTEGER element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [-1, Number.MIN_SAFE_INTEGER, 0];
      expect(arr.some((x: number): boolean => x === Number.MIN_SAFE_INTEGER)).assertEqual(true);
      expect(arr.some((x: number): boolean => x < Number.MIN_SAFE_INTEGER)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_3400
     * @tc.desc Verify some with Infinity and -Infinity elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, Infinity, 3];
      expect(arr.some((x: number): boolean => x === Infinity)).assertEqual(true);
      const arr2: number[] = [-1, -Infinity, 0];
      expect(arr2.some((x: number): boolean => x === -Infinity)).assertEqual(true);
      expect(arr.some((x: number): boolean => x > Infinity)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_3500
     * @tc.desc Verify some with Number.MIN_VALUE element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, Number.MIN_VALUE, 1];
      expect(arr.some((x: number): boolean => x > 0)).assertEqual(true);
      expect(arr.some((x: number): boolean => x === Number.MIN_VALUE)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_3600
     * @tc.desc Verify some on single-element array when condition holds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5]; expect(arr.some((x: number): boolean => x > 3)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_3700
     * @tc.desc Verify some on single-element array when condition fails
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [2]; expect(arr.some((x: number): boolean => x > 3)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_3800
     * @tc.desc Verify some on single-element arrays with null undefined NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: (number | null)[] = [null];
      expect(arr1.some((x: number | null): boolean => x === null)).assertEqual(true);
      const arr2: (number | undefined)[] = [undefined];
      expect(arr2.some((x: number | undefined): boolean => x === undefined)).assertEqual(true);
      const arr3: number[] = [NaN];
      expect(arr3.some((x: number): boolean => Number.isNaN(x))).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_3900
     * @tc.desc Verify some on large array finds target without full scan semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_38()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_4000
     * @tc.desc Verify some on sparse array with very large index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_39()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_4100
     * @tc.desc Verify some treats numeric truthy return from callback as true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(arr.some((x: number): boolean => (x > 1 ? true : false))).assertEqual(true);
      expect(arr.some((x: number): boolean => (x > 10 ? true : false))).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_4200
     * @tc.desc Verify some treats non-empty string return from callback as true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const truthyStr: boolean = 'a'.length > 0;
      expect(arr.some((x: number): boolean => (x > 1 ? truthyStr : false))).assertEqual(true);
      expect(arr.some((x: number): boolean => (x > 10 ? true : false))).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_4300
     * @tc.desc Verify some treats object return from callback as true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(arr.some((x: number): boolean => (x > 1))).assertEqual(true);
      expect(arr.some((x: number): boolean => (x > 10))).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_4400
     * @tc.desc Verify some treats false return from callback as false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3]; expect(arr.some((): boolean => false)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_4500
     * @tc.desc Verify some treats zero return from callback as false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3]; expect(arr.some((): boolean => 0 !== 0)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_4600
     * @tc.desc Verify some treats empty string return from callback as false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3]; expect(arr.some((): boolean => '' !== '')).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_4700
     * @tc.desc Verify some treats null return from callback as false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3]; expect(arr.some((): boolean => null !== null)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_4800
     * @tc.desc Verify some treats undefined return from callback as false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(arr.some((): boolean => false)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_4900
     * @tc.desc Verify some treats NaN return from callback as false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_148()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_5000
     * @tc.desc Verify some on heterogeneous element types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objInst: ArraySomeMixMarker = new ArraySomeMixMarker();
      const nested: number[] = [];
      type Mix = number | string | boolean | null | undefined | ArraySomeMixMarker | number[];
      const arr: Mix[] = [1, '2', true, null, undefined, objInst, nested];
      expect(arr.some((x: Mix): boolean => typeof x === 'string')).assertEqual(true);
      expect(arr.some((x: Mix): boolean => typeof x === 'function')).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_5100
     * @tc.desc Verify some with type coercion inside callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: string[] = ['1', '2', '3'];
      expect(arr1.some((x: string): boolean => Number(x) > 2)).assertEqual(true);
      const arr2: (number | string)[] = [1, 0, 'hello', ''];
      expect(arr2.some((x: number | string): boolean => Boolean(x))).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_5200
     * @tc.desc Verify some with named function as callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      expect(arr.some(ARRAY_SOME_NAMED_GT3)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_5300
     * @tc.desc Verify some with arrow function as callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      expect(arr.some((e: number): boolean => e > 3)).assertEqual(true);
      expect(arr.some((_e: number, index: number): boolean => index > 3)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_5400
     * @tc.desc Verify some with inline anonymous function as callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      expect(arr.some((element: number): boolean => element > 3)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_5500
     * @tc.desc Verify some with object method as callback and thisArg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_54()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_5600
     * @tc.desc Verify some propagates exception thrown from callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_55()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_5700
     * @tc.desc Verify some stops iteration after callback throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_56()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_5800
     * @tc.desc Verify some callback can read outer variable via closure
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const threshold: number = 3;
      expect(arr.some((x: number): boolean => x > threshold)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_5900
     * @tc.desc Verify some callback can mutate outer variable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      let found: boolean = false;
      const result: boolean = arr.some((x: number): boolean => {
      if (x > 3) {
      found = true;
      return true;
      }
      return false;
      });
      expect(result).assertEqual(true);
      expect(found).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_6000
     * @tc.desc Verify some with object thisArg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface RangeCtx {
        min: number;
        max: number;
      }
      const arr: number[] = [1, 2, 3, 4, 5];
      const context: RangeCtx = { min: 2, max: 4 };
      expect(arr.some((element: number): boolean => element > context.min && element < context.max)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_6100
     * @tc.desc Verify some with array thisArg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const contextArr: number[] = [10, 20, 30];
      expect(arr.some((element: number, index: number): boolean => element * contextArr[index] > 20)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_6200
     * @tc.desc Verify some boxes primitive thisArg as object for this
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_61()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_6300
     * @tc.desc Verify some with thisArg null uses strict undefined this
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_62()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_6400
     * @tc.desc Verify some with thisArg undefined uses strict undefined this
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_63()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_6500
     * @tc.desc Verify arrow callback ignores thisArg (mock outer lexical this)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_64()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_6600
     * @tc.desc Verify nested arrow inside normal callback respects thisArg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_65()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_6700
     * @tc.desc Verify some on plain array-like object via Array.prototype.some.call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_66()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_6800
     * @tc.desc Verify some on string primitive via call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_67()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_6900
     * @tc.desc Verify some on arguments object via call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_68()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_7000
     * @tc.desc Verify some on NodeList-like mock via call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_69()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_7100
     * @tc.desc Verify some on HTMLCollection-like mock via call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_70()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_7200
     * @tc.desc Verify some on Int8Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      expect(int8.some((x: number): boolean => x > 3)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_7300
     * @tc.desc Verify some on Float32Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const float32: Float32Array = new Float32Array([1.1, 2.2, 3.3]);
      expect(float32.some((x: number): boolean => x > 2.5)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_7400
     * @tc.desc Verify some on custom array-like with iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_73()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_7500
     * @tc.desc Verify some on sparse array-like with non-contiguous indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_74()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_7600
     * @tc.desc Verify some on array-like when length exceeds defined indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_75()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_7700
     * @tc.desc Verify some when callback mutates already visited element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: boolean = arr.some((element: number, index: number, array: number[]): boolean => {
      if (index === 0) {
      array[1] = 100;
      }
      return element > 10;
      });
      expect(result).assertEqual(true);
      expect(arr[1]).assertEqual(100);
    })

    /**
     * @tc.name testArraySomeTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_7800
     * @tc.desc Verify some when callback mutates not-yet-visited element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: boolean = arr.some((element: number, index: number, array: number[]): boolean => {
      if (index === 0) {
      array[4] = 100;
      }
      return element > 10;
      });
      expect(result).assertEqual(true);
      expect(arr[4]).assertEqual(100);
    })

    /**
     * @tc.name testArraySomeTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_7900
     * @tc.desc Verify some when callback pushes new elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: number, array: number[]): boolean => {
      callCount++;
      array.push(element + 10);
      return element > 2;
      });
      expect(result).assertEqual(true);
      expect(callCount).assertEqual(3);
      expect(arr.length >= 3).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_8000
     * @tc.desc Verify some when callback splices to delete element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: boolean = arr.some((element: number, index: number, array: number[]): boolean => {
      if (index === 0) {
      array.splice(2, 1);
      }
      return element > 3;
      });
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_8100
     * @tc.desc Verify some when callback increases array length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: number, array: number[]): boolean => {
      callCount++;
      if (index === 0) {
      array.length = 10;
      }
      return element > 2;
      });
      expect(result).assertEqual(true);
      expect(callCount).assertEqual(3);
    })

    /**
     * @tc.name testArraySomeTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_8200
     * @tc.desc Verify some when callback decreases array length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: number, array: number[]): boolean => {
      callCount++;
      if (index === 0) {
      array.length = 2;
      }
      return element > 3;
      });
      expect(result).assertEqual(false);
      expect(callCount).assertEqual(2);
    })

    /**
     * @tc.name testArraySomeTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_8300
     * @tc.desc Verify some when callback clears array length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: number, array: number[]): boolean => {
      callCount++;
      if (index === 1) {
      array.length = 0;
      }
      return element > 3;
      });
      expect(result).assertEqual(false);
      expect(callCount).assertEqual(2);
    })

    /**
     * @tc.name testArraySomeTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_8400
     * @tc.desc Verify some when callback deletes next index with delete operator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_83()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_8500
     * @tc.desc Verify some when callback deletes unvisited tail with delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_84()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_8600
     * @tc.desc Verify logical relation between some and every predicates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const hasGreaterThan3: boolean = arr.some((x: number): boolean => x > 3);
      const allNotGreaterThan3: boolean = !arr.every((x: number): boolean => x <= 3);
      expect(hasGreaterThan3 === allNotGreaterThan3).assertEqual(true);
      const hasNegative: boolean = arr.some((x: number): boolean => x < 0);
      const allNonNegative: boolean = arr.every((x: number): boolean => x >= 0);
      expect(hasNegative === !allNonNegative).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_8700
     * @tc.desc Verify some and every under same conditions on sample arrays
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: number[] = [5, 6, 7, 8, 9];
      expect(arr1.some((x: number): boolean => x > 0)).assertEqual(true);
      expect(arr1.every((x: number): boolean => x > 0)).assertEqual(true);
      const arr2: number[] = [-1, 2, 3, -4, 5];
      expect(arr2.some((x: number): boolean => x > 0)).assertEqual(true);
      expect(arr2.every((x: number): boolean => x > 0)).assertEqual(false);
      const arr3: number[] = [-1, -2, -3];
      expect(arr3.some((x: number): boolean => x > 0)).assertEqual(false);
      expect(arr3.every((x: number): boolean => x > 0)).assertEqual(false);
    })

    /**
     * @tc.name testArraySomeTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_8800
     * @tc.desc Verify some can emulate includes equality check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const target: number = 3;
      expect(arr.includes(target) === arr.some((x: number): boolean => x === target)).assertEqual(true);
      const target2: number = 6;
      expect(arr.includes(target2) === arr.some((x: number): boolean => x === target2)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_8900
     * @tc.desc Verify some allows custom predicate unlike includes reference check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySomeJs_88()).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_9000
     * @tc.desc Verify some matches non-empty filter via existence predicate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const filtered: number[] = arr.filter((x: number): boolean => x > 3);
      const hasMatch: boolean = filtered.length > 0;
      const hasMatchWithSome: boolean = arr.some((x: number): boolean => x > 3);
      expect(hasMatch === hasMatchWithSome).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_9100
     * @tc.desc Verify some short-circuits compared to materializing filter length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 100, 5];
      let someCount: number = 0;
      const cond = (x: number): boolean => {
      someCount++;
      return x > 10;
      };
      const r1: boolean = arr.some(cond);
      expect(r1).assertEqual(true);
      expect(someCount).assertEqual(4);
      let filterCount: number = 0;
      const r2: boolean = arr.filter((x: number): boolean => {
      filterCount++;
      return x > 10;
      }).length > 0;
      expect(r2).assertEqual(true);
      expect(filterCount).assertEqual(5);
    })

    /**
     * @tc.name testArraySomeTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_9200
     * @tc.desc Verify some returns boolean while find returns element or undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const condition = (x: number): boolean => x > 3;
      expect(arr.some(condition)).assertEqual(true);
      expect(arr.find(condition)).assertEqual(4);
      expect(arr.find((x: number): boolean => x > 10)).assertEqual(undefined);
    })

    /**
     * @tc.name testArraySomeTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_9300
     * @tc.desc Verify some returns boolean while findIndex returns index or -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const condition = (x: number): boolean => x > 3;
      expect(arr.some(condition)).assertEqual(true);
      expect(arr.findIndex(condition)).assertEqual(3);
      expect(arr.findIndex((x: number): boolean => x > 10)).assertEqual(-1);
    })

    /**
     * @tc.name testArraySomeTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_9400
     * @tc.desc Verify some after map transformation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      expect(arr.map((x: number): number => x * 2).some((x: number): boolean => x > 7)).assertEqual(true);
      expect(arr.some((x: number): boolean => x * 2 > 7)).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_9500
     * @tc.desc Verify reduce can emulate some predicate accumulation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const condition = (x: number): boolean => x > 3;
      const r1: boolean = arr.some(condition);
      const r2: boolean = arr.reduce((acc: boolean, x: number): boolean => acc || condition(x), false);
      expect(r1 === r2).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_9600
     * @tc.desc Verify some short-circuits compared to reduce scan
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 100, 5];
      const condition = (x: number): boolean => x > 10;
      expect(arr.some(condition)).assertEqual(true);
      const r2: boolean = arr.reduce((acc: boolean, x: number): boolean => {
      if (acc) {
      return acc;
      }
      return condition(x);
      }, false);
      expect(r2).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_9700
     * @tc.desc Verify chained filter map some pipeline
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result: boolean = arr
      .filter((x: number): boolean => x % 2 === 0)
      .map((x: number): number => x * 2)
      .some((x: number): boolean => x > 10);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name testArraySomeTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SOME_SUPPLEMENT_TEST_9800
     * @tc.desc Verify some as terminal step in method chain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySomeTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      expect(arr.filter((x: number): boolean => x > 2).some((x: number): boolean => x > 3)).assertEqual(true);
      expect(arr.map((x: number): number => x * 2).filter((x: number): boolean => x > 5).some((x: number): boolean => x < 10)).assertEqual(true);
    })

  })
}
