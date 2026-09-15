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

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function CollectionsArrayCombination1Test() {
  describe('CollectionsArrayCombination1Test', () => {
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
     * @tc.name   builtinsArrayConstructor1Test001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0140
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([]);
      const typedArr = new Int32Array([]);
      expect(arr.map(x => x).sort()).assertDeepEquals([]);
      expect(Int32Array.from(typedArr.map(x => x)).sort()).assertDeepEquals(Int32Array.from([]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0180
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const typedArr = new Int32Array([1, 2, 3]);
      expect(arr.filter(x => x > 10).reverse()).assertDeepEquals([]);
      expect(Int32Array.from(typedArr.filter(x => x > 10)).reverse()).assertDeepEquals(Int32Array.from([]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0220
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1]]);
      const typedArr = Array.from([new Float32Array([5])]);

      const r2 = Float32Array.from(Array.from(typedArr).flatMap(x => Array.from(x))).fill(99);
      expect(Array.from(arr).flatMap(x => x).fill(99)).assertDeepEquals([99]);
      expect(r2).assertDeepEquals(Float32Array.from([99]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0259
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2]);
      const typedArr = new Int32Array([1, 2]);
      const r1 = arr.map(x => x).copyWithin(10, 0);
      const r2 = Int32Array.from(typedArr.map(x => x)).copyWithin(10, 0);
      expect(r1).assertDeepEquals([1, 2]);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2]));
    });



    /**
     * @tc.name   builtinsArrayConstructor1Test005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0297
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([NaN, 2, 1]);
      const typedArr: Float32Array = new Float32Array([NaN, 2, 1]);
      const r1 = arr.filter(x => true).sort();
      const r2 = Float32Array.from(typedArr.filter(x => true)).sort((a, b) => {
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
     * @tc.name   builtinsArrayConstructor1Test006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0333
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[], [1], []]);
      const typedArr = Array.from([new Int32Array([]), new Int32Array([1]), new Int32Array([])]);
      const r1 = Array.from(arr).flatMap(x => x).reverse();
      const flattened: number[] = Array.from([]);
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
     * @tc.name   builtinsArrayConstructor1Test007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0369
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test007()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0404
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([10, 20, 30, 40]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.filter(x => x >= 20).copyWithin(-1, 0, 1);
      const r2 = Int32Array.from(typedArr.filter(x => x >= 20)).copyWithin(-1, 0, 1);
      expect(r1).assertDeepEquals([20, 30, 20]);
      expect(r2).assertDeepEquals(Int32Array.from([20, 30, 20]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0436
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([42]);
      const typedArr = new Int32Array(arr);
      expect(arr.map(x => x).reverse()).assertDeepEquals([42]);
      expect(Int32Array.from(typedArr.map(x => x)).reverse()).assertDeepEquals(Int32Array.from([42]));

    });

    /**
     * @tc.name   builtinsArrayConstructor1Test010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0466
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[Infinity], [-Infinity], [0]]);
      const typedArr = Array.from([new Float32Array([Infinity]), new Float32Array([-Infinity]), new Float32Array([0])]);
      const r1 = Array.from(arr).flatMap(x => x).sort((a, b) => a - b);
      const r2 = Float32Array.from(typedArr.flatMap(x => Array.from(x))).sort((a, b) => a - b);
      expect(r1).assertDeepEquals([-Infinity, 0, Infinity]);
      expect(r2).assertDeepEquals(Float32Array.from([-Infinity, 0, Infinity]));

    });

    /**
     * @tc.name   builtinsArrayConstructor1Test011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0492
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.filter(x => true).fill(999, 2, 2);
      const r2 = Int32Array.from(typedArr.filter(x => true)).fill(999, 2, 2);
      expect(r1).assertDeepEquals([1, 2, 3]);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2, 3]));

    });

    /**
     * @tc.name   builtinsArrayConstructor1Test012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0517
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.map(x => x).copyWithin(0, 2, 1);
      const r2 = Int32Array.from(typedArr.map(x => x)).copyWithin(0, 2, 1);
      expect(r1).assertDeepEquals([1, 2, 3]);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2, 3]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0538
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[[1]], [[2]]]);
      const r1 = arr.flatMap(x => x).reverse();
      expect(r1).assertDeepEquals([[2], [1]]);
      const typedSim = Array.from([new Int32Array([1]), new Int32Array([2])]);
      const r2 = Int32Array.from(typedSim.flatMap(x => Array.from(x))).reverse();
      expect(r2).assertDeepEquals(Int32Array.from([2, 1]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0555
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([5, 5, 5]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.filter(x => true).sort();
      const r2 = Int32Array.from(typedArr.filter(x => true)).sort();
      expect(r1).assertDeepEquals([5, 5, 5]);
      expect(r2).assertDeepEquals(Int32Array.from([5, 5, 5]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0572
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.map(x => x).fill(88, 0, 10);
      const r2 = Int32Array.from(typedArr.map(x => x)).fill(88, 0, 10);
      expect(r1).assertDeepEquals([88]);
      expect(r2).assertDeepEquals(Int32Array.from([88]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0587
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1, 2, 3]]);
      const typedArr = Array.from([new Int32Array([1, 2, 3])]);
      const r1 = arr.flatMap(x => x).copyWithin(1, 0, 2);
      const r2 = Int32Array.from(typedArr.flatMap(x => Array.from(x))).copyWithin(1, 0, 2);
      expect(r1).assertDeepEquals([1, 1, 2]);
      expect(r2).assertDeepEquals(Int32Array.from([1, 1, 2]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0602
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, undefined, 3]);
      const r1 = arr.filter(x => x !== undefined).reverse();
      expect(r1).assertDeepEquals([3, 1]);
      const typedArr =new Float32Array([1, NaN, 3]);
      const r2 = Float32Array.from(typedArr.filter(x => !Number.isNaN(x))).reverse();
      expect(r2).assertDeepEquals(Float32Array.from([3, 1]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0616
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([3, 1, 2]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.map(x => x).sort(() => 0);
      expect(r1.length).assertEqual(3);
      expect(r1.every(x => [1,2,3].includes(x))).assertTrue();
      const r2 = Int32Array.from(typedArr.map(x => x)).sort(() => 0);
      expect(r2.length).assertEqual(3);
      expect(r2.every(x => [1,2,3].includes(x))).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0629
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([['a'], ['b']]);
      const r1 = arr.flatMap(x => x).fill('X', 1);
      expect(r1).assertDeepEquals(['a', 'X']);
      const typedArr = Array.from([new Int32Array([10]), new Int32Array([20])]);
      const r2 = Int32Array.from(
        typedArr.flatMap(x => Array.from(x))
      ).fill(999, 1);

      expect(r2).assertDeepEquals(Int32Array.from([10, 999]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0020
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const typedArr = new Int32Array(arr);
      const r1 = arr.filter(x => x === 2).copyWithin(0, 0);
      const r2 = Int32Array.from(typedArr.filter(x => x === 2)).copyWithin(0, 0);
      expect(r1).assertDeepEquals([2]);
      expect(r2).assertDeepEquals(Int32Array.from([2]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0021
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test021()).assertDeepEquals([[1, -0, 0], true, [1, -0, 0], true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0022
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[], [], []]);
      const typedArr = Array.from([new Int32Array([]), new Int32Array([]), new Int32Array([])]);
      const r1 = Array.from(arr).flatMap(x => x).sort();
      const r2 = Int32Array.from(typedArr.flatMap(x => Array.from(x))).sort();
      expect(r1).assertDeepEquals([]);
      expect(r2).assertDeepEquals(Int32Array.from([]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0023
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const typedArr =new Float32Array([1, 2, 3]);
      const r1 = arr.filter(x => x > 1).fill(NaN);
      const r2 = Float32Array.from(typedArr.filter(x => x > 1)).fill(NaN);
      expect(r1.length).assertEqual(2);
      expect(Number.isNaN(r1[0])).assertTrue();
      expect(Number.isNaN(r1[1])).assertTrue();
      expect(r2.length).assertEqual(2);
      expect(Number.isNaN(r2[0])).assertTrue();
      expect(Number.isNaN(r2[1])).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0024
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([10, 20]);
      const typedArr = new Int32Array([10, 20]);
      const r1 = arr.map(x => x).copyWithin(-5, 0, 1);
      const r2 = Int32Array.from(typedArr.map(x => x)).copyWithin(-5, 0, 1);
      expect(r1).assertDeepEquals([10, 20]);
      expect(r2).assertDeepEquals(Int32Array.from([10, 20]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0025
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from(['ab']);
      const r1 = arr.flatMap(x => x.split('')).reverse();
      expect(r1).assertDeepEquals(['b', 'a']);
      const typedArr = Array.from([new Int32Array([1, 2])]);
      const r2 = Int32Array.from(typedArr.flatMap(x => Array.from(x))).reverse();
      expect(r2).assertDeepEquals(Int32Array.from([2, 1]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0026
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test026()).assertDeepEquals([[10, 20, 30, 40, 50, 60, 70, 80, 90, 100], [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0027
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3, 4]);
      const typedArr = new Int32Array([1, 2, 3, 4]);
      const r1 = arr.map(x => x).fill(777, -2);
      const r2 = Int32Array.from(typedArr.map(x => x)).fill(777, -2);
      expect(r1).assertDeepEquals([1, 2, 777, 777]);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2, 777, 777]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0028
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([[1, 2, 3]]);
      const typedArr = Array.from([new Int32Array([1, 2, 3])]);
      const r1 = Array.from(arr).flatMap(x => x).copyWithin(0, 1, 1);
      const r2 = Int32Array.from(typedArr.flatMap(x => Array.from(x))).copyWithin(0, 1, 1);
      expect(r1).assertDeepEquals([1, 2, 3]);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2, 3]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0029
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([3, 1, 4, 1, 5]);
      const typedArr = new Int32Array([3, 1, 4, 1, 5]);
      const r1 = arr.filter(x => true).reverse();
      const r2 = Int32Array.from(typedArr.filter(x => true)).reverse();
      expect(r1).assertDeepEquals([5, 1, 4, 1, 3]);
      expect(r2).assertDeepEquals(Int32Array.from([5, 1, 4, 1, 3]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0030
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test030()).assertDeepEquals([true, true, [0, 0]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0031
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let caught = false;
      try {
        [1, 2].map(x => { if (x === 2) throw new Error("boom"); return x; }).sort();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      try {
        new Int32Array([1, 2]).map(x => { if (x === 2) throw new Error("boom"); return x; });
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0032
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test032()).assertDeepEquals([[999, 999], [999, 999]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0033
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from(["hi"]);
      const r1 = arr.flatMap(x => x).reverse();
      expect(r1).assertDeepEquals(["hi"]);
      const typedSim =new Int32Array([1, 2]);
      const r2 = Int32Array.from(typedSim.map(x => x)).reverse();
      expect(r2).assertDeepEquals(Int32Array.from([2, 1]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0034
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const orig = Array.from([1, 2, 3]);
      const result = orig.map(x => x * 2).copyWithin(0, 1);
      expect(orig).assertDeepEquals([1, 2, 3]);
      expect(result).assertDeepEquals([4, 6, 6]);
      const typedOrig = new Int32Array([1, 2, 3]);
      const temp = Int32Array.from(typedOrig.map(x => x * 2));
      const typedResult = temp.copyWithin(0, 1);
      expect(Array.from(typedOrig)).assertDeepEquals([1, 2, 3]);
      expect(typedResult).assertDeepEquals(Int32Array.from([4, 6, 6]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0035
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([3, 1, 2]);
      const r1 = arr.filter(x => true).sort(() => NaN);
      expect(r1.length).assertEqual(3);
      expect([1,2,3].includes(r1[0])).assertTrue();
      const typedArr = new Int32Array([3,1,2]);
      const r2 = Int32Array.from(typedArr.filter(x => true)).sort(() => NaN);
      expect(r2.length).assertEqual(3);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0036
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test036()).assertDeepEquals([[1, null], [1, null]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0037
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2]);
      const r1 = arr.map(x => x).reverse().map(x => x * 10);
      expect(r1).assertDeepEquals([20, 10]);
      const typedArr = new Int32Array([1, 2]);
      const r2 = Int32Array.from(typedArr.map(x => x)).reverse().map(x => x * 10);
      expect(r2).assertDeepEquals(Int32Array.from([20, 10]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0038
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a = Array.from([10, 20, 30]);
      const filtered = a.filter(x => x > 10);
      const copied = filtered.copyWithin(0, 1);
      expect(a).assertDeepEquals([10, 20, 30]);
      expect(filtered).assertDeepEquals([30, 30]);
      expect(copied).assertDeepEquals([30,30]);
      const typedA = new Int32Array([10,20,30]);
      const tFiltered = Int32Array.from(typedA.filter(x => x > 10));
      const tCopied = tFiltered.copyWithin(0, 1);
      expect(typedA).assertDeepEquals(Int32Array.from([10,20,30]));
      expect(tFiltered).assertDeepEquals(Int32Array.from([30,30]));
      expect(tCopied).assertDeepEquals(Int32Array.from([30,30]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0039
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const r1 = arr.flatMap(x => []);
      expect(r1.sort()).assertDeepEquals([]);
      const typedArr = new Int32Array([1, 2, 3]);
      const r2 = Array.from(Array.from(typedArr).flatMap(x => []));
      expect(r2.sort()).assertDeepEquals(Array.from([]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0040
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3, 4]);
      const r1 = arr.map(x => x).fill(888, 1.7, 3.9);
      expect(r1).assertDeepEquals([1, 888, 888, 4]);
      const typedArr = new Int32Array([1,2,3,4]);
      const r2 = Int32Array.from(typedArr.map(x => x)).fill(888, 1.7, 3.9);
      expect(r2).assertDeepEquals(Int32Array.from([1, 888, 888, 4]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0041
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      let count = 0;
      const r1 = arr.filter(x => {
        count++;
        return x > 1;
      }).reverse();
      expect(count).assertEqual(3);
      expect(r1).assertDeepEquals([3, 2]);
      const typedArr = new Int32Array([1,2,3]);
      count = 0;
      const r2 = Int32Array.from(typedArr.filter(x => {
        count++;
        return x > 1;
      })).reverse();
      expect(count).assertEqual(3);
      expect(r2).assertDeepEquals(Int32Array.from([3, 2]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0042
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2]);
      const r1 = arr.copyWithin(100, 0, 1);
      expect(r1).assertDeepEquals([1, 2]);
      const typedArr = new Int32Array([1, 2]);
      const r2 = typedArr.copyWithin(100, 0, 1);
      expect(r2).assertDeepEquals(Int32Array.from([1, 2]));
    });
    /**
     * @tc.name   builtinsArrayConstructor1Test043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0043
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let factor = -1;
      const arr = Array.from([1, 3, 2]);
      const r1 = arr.map(x => x).sort((a, b) => factor * (a - b));
      expect(r1).assertDeepEquals([3, 2, 1]);
      factor = 1;
      const typedArr = new Int32Array([1,3,2]);
      const r2 = Int32Array.from(typedArr.map(x => x)).sort((a, b) => factor * (a - b));
      expect(r2).assertDeepEquals(Int32Array.from([1, 2, 3]));
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0044
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test044()).assertDeepEquals([{ "a": 1 }, { "a": 1 }, [999, 999]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0045
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array1.ArrayConstructor1Test045()).assertDeepEquals([['y', 'x'], [20, 10]]);
    });

    /**
     * @tc.name   builtinsArrayConstructor1Test046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0046
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3, 4, 5]);
      const r1 = arr
        .map(x => x * 2)
        .filter(x => x > 4)
        .copyWithin(0, 1);
      expect(r1).assertDeepEquals([8, 10, 10]);
      const typedArr = new Int32Array([1,2,3,4,5]);
