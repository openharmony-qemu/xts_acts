/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayCombinationCollectionsTest() {
  describe('ArrayCombinationCollectionsTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   ArrayCombinationCollectionsTest0100
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST0100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0001';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const mapped = arr.map(x => x * 2);
      let sum = 0;
      mapped.forEach(x => sum += x);
      expect(sum).assertEqual(12);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taMapped = ta.map(x => x * 2);
      let taSum = 0;
      taMapped.forEach(x => taSum += x);
      expect(taSum).assertEqual(12);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest0200
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST0200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0002';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const res = arr.map(x => x + 1).map(x => x * 2);
      expect(res).assertDeepEquals(collections.Array.from([4, 6, 8]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taRes = ta.map(x => x + 1).map(x => x * 2);
      expect(taRes).assertDeepEquals(collections.Int8Array.from(new Int8Array([4, 6, 8])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest0300
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST0300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0003';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.map(x => x * 3).filter(x => x > 6);
      /*expect(res).assertDeepEquals(collections.Array.from([9, 12,undefined,undefined]));*/
      expect(res).assertDeepEquals(collections.Array.from([9, 12]));
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.map(x => x * 3).filter(x => x > 6);
      expect(taRes).assertDeepEquals(collections.Int8Array.from(new Int8Array([9, 12])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest0400
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST0400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0004';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const res = arr.map(x => x + 1).reduce((a, b) => a + b, 0);
      expect(res).assertEqual(9);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taRes = ta.map(x => x + 1).reduce((a, b) => a + b, 0);
      expect(taRes).assertEqual(9);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest0500
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST0500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0005';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const res = arr.map(x => x * 2).reduceRight((a, b) => a - b);
      expect(res).assertEqual(0);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taRes = ta.map(x => x * 2).reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(0);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest0600
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST0600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0006';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const res = arr.map(x => x * 3).some(x => x > 8);
      expect(res).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taRes = ta.map(x => x * 3).some(x => x > 8);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest0700
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST0700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0007';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 4, 6]);
      const res = arr.map(x => x / 2).every(x => x >= 1);
      expect(res).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([2, 4, 6]));
      const taRes = ta.map(x => x / 2).every(x => x >= 1);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest0800
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST0800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0008';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const res = arr.map(x => x + 5).find(x => x === 7);
      expect(res).assertEqual(7);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taRes = ta.map(x => x + 5).find(x => x === 7);
      expect(taRes).assertEqual(7);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest0900
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST0900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0009';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const res = arr.map(x => x * 2).findIndex(x => x === 4);
      expect(res).assertEqual(1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taRes = ta.map(x => x * 2).findIndex(x => x === 4);
      expect(taRes).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest1000
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST1000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0013';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const filtered = arr.filter(x => x % 2 === 0);
      let sum = 0;
      filtered.forEach(x => sum += x);
      expect(sum).assertEqual(6);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taFiltered = ta.filter(x => x % 2 === 0);
      let taSum = 0;
      taFiltered.forEach(x => taSum += x);
      expect(taSum).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest1100
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST1100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0014';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.filter(x => x > 2).map(x => x * 2);
      expect(res).assertDeepEquals(collections.Array.from([6, 8]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.filter(x => x > 2).map(x => x * 2);
      expect(taRes).assertDeepEquals(collections.Int8Array.from(new Int8Array([6, 8])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest1200
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST1200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0015';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.filter(x => x > 1).filter(x => x < 4);
      expect(res).assertDeepEquals(collections.Array.from([2, 3,undefined]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.filter(x => x > 1).filter(x => x < 4);
      expect(taRes).assertDeepEquals(collections.Int8Array.from(new Int8Array([2, 3])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest1300
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST1300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0016';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.filter(x => x % 2 === 0).reduce((a, b) => a + b);
      expect(res).assertEqual(6);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.filter(x => x % 2 === 0).reduce((a, b) => a + b);
      expect(taRes).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest1400
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST1400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0017';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.filter(x => x > 1).reduceRight((a, b) => a - b);
      expect(res).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.filter(x => x > 1).reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest1500
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST1500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0018';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.filter(x => x > 2).some(x => x === 4);
      expect(res).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.filter(x => x > 2).some(x => x === 4);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest1600
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST1600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0019';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.filter(x => x > 1).every(x => x > 1);
      expect(res).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.filter(x => x > 1).every(x => x > 1);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest1700
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST1700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0020';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.filter(x => x > 2).find(x => x === 4);
      expect(res).assertEqual(4);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.filter(x => x > 2).find(x => x === 4);
      expect(taRes).assertEqual(4);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest1800
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST1800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0021';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.filter(x => x > 1).findIndex(x => x === 3);
      expect(res).assertEqual(1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.filter(x => x > 1).findIndex(x => x === 3);
      expect(taRes).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest1900
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST1900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0037';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const result = arr.map(x => x * 2).includes(4);
      expect(result).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taResult = ta.map(x => x * 2).includes(4);
      expect(taResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2000
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0038';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const index = arr.map(x => x + 1).indexOf(3);
      expect(index).assertEqual(1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taIndex = ta.map(x => x + 1).indexOf(3);
      expect(taIndex).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2100
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0039';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 2]);
      const index = arr.map(x => x * 2).lastIndexOf(4);
      expect(index).assertEqual(3);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 2]));
      const taIndex = ta.map(x => x * 2).lastIndexOf(4);
      expect(taIndex).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2200
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0040';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const result = arr.filter(x => x % 2 === 0).includes(4);
      expect(result).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taResult = ta.filter(x => x % 2 === 0).includes(4);
      expect(taResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2300
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0041';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const index = arr.filter(x => x > 2).indexOf(4);
      expect(index).assertEqual(1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taIndex = ta.filter(x => x > 2).indexOf(4);
      expect(taIndex).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2400
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0042';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 3]);
      const index = arr.filter(x => x >= 3).lastIndexOf(3);
      expect(index).assertEqual(2);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 3]));
      const taIndex = ta.filter(x => x >= 3).lastIndexOf(3);
      expect(taIndex).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest2500
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0058';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.slice(1, 3);
      let sum = 0;
      res.forEach(x => sum += x);
      expect(sum).assertEqual(5);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.slice(1, 3);
      let taSum = 0;
      taRes.forEach(x => taSum += x);
      expect(taSum).assertEqual(5);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2600
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0059';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.slice(1, 3).map(x => x * 2);
      expect(res).assertDeepEquals(collections.Array.from([4, 6]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.slice(1, 3).map(x => x * 2);
      expect(taRes).assertDeepEquals(collections.Int8Array.from(new Int8Array([4, 6])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2700
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0060';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]);
      const res = arr.slice(2, 5).filter(x => x % 2 === 0);
      expect(res).assertDeepEquals(collections.Array.from([4,undefined,undefined]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5]));
      const taRes = ta.slice(2, 5).filter(x => x % 2 === 0);
      expect(taRes).assertDeepEquals(collections.Int8Array.from(new Int8Array([4])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2800
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0061';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.slice(1, 4).reduce((a, b) => a + b, 0);
      expect(res).assertEqual(9);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.slice(1, 4).reduce((a, b) => a + b, 0);
      expect(taRes).assertEqual(9);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2900
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0062';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.slice(1, 4).reduceRight((a, b) => a - b);
      expect(res).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.slice(1, 4).reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3000
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0063';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.slice(1, 3).some(x => x === 3);
      expect(res).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.slice(1, 3).some(x => x === 3);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3100
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0064';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 4, 6]);
      const res = arr.slice(0, 2).every(x => x % 2 === 0);
      expect(res).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([2, 4, 6]));
      const taRes = ta.slice(0, 2).every(x => x % 2 === 0);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3200
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0065';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.slice(1, 4).find(x => x === 3);
      expect(res).assertEqual(3);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.slice(1, 4).find(x => x === 3);
      expect(taRes).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3300
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0066';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.slice(1, 4).findIndex(x => x === 4);
      expect(res).assertEqual(2);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.slice(1, 4).findIndex(x => x === 4);
      expect(taRes).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest3400
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3400
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0083';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([2, 3, 4]));
      const index = concated.indexOf(3);
      expect(index).assertEqual(3);
      const index2 = concated.indexOf(5);
      expect(index2).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest3500
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3500
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0084';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([2, 3, 4]));
      const lastIdx = concated.lastIndexOf(2);
      expect(lastIdx).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest3600
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3600
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0085';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([10, 20, 30, 40]);
      const sliced = arr.slice(1, 3);
      const result = sliced.includes(30);
      expect(result).assertEqual(true);
      const result2 = sliced.includes(10);
      expect(result2).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest3700
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3700
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0086';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([5, 6, 7, 8, 9]);
      const sliced = arr.slice(2);
      const index = sliced.indexOf(8);
      expect(index).assertEqual(1);
      const index2 = sliced.indexOf(5);
      expect(index2).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest3800
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3800
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0087';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([5, 6, 7, 8, 7]);
      const sliced = arr.slice(1);
      const index = sliced.lastIndexOf(7);
      expect(index).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest3900
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3900
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0091';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([3, 4]));
      const len = concated.push(5);
      expect(len).assertEqual(5);
      expect([...concated]).assertDeepEquals([1, 2, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest4000
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST4000
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0092';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([3, 4]));
      const popped = concated.pop();
      expect(popped).assertEqual(4);
      expect([...concated]).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest4100
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST4100
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0093';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([10, 20]);
      const concated = arr.concat(collections.Array.from([30, 40]));
      const shifted = concated.shift();
      expect(shifted).assertEqual(10);
      expect([...concated]).assertDeepEquals([20, 30, 40]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest4200
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST4200
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0094';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 4]);
      const concated = arr.concat(collections.Array.from([5, 6]));
      const len = concated.unshift(1, 2);
      expect(len).assertEqual(6);
      expect([...concated]).assertDeepEquals([1, 2, 3, 4, 5, 6]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest4300
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST4300
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0095';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([3, 4, 5]));
      const removed = concated.splice(1, 2, 9, 9);
      expect([...removed]).assertDeepEquals([2, 3]);
      expect([...concated]).assertDeepEquals([1, 9, 9, 4, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest4400
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST4400
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0096';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1]).concat(collections.Array.from([5, 4, 2])).sort();
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest4500
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST4500
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0097';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([3, 4, 5]));
      const reversed = concated.reverse();
      expect([...reversed]).assertDeepEquals([5, 4, 3, 2, 1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest4600
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST4600
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0098';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([3, 4, 5]));
      const copied = concated.copyWithin(1, 3);
      expect([...copied]).assertDeepEquals([1, 4, 5, 4, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest4700
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST4700
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0099';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([3, 4, 5]));
      const filled = concated.fill(9, 2, 4);
      expect([...filled]).assertDeepEquals([1, 2, 9, 9, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest4800
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST4800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const sliced = arr.slice(1, 3);
      const len = sliced.push(9);
      expect(len).assertEqual(3);
      expect([...sliced]).assertDeepEquals([2, 3, 9]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest4900
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST4900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0101';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]).slice(1, 4);

      const popped = arr.pop();
      expect(popped).assertEqual(4);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest5000
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST5000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0102';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([10, 20, 30, 40]).slice(1, 3);
      const shifted = arr.shift();
      expect(shifted).assertEqual(20);
      expect(arr).assertDeepEquals(collections.Array.from([30]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest5100
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST5100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0103';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 4, 5, 6]).slice(1, 3);
      const len = arr.unshift(1, 2);
      expect(len).assertEqual(4);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 4, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest5200
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST5200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0104';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]).slice(1, 4);
      const removed = arr.splice(1, 1, 9);
      expect(removed).assertDeepEquals(collections.Array.from([3]));
      expect(arr).assertDeepEquals(collections.Array.from([2, 9, 4]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest5300
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST5300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0105';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([5, 4, 3, 2, 1]).slice(1, 4).sort();
      expect(arr).assertDeepEquals(collections.Array.from([2, 3, 4]));
      const ta = collections.Int8Array.from(new Int8Array([5, 4, 3, 2, 1])).slice(1, 4).sort();
      expect(ta).assertDeepEquals(collections.Int8Array.from(new Int8Array([2, 3, 4])));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest5400
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST5400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0106';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]).slice(1, 4).reverse();
      expect(arr).assertDeepEquals(collections.Array.from([4, 3, 2]));
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5])).slice(1, 4).reverse();
      expect(ta).assertDeepEquals(collections.Int8Array.from(new Int8Array([4, 3, 2])));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest5500
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST5500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0107';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]).slice().copyWithin(1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([1, 4, 5, 4, 5]));
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5])).slice().copyWithin(1, 3);
      expect(ta).assertDeepEquals(collections.Int8Array.from(new Int8Array([1, 4, 5, 4, 5])));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest5600
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST5600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest0108';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]).slice().fill(9, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 9, 4, 5]));
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5])).slice().fill(9, 1, 3);
      expect(ta).assertDeepEquals(collections.Int8Array.from(new Int8Array([1, 9, 9, 4, 5])));
      console.info(`${caseName}, test end`);
    });

  });
}
