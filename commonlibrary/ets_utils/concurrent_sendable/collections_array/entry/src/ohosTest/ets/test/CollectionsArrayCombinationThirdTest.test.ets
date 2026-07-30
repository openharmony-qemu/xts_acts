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

export default function CollectionsArrayCombinationThirdTest() {
  describe('CollectionsArrayCombinationThirdTest', () => {
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
     * @tc.name   collectionsArrayCombinationThirdTest0100
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_0100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest0100';
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
     * @tc.name   collectionsArrayCombinationThirdTest0200
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_0200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest0200';
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
     * @tc.name   collectionsArrayCombinationThirdTest0300
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_0300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest0300';
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
     * @tc.name   collectionsArrayCombinationThirdTest0400
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_0400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest0400';
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
     * @tc.name   collectionsArrayCombinationThirdTest0500
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_0500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest0500';
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
     * @tc.name   collectionsArrayCombinationThirdTest0600
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_0600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest0600';
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
     * @tc.name   collectionsArrayCombinationThirdTest0700
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_0700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest0700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));
      const res = arr.concat(collections.Array.from([4, 5]));
      expect(res).assertDeepEquals(collections.Array.from([1, 2, 3, 4, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest0800
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_0800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest0800';
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
     * @tc.name   collectionsArrayCombinationThirdTest0900
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_0900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest0900';
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
     * @tc.name   collectionsArrayCombinationThirdTest1000
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_1000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest1000';
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
     * @tc.name   collectionsArrayCombinationThirdTest1100
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_1100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest1100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));
      const res = arr.concat(collections.Array.from([4, 5]));
      expect(res).assertDeepEquals(collections.Array.from([1, 2, 3, 4, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest1200
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_1200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest1200';
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
     * @tc.name   collectionsArrayCombinationThirdTest1300
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_1300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest1300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.reverse();
      expect(arr).assertDeepEquals(collections.Array.from([3, 2, 1]));
      const res = arr.concat(collections.Array.from([4, 5]));
      expect(res).assertDeepEquals(collections.Array.from([3, 2, 1, 4, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest1400
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_1400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest1400';
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
     * @tc.name   collectionsArrayCombinationThirdTest1500
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_1500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest1500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3);
      expect(arr).assertDeepEquals(collections.Array.from([4, 5, 3, 4, 5]));
      const res = arr.concat(collections.Array.from([6, 7]));
      expect(res).assertDeepEquals(collections.Array.from([4, 5, 3, 4, 5, 6, 7]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest1600
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_1600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest1600';
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
     * @tc.name   collectionsArrayCombinationThirdTest1700
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_1700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest1700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.fill(5, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 5]));
      const res = arr.concat(collections.Array.from([6, 7]));
      expect(res).assertDeepEquals(collections.Array.from([1, 5, 5, 6, 7]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest1800
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_1800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest1800';
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
     * @tc.name   collectionsArrayCombinationThirdTest1900
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_1900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest1900';
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
     * @tc.name   collectionsArrayCombinationThirdTest2000
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_2000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest2000';
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
     * @tc.name   collectionsArrayCombinationThirdTest2100
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_2100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest2100';
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
     * @tc.name   collectionsArrayCombinationThirdTest2200
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_2200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest2200';
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
     * @tc.name   collectionsArrayCombinationThirdTest2300
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_2300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest2300';
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
     * @tc.name   collectionsArrayCombinationThirdTest2400
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_2400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest2400';
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
     * @tc.name   collectionsArrayCombinationThirdTest2500
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_2500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest2500';
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
     * @tc.name   collectionsArrayCombinationThirdTest2600
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_2600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest2600';
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
     * @tc.name   collectionsArrayCombinationThirdTest2700
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_2700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest2700';
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
     * @tc.name   collectionsArrayCombinationThirdTest2800
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_2800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest2800';
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
     * @tc.name   collectionsArrayCombinationThirdTest2900
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_2900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest2900';
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
     * @tc.name   collectionsArrayCombinationThirdTest3000
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_3000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest3000';
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
     * @tc.name   collectionsArrayCombinationThirdTest3100
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_3100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest3100';
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
     * @tc.name   collectionsArrayCombinationThirdTest3200
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_3200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest3200';
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
     * @tc.name   collectionsArrayCombinationThirdTest3300
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_3300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest3300';
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
     * @tc.name   collectionsArrayCombinationThirdTest3400
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_3400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest3400';
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
     * @tc.name   collectionsArrayCombinationThirdTest3500
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_3500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest3500';
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
     * @tc.name   collectionsArrayCombinationThirdTest3600
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_3600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest3600';
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
     * @tc.name   collectionsArrayCombinationThirdTest3700
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_3700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest3700';
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
     * @tc.name   collectionsArrayCombinationThirdTest3800
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_3800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest3800';
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
     * @tc.name   collectionsArrayCombinationThirdTest3900
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_3900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest3900';
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
     * @tc.name   collectionsArrayCombinationThirdTest4000
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_4000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest4000';
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
     * @tc.name   collectionsArrayCombinationThirdTest4100
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_4100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest4100';
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
     * @tc.name   collectionsArrayCombinationThirdTest4200
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_4200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest4200';
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
     * @tc.name   collectionsArrayCombinationThirdTest4300
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_4300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest4300';
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
     * @tc.name   collectionsArrayCombinationThirdTest4400
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_4400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest4400';
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
     * @tc.name   collectionsArrayCombinationThirdTest4500
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_4500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest4500';
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
     * @tc.name   collectionsArrayCombinationThirdTest4600
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_4600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest4600';
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
     * @tc.name   collectionsArrayCombinationThirdTest4700
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_4700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest4700';
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
     * @tc.name   collectionsArrayCombinationThirdTest4800
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_4800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest4800';
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
     * @tc.name   collectionsArrayCombinationThirdTest4900
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_4900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest4900';
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
     * @tc.name   collectionsArrayCombinationThirdTest5000
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_5000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest5000';
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
     * @tc.name   collectionsArrayCombinationThirdTest5100
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_5100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest5100';
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
     * @tc.name   collectionsArrayCombinationThirdTest5200
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_5200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest5200';
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
     * @tc.name   collectionsArrayCombinationThirdTest5300
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_5300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest5300';
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
     * @tc.name   collectionsArrayCombinationThirdTest5400
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_5400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest5400';
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
     * @tc.name   collectionsArrayCombinationThirdTest5500
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_5500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest5500';
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
     * @tc.name   collectionsArrayCombinationThirdTest5600
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_5600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest5600';
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
     * @tc.name   collectionsArrayCombinationThirdTest5700
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_5700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest5700';
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
     * @tc.name   collectionsArrayCombinationThirdTest5800
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_5800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest5800';
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
     * @tc.name   collectionsArrayCombinationThirdTest5900
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_5900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest5900';
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
     * @tc.name   collectionsArrayCombinationThirdTest6000
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_6000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest6000';
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
     * @tc.name   collectionsArrayCombinationThirdTest6100
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_6100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest6100';
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
     * @tc.name   collectionsArrayCombinationThirdTest6200
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_6200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest6200';
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
     * @tc.name   collectionsArrayCombinationThirdTest6300
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_6300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest6300';
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
     * @tc.name   collectionsArrayCombinationThirdTest6400
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_6400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest6400';
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
     * @tc.name   collectionsArrayCombinationThirdTest6500
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_6500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest6500';
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
     * @tc.name   collectionsArrayCombinationThirdTest6600
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_6600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest6600';
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
     * @tc.name   collectionsArrayCombinationThirdTest6700
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_6700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest6700';
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
     * @tc.name   collectionsArrayCombinationThirdTest6800
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_6800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest6800';
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
     * @tc.name   collectionsArrayCombinationThirdTest6900
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_6900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest6900';
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
     * @tc.name   collectionsArrayCombinationThirdTest7000
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_7000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest7000';
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
     * @tc.name   collectionsArrayCombinationThirdTest7100
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_7100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest7100';
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
     * @tc.name   collectionsArrayCombinationThirdTest7200
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_7200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest7200';
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
     * @tc.name   collectionsArrayCombinationThirdTest7300
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_7300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @note      Int8Array 不支�?unshift 方法，只测试共享数组的行�?
     */
    it('collectionsArrayCombinationThirdTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest7300';
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
     * @tc.name   collectionsArrayCombinationThirdTest7400
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_7400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest7400';
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
     * @tc.name   collectionsArrayCombinationThirdTest7500
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_7500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest7500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      const s = arr.shift();
      expect(arr).assertDeepEquals(collections.Array.from([2, 3]));
      expect(s).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest7600
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_7600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest7600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      arr.unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 1, 2, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest7700
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_7700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest7700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.unshift(0);
      arr.splice(1, 1, 5);
      expect(arr).assertDeepEquals(collections.Array.from([0, 5, 2, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest7800
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_7800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest7800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.unshift(0);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([0, 1, 2, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest7900
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_7900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest7900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.unshift(0);
      arr.reverse();
      expect(arr).assertDeepEquals(collections.Array.from([3, 2, 1, 0]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest8000
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_8000
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest8000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.unshift(0);
      arr.copyWithin(0, 2);
      expect(arr).assertDeepEquals(collections.Array.from([2, 3, 4, 3, 4]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest8100
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_8100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest8100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.unshift(0);
      arr.fill(9, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([0, 9, 9, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest8200
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_8200
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest8200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.push(7);
      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 6, 4, 7]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest8300
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_8300
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest8300';
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
     * @tc.name   collectionsArrayCombinationThirdTest8400
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_8400
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest8400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      const s = arr.shift();
      expect(arr).assertDeepEquals(collections.Array.from([5, 6, 4]));
      expect(s).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest8500
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_8500
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest8500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 1, 5, 6, 4]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest8600
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_8600
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest8600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.splice(2, 1, 9);
      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 9, 4]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest8700
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_8700
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest8700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 4, 2]);
      arr.splice(1, 2, 5, 6);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([2, 3, 5, 6]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest8800
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_8800
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest8800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.reverse();
      expect(arr).assertDeepEquals(collections.Array.from([4, 6, 5, 1]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsArrayCombinationThirdTest8900
     * @tc.number SUB_COLLECTIONS_ARRAY_COMBINATION_THIRD_TEST_8900
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayCombinationThirdTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'collectionsArrayCombinationThirdTest8900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]);
      arr.splice(1, 2, 6, 7);
      arr.copyWithin(0, 3);
      expect(arr).assertDeepEquals(collections.Array.from([4, 5, 7, 4, 5]));
      console.info(`${caseName}, test end`);
    });

  })
}
