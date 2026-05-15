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

export default function BuiltinsArrayCombinationThirdTest() {
  describe('BuiltinsArrayCombinationThirdTest', () => {
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
     * @tc.name   builtinsArrayCombinationThirdTest0100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_0100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest0100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      arr.push(3);
      arr.concat(collections.Array.from([4, 5]));
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));
      const concatRes = arr.concat(collections.Array.from([4, 5]));
      expect(concatRes).assertDeepEquals(collections.Array.from([1, 2, 3, 4, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest0200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_0200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest0200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      arr.push(3);
      const res = arr.slice(1, 3);
      expect(res).assertDeepEquals(collections.Array.from([2, 3]));
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const resTA = ta.slice(1, 3);
      expect(Array.from(resTA)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest0300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_0300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest0300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const popped = arr.pop();
      expect(popped).assertEqual(3);
      const res = arr.concat(collections.Array.from([4, 5]));
      expect(res).assertDeepEquals(collections.Array.from([1, 2, 4, 5]));
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));
      expect(arr[0]).assertDeepEquals(1);
      expect(arr[1]).assertDeepEquals(2);
      expect(arr[2]).assertDeepEquals(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest0400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_0400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest0400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.pop();
      const res = arr.slice(0, 2);
      expect(res).assertDeepEquals(collections.Array.from([1, 2]));
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));
      expect(arr[0]).assertDeepEquals(1);
      expect(arr[1]).assertDeepEquals(2);
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const resTA = ta.slice(0, 2);
      expect(Array.from(resTA)).assertDeepEquals([1, 2]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest0500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_0500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest0500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const shifted = arr.shift();
      expect(shifted).assertEqual(1);
      const res = arr.concat(collections.Array.from([4, 5]));
      expect(res).assertDeepEquals(collections.Array.from([2, 3, 4, 5]));
      expect(arr).assertDeepEquals(collections.Array.from([2, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest0600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_0600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest0600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.shift();
      const res = arr.slice(0, 2);
      expect(res).assertDeepEquals(collections.Array.from([2, 3]));
      expect(arr).assertDeepEquals(collections.Array.from([2, 3]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const resTA = ta.slice(0, 2);
      expect(Array.from(resTA)).assertDeepEquals([1, 2]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest0700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_0700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest0700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));
      const res = arr.concat(collections.Array.from([4, 5]));
      expect(res).assertDeepEquals(collections.Array.from([1, 2, 3, 4, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest0800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_0800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest0800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      const res = arr.slice(1, 3);
      expect(res).assertDeepEquals(collections.Array.from([2, 3]));
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const resTA = ta.slice(1, 3);
      expect(Array.from(resTA)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest0900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_0900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest0900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const removed = arr.splice(1, 2, 5, 6);
      expect(removed).assertDeepEquals(collections.Array.from([2, 3]));
      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 6, 4]));
      const res = arr.concat(collections.Array.from([7, 8]));
      expect(res).assertDeepEquals(collections.Array.from([1, 5, 6, 4, 7, 8]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest1000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_1000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest1000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      const res = arr.slice(1, 3);
      expect(res).assertDeepEquals(collections.Array.from([5, 6]));
      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 6, 4]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      const resTA = ta.slice(1, 3);
      expect(Array.from(resTA)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest1100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_1100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest1100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));
      const res = arr.concat(collections.Array.from([4, 5]));
      expect(res).assertDeepEquals(collections.Array.from([1, 2, 3, 4, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest1200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_1200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest1200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.sort((a, b) => a - b);
      const res = arr.slice(1, 3);
      expect(res).assertDeepEquals(collections.Array.from([2, 3]));
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2]));
      const taSorted = ta.sort();
      const resTA = taSorted.slice(1, 3);
      expect(Array.from(resTA)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest1300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_1300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest1300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.reverse();
      expect(arr).assertDeepEquals(collections.Array.from([3, 2, 1]));
      const res = arr.concat(collections.Array.from([4, 5]));
      expect(res).assertDeepEquals(collections.Array.from([3, 2, 1, 4, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest1400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_1400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest1400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.reverse();
      const res = arr.slice(0, 2);
      expect(res).assertDeepEquals(collections.Array.from([3, 2]));
      expect(arr).assertDeepEquals(collections.Array.from([3, 2, 1]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const taReversed = ta.reverse();
      const resTA = taReversed.slice(0, 2);
      expect(Array.from(resTA)).assertDeepEquals([3, 2]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest1500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_1500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest1500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3);
      expect(arr).assertDeepEquals(collections.Array.from([4, 5, 3, 4, 5]));
      const res = arr.concat(collections.Array.from([6, 7]));
      expect(res).assertDeepEquals(collections.Array.from([4, 5, 3, 4, 5, 6, 7]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest1600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_1600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest1600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]);
      arr.copyWithin(1, 3);
      const res = arr.slice(2, 5);
      expect(res).assertDeepEquals(collections.Array.from([5, 4, 5]));
      expect(arr).assertDeepEquals(collections.Array.from([1, 4, 5, 4, 5]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5]));
      ta.copyWithin(1, 3);
      const resTA = ta.slice(2, 5);
      expect(Array.from(resTA)).assertDeepEquals([5, 4, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest1700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_1700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest1700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.fill(5, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 5]));
      const res = arr.concat(collections.Array.from([6, 7]));
      expect(res).assertDeepEquals(collections.Array.from([1, 5, 5, 6, 7]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest1800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_1800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest1800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.fill(4);
      const res = arr.slice(1, 3);
      expect(res).assertDeepEquals(collections.Array.from([4, 4]));
      expect(arr).assertDeepEquals(collections.Array.from([4, 4, 4]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      ta.fill(4);
      const resTA = ta.slice(1, 3);
      expect(Array.from(resTA)).assertDeepEquals([4, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest1900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_1900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest1900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      arr.push(3);
      expect(arr.includes(3)).assertEqual(true);
      expect(arr.includes(4)).assertEqual(false);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(ta.includes(3)).assertEqual(true);
      expect(ta.includes(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest2000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_2000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest2000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      arr.push(3);
      expect(arr.indexOf(3)).assertEqual(2);
      expect(arr.indexOf(4)).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(ta.indexOf(3)).assertEqual(2);
      expect(ta.indexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest2100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_2100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest2100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 2]);
      arr.push(2);
      expect(arr.lastIndexOf(2)).assertEqual(4);
      expect(arr.lastIndexOf(5)).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 2]));
      expect(ta.lastIndexOf(2)).assertEqual(3);
      expect(ta.lastIndexOf(5)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest2200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_2200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest2200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const popped = arr.pop();
      expect(popped).assertEqual(3);
      expect(arr.includes(3)).assertEqual(false);
      expect(arr.includes(2)).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(ta.includes(3)).assertEqual(true);
      expect(ta.includes(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest2300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_2300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest2300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.pop();
      expect(arr.indexOf(3)).assertEqual(-1);
      expect(arr.indexOf(2)).assertEqual(1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(ta.indexOf(3)).assertEqual(2);
      expect(ta.indexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest2400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_2400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest2400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 2]);
      arr.pop();
      expect(arr.lastIndexOf(2)).assertEqual(1);
      expect(arr.lastIndexOf(3)).assertEqual(2);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 2]));
      expect(ta.lastIndexOf(2)).assertEqual(3);
      expect(ta.lastIndexOf(5)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest2500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_2500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest2500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const shifted = arr.shift();
      expect(shifted).assertEqual(1);
      expect(arr.includes(1)).assertEqual(false);
      expect(arr.includes(2)).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(ta.includes(1)).assertEqual(true);
      expect(ta.includes(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest2600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_2600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest2600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.shift();
      expect(arr.indexOf(1)).assertEqual(-1);
      expect(arr.indexOf(2)).assertEqual(0);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(ta.indexOf(1)).assertEqual(0);
      expect(ta.indexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest2700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_2700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest2700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 2]);
      arr.shift();
      expect(arr.lastIndexOf(2)).assertEqual(2);
      expect(arr.lastIndexOf(1)).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 2]));
      expect(ta.lastIndexOf(2)).assertEqual(3);
      expect(ta.lastIndexOf(5)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest2800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_2800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest2800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      expect(arr.includes(1)).assertEqual(true);
      expect(arr.includes(4)).assertEqual(false);

      const ta = collections.Int8Array.from(new Int8Array([2, 3]));
      expect(ta.includes(2)).assertEqual(true);
      expect(ta.includes(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest2900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_2900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest2900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      expect(arr.indexOf(1)).assertEqual(0);
      expect(arr.indexOf(4)).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([2, 3]));
      expect(ta.indexOf(2)).assertEqual(0);
      expect(ta.indexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest3000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_3000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest3000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3, 2]);
      arr.unshift(1);
      expect(arr.lastIndexOf(2)).assertEqual(3);
      expect(arr.lastIndexOf(1)).assertEqual(0);

      const ta = collections.Int8Array.from(new Int8Array([2, 3, 2]));
      expect(ta.lastIndexOf(2)).assertEqual(2);
      expect(ta.lastIndexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest3100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_3100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest3100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      expect(arr.includes(2)).assertEqual(false);
      expect(arr.includes(5)).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      expect(ta.includes(2)).assertEqual(true);
      expect(ta.includes(5)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest3200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_3200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest3200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      expect(arr.indexOf(2)).assertEqual(-1);
      expect(arr.indexOf(5)).assertEqual(1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      expect(ta.indexOf(2)).assertEqual(1);
      expect(ta.indexOf(5)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest3300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_3300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest3300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 2]);
      arr.splice(1, 2, 5, 6);
      expect(arr.lastIndexOf(2)).assertEqual(3);
      expect(arr.lastIndexOf(3)).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 2]));
      expect(ta.lastIndexOf(2)).assertEqual(3);
      expect(ta.lastIndexOf(5)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest3400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_3400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest3400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.sort((a, b) => a - b);
      expect(arr.includes(2)).assertEqual(true);
      expect(arr.includes(4)).assertEqual(false);

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2]));
      ta.sort();
      expect(ta.includes(2)).assertEqual(true);
      expect(ta.includes(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest3500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_3500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest3500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      expect(arr.sort((a, b) => a - b).indexOf(2)).assertEqual(1);
      expect(arr.sort((a, b) => a - b).indexOf(4)).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2]));
      expect(ta.sort().indexOf(2)).assertEqual(1);
      expect(ta.sort().indexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest3600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_3600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest3600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2, 2]);
      expect(arr.sort((a, b) => a - b).lastIndexOf(2)).assertEqual(2);
      expect(arr.sort((a, b) => a - b).lastIndexOf(4)).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2, 2]));
      expect(ta.sort().lastIndexOf(2)).assertEqual(2);
      expect(ta.sort().lastIndexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest3700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_3700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest3700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      expect(arr.reverse().includes(2)).assertEqual(true);
      expect(arr.reverse().includes(4)).assertEqual(false);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(ta.reverse().includes(2)).assertEqual(true);
      expect(ta.reverse().includes(4)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest3800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_3800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest3800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      expect(arr.reverse().indexOf(2)).assertEqual(1);
      expect(arr.reverse().indexOf(4)).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(ta.reverse().indexOf(2)).assertEqual(1);
      expect(ta.reverse().indexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest3900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_3900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest3900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 2]);
      expect(arr.reverse().lastIndexOf(2)).assertEqual(2);
      expect(arr.reverse().lastIndexOf(4)).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 2]));
      expect(ta.reverse().lastIndexOf(2)).assertEqual(2);
      expect(ta.reverse().lastIndexOf(4)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest4000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_4000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest4000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]);
      expect(arr.copyWithin(0, 3).includes(2)).assertEqual(false);
      expect(arr.copyWithin(0, 3).includes(4)).assertEqual(true);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5]));
      expect(ta.copyWithin(0, 3).includes(2)).assertEqual(false);
      expect(ta.copyWithin(0, 3).includes(4)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest4100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_4100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest4100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]);
      expect(arr.copyWithin(0, 3).indexOf(3)).assertEqual(2);
      expect(arr.copyWithin(0, 3).indexOf(2)).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5]));
      expect(ta.copyWithin(0, 3).indexOf(3)).assertEqual(2);
      expect(ta.copyWithin(0, 3).indexOf(2)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest4200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_4200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest4200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]);
      expect(arr.copyWithin(1, 3).lastIndexOf(4)).assertEqual(3);
      expect(arr.copyWithin(1, 3).lastIndexOf(2)).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5]));
      expect(ta.copyWithin(1, 3).lastIndexOf(4)).assertEqual(3);
      expect(ta.copyWithin(1, 3).lastIndexOf(2)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest4300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_4300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest4300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      expect(arr.fill(5, 1, 3).includes(5)).assertEqual(true);
      expect(arr.fill(5, 1, 3).includes(2)).assertEqual(false);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(ta.fill(5, 1, 3).includes(5)).assertEqual(true);
      expect(ta.fill(5, 1, 3).includes(2)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest4400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_4400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest4400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      expect(arr.fill(4).indexOf(4)).assertEqual(0);
      expect(arr.fill(4).indexOf(1)).assertEqual(-1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(ta.fill(4).indexOf(4)).assertEqual(0);
      expect(ta.fill(4).indexOf(1)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest4500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_4500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest4500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 2]);
      expect(arr.fill(9, 1, 3).lastIndexOf(9)).assertEqual(2);
      expect(arr.fill(9, 1, 3).lastIndexOf(2)).assertEqual(3);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 2]));
      expect(ta.fill(9, 1, 3).lastIndexOf(9)).assertEqual(2);
      expect(ta.fill(9, 1, 3).lastIndexOf(2)).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest4600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_4600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest4600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      arr.push(3);
      arr.push(4);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3, 4]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest4700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_4700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest4700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      arr.push(3);
      const p = arr.pop();
      expect(p).assertEqual(3);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));
      expect(arr[0]).assertDeepEquals(1);
      expect(arr[1]).assertDeepEquals(2)
      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      const pTA = ta[ta.length-1];
      expect(pTA).assertEqual(3);
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest4800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_4800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest4800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      arr.push(3);
      const s = arr.shift();
      expect(s).assertEqual(1);
      expect(arr).assertDeepEquals(collections.Array.from([2, 3]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest4900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_4900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest4900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.push(4);
      arr.unshift(1);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3, 4]));

      const ta = collections.Int8Array.from(new Int8Array([2, 3, 4]));
      expect(Array.from(ta)).assertDeepEquals([2, 3, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest5000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_5000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest5000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2]);
      arr.push(3);
      arr.splice(1, 1, 5);
      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 3]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest5100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_5100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest5100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.push(4);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3, 4]));

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2, 4]));
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest5200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_5200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest5200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.push(4);
      arr.reverse();
      expect(arr).assertDeepEquals(collections.Array.from([4, 3, 2, 1]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([4, 3, 2, 1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest5300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_5300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest5300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.push(5);
      arr.copyWithin(0, 3);
      expect(arr).assertDeepEquals(collections.Array.from([4, 5, 3, 4, 5]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4, 5]));
      ta.copyWithin(0, 3);
      expect(Array.from(ta)).assertDeepEquals([4, 5, 3, 4, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest5400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_5400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest5400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.push(4);
      arr.fill(9, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 9, 4]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest5500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_5500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest5500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const p = arr.pop();
      arr.push(4);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 4]));
      expect(p).assertEqual(3);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest5600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_5600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest5600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const p1 = arr.pop();
      const p2 = arr.pop();

      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));
      expect(arr[0]).assertDeepEquals(1)
      expect(p1).assertEqual(3);
      expect(p2).assertEqual(2);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest5700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_5700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest5700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.pop();
      const s = arr.shift();

      expect(arr[0]).assertDeepEquals(2)
      expect(s).assertEqual(1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest5800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_5800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest5800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.pop();
      arr.unshift(1);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2]));

      const ta = collections.Int8Array.from(new Int8Array([2, 3]));
      expect(Array.from(ta)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest5900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_5900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest5900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.pop();
      arr.splice(1, 1, 5);
      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 3]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest6000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_6000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest6000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.pop();
      arr.sort((a, b) => a - b);

      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));
      expect(arr[0]).assertDeepEquals(1);
      expect(arr[1]).assertDeepEquals(2);

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2]));
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest6100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_6100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest6100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.pop();
      arr.reverse();

      expect(arr).assertDeepEquals(collections.Array.from([2, 1, 3]));
      expect(arr[0]).assertDeepEquals(2);
      expect(arr[1]).assertDeepEquals(1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([3, 2, 1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest6200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_6200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest6200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.pop();
      arr.copyWithin(0, 2);
      expect(arr).assertDeepEquals(collections.Array.from([3, 2, 3, 4]));
      expect(arr[0]).assertDeepEquals(3);
      expect(arr[1]).assertDeepEquals(2);
      expect(arr[2]).assertDeepEquals(3);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 3, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest6300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_6300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest6300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.pop();
      arr.fill(9, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 9, 4]));
      expect(arr[0]).assertDeepEquals(1)
      expect(arr[1]).assertDeepEquals(9)
      expect(arr[2]).assertDeepEquals(9)

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest6400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_6400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest6400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const s = arr.shift();
      arr.push(4);
      expect(arr).assertDeepEquals(collections.Array.from([2, 3, 4]));
      expect(s).assertEqual(1);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest6500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_6500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest6500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.shift();
      const p = arr.pop();

      expect(arr).assertDeepEquals(collections.Array.from([2, 3]));
      expect(arr[0]).assertDeepEquals(2)
      expect(p).assertEqual(3);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest6600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_6600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest6600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const s1 = arr.shift();
      const s2 = arr.shift();
      expect(arr).assertDeepEquals(collections.Array.from([3]));
      expect(s1).assertEqual(1);
      expect(s2).assertEqual(2);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest6700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_6700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest6700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.shift();
      arr.unshift(1);
      expect(arr).assertDeepEquals(collections.Array.from([1, 3]));

      const ta = collections.Int8Array.from(new Int8Array([2, 3]));
      expect(Array.from(ta)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest6800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_6800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest6800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.shift();
      arr.splice(1, 1, 5);
      expect(arr).assertDeepEquals(collections.Array.from([2, 5, 4]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest6900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_6900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest6900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.shift();
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2]));

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2]));
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest7000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_7000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest7000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.shift();
      arr.reverse();
      expect(arr).assertDeepEquals(collections.Array.from([3, 2]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([3, 2, 1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest7100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_7100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest7100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.shift();
      arr.copyWithin(0, 2);
      expect(arr).assertDeepEquals(collections.Array.from([4, 3, 4]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 3, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest7200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_7200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest7200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.shift();
      arr.fill(9, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([2, 9, 9]));

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3, 4]));
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest7300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_7300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @note      Int8Array 不支�?unshift 方法，只测试共享数组的行�?
     */
    it('builtinsArrayCombinationThirdTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest7300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      arr.push(4);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3, 4]));

      const ta = collections.Int8Array.from(new Int8Array([2, 3]));
      expect(Array.from(ta)).assertDeepEquals([2, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest7400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_7400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest7400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      const p = arr.pop();

      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));
      expect(arr[0]).assertDeepEquals(1);
      expect(arr[1]).assertDeepEquals(2);
      expect(p).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest7500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_7500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest7500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      const s = arr.shift();
      expect(arr).assertDeepEquals(collections.Array.from([2, 3]));
      expect(s).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest7600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_7600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest7600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      arr.unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 1, 2, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest7700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_7700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest7700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.unshift(0);
      arr.splice(1, 1, 5);
      expect(arr).assertDeepEquals(collections.Array.from([0, 5, 2, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest7800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_7800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest7800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.unshift(0);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([0, 1, 2, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest7900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_7900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest7900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.unshift(0);
      arr.reverse();
      expect(arr).assertDeepEquals(collections.Array.from([3, 2, 1, 0]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest8000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_8000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest8000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.unshift(0);
      arr.copyWithin(0, 2);
      expect(arr).assertDeepEquals(collections.Array.from([2, 3, 4, 3, 4]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest8100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_8100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest8100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.unshift(0);
      arr.fill(9, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([0, 9, 9, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest8200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_8200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest8200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.push(7);
      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 6, 4, 7]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest8300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_8300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest8300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      const p = arr.pop();

      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 6, 4]));
      expect(arr[0]).assertDeepEquals(1);
      expect(arr[1]).assertDeepEquals(5);
      expect(arr[2]).assertDeepEquals(6);
      expect(p).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest8400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_8400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest8400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      const s = arr.shift();
      expect(arr).assertDeepEquals(collections.Array.from([5, 6, 4]));
      expect(s).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest8500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_8500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest8500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 1, 5, 6, 4]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest8600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_8600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest8600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.splice(2, 1, 9);
      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 9, 4]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest8700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_8700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest8700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 4, 2]);
      arr.splice(1, 2, 5, 6);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([2, 3, 5, 6]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest8800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_8800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest8800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.reverse();
      expect(arr).assertDeepEquals(collections.Array.from([4, 6, 5, 1]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest8900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_8900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest8900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]);
      arr.splice(1, 2, 6, 7);
      arr.copyWithin(0, 3);
      expect(arr).assertDeepEquals(collections.Array.from([4, 5, 7, 4, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest9000
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_9000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest9000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.fill(9, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 9, 4]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest9100
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_9100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest9100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.sort().push(4);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3, 4]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest9200
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_9200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest9200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2, 4]);
      const popped = arr.sort().pop();

      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3, 4]));
      expect(arr[0]).assertDeepEquals(1);
      expect(arr[1]).assertDeepEquals(2);
      expect(arr[2]).assertDeepEquals(3);

      expect(popped).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest9300
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_9300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest9300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2, 4]);
      const shifted = arr.sort().shift();
      expect(arr).assertDeepEquals(collections.Array.from([2, 3, 4]));
      expect(shifted).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest9400
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_9400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest9400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.sort().unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 1, 2, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest9500
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_9500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest9500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 4, 2]);
      arr.sort().splice(1, 2, 9);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 4]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest9600
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_9600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest9600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 4, 2]);
      arr.sort().sort((a, b) => b - a);
      expect(arr).assertDeepEquals(collections.Array.from([4, 3, 2, 1]));

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 4, 2]));
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest9700
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_9700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest9700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.sort().reverse();
      expect(arr).assertDeepEquals(collections.Array.from([3, 2, 1]));

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2]));
      ta.sort().reverse();
      expect(Array.from(ta)).assertDeepEquals([3, 2, 1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest9800
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_9800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest9800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2, 4]);
      arr.sort().copyWithin(0, 2);
      expect(arr).assertDeepEquals(collections.Array.from([3, 4, 3, 4]));

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2, 4]));
      ta.sort();
      ta.copyWithin(0, 2);
      expect(Array.from(ta)).assertDeepEquals([3, 4, 3, 4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   builtinsArrayCombinationThirdTest9900
     * @tc.number SUB_BUILTINS_ARRAY_COMBINATION_THIRD_TEST_9900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCombinationThirdTest9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsArrayCombinationThirdTest9900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2, 4]);
      arr.sort().fill(9, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 9, 4]));

      const ta = collections.Int8Array.from(new Int8Array([3, 1, 2, 4]));
      ta.sort();
      ta.fill(9, 1, 3);
      expect(Array.from(ta)).assertDeepEquals([1, 9, 9, 4]);
      console.info(`${caseName}, test end`);
    });

  })
}
