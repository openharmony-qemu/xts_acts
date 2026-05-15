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

export default function BuiltinsArrayCombinationSecondTest() {
  describe('BuiltinsArrayCombinationSecondTest', (): void => {
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
     * @tc.name   builtinsArrayCombinationSecondTest0100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_0100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest0100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const result = arr.concat(collections.Array.from([4, 5])).slice(1, 4);
      expect(result).assertDeepEquals(collections.Array.from([2, 3, 4]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest0200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_0200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest0200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([10, 20, 30, 40]);
      const result = arr.slice(1, 3).concat(collections.Array.from([50, 60]));
      expect(result).assertDeepEquals(collections.Array.from([20, 30, 50, 60]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest0300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_0300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest0300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const result = arr.concat(collections.Array.from([3])).concat(collections.Array.from([4, 5]));
      expect(result).assertDeepEquals(collections.Array.from([1, 2, 3, 4, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest0400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_0400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest0400';
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
     * @tc.name   builtinsArrayCombinationSecondTest0500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_0500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest0500';
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
     * @tc.name   builtinsArrayCombinationSecondTest0600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_0600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest0600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]).map(x => x * 2);
      expect(arr).assertDeepEquals(collections.Array.from([2, 4, 6, 8]));
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4])).map(x => x * 2);
      expect(ta).assertDeepEquals(collections.Int8Array.from(new Int8Array([2, 4, 6, 8])));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest0700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_0700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest0700';
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
     * @tc.name   builtinsArrayCombinationSecondTest0800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_0800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest0800';
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
     * @tc.name   builtinsArrayCombinationSecondTest0900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_0900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest0900';
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
     * @tc.name   builtinsArrayCombinationSecondTest1000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_1000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest1000';
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
     * @tc.name   builtinsArrayCombinationSecondTest1100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_1100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest1100';
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
     * @tc.name   builtinsArrayCombinationSecondTest1200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_1200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest1200';
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
     * @tc.name   builtinsArrayCombinationSecondTest1300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_1300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest1300';
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
     * @tc.name   builtinsArrayCombinationSecondTest1400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_1400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest1400';
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
     * @tc.name   builtinsArrayCombinationSecondTest1500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_1500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest1500';
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
     * @tc.name   builtinsArrayCombinationSecondTest1600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_1600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest1600';
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
     * @tc.name   builtinsArrayCombinationSecondTest1700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_1700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest1700';
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
     * @tc.name   builtinsArrayCombinationSecondTest1800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_1800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest1800';
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
     * @tc.name   builtinsArrayCombinationSecondTest1900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_1900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest1900';
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
     * @tc.name   builtinsArrayCombinationSecondTest2000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_2000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest2000';
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
     * @tc.name   builtinsArrayCombinationSecondTest2100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_2100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest2100';
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
     * @tc.name   builtinsArrayCombinationSecondTest2200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_2200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest2200';
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
     * @tc.name   builtinsArrayCombinationSecondTest2300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_2300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest2300';
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
     * @tc.name   builtinsArrayCombinationSecondTest2400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_2400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest2400';
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
     * @tc.name   builtinsArrayCombinationSecondTest2500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_2500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest2500';
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
     * @tc.name   builtinsArrayCombinationSecondTest2600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_2600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest2600';
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
     * @tc.name   builtinsArrayCombinationSecondTest2700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_2700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest2700';
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
     * @tc.name   builtinsArrayCombinationSecondTest2800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_2800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest2800';
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
     * @tc.name   builtinsArrayCombinationSecondTest2900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_2900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest2900';
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
     * @tc.name   builtinsArrayCombinationSecondTest3000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_3000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest3000';
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
     * @tc.name   builtinsArrayCombinationSecondTest3100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_3100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest3100';
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
     * @tc.name   builtinsArrayCombinationSecondTest3200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_3200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest3200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3, 4]);
      arr.unshift(1);
      let sum = 0;
      arr.forEach(v => sum += v);
      expect(sum).assertEqual(10);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest3300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_3300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest3300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      const mapped = arr.map(x => x * 2);
      expect(mapped).assertDeepEquals(collections.Array.from([2, 4, 6]));

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest3400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_3400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest3400';
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
     * @tc.name   builtinsArrayCombinationSecondTest3500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_3500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest3500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3, 4]);
      arr.unshift(1);
      const sum = arr.reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest3600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_3600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest3600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 4]);
      arr.unshift(1, 2);
      const res = arr.reduceRight((a, b) => a - b);
      expect(res).assertEqual(-2);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest3700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_3700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest3700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      const hasEven = arr.some(x => x % 2 === 0);
      expect(hasEven).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest3800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_3800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest3800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 4]);
      arr.unshift(6);
      const allEven = arr.every(x => x % 2 === 0);
      expect(allEven).assertEqual(true);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest3900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_3900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest3900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 5, 7]);
      arr.unshift(2);
      const res = arr.find(x => x > 4);
      expect(res).assertEqual(5);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest4000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_4000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest4000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 4, 5]);
      arr.unshift(1);
      const idx = arr.findIndex(x => x === 4);
      expect(idx).assertEqual(2);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest4100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_4100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest4100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 9, 10);
      let sum = 0;
      arr.forEach(v => sum += v);
      expect(sum).assertEqual(24);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest4200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_4200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest4200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const mapped = arr.splice(2, 1, 9).map(x => x * 2);
      expect(mapped).assertDeepEquals(collections.Array.from([6]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest4300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_4300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest4300';
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
     * @tc.name   builtinsArrayCombinationSecondTest4400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_4400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest4400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.splice(1, 1, 5);
      const sum = arr.reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(9);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest4500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_4500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest4500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.splice(0, 1, 9);
      const diff = arr.reduceRight((a, b) => a - b);
      expect(diff).assertEqual(-8);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest4600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_4600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest4600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.splice(1, 1, 10);
      const hasEven = arr.some(x => x % 2 === 0);
      expect(hasEven).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest4700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_4700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest4700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 4, 6]);
      arr.splice(1, 1, 8);
      const allEven = arr.every(x => x % 2 === 0);
      expect(allEven).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest4800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_4800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest4800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.splice(0, 1, 5);
      const res = arr.find(x => x > 3);
      expect(res).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest4900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_4900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest4900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.splice(1, 1, 9);
      const idx = arr.findIndex(x => x === 9);
      expect(idx).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationSecondTest5000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_5000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest5000';
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
     * @tc.name   builtinsArrayCombinationSecondTest5100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_5100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest5100';
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
     * @tc.name   builtinsArrayCombinationSecondTest5200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_5200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest5200';
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
     * @tc.name   builtinsArrayCombinationSecondTest5300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_5300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest5300';
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
     * @tc.name   builtinsArrayCombinationSecondTest5400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_5400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest5400';
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
     * @tc.name   builtinsArrayCombinationSecondTest5500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_5500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest5500';
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
     * @tc.name   builtinsArrayCombinationSecondTest5600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_5600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest5600';
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
     * @tc.name   builtinsArrayCombinationSecondTest5700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_5700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest5700';
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
     * @tc.name   builtinsArrayCombinationSecondTest5800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_5800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest5800';
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
     * @tc.name   builtinsArrayCombinationSecondTest5900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_5900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest5900';
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
     * @tc.name   builtinsArrayCombinationSecondTest6000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_6000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest6000';
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
     * @tc.name   builtinsArrayCombinationSecondTest6100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_6100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest6100';
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
     * @tc.name   builtinsArrayCombinationSecondTest6200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_6200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest6200';
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
     * @tc.name   builtinsArrayCombinationSecondTest6300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_6300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest6300';
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
     * @tc.name   builtinsArrayCombinationSecondTest6400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_6400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest6400';
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
     * @tc.name   builtinsArrayCombinationSecondTest6500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_6500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest6500';
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
     * @tc.name   builtinsArrayCombinationSecondTest6600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_6600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest6600';
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
     * @tc.name   builtinsArrayCombinationSecondTest6700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_6700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest6700';
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
     * @tc.name   builtinsArrayCombinationSecondTest6800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_6800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest6800';
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
     * @tc.name   builtinsArrayCombinationSecondTest6900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_6900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest6900';
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
     * @tc.name   builtinsArrayCombinationSecondTest7000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_7000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest7000';
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
     * @tc.name   builtinsArrayCombinationSecondTest7100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_7100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest7100';
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
     * @tc.name   builtinsArrayCombinationSecondTest7200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_7200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest7200';
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
     * @tc.name   builtinsArrayCombinationSecondTest7300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_7300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest7300';
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
     * @tc.name   builtinsArrayCombinationSecondTest7400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_7400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest7400';
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
     * @tc.name   builtinsArrayCombinationSecondTest7500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_7500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest7500';
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
     * @tc.name   builtinsArrayCombinationSecondTest7600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_7600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest7600';
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
     * @tc.name   builtinsArrayCombinationSecondTest7700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_7700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest7700';
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
     * @tc.name   builtinsArrayCombinationSecondTest7800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_7800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest7800';
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
     * @tc.name   builtinsArrayCombinationSecondTest7900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_7900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest7900';
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
     * @tc.name   builtinsArrayCombinationSecondTest8000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_8000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest8000';
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
     * @tc.name   builtinsArrayCombinationSecondTest8100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_8100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest8100';
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
     * @tc.name   builtinsArrayCombinationSecondTest8200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_8200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest8200';
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
     * @tc.name   builtinsArrayCombinationSecondTest8300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_8300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest8300';
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
     * @tc.name   builtinsArrayCombinationSecondTest8400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_SECOND_TEST_8400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationSecondTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationSecondTest8400';
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