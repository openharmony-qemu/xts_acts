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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import * as Array1 from './ArrayCombination1';
import { collections } from '@kit.ArkTS';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function ArrayConstructor1Test() {
  describe('ArrayConstructor1Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
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
     * @tc.name   ArrayConstructor1Test001
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [];
      const typedArr = new collections.Int32Array([]);
      expect(arr.map(x => x).sort()).assertDeepEquals([]);
      expect(collections.Int32Array.from(typedArr.map(x => x)).sort()).assertDeepEquals(collections.Int32Array.from([]));
    });

    /**
     * @tc.name   ArrayConstructor1Test002
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const typedArr = new collections.Int32Array([1, 2, 3]);
      expect(arr.filter(x => x > 10).reverse()).assertDeepEquals([]);
      expect(collections.Int32Array.from(typedArr.filter(x => x > 10)).reverse()).assertDeepEquals(collections.Int32Array.from([]));
    });

    /**
     * @tc.name   ArrayConstructor1Test003
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1]];
      const typedArr = [new collections.Float32Array([5])];
      const r1 = arr.flatMap(x => x).fill(99);
      const r2 = collections.Float32Array.from(typedArr.flatMap(x => Array.from(x))).fill(99);
      expect(r1).assertDeepEquals([99]);
      expect(r2).assertDeepEquals(collections.Float32Array.from([99]));
    });

    /**
     * @tc.name   ArrayConstructor1Test004
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      const typedArr = new collections.Int32Array([1, 2]);
      const r1 = arr.map(x => x).copyWithin(10, 0);
      const r2 = collections.Int32Array.from(typedArr.map(x => x)).copyWithin(10, 0);
      expect(r1).assertDeepEquals([1, 2]);
      expect(r2).assertDeepEquals(collections.Int32Array.from([1, 2]));
    });



    /**
     * @tc.name   ArrayConstructor1Test005
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [NaN, 2, 1];
      const typedArr: collections.Float32Array = new collections.Float32Array([NaN, 2, 1]);
      const r1 = arr.filter(x => true).sort();
      const r2 = collections.Float32Array.from(typedArr.filter(x => true)).sort((a, b) => {
        if (Number.isNaN(a) && Number.isNaN(b)) return 0;
        if (Number.isNaN(a)) return 1;
        if (Number.isNaN(b)) return -1;
        return a - b;
      });
      expect(r1[0]).assertEqual(1);
      expect(r1[1]).assertEqual(2);
      expect(Number.isNaN(r1[2])).assertTrue();
      expect(r2[0]).assertEqual(1);
      expect(r2[1]).assertEqual(2);
      expect(Number.isNaN(r2[2])).assertTrue();
    });


    /**
     * @tc.name   ArrayConstructor1Test006
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[], [1], []];
      const typedArr = [new collections.Int32Array([]), new collections.Int32Array([1]), new collections.Int32Array([])];
      const r1 = arr.flatMap(x => x).reverse();
      const flattened: number[] = [];
      for (const arr of typedArr) {
        for (let i = 0; i < arr.length; i++) {
          flattened.push(arr[i]);
        }
      }
      const r2 = flattened.reverse();
      expect(r1).assertDeepEquals([1]);
      expect(r2).assertDeepEquals([1]);
    });

    /**
     * @tc.name   ArrayConstructor1Test007
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test007()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ArrayConstructor1Test008
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30, 40];
      const typedArr = new collections.Int32Array(arr);
      const r1 = arr.filter(x => x >= 20).copyWithin(-1, 0, 1);
      const r2 = collections.Int32Array.from(typedArr.filter(x => x >= 20)).copyWithin(-1, 0, 1);
      expect(r1).assertDeepEquals([20, 30, 20]);
      expect(r2).assertDeepEquals(collections.Int32Array.from([20, 30, 20]));
    });

    /**
     * @tc.name   ArrayConstructor1Test009
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST0900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [42];
      const typedArr = new collections.Int32Array(arr);
      expect(arr.map(x => x).reverse()).assertDeepEquals([42]);
      expect(collections.Int32Array.from(typedArr.map(x => x)).reverse()).assertDeepEquals(collections.Int32Array.from([42]));

    });

    /**
     * @tc.name   ArrayConstructor1Test010
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[Infinity], [-Infinity], [0]];
      const typedArr = [new collections.Float32Array([Infinity]), new collections.Float32Array([-Infinity]), new collections.Float32Array([0])];
      const r1 = arr.flatMap(x => x).sort((a, b) => a - b);
      const r2 = collections.Float32Array.from(typedArr.flatMap(x => Array.from(x))).sort((a, b) => a - b);
      expect(r1).assertDeepEquals([-Infinity, 0, Infinity]);
      expect(r2).assertDeepEquals(collections.Float32Array.from([-Infinity, 0, Infinity]));

    });

    /**
     * @tc.name   ArrayConstructor1Test011
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const typedArr = new collections.Int32Array(arr);
      const r1 = arr.filter(x => true).fill(999, 2, 2);
      const r2 = collections.Int32Array.from(typedArr.filter(x => true)).fill(999, 2, 2);
      expect(r1).assertDeepEquals([1, 2, 3]);
      expect(r2).assertDeepEquals(collections.Int32Array.from([1, 2, 3]));

    });

    /**
     * @tc.name   ArrayConstructor1Test012
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const typedArr = new collections.Int32Array(arr);
      const r1 = arr.map(x => x).copyWithin(0, 2, 1);
      const r2 = collections.Int32Array.from(typedArr.map(x => x)).copyWithin(0, 2, 1);
      expect(r1).assertDeepEquals([1, 2, 3]);
      expect(r2).assertDeepEquals(collections.Int32Array.from([1, 2, 3]));
    });

    /**
     * @tc.name   ArrayConstructor1Test013
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[[1]], [[2]]];
      const r1 = arr.flatMap(x => x).reverse();
      expect(r1).assertDeepEquals([[2], [1]]);
      const typedSim = [new collections.Int32Array([1]), new collections.Int32Array([2])];
      const r2 = collections.Int32Array.from(typedSim.flatMap(x => Array.from(x))).reverse();
      expect(r2).assertDeepEquals(collections.Int32Array.from([2, 1]));
    });

    /**
     * @tc.name   ArrayConstructor1Test014
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [5, 5, 5];
      const typedArr = new collections.Int32Array(arr);
      const r1 = arr.filter(x => true).sort();
      const r2 = collections.Int32Array.from(typedArr.filter(x => true)).sort();
      expect(r1).assertDeepEquals([5, 5, 5]);
      expect(r2).assertDeepEquals(collections.Int32Array.from([5, 5, 5]));
    });

    /**
     * @tc.name   ArrayConstructor1Test015
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      const typedArr = new collections.Int32Array(arr);
      const r1 = arr.map(x => x).fill(88, 0, 10);
      const r2 = collections.Int32Array.from(typedArr.map(x => x)).fill(88, 0, 10);
      expect(r1).assertDeepEquals([88]);
      expect(r2).assertDeepEquals(collections.Int32Array.from([88]));
    });

    /**
     * @tc.name   ArrayConstructor1Test016
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1, 2, 3]];
      const typedArr = [new collections.Int32Array([1, 2, 3])];
      const r1 = arr.flatMap(x => x).copyWithin(1, 0, 2);
      const r2 = collections.Int32Array.from(typedArr.flatMap(x => Array.from(x))).copyWithin(1, 0, 2);
      expect(r1).assertDeepEquals([1, 1, 2]);
      expect(r2).assertDeepEquals(collections.Int32Array.from([1, 1, 2]));
    });

    /**
     * @tc.name   ArrayConstructor1Test017
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, undefined, 3];
      const r1 = arr.filter(x => x !== undefined).reverse();
      expect(r1).assertDeepEquals([3, 1]);
      const typedArr =new collections.Float32Array([1, NaN, 3]);
      const r2 = collections.Float32Array.from(typedArr.filter(x => !Number.isNaN(x))).reverse();
      expect(r2).assertDeepEquals(collections.Float32Array.from([3, 1]));
    });

    /**
     * @tc.name   ArrayConstructor1Test018
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [3, 1, 2];
      const typedArr = new collections.Int32Array(arr);
      const r1 = arr.map(x => x).sort(() => 0);
      expect(r1.length).assertEqual(3);
      expect(r1.every(x => [1,2,3].includes(x))).assertTrue();
      const r2 = collections.Int32Array.from(typedArr.map(x => x)).sort(() => 0);
      expect(r2.length).assertEqual(3);
      expect(r2.every(x => [1,2,3].includes(x))).assertTrue();
    });

    /**
     * @tc.name   ArrayConstructor1Test019
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST1900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [['a'], ['b']];
      const r1 = arr.flatMap(x => x).fill('X', 1);
      expect(r1).assertDeepEquals(['a', 'X']);
      const typedArr = [new collections.Int32Array([10]), new collections.Int32Array([20])];
      const r2 = collections.Int32Array.from(
        typedArr.flatMap(x => Array.from(x))
      ).fill(999, 1);

      expect(r2).assertDeepEquals(collections.Int32Array.from([10, 999]));
    });

    /**
     * @tc.name   ArrayConstructor1Test020
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const typedArr = new collections.Int32Array(arr);
      const r1 = arr.filter(x => x === 2).copyWithin(0, 0);
      const r2 = collections.Int32Array.from(typedArr.filter(x => x === 2)).copyWithin(0, 0);
      expect(r1).assertDeepEquals([2]);
      expect(r2).assertDeepEquals(collections.Int32Array.from([2]));
    });

    /**
     * @tc.name   ArrayConstructor1Test021
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test021()).assertDeepEquals([[1, -0, 0], true, [1, -0, 0], true]);
    });

    /**
     * @tc.name   ArrayConstructor1Test022
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[], [], []];
      const typedArr = [new collections.Int32Array([]), new collections.Int32Array([]), new collections.Int32Array([])];
      const r1 = arr.flatMap(x => x).sort();
      const r2 = collections.Int32Array.from(typedArr.flatMap(x => Array.from(x))).sort();
      expect(r1).assertDeepEquals([]);
      expect(r2).assertDeepEquals(collections.Int32Array.from([]));
    });

    /**
     * @tc.name   ArrayConstructor1Test023
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const typedArr =new collections.Float32Array([1, 2, 3]);
      const r1 = arr.filter(x => x > 1).fill(NaN);
      const r2 = collections.Float32Array.from(typedArr.filter(x => x > 1)).fill(NaN);
      expect(r1.length).assertEqual(2);
      expect(Number.isNaN(r1[0])).assertTrue();
      expect(Number.isNaN(r1[1])).assertTrue();
      expect(r2.length).assertEqual(2);
      expect(Number.isNaN(r2[0])).assertTrue();
      expect(Number.isNaN(r2[1])).assertTrue();
    });

    /**
     * @tc.name   ArrayConstructor1Test024
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20];
      const typedArr = new collections.Int32Array([10, 20]);
      const r1 = arr.map(x => x).copyWithin(-5, 0, 1);
      const r2 = collections.Int32Array.from(typedArr.map(x => x)).copyWithin(-5, 0, 1);
      expect(r1).assertDeepEquals([10, 20]);
      expect(r2).assertDeepEquals(collections.Int32Array.from([10, 20]));
    });

    /**
     * @tc.name   ArrayConstructor1Test025
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['ab'];
      const r1 = arr.flatMap(x => x.split('')).reverse();
      expect(r1).assertDeepEquals(['b', 'a']);
      const typedArr = [new collections.Int32Array([1, 2])];
      const r2 = collections.Int32Array.from(typedArr.flatMap(x => Array.from(x))).reverse();
      expect(r2).assertDeepEquals(collections.Int32Array.from([2, 1]));
    });

    /**
     * @tc.name   ArrayConstructor1Test026
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test026()).assertDeepEquals([[10, 20, 30, 40, 50, 60, 70, 80, 90, 100], [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]]);
    });

    /**
     * @tc.name   ArrayConstructor1Test027
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const typedArr = new collections.Int32Array([1, 2, 3, 4]);
      const r1 = arr.map(x => x).fill(777, -2);
      const r2 = collections.Int32Array.from(typedArr.map(x => x)).fill(777, -2);
      expect(r1).assertDeepEquals([1, 2, 777, 777]);
      expect(r2).assertDeepEquals(collections.Int32Array.from([1, 2, 777, 777]));
    });

    /**
     * @tc.name   ArrayConstructor1Test028
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1, 2, 3]];
      const typedArr = [new collections.Int32Array([1, 2, 3])];
      const r1 = arr.flatMap(x => x).copyWithin(0, 1, 1);
      const r2 = collections.Int32Array.from(typedArr.flatMap(x => Array.from(x))).copyWithin(0, 1, 1);
      expect(r1).assertDeepEquals([1, 2, 3]);
      expect(r2).assertDeepEquals(collections.Int32Array.from([1, 2, 3]));
    });

    /**
     * @tc.name   ArrayConstructor1Test029
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST2900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [3, 1, 4, 1, 5];
      const typedArr = new collections.Int32Array([3, 1, 4, 1, 5]);
      const r1 = arr.filter(x => true).reverse();
      const r2 = collections.Int32Array.from(typedArr.filter(x => true)).reverse();
      expect(r1).assertDeepEquals([5, 1, 4, 1, 3]);
      expect(r2).assertDeepEquals(collections.Int32Array.from([5, 1, 4, 1, 3]));
    });

    /**
     * @tc.name   ArrayConstructor1Test030
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test030()).assertDeepEquals([true, true, [0, 0]]);
    });

    /**
     * @tc.name   ArrayConstructor1Test031
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let caught = false;
      try {
        [1, 2].map(x => { if (x === 2) throw new Error("boom"); return x; }).sort();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      try {
        new collections.Int32Array([1, 2]).map(x => { if (x === 2) throw new Error("boom"); return x; });
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.name   ArrayConstructor1Test032
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test032()).assertDeepEquals([[999, 999], [999, 999]]);
    });

    /**
     * @tc.name   ArrayConstructor1Test033
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ["hi"];
      const r1 = arr.flatMap(x => x).reverse();
      expect(r1).assertDeepEquals(["hi"]);
      const typedSim =new collections.Int32Array([1, 2]);
      const r2 = collections.Int32Array.from(typedSim.map(x => x)).reverse();
      expect(r2).assertDeepEquals(collections.Int32Array.from([2, 1]));
    });

    /**
     * @tc.name   ArrayConstructor1Test034
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const orig = [1, 2, 3];
      const result = orig.map(x => x * 2).copyWithin(0, 1);
      expect(orig).assertDeepEquals([1, 2, 3]);
      expect(result).assertDeepEquals([4, 6, 6]);
      const typedOrig = new collections.Int32Array([1, 2, 3]);
      const temp = collections.Int32Array.from(typedOrig.map(x => x * 2));
      const typedResult = temp.copyWithin(0, 1);
      expect(Array.from(typedOrig)).assertDeepEquals([1, 2, 3]);
      expect(typedResult).assertDeepEquals(collections.Int32Array.from([4, 6, 6]));
    });

    /**
     * @tc.name   ArrayConstructor1Test035
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [3, 1, 2];
      const r1 = arr.filter(x => true).sort(() => NaN);
      expect(r1.length).assertEqual(3);
      expect([1,2,3].includes(r1[0])).assertTrue();
      const typedArr = new collections.Int32Array([3,1,2]);
      const r2 = collections.Int32Array.from(typedArr.filter(x => true)).sort(() => NaN);
      expect(r2.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayConstructor1Test036
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test036()).assertDeepEquals([[1, null], [1, null]]);
    });

    /**
     * @tc.name   ArrayConstructor1Test037
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      const r1 = arr.map(x => x).reverse().map(x => x * 10);
      expect(r1).assertDeepEquals([20, 10]);
      const typedArr = new collections.Int32Array([1, 2]);
      const r2 = collections.Int32Array.from(typedArr.map(x => x)).reverse().map(x => x * 10);
      expect(r2).assertDeepEquals(collections.Int32Array.from([20, 10]));
    });

    /**
     * @tc.name   ArrayConstructor1Test038
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a = [10, 20, 30];
      const filtered = a.filter(x => x > 10);
      const copied = filtered.copyWithin(0, 1);
      expect(a).assertDeepEquals([10, 20, 30]);
      expect(filtered).assertDeepEquals([30, 30]);
      expect(copied).assertDeepEquals([30,30]);
      const typedA = new collections.Int32Array([10,20,30]);
      const tFiltered = collections.Int32Array.from(typedA.filter(x => x > 10));
      const tCopied = tFiltered.copyWithin(0, 1);
      expect(typedA).assertDeepEquals(collections.Int32Array.from([10,20,30]));
      expect(tFiltered).assertDeepEquals(collections.Int32Array.from([30,30]));
      expect(tCopied).assertDeepEquals(collections.Int32Array.from([30,30]));
    });

    /**
     * @tc.name   ArrayConstructor1Test039
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST3900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const r1 = arr.flatMap(x => []);
      expect(r1.sort()).assertDeepEquals([]);
      const typedArr = new collections.Int32Array([1, 2, 3]);
      const r2 = collections.Array.from(Array.from(typedArr).flatMap(x => []));
      expect(r2.sort()).assertDeepEquals(collections.Array.from([]));
    });

    /**
     * @tc.name   ArrayConstructor1Test040
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const r1 = arr.map(x => x).fill(888, 1.7, 3.9);
      expect(r1).assertDeepEquals([1, 888, 888, 4]);
      const typedArr = new collections.Int32Array([1,2,3,4]);
      const r2 = collections.Int32Array.from(typedArr.map(x => x)).fill(888, 1.7, 3.9);
      expect(r2).assertDeepEquals(collections.Int32Array.from([1, 888, 888, 4]));
    });

    /**
     * @tc.name   ArrayConstructor1Test041
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      let count = 0;
      const r1 = arr.filter(x => {
        count++;
        return x > 1;
      }).reverse();
      expect(count).assertEqual(3);
      expect(r1).assertDeepEquals([3, 2]);
      const typedArr = new collections.Int32Array([1,2,3]);
      count = 0;
      const r2 = collections.Int32Array.from(typedArr.filter(x => {
        count++;
        return x > 1;
      })).reverse();
      expect(count).assertEqual(3);
      expect(r2).assertDeepEquals(collections.Int32Array.from([3, 2]));
    });

    /**
     * @tc.name   ArrayConstructor1Test042
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1, 2]];
      const r1 = arr.flatMap(x => x).copyWithin(100, 0, 1);
      expect(r1).assertDeepEquals([1, 2]);
      const typedArr = [new collections.Int32Array([1,2])];
      const r2 = collections.Int32Array.from(typedArr.flatMap(x => Array.from(x))).copyWithin(100, 0, 1);
      expect(r2).assertDeepEquals(collections.Int32Array.from([1, 2]));
    });

    /**
     * @tc.name   ArrayConstructor1Test043
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let factor = -1;
      const arr = [1, 3, 2];
      const r1 = arr.map(x => x).sort((a, b) => factor * (a - b));
      expect(r1).assertDeepEquals([3, 2, 1]);
      factor = 1;
      const typedArr = new collections.Int32Array([1,3,2]);
      const r2 = collections.Int32Array.from(typedArr.map(x => x)).sort((a, b) => factor * (a - b));
      expect(r2).assertDeepEquals(collections.Int32Array.from([1, 2, 3]));
    });

    /**
     * @tc.name   ArrayConstructor1Test044
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test044()).assertDeepEquals([{ "a": 1 }, { "a": 1 }, [999, 999]]);
    });

    /**
     * @tc.name   ArrayConstructor1Test045
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test045()).assertDeepEquals([['y', 'x'], [20, 10]]);
    });

    /**
     * @tc.name   ArrayConstructor1Test046
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const r1 = arr
        .map(x => x * 2)
        .filter(x => x > 4)
        .copyWithin(0, 1);
      expect(r1).assertDeepEquals([8, 10, 10]);
      const typedArr = new collections.Int32Array([1,2,3,4,5]);
      const temp = collections.Int32Array.from(typedArr.map(x => x * 2)).filter(x => x > 4);
      const r2 = temp.copyWithin(0, 1);
      expect(r2).assertDeepEquals(collections.Int32Array.from([8, 10, 10]));
    });

    /**
     * @tc.name   ArrayConstructor1Test047
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [true, false, true];
      const r1 = arr.filter(x => x).sort();
      expect(r1).assertDeepEquals([true, true]);
      const typedArr = new collections.Uint8Array([1, 0, 1]);
      const r2 = collections.Uint8Array.from(typedArr.filter(x => x === 1)).sort();
      expect(r2).assertDeepEquals(collections.Uint8Array.from([1, 1]));
    });

    /**
     * @tc.name   ArrayConstructor1Test048
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1, 2, 3, 4]];
      const r1 = arr.flatMap(x => x).fill(0, -3, -1);
      expect(r1).assertDeepEquals([1, 0, 0, 4]);
      const typedArr = [new collections.Int32Array([1,2,3,4])];
      const r2 = collections.Int32Array.from(
        typedArr.flatMap(x => Array.from(x))
      ).fill(0, -3, -1);
      expect(r2).assertDeepEquals(collections.Int32Array.from([1, 0, 0, 4]));
    });

    /**
     * @tc.name   ArrayConstructor1Test049
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const timestamp2020 = 1577836800;
      const timestamp2021 = 1609459200;
      const d1 = new Date(timestamp2020*1000);
      const d2 = new Date(timestamp2021*1000);
      const r1: Date[] = [d2, d1]; 

      expect(r1[0].toISOString()).assertEqual("2021-01-01T00:00:00.000Z");
      expect(r1[1].toISOString()).assertEqual("2020-01-01T00:00:00.000Z");

      const typedArr =new collections.Float32Array([timestamp2020, timestamp2021]);
      const r2: number[] = [typedArr[1], typedArr[0]];
      expect(r2[0]).assertEqual(timestamp2021);
      expect(r2[1]).assertEqual(timestamp2020);
    });

    /**
     * @tc.name   ArrayConstructor1Test050
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const r1 = arr.filter(x => true).copyWithin(0, 2);
      expect(r1).assertDeepEquals([3, 4, 3, 4]);
      const typedArr = new collections.Int32Array([1,2,3,4]);
      const r2 = collections.Int32Array.from(typedArr.filter(x => true)).copyWithin(0, 2);
      expect(r2).assertDeepEquals(collections.Int32Array.from([3, 4, 3, 4]));
    });

    /**
     * @tc.name   ArrayConstructor1Test051
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[null], [2], [1]];
      const r1 = arr.flatMap(x => x).sort((a, b) => {
        if (a === null) return -1;
        if (b === null) return 1;
        return a - b;
      });
      expect(r1).assertDeepEquals([null, 1, 2]);
      const typedArr = [new collections.Int32Array([0]), new collections.Int32Array([2]), new collections.Int32Array([1])];
      const r2 = collections.Int32Array.from(typedArr.flatMap(x => Array.from(x))).sort((a, b) => a - b);
      expect(r2).assertDeepEquals(collections.Int32Array.from([0, 1, 2]));
    });

    /**
     * @tc.name   ArrayConstructor1Test052
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      const r1 = arr.map(x => x).fill(999, Infinity);
      expect(r1).assertDeepEquals([1, 2]);
      const typedArr = new collections.Int32Array([1,2]);
      const r2 = collections.Int32Array.from(typedArr.map(x => x)).fill(999, Infinity);
      expect(r2).assertDeepEquals(collections.Int32Array.from([1, 2]));
    });

    /**
     * @tc.name   ArrayConstructor1Test053
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [0, 1, "", "hello", null, 42];
      const r1 = arr.filter(x => x).reverse();
      expect(r1).assertDeepEquals([42, "hello", 1]);
      const typedArr = new collections.Int32Array([0, 1, 0, 5, 0, 42]);
      const r2 = collections.Int32Array.from(typedArr.filter(x => x !== 0)).reverse();
      expect(r2).assertDeepEquals(collections.Int32Array.from([42, 5, 1]));
    });

    /**
     * @tc.name   ArrayConstructor1Test054
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1, 2]];
      const r1 = arr.flatMap(x => x).copyWithin(0, 0, 0);
      expect(r1).assertDeepEquals([1, 2]);
      const typedArr = [new collections.Int32Array([1,2])];
      const r2 = collections.Int32Array.from(
        typedArr.flatMap(x => Array.from(x))).copyWithin(0, 0, 0);
      expect(r2).assertDeepEquals(collections.Int32Array.from([1, 2]));
    });

    /**
     * @tc.name   ArrayConstructor1Test055
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [3, 1, 2];
      const r1 = arr.map(x => x).sort().sort((a, b) => b - a);
      expect(r1).assertDeepEquals([3, 2, 1]);
      const typedArr = new collections.Int32Array([3,1,2]);
      const r2 = collections.Int32Array.from(typedArr.map(x => x)).sort().sort((a, b) => b - a);
      expect(r2).assertDeepEquals(collections.Int32Array.from([3, 2, 1]));
    });

    /**
     * @tc.name   ArrayConstructor1Test056
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const r1 = arr.filter(x => x < 3).fill(-Infinity);
      expect(r1).assertDeepEquals([-Infinity, -Infinity]);
      const typedArr =new collections.Float32Array([1,2,3]);
      const r2 = collections.Float32Array.from(typedArr.filter(x => x < 3)).fill(-Infinity);
      expect(r2).assertDeepEquals(collections.Float32Array.from([-Infinity, -Infinity]));
    });

    /**
     * @tc.name   ArrayConstructor1Test057
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test057()).assertTrue();
    });

    /**
     * @tc.name   ArrayConstructor1Test058
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test058()).assertDeepEquals([[10, 20, 10], [10, 20, 10]]);
    });

    /**
     * @tc.name   ArrayConstructor1Test060
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1], [2]];
      const step1 = arr.flatMap(x => x).fill(0);
      const step2 = [step1].flatMap(x => x);
      expect(step2).assertDeepEquals([0, 0]);
      const typedArr = [new collections.Int32Array([1]), new collections.Int32Array([2])];
      const t1 = collections.Int32Array.from(typedArr.flatMap(x => Array.from(x))).fill(0);
      const t2 = collections.Int32Array.from([t1].flatMap(x => Array.from(x)));
      expect(t2).assertDeepEquals(collections.Int32Array.from([0, 0]));
    });

    /**
     * @tc.name   ArrayConstructor1Test061
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = new collections.Int8Array([127, 128, -129]);
      const r = collections.Int8Array.from(arr.map(x => x)).sort((a, b) => a - b);
      expect(r).assertDeepEquals(collections.Int8Array.from([-128, 127, 127]));
    });

    /**
     * @tc.name   ArrayConstructor1Test062
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = new collections.Uint8ClampedArray([0, 0]);
      const filtered = collections.Uint8ClampedArray.from(arr.filter(_ => true));
      const filled = filtered.fill(300);
      expect(filled).assertDeepEquals(collections.Uint8ClampedArray.from([300, 300]));
    });

    /**
     * @tc.name   ArrayConstructor1Test063
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [new collections.Float32Array([0.1 + 0.2])];
      const r = collections.Float32Array.from(arr.flatMap(x => Array.from(x))).reverse();
      expect(r.length).assertEqual(1);
      expect(Math.abs(r[0] - 0.3) < 1e-6).assertTrue();
    });

    /**
     * @tc.name   ArrayConstructor1Test064
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6400
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const ta = new collections.Int32Array([10, 20, 30]);
      const result = collections.Int32Array.from(ta.map(x => {
        ta[0] = 999;
        return x;
      })).copyWithin(1, 0, 1);
      expect(result).assertDeepEquals(collections.Int32Array.from([10, 10, 30]));
      expect(ta[0]).assertEqual(999);
    });

    /**
     * @tc.name   ArrayConstructor1Test065
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6500
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test065()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ArrayConstructor1Test067
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6700
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test067()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ArrayConstructor1Test068
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const r = arr.filter(x => x > 2).copyWithin(0, -2, -3);
      expect(r).assertDeepEquals([3, 4, 5]);
    });

    /**
     * @tc.name   ArrayConstructor1Test069
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST6900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[NaN], [NaN]];
      const r1 = arr.flatMap(x => x).sort();
      expect(r1.length).assertEqual(2);
      expect(Number.isNaN(r1[0])).assertTrue();
      expect(Number.isNaN(r1[1])).assertTrue();
      const ta = [new collections.Float32Array([NaN]),new collections.Float32Array([NaN])];
      const r2 = collections.Float32Array.from(ta.flatMap(x => Array.from(x))).sort();
      expect(r2.length).assertEqual(2);
      expect(Number.isNaN(r2[0])).assertTrue();
      expect(Number.isNaN(r2[1])).assertTrue();
    });

    /**
     * @tc.name   ArrayConstructor1Test070
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST7000
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test070()).assertDeepEquals([[undefined, undefined], [0, 0], undefined]);
    });

    /**
     * @tc.name   ArrayConstructor1Test071
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST7100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [new Number(1), new Number(0), new Number(2)];
      const r = arr.filter(x => x.valueOf() > 0).reverse();
      expect(r.length).assertEqual(2);
      expect(r[0].valueOf()).assertEqual(2);
      expect(r[1].valueOf()).assertEqual(1);
    });

    /**
     * @tc.name   ArrayConstructor1Test072
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST7200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1, 2]];
      const r = arr.flatMap(x => x).copyWithin(0, 1, 10);
      expect(r).assertDeepEquals([2, 2]);
    });

    /**
     * @tc.name   ArrayConstructor1Test073
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST7300
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test073()).assertTrue();
    });

    /**
     * @tc.name   ArrayConstructor1Test076
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST7600
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test076()).assertDeepEquals([[20, 20, 30], true]);
    });

   
    /**
     * @tc.name   ArrayConstructor1Test077
     * @tc.number ArrayConstructor1Test077
     * @tc.desc   ArrayConstructor1Test077
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ["ab"];
      const r = arr.flatMap(x => x.split('')).sort();
      expect(r).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ArrayConstructor1Test078
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST7800
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1], [2]];
      const r = arr.flatMap(x => x).fill(99);
      expect(r).assertDeepEquals([99, 99]);
    });




  })
}