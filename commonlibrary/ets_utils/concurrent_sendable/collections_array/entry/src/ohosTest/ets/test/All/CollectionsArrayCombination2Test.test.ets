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
import * as Array2 from './ArrayCombination2';
import { collections } from '@kit.ArkTS';
function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function CollectionsArrayCombination2Test() {
  describe('CollectionsArrayCombination2Test', () => {
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
     * @tc.name   builtinsArrayConstructor2Test001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0141
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3]);
      const typedArr = new collections.Int32Array(arr);
      const suffix = collections.Array.from([4, 5]);
      const typedSuffix = new collections.Int32Array(suffix);
      const resultArr = arr.concat(suffix).includes(4);
      expect(resultArr).assertEqual(true);
      const typedConcat = collections.Int32Array.from([...typedArr, ...typedSuffix]);
      const resultTyped = typedConcat.includes(4);
      expect(resultTyped).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0181
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(['a', 'b']);
      const typedArr = new collections.Uint8Array([10, 20]);
      const extra = collections.Array.from(['c']);
      const typedExtra = new collections.Uint8Array([30]);
      const idxArr = arr.concat(extra).indexOf('c');
      expect(idxArr).assertEqual(2);
      const typedConcat = collections.Uint8Array.from([...typedArr, ...typedExtra]);
      const idxTyped = typedConcat.indexOf(30);
      expect(idxTyped).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0221
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 1]);
      const typedArr = new collections.Int16Array([5, 6, 5]);
      const tail = collections.Array.from([1]);
      const typedTail = new collections.Int16Array([5]);
      const lastIdxArr = arr.concat(tail).lastIndexOf(1);
      expect(lastIdxArr).assertEqual(3);
      const typedConcat = collections.Int16Array.from([...typedArr, ...typedTail]);
      const lastIdxTyped = typedConcat.lastIndexOf(5);
      expect(lastIdxTyped).assertEqual(3);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0260
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([10, 20, 30, 40]);
      const typedArr = new collections.Float32Array([1.1, 2.2, 3.3, 4.4]);
      const slicedIncludes = arr.slice(1, 3).includes(30);
      expect(slicedIncludes).assertEqual(true);
      const typedSliced = typedArr.slice(1, 3);
      const typedIncludes = typedSliced.includes(3.3);
      expect(typedIncludes).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0298
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(['x', 'y', 'z', 'y']);
      const typedArr = new collections.Int8Array([7, 8, 9, 8]);
      const slicedIdx = arr.slice(1).indexOf('y');
      expect(slicedIdx).assertEqual(0);
      const typedSliced = typedArr.slice(1);
      const typedIdx = typedSliced.indexOf(8);
      expect(typedIdx).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0334
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3, 4]);
      const target = 3;
      const typedArr = new collections.Int32Array([1,2,3,4]);

      expect(Array.from(arr).flat().includes(target)).assertEqual(true);
      const typedIncludes = typedArr.includes(target);
      expect(typedIncludes).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0370
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([10, 20, 30]);
      const target = 30;
      const typedArr = new collections.Int16Array([10, 20, 30]);
      expect(Array.from(arr).flat().indexOf(target)).assertEqual(2);
      const typedIdx = typedArr.indexOf(target);
      expect(typedIdx).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0405
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([5, 5, 6, 5]);
      const target = 5;
      const typedArr = new collections.Uint8Array([5, 5, 6, 5]);
      expect(Array.from(arr).flat(0).lastIndexOf(target)).assertEqual(3);
      const typedLastIdx = typedArr.lastIndexOf(target);
      expect(typedLastIdx).assertEqual(3);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0437
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3, 2, 4]);
      const typedArr = new collections.Int32Array(arr);
      const slicedLastIdx = arr.slice(1, -1).lastIndexOf(2);
      expect(slicedLastIdx).assertEqual(2);

      const typedSliced = typedArr.slice(1, -1);
      const typedLastIdx = typedSliced.lastIndexOf(2);
      expect(typedLastIdx).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0467
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test010()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0493
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2]);
      const suffix = collections.Array.from([3]);
      const typedArr = new collections.Int32Array(arr);
      const typedSuffix = new collections.Int32Array(suffix);

      expect(arr.concat(suffix).includes(99)).assertEqual(false);
      const typedConcat = collections.Int32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(99)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0518
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1]);
      const suffix = collections.Array.from([2, 1]);
      const typedArr = new collections.Int32Array(arr);
      const typedSuffix = new collections.Int32Array(suffix);

      expect(arr.concat(suffix).indexOf(1)).assertEqual(0);
      const typedConcat = collections.Int32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.indexOf(1)).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0539
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([5, 6, 5]);
      const suffix = collections.Array.from([7, 5]);
      const typedArr = new collections.Int16Array([5, 6, 5]);
      const typedSuffix = new collections.Int16Array([7, 5]);

      expect(arr.concat(suffix).lastIndexOf(5)).assertEqual(4);
      const typedConcat = collections.Int16Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.lastIndexOf(5)).assertEqual(4);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0556
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([10, 20, 30, 40]);
      const typedArr = new collections.Int32Array(arr);

      expect(arr.slice(1, -1).includes(30)).assertEqual(true);
      expect(typedArr.slice(1, -1).includes(30)).assertEqual(true);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0573
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2]);
      const typedArr = new collections.Uint8Array([1, 2]);

      expect(arr.slice(5, 10).includes(1)).assertEqual(false);
      expect(typedArr.slice(5, 10).includes(1)).assertEqual(false);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0588
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2]);
      const typedArr = new collections.Int32Array(arr);

      expect(arr.slice(2).indexOf(1)).assertEqual(-1);
      expect(typedArr.slice(2).indexOf(1)).assertEqual(-1);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0603
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(['a']);
      const typedArr = new collections.Int8Array([97]);

      expect(arr.slice(0, 1).lastIndexOf('a')).assertEqual(0);
      expect(typedArr.slice(0, 1).lastIndexOf(97)).assertEqual(0);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0617
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1]);
      const typedArr = new collections.Int32Array([1]);
      expect(Array.from(arr).flat().includes(2)).assertEqual(false);
      expect(typedArr.includes(2)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0630
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([ , 1,  ]);
      const typedArr = new collections.Int32Array([1]);

      expect(Array.from(arr).flat().includes(1)).assertEqual(true);
      expect(typedArr.includes(1)).assertEqual(true);
    });


    /**
     * @tc.name   builtinsArrayConstructor2Test020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0642
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, '2']);
      const suffix = collections.Array.from(['3']);
      const typedArr = new collections.Float32Array([1.0, 2.0]);
      const typedSuffix = new collections.Float32Array([3.0]);

      expect(arr.concat(suffix).includes('2')).assertEqual(true);
      const typedConcat = collections.Float32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(2.0)).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0654
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([10, 20, 30]);
      const typedArr = new collections.Int32Array(arr);

      expect(arr.slice(-2).indexOf(30)).assertEqual(1);
      expect(typedArr.slice(-2).indexOf(30)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0664
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([7, 8, 7]);
      const typedArr = new collections.Int8Array([7, 8, 7]);

      expect(arr.slice().lastIndexOf(7)).assertEqual(2);
      expect(typedArr.slice().lastIndexOf(7)).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0673
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, null, null]);
      const typedArr = new collections.Int32Array([1, 2]);
      expect(Array.from(arr).flat().includes(null)).assertEqual(true);
      expect(typedArr.includes(0)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0681
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1]);
      const suffix = new collections.Int32Array([2]);
      const typedArr = new collections.Uint8Array([1]);
      const typedSuffix = new collections.Int32Array([2]);

      expect(arr.concat(suffix).indexOf(2)).assertEqual(-1);
      const typedConcat = collections.Uint8Array.from([...typedArr, ...new collections.Uint8Array(typedSuffix)]);
      expect(typedConcat.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0688
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3]);
      const typedArr = new collections.Int32Array(arr);

      expect(arr.slice(1, 1).includes(2)).assertEqual(false);
      expect(typedArr.slice(1, 1).includes(2)).assertEqual(false);
    });



    /**
     * @tc.name   builtinsArrayConstructor2Test026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0693
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([5, 5]);
      const suffix = collections.Array.from([5]);
      const typedArr = new collections.Int32Array(arr);
      const typedSuffix = new collections.Int32Array(suffix);

      expect(arr.concat(suffix).lastIndexOf(5)).assertEqual(2);
      const typedConcat = collections.Int32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.lastIndexOf(5)).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0698
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Array2.ArrayConstructor2Test030()).assertDeepEquals([9, 9]);
    });



    /**
     * @tc.name   builtinsArrayConstructor2Test028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0703
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, , 3]);
      const suffix = collections.Array.from([4]);
      const typedArr = new collections.Int32Array([1,3]);
      const typedSuffix = new collections.Int32Array(suffix);
      expect(arr.concat(suffix).includes(undefined)).assertEqual(true);
      const typedConcat = collections.Int32Array.from([...typedArr, ...typedSuffix]);
      expect(typedConcat.includes(0)).assertEqual(false);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0707
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3, 2]);
      const typedArr = new collections.Int32Array(arr);
      expect(arr.slice(0, 3).lastIndexOf(2)).assertEqual(1);
      expect(typedArr.slice(0, 3).lastIndexOf(2)).assertEqual(1);

    });

    /**
     * @tc.name   builtinsArrayConstructor2Test030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0710
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(['1', '2']);
      const typedArr = new collections.Int32Array([1, 2]);

      expect(Array.from(arr).flat().indexOf('2')).assertEqual(1);
      expect(typedArr.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0713
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConstructor2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1]);
      const a1 = collections.Array.from([2]);
      const a2 = collections.Array.from([3]);
      const typedArr = new collections.Int32Array(arr);
      const t1 = new collections.Int32Array(a1);
      const t2 = new collections.Int32Array(a2);

      expect(arr.concat(a1, a2).indexOf(3)).assertEqual(2);
      const typedConcat = collections.Int32Array.from([...typedArr, ...t1, ...t2]);
      expect(typedConcat.indexOf(3)).assertEqual(2);
    });

    /**
     * @tc.name   builtinsArrayConstructor2Test032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0715
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
