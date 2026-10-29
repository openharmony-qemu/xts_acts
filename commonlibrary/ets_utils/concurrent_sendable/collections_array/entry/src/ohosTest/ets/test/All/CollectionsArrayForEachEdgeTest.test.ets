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

export default function CollectionsArrayForEachEdgeTest() {
  describe('CollectionsArrayForEachEdgeTest', () => {
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
     * @tc.name   collectionsArrayForEachEdgeTest0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FOREACH_EDGE_0006
     * @tc.desc   case_id_temp_006: forEach on a single-element [42] invokes the callback exactly once with element 42, index 0 and the owning array reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayForEachEdgeTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      const array: collections.Array<number> = collections.Array.from<number>([42]);
      let callCount: number = 0;
      let capturedElement: number = 0;
      let capturedIndex: number = -1;
      let capturedArray: collections.Array<number> = array;
      array.forEach((value: number, index: number, arr: collections.Array<number>): void => {
        callCount++;
        capturedElement = value;
        capturedIndex = index;
        capturedArray = arr;
      });
      expect(callCount).assertEqual(1);
      expect(capturedElement).assertEqual(42);
      expect(capturedIndex).assertEqual(0);
      // The third callback argument must be the very same Sendable Array instance being iterated.
      expect(capturedArray === array).assertTrue();
      done();
    })

    /**
     * @tc.name   collectionsArrayForEachEdgeTest0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FOREACH_EDGE_0007
     * @tc.desc   case_id_temp_007: an Error thrown by a forEach callback propagates and the array can still be forEach-ed again afterwards
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayForEachEdgeTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      const array: collections.Array<number> = collections.Array.from<number>([1, 2, 3]);
      let firstThrown: boolean = false;
      try {
        array.forEach((value: number, index: number, arr: collections.Array<number>): void => {
          throw new Error('forEach callback boom');
        });
      } catch (e) {
        firstThrown = true;
      }
      expect(firstThrown).assertTrue();
      // The array must remain usable: a second forEach should still traverse every element.
      let sum: number = 0;
      let secondCallCount: number = 0;
      array.forEach((value: number, index: number, arr: collections.Array<number>): void => {
        sum += value;
        secondCallCount++;
      });
      expect(secondCallCount).assertEqual(3);
      expect(sum).assertEqual(6);
      done();
    })
  })
}
