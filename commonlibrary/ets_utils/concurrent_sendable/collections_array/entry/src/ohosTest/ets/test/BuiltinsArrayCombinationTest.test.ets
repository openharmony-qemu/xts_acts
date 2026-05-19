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

export default function BuiltinsArrayCombinationTest() {
  describe('BuiltinsArrayCombinationTest', () => {
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
     * @tc.name   builtinsArrayCombinationTest0100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_0100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest0100';
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
     * @tc.name   builtinsArrayCombinationTest0200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_0200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest0200';
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
     * @tc.name   builtinsArrayCombinationTest0300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_0300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest0300';
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
     * @tc.name   builtinsArrayCombinationTest0400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_0400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest0400';
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
     * @tc.name   builtinsArrayCombinationTest0500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_0500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest0500';
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
     * @tc.name   builtinsArrayCombinationTest0600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_0600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest0600';
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
     * @tc.name   builtinsArrayCombinationTest0700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_0700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest0700';
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
     * @tc.name   builtinsArrayCombinationTest0800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_0800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest0800';
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
     * @tc.name   builtinsArrayCombinationTest0900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_0900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest0900';
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
     * @tc.name   builtinsArrayCombinationTest1000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_1000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest1000';
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
     * @tc.name   builtinsArrayCombinationTest1100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_1100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest1100';
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
     * @tc.name   builtinsArrayCombinationTest1200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_1200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest1200';
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
     * @tc.name   builtinsArrayCombinationTest1300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_1300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest1300';
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
     * @tc.name   builtinsArrayCombinationTest1400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_1400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest1400';
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
     * @tc.name   builtinsArrayCombinationTest1500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_1500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest1500';
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
     * @tc.name   builtinsArrayCombinationTest1600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_1600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest1600';
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
     * @tc.name   builtinsArrayCombinationTest1700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_1700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest1700';
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
     * @tc.name   builtinsArrayCombinationTest1800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_1800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest1800';
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
     * @tc.name   builtinsArrayCombinationTest1900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_1900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest1900';
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
     * @tc.name   builtinsArrayCombinationTest2000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_2000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest2000';
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
     * @tc.name   builtinsArrayCombinationTest2100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_2100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest2100';
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
     * @tc.name   builtinsArrayCombinationTest2200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_2200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest2200';
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
     * @tc.name   builtinsArrayCombinationTest2300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_2300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest2300';
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
     * @tc.name   builtinsArrayCombinationTest2400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_2400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest2400';
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
     * @tc.name   builtinsArrayCombinationTest2500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_2500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest2500';
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
     * @tc.name   builtinsArrayCombinationTest2600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_2600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest2600';
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
     * @tc.name   builtinsArrayCombinationTest2700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_2700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest2700';
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
     * @tc.name   builtinsArrayCombinationTest2800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_2800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest2800';
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
     * @tc.name   builtinsArrayCombinationTest2900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_2900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest2900';
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
     * @tc.name   builtinsArrayCombinationTest3000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_3000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest3000';
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
     * @tc.name   builtinsArrayCombinationTest3100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_3100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest3100';
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
     * @tc.name   builtinsArrayCombinationTest3200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_3200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest3200';
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
     * @tc.name   builtinsArrayCombinationTest3300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_3300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest3300';
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
     * @tc.name   builtinsArrayCombinationTest3400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_3400
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest3400';
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
     * @tc.name   builtinsArrayCombinationTest3500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_3500
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest3500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([2, 3, 4]));
      const lastIdx = concated.lastIndexOf(2);
      expect(lastIdx).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest3600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_3600
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest3600';
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
     * @tc.name   builtinsArrayCombinationTest3700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_3700
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest3700';
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
     * @tc.name   builtinsArrayCombinationTest3800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_3800
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest3800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([5, 6, 7, 8, 7]);
      const sliced = arr.slice(1);
      const index = sliced.lastIndexOf(7);
      expect(index).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest3900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_3900
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest3900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([3, 4]));
      const len = concated.push(5);
      expect(len).assertEqual(5);
      expect([...concated]).assertDeepEquals([1, 2, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest4000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_4000
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest4000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([3, 4]));
      const popped = concated.pop();
      expect(popped).assertEqual(4);
      expect([...concated]).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest4100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_4100
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest4100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([10, 20]);
      const concated = arr.concat(collections.Array.from([30, 40]));
      const shifted = concated.shift();
      expect(shifted).assertEqual(10);
      expect([...concated]).assertDeepEquals([20, 30, 40]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest4200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_4200
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest4200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 4]);
      const concated = arr.concat(collections.Array.from([5, 6]));
      const len = concated.unshift(1, 2);
      expect(len).assertEqual(6);
      expect([...concated]).assertDeepEquals([1, 2, 3, 4, 5, 6]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest4300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_4300
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest4300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([3, 4, 5]));
      const removed = concated.splice(1, 2, 9, 9);
      expect([...removed]).assertDeepEquals([2, 3]);
      expect([...concated]).assertDeepEquals([1, 9, 9, 4, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest4400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_4400
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest4400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1]).concat(collections.Array.from([5, 4, 2])).sort();
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest4500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_4500
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest4500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([3, 4, 5]));
      const reversed = concated.reverse();
      expect([...reversed]).assertDeepEquals([5, 4, 3, 2, 1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest4600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_4600
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest4600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([3, 4, 5]));
      const copied = concated.copyWithin(1, 3);
      expect([...copied]).assertDeepEquals([1, 4, 5, 4, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest4700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_4700
     * @tc.desc   Test Method Combination in Shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest4700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      const concated = arr.concat(collections.Array.from([3, 4, 5]));
      const filled = concated.fill(9, 2, 4);
      expect([...filled]).assertDeepEquals([1, 2, 9, 9, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest4800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_4800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest4800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const sliced = arr.slice(1, 3);
      const len = sliced.push(9);
      expect(len).assertEqual(3);
      expect([...sliced]).assertDeepEquals([2, 3, 9]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest4900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_4900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest4900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]).slice(1, 4);

      const popped = arr.pop();
      expect(popped).assertEqual(4);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest5000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_5000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest5000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([10, 20, 30, 40]).slice(1, 3);
      const shifted = arr.shift();
      expect(shifted).assertEqual(20);
      expect(arr).assertDeepEquals(collections.Array.from([30]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest5100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_5100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest5100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 4, 5, 6]).slice(1, 3);
      const len = arr.unshift(1, 2);
      expect(len).assertEqual(4);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 4, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest5200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_5200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest5200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]).slice(1, 4);
      const removed = arr.splice(1, 1, 9);
      expect(removed).assertDeepEquals(collections.Array.from([3]));
      expect(arr).assertDeepEquals(collections.Array.from([2, 9, 4]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest5300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_5300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest5300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([5, 4, 3, 2, 1]).slice(1, 4).sort();
      expect(arr).assertDeepEquals(collections.Array.from([2, 3, 4]));
      const ta = collections.Int8Array.from(new Int8Array([5, 4, 3, 2, 1])).slice(1, 4).sort();
      expect(ta).assertDeepEquals(collections.Int8Array.from(new Int8Array([2, 3, 4])));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest5400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_5400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest5400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]).slice(1, 4).reverse();
      expect(arr).assertDeepEquals(collections.Array.from([4, 3, 2]));
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5])).slice(1, 4).reverse();
      expect(ta).assertDeepEquals(collections.Int8Array.from(new Int8Array([4, 3, 2])));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest5500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_5500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest5500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]).slice().copyWithin(1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([1, 4, 5, 4, 5]));
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5])).slice().copyWithin(1, 3);
      expect(ta).assertDeepEquals(collections.Int8Array.from(new Int8Array([1, 4, 5, 4, 5])));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationTest5600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_TEST_5600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationTest5600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]).slice().fill(9, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 9, 4, 5]));
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5])).slice().fill(9, 1, 3);
      expect(ta).assertDeepEquals(collections.Int8Array.from(new Int8Array([1, 9, 9, 4, 5])));
      console.info(`${caseName}, test end`);
    });


  });
}
