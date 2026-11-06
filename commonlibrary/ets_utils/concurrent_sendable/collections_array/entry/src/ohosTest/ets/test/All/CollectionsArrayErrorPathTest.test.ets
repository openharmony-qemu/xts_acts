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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from './pages/Utils';

// A Sendable target type used as the declared element type of sendable
// containers. Non-Sendable values are funnelled into these containers through
// an `as Object as <Sendable>` double cast so that the compile-time sendable
// guard is bypassed and the runtime rejection (BusinessError 401) can be
// observed.
@Sendable
class SendableValue {
  val: number;
  constructor(val: number) {
    this.val = val;
  }
}

// Non-Sendable {val: number} object used to exercise the map-callback return
// path (case_id_temp_011).
class NonSendableResult {
  val: number;
  constructor(val: number) {
    this.val = val;
  }
}

// Non-Sendable {a: number} object used to exercise Set.add (case_id_temp_034).
class NonSendableObject {
  a: number;
  constructor(a: number) {
    this.a = a;
  }
}

export default function CollectionsArrayErrorPathTest() {
  describe('CollectionsArrayErrorPathTest', () => {
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
     * @tc.name   collectionsArrayErrorPathTest011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ERROR_PATH_0011
     * @tc.desc   map callback returns a non-Sendable object {val:1}, expect BusinessError 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayErrorPathTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsArrayErrorPathTest011';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number> = collections.Array.from([1, 2, 3]);
        let threw: boolean = false;
        let errCode: number = -1;
        try {
          // The callback declares a Sendable return type but returns a
          // plain (non-@Sendable) object cast through `as Object as`. The
          // runtime sendable check rejects the returned value when it is
          // placed into the result Sendable Array.
          arr.map((x: number): SendableValue => new NonSendableResult(x) as Object as SendableValue);
        } catch (e) {
          threw = true;
          errCode = (e as BusinessError).code;
        }
        expect(threw).assertTrue();
        expect(errCode).assertEqual(401);
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayErrorPathTest034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ERROR_PATH_0034
     * @tc.desc   Set.add a non-Sendable object {a:1}, expect BusinessError 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayErrorPathTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsArrayErrorPathTest034';
        console.info(`${caseName}, test start`);
        const set: collections.Set<SendableValue> = new collections.Set<SendableValue>();
        let threw: boolean = false;
        let errCode: number = -1;
        try {
          set.add(new NonSendableObject(1) as Object as SendableValue);
        } catch (e) {
          threw = true;
          errCode = (e as BusinessError).code;
        }
        expect(threw).assertTrue();
        expect(errCode).assertEqual(401);
        // The non-Sendable value must not have been stored.
        expect(set.size).assertEqual(0);
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayErrorPathTest048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ERROR_PATH_0048
     * @tc.desc   Non-callable callback (42) to forEach/map/filter/reduce on Array and forEach on Map & Set, expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayErrorPathTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsArrayErrorPathTest048';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number> = collections.Array.from([1, 2, 3]);

        // Array.forEach(42)
        let threw: boolean = false;
        let errMsg: string = '';
        try {
          arr.forEach(42 as Object as (value: number) => void);
        } catch (e) {
          threw = true;
          errMsg = (e as Error).message;
        }
        expect(threw).assertTrue();
        expect(errMsg.length > 0).assertTrue();

        // Array.map(42)
        threw = false;
        errMsg = '';
        try {
          arr.map(42 as Object as (value: number) => number);
        } catch (e) {
          threw = true;
          errMsg = (e as Error).message;
        }
        expect(threw).assertTrue();
        expect(errMsg.length > 0).assertTrue();

        // Array.filter(42)
        threw = false;
        errMsg = '';
        try {
          arr.filter(42 as Object as (value: number) => boolean);
        } catch (e) {
          threw = true;
          errMsg = (e as Error).message;
        }
        expect(threw).assertTrue();
        expect(errMsg.length > 0).assertTrue();

        // Array.reduce(42)
        threw = false;
        errMsg = '';
        try {
          arr.reduce(42 as Object as (acc: number, value: number) => number, 0);
        } catch (e) {
          threw = true;
          errMsg = (e as Error).message;
        }
        expect(threw).assertTrue();
        expect(errMsg.length > 0).assertTrue();

        // Map.forEach(42)
        const map: collections.Map<string, number> = new collections.Map<string, number>();
        map.set('a', 1);
        threw = false;
        errMsg = '';
        try {
          map.forEach(42 as Object as (value: number, key: string) => void);
        } catch (e) {
          threw = true;
          errMsg = (e as Error).message;
        }
        expect(threw).assertTrue();
        expect(errMsg.length > 0).assertTrue();

        // Set.forEach(42)
        const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
        threw = false;
        errMsg = '';
        try {
          set.forEach(42 as Object as (value: number) => void);
        } catch (e) {
          threw = true;
          errMsg = (e as Error).message;
        }
        expect(threw).assertTrue();
        expect(errMsg.length > 0).assertTrue();
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayErrorPathTest068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ERROR_PATH_0068
     * @tc.desc   collections.Int8Array constructed with a global ArrayBuffer / SharedArrayBuffer (not a
     *            sendable collections.ArrayBuffer), expect BusinessError 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayErrorPathTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsArrayErrorPathTest068';
        console.info(`${caseName}, test start`);

        // Sub-check 1: new collections.Int8Array(new ArrayBuffer(8))
        // The sendable collections.Int8Array expects a sendable collections.ArrayBuffer;
        // a plain global ArrayBuffer is not accepted and is rejected with 401.
        let threw1: boolean = false;
        let code1: number = -1;
        try {
          new collections.Int8Array(new ArrayBuffer(8) as Object as collections.ArrayBuffer);
        } catch (e) {
          threw1 = true;
          code1 = (e as BusinessError).code;
        }
        expect(threw1).assertTrue();
        expect(code1).assertEqual(401);

        // Sub-check 2: new collections.Int8Array(new SharedArrayBuffer(8))
        // A global SharedArrayBuffer is likewise not a sendable collections.ArrayBuffer
        // and is rejected with 401.
        let threw2: boolean = false;
        let code2: number = -1;
        try {
          new collections.Int8Array(new SharedArrayBuffer(8) as Object as collections.ArrayBuffer);
        } catch (e) {
          threw2 = true;
          code2 = (e as BusinessError).code;
        }
        expect(threw2).assertTrue();
        expect(code2).assertEqual(401);
        console.info(`${caseName}, test end`);
        done();
      });

  })
}
