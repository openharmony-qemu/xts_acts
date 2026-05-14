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

export default function ArrayCombinationCollectionsTest3() {
  describe('ArrayCombinationCollectionsTest3', () => {
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
     * @tc.name   ArrayCombinationCollectionsTest3001
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3001
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3001';
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
     * @tc.name   ArrayCombinationCollectionsTest3002
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3002
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3002';
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
     * @tc.name   ArrayCombinationCollectionsTest3003
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3003
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3004';
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
     * @tc.name   ArrayCombinationCollectionsTest3004
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3004
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3005';
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
     * @tc.name   ArrayCombinationCollectionsTest3005
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3005
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3007';
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
     * @tc.name   ArrayCombinationCollectionsTest3006
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3006
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3008';
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
     * @tc.name   ArrayCombinationCollectionsTest3007
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3007
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3010';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));
      const res = arr.concat(collections.Array.from([4, 5]));
      expect(res).assertDeepEquals(collections.Array.from([1, 2, 3, 4, 5]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3008
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3008
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3011';
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
     * @tc.name   ArrayCombinationCollectionsTest3009
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3009
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3013';
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
     * @tc.name   ArrayCombinationCollectionsTest3010
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3010
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3014';
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
     * @tc.name   ArrayCombinationCollectionsTest3011
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3011
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3016';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3]));
      const res = arr.concat(collections.Array.from([4, 5]));
      expect(res).assertDeepEquals(collections.Array.from([1, 2, 3, 4, 5]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3012
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3012
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3017';
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
     * @tc.name   ArrayCombinationCollectionsTest3013
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3013
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3019';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.reverse();
      expect(arr).assertDeepEquals(collections.Array.from([3, 2, 1]));
      const res = arr.concat(collections.Array.from([4, 5]));
      expect(res).assertDeepEquals(collections.Array.from([3, 2, 1, 4, 5]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3014
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3014
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3020';
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
     * @tc.name   ArrayCombinationCollectionsTest3015
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3015
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3022';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3);
      expect(arr).assertDeepEquals(collections.Array.from([4, 5, 3, 4, 5]));
      const res = arr.concat(collections.Array.from([6, 7]));
      expect(res).assertDeepEquals(collections.Array.from([4, 5, 3, 4, 5, 6, 7]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3016
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3016
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3023';
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
     * @tc.name   ArrayCombinationCollectionsTest3017
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3017
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3025';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.fill(5, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 5]));
      const res = arr.concat(collections.Array.from([6, 7]));
      expect(res).assertDeepEquals(collections.Array.from([1, 5, 5, 6, 7]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3018
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3018
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3026';
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
     * @tc.name   ArrayCombinationCollectionsTest3019
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3019
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3028';
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
     * @tc.name   ArrayCombinationCollectionsTest3020
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3020
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3029';
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
     * @tc.name   ArrayCombinationCollectionsTest3021
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3021
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3030';
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
     * @tc.name   ArrayCombinationCollectionsTest3022
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3022
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3031';
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
     * @tc.name   ArrayCombinationCollectionsTest3023
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3023
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3032';
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
     * @tc.name   ArrayCombinationCollectionsTest3024
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3024
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3033';
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
     * @tc.name   ArrayCombinationCollectionsTest3025
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3025
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3034';
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
     * @tc.name   ArrayCombinationCollectionsTest3026
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3026
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3035';
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
     * @tc.name   ArrayCombinationCollectionsTest3027
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3027
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3036';
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
     * @tc.name   ArrayCombinationCollectionsTest3028
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3028
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3037';
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
     * @tc.name   ArrayCombinationCollectionsTest3029
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3029
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3038';
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
     * @tc.name   ArrayCombinationCollectionsTest3030
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3030
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3039';
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
     * @tc.name   ArrayCombinationCollectionsTest3031
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3031
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3040';
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
     * @tc.name   ArrayCombinationCollectionsTest3032
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3032
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3041';
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
     * @tc.name   ArrayCombinationCollectionsTest3033
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3033
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3042';
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
     * @tc.name   ArrayCombinationCollectionsTest3034
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3034
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3043';
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
     * @tc.name   ArrayCombinationCollectionsTest3035
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3035
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3044';
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
     * @tc.name   ArrayCombinationCollectionsTest3036
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3036
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3045';
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
     * @tc.name   ArrayCombinationCollectionsTest3037
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3037
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3046';
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
     * @tc.name   ArrayCombinationCollectionsTest3038
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3038
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3047';
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
     * @tc.name   ArrayCombinationCollectionsTest3039
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3039
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3048';
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
     * @tc.name   ArrayCombinationCollectionsTest3040
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3040
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3049';
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
     * @tc.name   ArrayCombinationCollectionsTest3041
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3041
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3050';
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
     * @tc.name   ArrayCombinationCollectionsTest3042
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3042
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3051';
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
     * @tc.name   ArrayCombinationCollectionsTest3043
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3043
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3052';
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
     * @tc.name   ArrayCombinationCollectionsTest3044
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3044
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3053';
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
     * @tc.name   ArrayCombinationCollectionsTest3045
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3045
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3054';
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
     * @tc.name   ArrayCombinationCollectionsTest3046
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3046
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3055';
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
     * @tc.name   ArrayCombinationCollectionsTest3047
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3047
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3056';
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
     * @tc.name   ArrayCombinationCollectionsTest3048
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3048
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3057';
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
     * @tc.name   ArrayCombinationCollectionsTest3049
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3049
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3058';
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
     * @tc.name   ArrayCombinationCollectionsTest3050
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3050
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3059';
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
     * @tc.name   ArrayCombinationCollectionsTest3051
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3051
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3060';
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
     * @tc.name   ArrayCombinationCollectionsTest3052
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3052
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3061';
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
     * @tc.name   ArrayCombinationCollectionsTest3053
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3053
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3062';
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
     * @tc.name   ArrayCombinationCollectionsTest3054
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3054
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3063';
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
     * @tc.name   ArrayCombinationCollectionsTest3055
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3055
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3064';
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
     * @tc.name   ArrayCombinationCollectionsTest3056
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3056
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3065';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const p1 = arr.pop();
      const p2 = arr.pop();

      expect(arr).assertDeepEquals(collections.Array.from([1,2,3]));
      expect(arr[0]).assertDeepEquals(1)
      expect(p1).assertEqual(3);
      expect(p2).assertEqual(2);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3057
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3057
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3066';
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
     * @tc.name   ArrayCombinationCollectionsTest3058
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3058
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3067';
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
     * @tc.name   ArrayCombinationCollectionsTest3059
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3059
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3068';
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
     * @tc.name   ArrayCombinationCollectionsTest3060
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3060
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3069';
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
     * @tc.name   ArrayCombinationCollectionsTest3061
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3061
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3070';
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
     * @tc.name   ArrayCombinationCollectionsTest3062
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3062
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3071';
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
     * @tc.name   ArrayCombinationCollectionsTest3063
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3063
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3072';
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
     * @tc.name   ArrayCombinationCollectionsTest3064
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3064
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3073';
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
     * @tc.name   ArrayCombinationCollectionsTest3065
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3065
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3074';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.shift();
      const p = arr.pop();

      expect(arr).assertDeepEquals(collections.Array.from([2,3]));
      expect(arr[0]).assertDeepEquals(2)
      expect(p).assertEqual(3);

      const ta = collections.Int8Array.from(new Int8Array([1, 2, 3]));
      expect(Array.from(ta)).assertDeepEquals([1, 2, 3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3066
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3066
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3075';
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
     * @tc.name   ArrayCombinationCollectionsTest3067
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3067
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3076';
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
     * @tc.name   ArrayCombinationCollectionsTest3068
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3068
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3077';
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
     * @tc.name   ArrayCombinationCollectionsTest3069
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3069
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3078';
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
     * @tc.name   ArrayCombinationCollectionsTest3070
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3070
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3079';
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
     * @tc.name   ArrayCombinationCollectionsTest3071
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3071
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3080';
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
     * @tc.name   ArrayCombinationCollectionsTest3072
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3072
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3081';
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
     * @tc.name   ArrayCombinationCollectionsTest3073
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3073
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @note      Int8Array 不支持 unshift 方法，只测试共享数组的行为
     */
    it('ArrayCombinationCollectionsTest3073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3082';
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
     * @tc.name   ArrayCombinationCollectionsTest3074
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3074
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3083';
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
     * @tc.name   ArrayCombinationCollectionsTest3075
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3075
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3084';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      const s = arr.shift();
      expect(arr).assertDeepEquals(collections.Array.from([2, 3]));
      expect(s).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3076
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3076
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3085';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([2, 3]);
      arr.unshift(1);
      arr.unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 1, 2, 3]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3077
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3077
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3086';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.unshift(0);
      arr.splice(1, 1, 5);
      expect(arr).assertDeepEquals(collections.Array.from([0, 5, 2, 3]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3078
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3078
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3087';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.unshift(0);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([0, 1, 2, 3]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3079
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3079
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3088';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.unshift(0);
      arr.reverse();
      expect(arr).assertDeepEquals(collections.Array.from([3, 2, 1, 0]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3080
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3080
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3089';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.unshift(0);
      arr.copyWithin(0, 2);
      expect(arr).assertDeepEquals(collections.Array.from([2, 3, 4, 3, 4]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3081
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3081
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3090';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.unshift(0);
      arr.fill(9, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([0, 9, 9, 3]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3082
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3082
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3091';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.push(7);
      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 6, 4, 7]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3083
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3083
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3092';
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
     * @tc.name   ArrayCombinationCollectionsTest3084
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3084
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3093';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      const s = arr.shift();
      expect(arr).assertDeepEquals(collections.Array.from([5, 6, 4]));
      expect(s).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3085
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3085
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3094';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 1, 5, 6, 4]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3086
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3086
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3095';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.splice(2, 1, 9);
      expect(arr).assertDeepEquals(collections.Array.from([1, 5, 9, 4]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3087
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3087
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3096';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 4, 2]);
      arr.splice(1, 2, 5, 6);
      arr.sort((a, b) => a - b);
      expect(arr).assertDeepEquals(collections.Array.from([2, 3, 5, 6]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3088
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3088
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3097';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.reverse();
      expect(arr).assertDeepEquals(collections.Array.from([4, 6, 5, 1]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3089
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3089
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3098';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4, 5]);
      arr.splice(1, 2, 6, 7);
      arr.copyWithin(0, 3);
      expect(arr).assertDeepEquals(collections.Array.from([4, 5, 7, 4, 5]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3090
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3090
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3099';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.splice(1, 2, 5, 6);
      arr.fill(9, 1, 3);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 9, 4]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3091
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3091
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.sort().push(4);
      expect(arr).assertDeepEquals(collections.Array.from([1, 2, 3, 4]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3092
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3092
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3101';
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
     * @tc.name   ArrayCombinationCollectionsTest3093
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3093
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3102';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2, 4]);
      const shifted = arr.sort().shift();
      expect(arr).assertDeepEquals(collections.Array.from([2, 3, 4]));
      expect(shifted).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3094
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3094
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3103';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 2]);
      arr.sort().unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 1, 2, 3]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3095
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3095
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3104';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([3, 1, 4, 2]);
      arr.sort().splice(1, 2, 9);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 4]));
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3096
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3096
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3105';
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
     * @tc.name   ArrayCombinationCollectionsTest3097
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3097
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3106';
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
     * @tc.name   ArrayCombinationCollectionsTest3098
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3098
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3107';
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
     * @tc.name   ArrayCombinationCollectionsTest3099
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3099
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3108';
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
    /**
     * @tc.name   ArrayCombinationCollectionsTest3100
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3100
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3109';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.reverse().push(4);
      expect(arr).assertDeepEquals(collections.Array.from([3, 2, 1, 4]));

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3101
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3101
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3110';
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
     * @tc.name   ArrayCombinationCollectionsTest3102
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3102
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3111';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      const s = arr.reverse().shift();
      expect(arr).assertDeepEquals(collections.Array.from([2, 1]));
      expect(s).assertEqual(3);

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3103
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3103
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3112';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3]);
      arr.reverse().unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 3, 2, 1]));

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3104
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3104
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3113';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.reverse().splice(1, 2, 9);
      expect(arr).assertDeepEquals(collections.Array.from([4, 9, 1]));

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3105
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3105
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3114';
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
     * @tc.name   ArrayCombinationCollectionsTest3106
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3106
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3115';
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
     * @tc.name   ArrayCombinationCollectionsTest3107
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3107
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3116';
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
     * @tc.name   ArrayCombinationCollectionsTest3108
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3108
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3117';
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
     * @tc.name   ArrayCombinationCollectionsTest3109
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3109
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3118';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.copyWithin(0, 2).push(5);
      expect(arr).assertDeepEquals(collections.Array.from([3, 4, 3, 4, 5]));

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3110
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3110
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3119';
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
     * @tc.name   ArrayCombinationCollectionsTest3111
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3111
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3120';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const s = arr.copyWithin(0, 2).shift();
      expect(arr).assertDeepEquals(collections.Array.from([4, 3, 4]));
      expect(s).assertEqual(3);

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3112
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3112
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3121';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.copyWithin(0, 2).unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 3, 4, 3, 4]));

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3113
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3113
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3122';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.copyWithin(0, 2).splice(1, 2, 9);
      expect(arr).assertDeepEquals(collections.Array.from([3, 9, 4]));

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3114
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3114
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3123';
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
     * @tc.name   ArrayCombinationCollectionsTest3115
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3115
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3124';
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
     * @tc.name   ArrayCombinationCollectionsTest3116
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3116
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3125';
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
     * @tc.name   ArrayCombinationCollectionsTest3117
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3117
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3126';
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
     * @tc.name   ArrayCombinationCollectionsTest3118
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3118
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3127';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.fill(9, 1, 3).push(5);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 9, 4, 5]));

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3119
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3119
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3128';
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
     * @tc.name   ArrayCombinationCollectionsTest3120
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3120
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3129';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      const s = arr.fill(9, 1, 3).shift();
      expect(arr).assertDeepEquals(collections.Array.from([9, 9, 4]));
      expect(s).assertEqual(1);

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3121
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3121
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3130';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.fill(9, 1, 3).unshift(0);
      expect(arr).assertDeepEquals(collections.Array.from([0, 1, 9, 9, 4]));

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3122
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3122
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1

     */
    it('ArrayCombinationCollectionsTest3122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3131';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.from([1, 2, 3, 4]);
      arr.fill(9, 1, 3).splice(2, 1, 5);
      expect(arr).assertDeepEquals(collections.Array.from([1, 9, 5, 4]));

      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationCollectionsTest3123
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3123
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3132';
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
     * @tc.name   ArrayCombinationCollectionsTest3124
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3124
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3133';
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
     * @tc.name   ArrayCombinationCollectionsTest3125
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3125
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3134';
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
     * @tc.name   ArrayCombinationCollectionsTest3126
     * @tc.number BUILTINS_ARRAY_COMBINATION_COLLECTIONS_TEST3126
     * @tc.desc   Test Method Combination in Shared Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationCollectionsTest3126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationCollectionsTest3135';
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