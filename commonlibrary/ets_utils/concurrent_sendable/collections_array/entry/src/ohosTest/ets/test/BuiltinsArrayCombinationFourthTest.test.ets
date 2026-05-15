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

export default function BuiltinsArrayCombinationFourthTest() {
  describe('BuiltinsArrayCombinationFourthTest', () => {
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
     * @tc.name   builtinsArrayCombinationFourthTest0100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_0100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest0100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.reverse().push(4);
      expect(arr).assertDeepEquals(collections.Array.from([3, 2, 1, 4]));

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest0200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_0200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest0200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const p = arr.reverse().pop();

      expect(arr).assertDeepEquals(collections.Array.from([3, 2, 1]));
      expect(arr[0]).assertDeepEquals(3);
      expect(arr[1]).assertDeepEquals(2);
      expect(p).assertEqual(1);

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest0300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_0300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest0300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const s = arr.reverse().shift();
      expect(arr).assertDeepEquals(collections.Array.from([2, 1]));
      expect(s).assertEqual(3);

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest0400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_0400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest0400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.reverse().unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 3, 2, 1]));

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest0500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_0500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest0500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.reverse().splice(1, 2, 9);
      expect(arr).assertDeepEquals(collections.Array.from([4, 9, 1]));

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest0600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_0600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest0600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.reverse().sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2]));
      ta.reverse();
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest0700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_0700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest0700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.reverse().reverse();
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      ta.reverse().reverse();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest0800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_0800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest0800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.reverse().copyWithin(0, 2);
      expect(arr).assertDeepEquals(collections.Array.from([2, 1, 2, 1]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      ta.reverse();
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([2, 1, 2, 1]);
      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest0900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_0900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest0900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.reverse().fill(9, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([4, 9, 9, 1]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      ta.reverse();
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([4, 9, 9, 1]);
      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest1000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_1000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest1000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.copyWithin(0, 2).push(5);
      expect(arr).assertDeepEquals(collections.Array.from([3, 4, 3, 4, 5]));

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest1100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_1100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest1100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const p = arr.copyWithin(0, 2).pop();

      expect(arr).assertDeepEquals(collections.Array.from([3, 4, 3, 4]));
      expect(arr[0]).assertDeepEquals(3);
      expect(arr[1]).assertDeepEquals(4);
      expect(arr[2]).assertDeepEquals(3);
      expect(p).assertEqual(4);

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest1200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_1200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest1200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const s = arr.copyWithin(0, 2).shift();
      expect(arr).assertDeepEquals(collections.Array.from([4, 3, 4]));
      expect(s).assertEqual(3);

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest1300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_1300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest1300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.copyWithin(0, 2).unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 3, 4, 3, 4]));

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest1400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_1400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest1400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.copyWithin(0, 2).splice(1, 2, 9);
      expect(arr).assertDeepEquals(collections.Array.from([3, 9, 4]));

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest1500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_1500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest1500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([4, 3, 1, 2]);
      arr.copyWithin(0, 2).sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([1, 1, 2, 2]));

      const ta = collections.Int8Array.from(new Int8Array([4, 3, 1, 2]));
      ta.copyWithin(0, 2);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 1, 2, 2]);
      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest1600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_1600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest1600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.copyWithin(0, 2).reverse();
      expect(arr).assertDeepEquals(collections.Array.from([4, 3, 4, 3]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      ta.copyWithin(0, 2);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([4, 3, 4, 3]);
      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest1700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_1700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest1700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2).copyWithin(1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([3, 4, 5, 4, 5]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5]));
      ta.copyWithin(0, 2).copyWithin(1, 3);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 5, 4, 5]);
      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest1800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_1800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest1800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.copyWithin(0, 2).fill(9, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([3, 9, 9, 4]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      ta.copyWithin(0, 2).fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([3, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest1900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_1900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest1900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.fill(9, 1, 3).push(5);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 9, 4, 5]));

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest2000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_2000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest2000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const p = arr.fill(9, 1, 3).pop();

      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 9, 4]));
      expect(arr[0]).assertDeepEquals(1);
      expect(arr[1]).assertDeepEquals(9);
      expect(arr[2]).assertDeepEquals(9);

      expect(p).assertEqual(4);

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest2100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_2100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest2100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const s = arr.fill(9, 1, 3).shift();
      expect(arr).assertDeepEquals(collections.Array.from([9, 9, 4]));
      expect(s).assertEqual(1);

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest2200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_2200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest2200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.fill(9, 1, 3).unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 1, 9, 9, 4]));

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest2300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_2300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest2300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.fill(9, 1, 3).splice(2, 1, 5);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 5, 4]));

      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest2400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_2400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest2400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([4, 2, 3, 1]);
      arr.fill(9, 1, 3).sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([1, 4, 9, 9]));

      const ta = collections.Int8Array.from(new Int8Array([4, 2, 3, 1]));
      ta.fill(9, 1, 3);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 4, 9, 9]);
      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest2500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_2500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest2500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.fill(9, 1, 3).reverse();
      expect(arr).assertDeepEquals(collections.Array.from([4, 9, 9, 1]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      ta.fill(9, 1, 3);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([4, 9, 9, 1]);
      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest2600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_2600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest2600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.fill(9, 1, 3).copyWithin(0, 2);
      expect(arr).assertDeepEquals(collections.Array.from([9, 4, 9, 4]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      ta.fill(9, 1, 3).copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([9, 4, 9, 4]);
      console.info(`${caseName}, test end`);
    });


    /**
     * @tc.name   builtinsArrayCombinationFourthTest2700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_FOURTH_TEST_2700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationFourthTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationFourthTest2700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.fill(9, 1, 3).fill(0, 2, 4);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 0, 0]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      ta.fill(9, 1, 3).fill(0, 2, 4);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 0, 0]);
      console.info(`${caseName}, test end`);
    });


  });
}