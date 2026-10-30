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
import { collections } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from './pages/Utils';

const ELEMENT_COUNT: number = 10000;
const ROUND_COUNT: number = 100;

function makeLargeArray(count: number): collections.Array<number> {
  const arr: collections.Array<number> = new collections.Array<number>();
  for (let i: number = 0; i < count; i++) { arr.push(i); }
  return arr;
}

export default function CollectionsArrayStabilityTest() {
  describe('CollectionsArrayStabilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.name   collectionsArrayStabilityTest070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_STABILITY_0070
     * @tc.desc   case_id_temp_070: map a 10000-element array for 100 rounds and verify every round's
     *            result equals round 1 (length plus first/middle/last spot checks), with no crash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayStabilityTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        try {
          const arr: collections.Array<number> = makeLargeArray(ELEMENT_COUNT);
          // Round 1 establishes the reference result.
          const refResult: collections.Array<number> =
            arr.map<number>((x: number): number => x * 2);
          const refLen: number = refResult.length;
          const refFirst: number = refResult[0];
          const refMid: number = refResult[Math.floor(refLen / 2)];
          const refLast: number = refResult[refLen - 1];
          expect(refLen).assertEqual(ELEMENT_COUNT);
          expect(refFirst).assertEqual(0);
          expect(refLast).assertEqual((ELEMENT_COUNT - 1) * 2);
          // Rounds 2..ROUND_COUNT must each match the reference.
          for (let round: number = 2; round <= ROUND_COUNT; round++) {
            const r: collections.Array<number> = arr.map<number>((x: number): number => x * 2);
            expect(r.length).assertEqual(refLen);
            expect(r[0]).assertEqual(refFirst);
            expect(r[Math.floor(r.length / 2)]).assertEqual(refMid);
            expect(r[r.length - 1]).assertEqual(refLast);
          }
        } catch (error) {
          const e: BusinessError = error as BusinessError;
          console.error('collectionsArrayStabilityTest070 unexpected failure, code is ' + e.code +
            ', message is ' + e.message);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   collectionsArrayStabilityTest071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_STABILITY_0071
     * @tc.desc   case_id_temp_071: filter a 10000-element array for 100 rounds and verify every
     *            round's result equals round 1 (length plus first/middle/last spot checks), no crash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayStabilityTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        try {
          const arr: collections.Array<number> = makeLargeArray(ELEMENT_COUNT);
          // Round 1 establishes the reference result (even numbers 0,2,4,...,9998).
          const refResult: collections.Array<number> =
            arr.filter((x: number): boolean => x % 2 === 0);
          const refLen: number = refResult.length;
          const refFirst: number = refResult[0];
          const refMid: number = refResult[Math.floor(refLen / 2)];
          const refLast: number = refResult[refLen - 1];
          expect(refLen).assertEqual(ELEMENT_COUNT / 2);
          expect(refFirst).assertEqual(0);
          expect(refLast).assertEqual(ELEMENT_COUNT - 2);
          // Rounds 2..ROUND_COUNT must each match the reference.
          for (let round: number = 2; round <= ROUND_COUNT; round++) {
            const r: collections.Array<number> = arr.filter((x: number): boolean => x % 2 === 0);
            expect(r.length).assertEqual(refLen);
            expect(r[0]).assertEqual(refFirst);
            expect(r[Math.floor(r.length / 2)]).assertEqual(refMid);
            expect(r[r.length - 1]).assertEqual(refLast);
          }
        } catch (error) {
          const e: BusinessError = error as BusinessError;
          console.error('collectionsArrayStabilityTest071 unexpected failure, code is ' + e.code +
            ', message is ' + e.message);
          expect().assertFail();
        }
        done();
      });

  });
}
