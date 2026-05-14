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
import { collections } from '@kit.ArkTS';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayCombinationCollectionsTest2() {
  describe('ArrayCombinationCollectionsTest2', (): void => {
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
     * @tc.name   ArrayCombinationCollectionsTest2001
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2001
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2001';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const result = arr.concat(collections.Array.from([4, 5])).slice(1, 4);
      expect(result).assertDeepEquals(collections.Array.from([2, 3, 4]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2002
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2002
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2002';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([10, 20, 30, 40]);
      const result = arr.slice(1, 3).concat(collections.Array.from([50, 60]));
      expect(result).assertDeepEquals(collections.Array.from([20, 30, 50, 60]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2003
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2003
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2003';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const result = arr.concat(collections.Array.from([3])).concat(collections.Array.from([4, 5]));
      expect(result).assertDeepEquals(collections.Array.from([1, 2, 3, 4, 5]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2004
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2004
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2004';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([0, 1, 2, 3, 4, 5]);
      const result = arr.slice(1, 5).slice(1, 3);
      expect(result).assertDeepEquals(collections.Array.from([2, 3]));

      const ta = collections.Int8Array.from(new Int8Array([0, 1, 2, 3, 4, 5]));
      const taResult = ta.slice(1, 5).slice(1, 3);
      expect(taResult).assertDeepEquals(collections.Int8Array.from(new Int8Array([2, 3])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2005
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2005
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2005';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.push(4);
      let sum = 0;
      arr.forEach(v => sum += v);
      expect(sum).assertEqual(10);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      let sum2 = 0;
      ta.forEach(v => sum2 += v);
      expect(sum2).assertEqual(10);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2006
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2006
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2006';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]).map(x => x * 2);
      expect(arr).assertDeepEquals(collections.Array.from([2, 4, 6, 8]));
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4])).map(x => x * 2);
      expect(ta).assertDeepEquals(collections.Int8Array.from(new Int8Array([2, 4, 6, 8])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2007
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2007
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2007';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]);
      const result = arr.filter(x => x % 2 === 0);
      expect(result).assertDeepEquals(collections.Array.from([2, 4,undefined,undefined,undefined]));
      expect(result[0]).assertDeepEquals(2)
      expect(result[1]).assertDeepEquals(4)
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5]));
      const filtered = ta.filter(x => x % 2 === 0);
      expect(filtered).assertDeepEquals(collections.Int8Array.from(new Int8Array([2, 4])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2008
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2008
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2008';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const result = arr.reduce((a, b) => a + b, 0);
      expect(result).assertEqual(10);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taSum = ta.reduce((a, b) => a + b);
      expect(taSum).assertEqual(10);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2009
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2009
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2009';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const result = arr.reduceRight((a, b) => a - b);
      expect(result).assertEqual(4 - 3 - 2 - 1);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(4 - 3 - 2 - 1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2010
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2010
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2010';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const result = arr.some(x => x > 3);
      expect(result).assertEqual(true);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taResult = ta.some(x => x > 3);
      expect(taResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2011
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2011
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2011';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const result = arr.every(x => x > 0);
      expect(result).assertEqual(true);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taResult = ta.every(x => x > 0);
      expect(taResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2012
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2012
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2012';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const val = arr.find(x => x > 2);
      expect(val).assertEqual(3);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taVal = ta.find(x => x > 2);
      expect(taVal).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2013
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2013
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2013';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const idx = arr.findIndex(x => x === 3);
      expect(idx).assertEqual(2);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taIdx = ta.findIndex(x => x === 3);
      expect(taIdx).assertEqual(2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2014
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2014
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2014';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.pop();
      let sum = 0;
      arr.forEach(x => sum += x);
      expect(sum).assertEqual(6);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const arr2 = ta.slice(0, -1);
      let s = 0;
      arr2.forEach(x => s += x);
      expect(s).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2015
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2015
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2015';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.pop();
      const result = arr.map(x => x * 2);
      expect(result).assertDeepEquals(collections.Array.from([2, 4]));
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const mapped = ta.slice(0, -1).map(x => x * 2);
      expect(mapped).assertDeepEquals(collections.Int8Array.from(new Int8Array([2, 4])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2016
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2016
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2016';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.pop();
      const result = arr.filter(x => x % 2 === 0);
      expect(result).assertDeepEquals(collections.Array.from([2,undefined,undefined]));
      expect(result[0]).assertDeepEquals(2)
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const filtered = ta.slice(0, -1).filter(x => x % 2 === 0);
      expect(filtered).assertDeepEquals(collections.Int8Array.from(new Int8Array([2])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2017
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2017
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2017';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.pop();
      const res = arr.reduce((a, b) => a + b, 0);
      expect(res).assertEqual(6);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.slice(0, -1).reduce((a, b) => a + b);
      expect(taRes).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2018
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2018
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2018';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.pop();
      const res = arr.reduceRight((a, b) => a - b);
      expect(res).assertEqual(3 - 2 - 1);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.slice(0, -1).reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(3 - 2 - 1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2019
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2019
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2027';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.pop();
      const result = arr.some(x => x > 2);
      expect(result).assertEqual(false);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taRes = ta.slice(0, -1).some(x => x > 2);
      expect(taRes).assertEqual(false);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2020
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2020
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2028';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.pop();
      const result = arr.every(x => x > 0);
      expect(result).assertEqual(true);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taRes = ta.slice(0, -1).every(x => x > 0);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2021
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2021
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2029';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.pop();
      const val = arr.find(x => x > 1);
      expect(val).assertEqual(2);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taVal = ta.slice(0, -1).find(x => x > 1);
      expect(taVal).assertEqual(2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2022
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2022
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2030';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.pop();
      const idx = arr.findIndex(x => x === 2);
      expect(idx).assertEqual(1);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taIdx = ta.slice(0, -1).findIndex(x => x === 2);
      expect(taIdx).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2023
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2023
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2034';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.shift();
      let sum = 0;
      arr.forEach(x => sum += x);
      expect(sum).assertEqual(9);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const ta2 = ta.slice(1);
      let total = 0;
      ta2.forEach(x => total += x);
      expect(total).assertEqual(9);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2024
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2024
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2035';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.shift();
      const res = arr.map(x => x * 3);
      expect(res).assertDeepEquals(collections.Array.from([6, 9]));
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taRes = ta.slice(1).map(x => x * 3);
      expect(taRes).assertDeepEquals(collections.Int8Array.from(new Int8Array([6, 9])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2025
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2025
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2036';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.shift();
      const res = arr.filter(x => x % 2 === 0);
      expect(res).assertDeepEquals(collections.Array.from([2, 4,undefined]));
      expect(res[0]).assertDeepEquals(2);
      expect(res[1]).assertDeepEquals(4);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.slice(1).filter(x => x % 2 === 0);
      expect(taRes).assertDeepEquals(collections.Int8Array.from(new Int8Array([2, 4])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2026
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2026
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2037';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.shift();
      const sum = arr.reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(9);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taSum = ta.slice(1).reduce((a, b) => a + b);
      expect(taSum).assertEqual(9);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2027
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2027
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2038';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.shift();
      const res = arr.reduceRight((a, b) => a - b);
      expect(res).assertEqual(4 - 3 - 2);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taRes = ta.slice(1).reduceRight((a, b) => a - b);
      expect(taRes).assertEqual(4 - 3 - 2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2028
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2028
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2039';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.shift();
      const res = arr.some(x => x > 2);
      expect(res).assertEqual(true);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taRes = ta.slice(1).some(x => x > 2);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2029
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2029
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2040';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.shift();
      const res = arr.every(x => x > 0);
      expect(res).assertEqual(true);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taRes = ta.slice(1).every(x => x > 0);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2030
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2030
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2041';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.shift();
      const val = arr.find(x => x > 2);
      expect(val).assertEqual(3);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taVal = ta.slice(1).find(x => x > 2);
      expect(taVal).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2031
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2031
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2042';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.shift();
      const idx = arr.findIndex(x => x === 2);
      expect(idx).assertEqual(0);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taIdx = ta.slice(1).findIndex(x => x === 2);
      expect(taIdx).assertEqual(0);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2032
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2032
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2046';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3, 4]);
      arr.unshift(1);
      let sum = 0;
      arr.forEach(v => sum += v);
      expect(sum).assertEqual(10);

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2033
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2033
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2047';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      const mapped = arr.map(x => x * 2);
      expect(mapped).assertDeepEquals(collections.Array.from([2, 4, 6]));

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2034
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2034
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2048';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3, 4]);
      arr.unshift(1);
      const res = arr.filter(x => x % 2 === 0);
      expect(res).assertDeepEquals(collections.Array.from([2, 4,undefined,undefined]));
      expect(res[0]).assertDeepEquals(2);
      expect(res[1]).assertDeepEquals(4);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2035
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2035
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2049';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3, 4]);
      arr.unshift(1);
      const sum = arr.reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(10);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2036
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2036
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2050';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 4]);
      arr.unshift(1, 2);
      const res = arr.reduceRight((a, b) => a - b);
      expect(res).assertEqual(-2);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2037
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2037
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2051';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      const hasEven = arr.some(x => x % 2 === 0);
      expect(hasEven).assertEqual(true);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2038
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2038
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2052';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 4]);
      arr.unshift(6);
      const allEven = arr.every(x => x % 2 === 0);
      expect(allEven).assertEqual(true);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2039
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2039
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2053';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 5, 7]);
      arr.unshift(2);
      const res = arr.find(x => x > 4);
      expect(res).assertEqual(5);

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2040
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2040
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2054';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 4, 5]);
      arr.unshift(1);
      const idx = arr.findIndex(x => x === 4);
      expect(idx).assertEqual(2);

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2041
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2041
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2058';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 9, 10);
      let sum = 0;
      arr.forEach(v => sum += v);
      expect(sum).assertEqual(24);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2042
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2042
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2059';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const mapped = arr.splice(2, 1, 9).map(x => x * 2);
      expect(mapped).assertDeepEquals(collections.Array.from([6]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2043
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2043
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2060';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 1, 10);
      const res = arr.filter(x => x > 3);
      expect(res).assertDeepEquals(collections.Array.from([10, 4,undefined,undefined]));
      expect(res[0]).assertDeepEquals(10);
      expect(res[1]).assertDeepEquals(4);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2044
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2044
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2061';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.splice(1, 1, 5);
      const sum = arr.reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(9);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2045
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2045
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2062';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.splice(0, 1, 9);
      const diff = arr.reduceRight((a, b) => a - b);
      expect(diff).assertEqual(-8);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2046
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2046
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2063';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.splice(1, 1, 10);
      const hasEven = arr.some(x => x % 2 === 0);
      expect(hasEven).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2047
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2047
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2064';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 4, 6]);
      arr.splice(1, 1, 8);
      const allEven = arr.every(x => x % 2 === 0);
      expect(allEven).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2048
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2048
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2065';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.splice(0, 1, 5);
      const res = arr.find(x => x > 3);
      expect(res).assertEqual(5);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2049
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2049
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2066';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.splice(1, 1, 9);
      const idx = arr.findIndex(x => x === 9);
      expect(idx).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2050
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2050
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2070';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.sort((a, b) => a - b);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i - 1;
      }
      expect(arr).assertDeepEquals(collections.Array.from([-1, 0, 1]));

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2]));
      ta.sort();
      for (let i = 0; i < ta.length; i++) {
        ta[i] = i - 1;
      }
      expect(ta).assertDeepEquals(collections.Int8Array.from(new Int8Array([-1, 0, 1])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2051
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2051
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2071';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      const res = arr.sort().map(x => x * 2);
      expect(res).assertDeepEquals(collections.Array.from([2, 4, 6]));

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2]));
      const resTA = ta.sort().map(x => x * 2);
      expect(resTA).assertDeepEquals(collections.Int8Array.from(new Int8Array([2, 4, 6])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2052
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2052
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2072';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([4, 1, 3, 2]);
      const res = arr.sort().filter(x => x > 2);
      expect(res).assertDeepEquals(collections.Array.from([3, 4,undefined,undefined]));
      expect(res[0]).assertDeepEquals(3);
      expect(res[1]).assertDeepEquals(4);

      const ta = collections.Int8Array.from(new Int8Array([4, 1, 3, 2]));
      const resTA = ta.sort().filter(x => x > 2);
      expect(resTA).assertDeepEquals(collections.Int8Array.from(new Int8Array([3, 4])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2053
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2053
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2073';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([5, 1, 4]);
      const sum = arr.sort().reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(10);

      const ta = collections.Int8Array.from(new Int8Array([5, 1, 4]));
      const sumTA = ta.sort().reduce((a, b) => a + b);
      expect(sumTA).assertEqual(10);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2054
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2054
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2074';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 1, 3]);
      const res = arr.sort().reduceRight((a, b) => a - b);
      expect(res).assertEqual(0);

      const ta = collections.Int8Array.from(new Int8Array([2, 1, 3]));
      const resTA = ta.sort().reduceRight((a, b) => a - b);
      expect(resTA).assertEqual(0);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2055
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2055
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2075';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 2, 1]);
      const res = arr.sort().some(x => x === 2);
      expect(res).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([3, 2, 1]));
      const resTA = ta.sort().some(x => x === 2);
      expect(resTA).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2056
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2056
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2076';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const res = arr.sort().every(x => x < 5);
      expect(res).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const resTA = ta.sort().every(x => x < 5);
      expect(resTA).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2057
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2057
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2077';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 4]);
      const res = arr.sort().find(x => x > 2);
      expect(res).assertEqual(3);

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 4]));
      const resTA = ta.sort().find(x => x > 2);
      expect(resTA).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2058
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2058
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2078';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      const res = arr.sort().findIndex(x => x === 2);
      expect(res).assertEqual(1);

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2]));
      const resTA = ta.sort().findIndex(x => x === 2);
      expect(resTA).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2059
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2059
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2082';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      let res: number[] = [];
      arr.reverse().forEach(v => res.push(v));
      expect(res).assertDeepEquals([3, 2, 1]);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      let taRes: number[] = [];
      ta.reverse().forEach(v => taRes.push(v));
      expect(taRes).assertDeepEquals([3, 2, 1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2060
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2060
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2083';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const res = arr.reverse().map(v => v * 2);
      expect(res).assertDeepEquals(collections.Array.from([6, 4, 2]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const resTA = ta.reverse().map(v => v * 2);
      expect(resTA).assertDeepEquals(collections.Int8Array.from(new Int8Array([6, 4, 2])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2061
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2061
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2084';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const res = arr.reverse().filter(v => v % 2 === 0);
      expect(res).assertDeepEquals(collections.Array.from([4, 2,undefined,undefined]));
      expect(res[0]).assertDeepEquals(4);
      expect(res[1]).assertDeepEquals(2);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const resTA = ta.reverse().filter(v => v % 2 === 0);
      expect(resTA).assertDeepEquals(collections.Int8Array.from(new Int8Array([4, 2])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2062
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2062
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2085';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const sum = arr.reverse().reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(6);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taSum = ta.reverse().reduce((a, b) => a + b);
      expect(taSum).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2063
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2063
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2086';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const diff = arr.reverse().reduceRight((a, b) => a - b);
      expect(diff).assertEqual(-4);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const diffTA = ta.reverse().reduceRight((a, b) => a - b);
      expect(diffTA).assertEqual(-4);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2064
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2064
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2087';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const res = arr.reverse().some(v => v > 2);
      expect(res).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const resTA = ta.reverse().some(v => v > 2);
      expect(resTA).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2065
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2065
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2088';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 4, 6]);
      const res = arr.reverse().every(v => v % 2 === 0);
      expect(res).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([2, 4, 6]));
      const resTA = ta.reverse().every(v => v % 2 === 0);
      expect(resTA).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2066
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2066
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2089';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const res = arr.reverse().find(v => v < 3);
      expect(res).assertEqual(2);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const resTA = ta.reverse().find(v => v < 3);
      expect(resTA).assertEqual(2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2067
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2067
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2090';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const idx = arr.reverse().findIndex(v => v === 1);
      expect(idx).assertEqual(2);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const idxTA = ta.reverse().findIndex(v => v === 1);
      expect(idxTA).assertEqual(2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2068
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2068
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2094';
      console.info(`${caseName}, test start`);
      let arr = collections.Array.from([1, 2, 3, 4, 5]);
      let result: number[] = [];
      arr.copyWithin(0, 3).forEach(x => result.push(x));
      expect(result).assertDeepEquals([4, 5, 3, 4, 5]);

      let ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5]));
      let taResult: number[] = [];
      ta.copyWithin(0, 3).forEach(x => taResult.push(x));
      expect(taResult).assertDeepEquals([4, 5, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2069
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2069
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2095';
      console.info(`${caseName}, test start`);
      let arr = collections.Array.from([1, 2, 3, 4, 5]);
      let mapped = arr.copyWithin(1, 2).map(x => x * 2);
      expect(mapped).assertDeepEquals(collections.Array.from([2, 6, 8, 10, 10]));

      let ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5]));
      let taMapped = ta.copyWithin(1, 2).map(x => x * 2);
      expect(taMapped).assertDeepEquals(collections.Int8Array.from(new Int8Array([2, 6, 8, 10, 10])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2070
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2070
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2096';
      console.info(`${caseName}, test start`);
      let arr = collections.Array.from([1, 2, 3, 4, 5]);
      let filtered = arr.copyWithin(2, 0).filter(x => x > 2);
      expect(filtered).assertDeepEquals(collections.Array.from([3,undefined,undefined,undefined,undefined]));
      expect(filtered[0]).assertDeepEquals(3);

      let ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5]));
      let taFiltered = ta.copyWithin(2, 0).filter(x => x > 2);
      expect(taFiltered).assertDeepEquals(collections.Int8Array.from(new Int8Array([3])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2071
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2071
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2097';
      console.info(`${caseName}, test start`);
      let arr = collections.Array.from([1, 2, 3, 4]);
      let sum = arr.copyWithin(1, 2).reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(12);

      let ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      let taSum = ta.copyWithin(1, 2).reduce((a, b) => a + b, 0);
      expect(taSum).assertEqual(12);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2072
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2072
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2098';
      console.info(`${caseName}, test start`);
      let arr = collections.Array.from([1, 2, 3, 4]);
      let res = arr.copyWithin(0, 2).reduceRight((a, b) => a - b, 0);
      expect(res).assertEqual((((0 - 4) - 3) - 3) - 4);

      let ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      let taRes = ta.copyWithin(0, 2).reduceRight((a, b) => a - b, 0);
      expect(taRes).assertEqual((((0 - 4) - 3) - 3) - 4);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2073
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2073
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2099';
      console.info(`${caseName}, test start`);
      let arr = collections.Array.from([1, 2, 3, 4]);
      let res = arr.copyWithin(0, 2).some(x => x === 3);
      expect(res).assertEqual(true);

      let ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      let taRes = ta.copyWithin(0, 2).some(x => x === 3);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2074
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2074
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2100';
      console.info(`${caseName}, test start`);
      let arr = collections.Array.from([2, 4, 6]);
      let res = arr.copyWithin(1, 2).every(x => x % 2 === 0);
      expect(res).assertEqual(true);

      let ta = collections.Int8Array.from(new Int8Array([2, 4, 6]));
      let taRes = ta.copyWithin(1, 2).every(x => x % 2 === 0);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest2075
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2075
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2101';
      console.info(`${caseName}, test start`);
      let arr = collections.Array.from([1, 2, 3, 4]);
      let found = arr.copyWithin(0, 2).find(x => x === 3);
      expect(found).assertEqual(3);

      let ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      let taFound = ta.copyWithin(0, 2).find(x => x === 3);
      expect(taFound).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2076
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2076
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2102';
      console.info(`${caseName}, test start`);
      let arr = collections.Array.from([1, 2, 3, 4]);
      let idx = arr.copyWithin(1, 2).findIndex(x => x === 4);
      expect(idx).assertEqual(2);

      let ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      let taIdx = ta.copyWithin(1, 2).findIndex(x => x === 4);
      expect(taIdx).assertEqual(2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2077
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2077
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2106';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      let res: number[] = [];
      arr.fill(5, 1, 3).forEach(v => res.push(v));
      expect(res).assertDeepEquals([1, 5, 5, 4]);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      let taRes: number[] = [];
      ta.fill(5, 1, 3).forEach(v => taRes.push(v));
      expect(taRes).assertDeepEquals([1, 5, 5, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationCollectionsTest2078
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2078
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2108';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const filtered = arr.fill(3, 0, 2).filter(x => x === 3);
      expect(filtered).assertDeepEquals(collections.Array.from([3, 3, 3,undefined]));
      expect(filtered[0]).assertDeepEquals(3);
      expect(filtered[1]).assertDeepEquals(3);
      expect(filtered[2]).assertDeepEquals(3);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const taFiltered = ta.fill(3, 0, 2).filter(x => x === 3);
      expect(taFiltered).assertDeepEquals(collections.Int8Array.from(new Int8Array([3, 3, 3])));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2079
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2079
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2109';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const sum = arr.fill(2).reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(6);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taSum = ta.fill(2).reduce((a, b) => a + b, 0);
      expect(taSum).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2080
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2080
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2110';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const diff = arr.fill(2).reduceRight((a, b) => a - b);
      expect(diff).assertEqual(-2);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taDiff = ta.fill(2).reduceRight((a, b) => a - b);
      expect(taDiff).assertEqual(-2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2081
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2081
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2111';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const hasThree = arr.fill(3).some(x => x === 3);
      expect(hasThree).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taHasThree = ta.fill(3).some(x => x === 3);
      expect(taHasThree).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2082
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2082
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2112';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const allThree = arr.fill(3).every(x => x === 3);
      expect(allThree).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taAllThree = ta.fill(3).every(x => x === 3);
      expect(taAllThree).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2083
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2083
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2113';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const found = arr.fill(2).find(x => x === 2);
      expect(found).assertEqual(2);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taFound = ta.fill(2).find(x => x === 2);
      expect(taFound).assertEqual(2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest2084
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST2084
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest2084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest2114';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const idx = arr.fill(4).findIndex(x => x === 4);
      expect(idx).assertEqual(0);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taIdx = ta.fill(4).findIndex(x => x === 4);
      expect(taIdx).assertEqual(0);
      console.info(`${caseName}, test end`);
    });
  });
}