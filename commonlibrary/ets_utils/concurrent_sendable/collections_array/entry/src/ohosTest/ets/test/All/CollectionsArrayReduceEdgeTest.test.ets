/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { sleep } from './pages/Utils';
import { collections } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

export default function CollectionsArrayReduceEdgeTest() {
  describe('CollectionsArrayReduceEdgeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.name   collectionsArrayReduceEdgeTest0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_REDUCE_EDGE_0019
     * @tc.desc   case_id_temp_019: reduce without initialValue on single-element [42] returns 42 and the callback is never invoked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayReduceEdgeTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      const array: collections.Array<number> = collections.Array.from<number>([42]);
      let callCount: number = 0;
      const reducedValue: number = array.reduce((previousValue: number, currentValue: number, currentIndex: number, arr: collections.Array<number>): number => {
        callCount++;
        return previousValue + currentValue;
      });
      // Without initialValue the single element becomes the accumulator, so the callback is not called.
      expect(reducedValue).assertEqual(42);
      expect(callCount).assertEqual(0);
      done();
    })

    /**
     * @tc.name   collectionsArrayReduceEdgeTest0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_REDUCE_EDGE_0020
     * @tc.desc   case_id_temp_020: reduce without initialValue on an empty array throws (TypeError / BusinessError code 401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayReduceEdgeTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      const array: collections.Array<number> = collections.Array.from<number>([]);
      let threw: boolean = false;
      let isExpectedError: boolean = false;
      try {
        array.reduce((previousValue: number, currentValue: number, currentIndex: number, arr: collections.Array<number>): number => {
          return previousValue + currentValue;
        });
      } catch (e) {
        threw = true;
        const code: number = (e as BusinessError).code;
        // The native Sendable Array reports the empty-reduce violation either as a JS TypeError
        // or as a BusinessError with code 401 (invalid input parameter).
        isExpectedError = (e as Error).name === 'TypeError' || code === 401;
      }
      expect(threw).assertTrue();
      expect(isExpectedError).assertTrue();
      done();
    })

    /**
     * @tc.name   collectionsArrayReduceEdgeTest0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_REDUCE_EDGE_0007
     * @tc.desc   case_id_temp_007: an Error thrown by a forEach callback propagates and the array stays usable afterwards
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayReduceEdgeTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      const array: collections.Array<number> = collections.Array.from<number>([1, 2, 3]);
      let threw: boolean = false;
      try {
        array.forEach((value: number, index: number, arr: collections.Array<number>): void => {
          throw new Error('forEach callback boom');
        });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      // The array must still be usable after the exception propagated out of forEach.
      let sum: number = 0;
      array.forEach((value: number, index: number, arr: collections.Array<number>): void => {
        sum += value;
      });
      expect(sum).assertEqual(6);
      done();
    })

    /**
     * @tc.name   collectionsArrayReduceEdgeTest0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_REDUCE_EDGE_0012
     * @tc.desc   case_id_temp_012: a TypeError thrown by a map callback propagates and the original array is left unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayReduceEdgeTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      const array: collections.Array<number> = collections.Array.from<number>([1, 2, 3]);
      let threw: boolean = false;
      let isTypeError: boolean = false;
      try {
        array.map<number>((value: number, index: number, arr: collections.Array<number>): number => {
          throw new TypeError('map callback boom');
        });
      } catch (e) {
        threw = true;
        isTypeError = (e as Error).name === 'TypeError';
      }
      expect(threw).assertTrue();
      expect(isTypeError).assertTrue();
      // map must not mutate the source array when the callback aborts.
      expect(array.length).assertEqual(3);
      expect(array[0]).assertEqual(1);
      expect(array[1]).assertEqual(2);
      expect(array[2]).assertEqual(3);
      done();
    })
  })
}
