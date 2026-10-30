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

// ArkTS strict mode rejects untyped object literals (arkts-no-untyped-obj-literals), so a bare
// `{}` cannot be used as the "plain object" receiver. This typed class stands in for a plain
// non-SendableArray object, mirroring the NormalClass receiver used by the existing unbound-method
// tests (ArrayBasic/ArrayExtended).
class PlainObjectReceiver {
  public tag: string = 'plain-object';
}

export default function CollectionsReceiverTypeCheckTest() {
  describe('CollectionsReceiverTypeCheckTest', () => {
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
     * @tc.name   collectionsReceiverTypeCheckTest052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_RECEIVER_TYPECHECK_0052
     * @tc.desc   case_id_temp_052: forEach invoked on a non-corresponding plain-object receiver
     *            throws a type error (10200011). ArkTS strict mode cannot access `.prototype` nor
     *            compile `Function.prototype.call`, so the unbound forEach is detached and rebound
     *            to the wrong receiver (same pattern as the existing Int8Array/forEach unbound tests).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsReceiverTypeCheckTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const unbound = arr.forEach;
        const wrongReceiver: PlainObjectReceiver = new PlainObjectReceiver();
        const bound: () => void = unbound.bind(wrongReceiver);
        let threw: boolean = false;
        try {
          // The receiver type check fires before any callback is consulted, so no callback arg is
          // required to provoke the type error (mirrors CollectionsSecondtest6000).
          bound();
          expect().assertFail();
        } catch (error) {
          const e: BusinessError = error as BusinessError;
          console.error('collectionsReceiverTypeCheckTest052 failed, code is ' + e.code +
            ', message is ' + e.message);
          expect(e.code).assertEqual(10200011);
          threw = true;
        }
        expect(threw).assertTrue();
        done();
      });

    /**
     * @tc.name   collectionsReceiverTypeCheckTest053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_RECEIVER_TYPECHECK_0053
     * @tc.desc   case_id_temp_053: forEach invoked on a non-corresponding builtin Array receiver
     *            [1,2,3] throws a type error (10200011). A plain (non-Sendable) Array is not a
     *            SendableArray, so the receiver type check rejects it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsReceiverTypeCheckTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const unbound = arr.forEach;
        const wrongReceiver: number[] = [1, 2, 3];
        const bound: () => void = unbound.bind(wrongReceiver);
        let threw: boolean = false;
        try {
          bound();
          expect().assertFail();
        } catch (error) {
          const e: BusinessError = error as BusinessError;
          console.error('collectionsReceiverTypeCheckTest053 failed, code is ' + e.code +
            ', message is ' + e.message);
          expect(e.code).assertEqual(10200011);
          threw = true;
        }
        expect(threw).assertTrue();
        done();
      });

    /**
     * @tc.name   collectionsReceiverTypeCheckTest054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_RECEIVER_TYPECHECK_0054
     * @tc.desc   case_id_temp_054: forEach invoked on a non-corresponding SendableMap receiver
     *            throws a type error (10200011). A collections.Map is a Sendable container but is
     *            not a SendableArray, so the receiver type check rejects it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsReceiverTypeCheckTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const unbound = arr.forEach;
        const wrongReceiver: collections.Map<number, number> =
          new collections.Map<number, number>([[1, 1], [2, 2]]);
        const bound: () => void = unbound.bind(wrongReceiver);
        let threw: boolean = false;
        try {
          bound();
          expect().assertFail();
        } catch (error) {
          const e: BusinessError = error as BusinessError;
          console.error('collectionsReceiverTypeCheckTest054 failed, code is ' + e.code +
            ', message is ' + e.message);
          expect(e.code).assertEqual(10200011);
          threw = true;
        }
        expect(threw).assertTrue();
        done();
      });

  });
}
