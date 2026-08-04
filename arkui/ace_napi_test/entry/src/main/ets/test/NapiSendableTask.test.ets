/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import napitest from 'libnapitest.so';
import { taskpool } from '@kit.ArkTS';

export const sleep = (ms: number | undefined) => {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

const TASK_COUNT = 10;

@Concurrent
function napiIsSendableTest(): boolean {
  let test = [1, 2];
  let value = napitest.NapiIsSendable(test);
  return value;
}

@Concurrent
function NapiCreateSendableObject(): boolean {
  let value = napitest.NapiCreateSendableObject();
  return napitest.NapiIsSendable(value);
}

@Concurrent
function NapiCreateSendableArray(): boolean {
  let value = napitest.NapiCreateSendableArray();
  let res = value.length == 0;
  return res && napitest.NapiIsSendable(value);
}

@Concurrent
function NapiCreateSendableArrayWithLength(): boolean {
  let value = napitest.NapiCreateSendableArrayWithLength();
  let res = value.length == 1;
  return res && napitest.NapiIsSendable(value);
}

@Concurrent
function NapiCreateSendableArrayBuffer(): boolean {
  let value = napitest.NapiCreateSendableArrayBuffer();
  let res = value.byteLength == 1024;
  return res && napitest.NapiIsSendable(value);
}

@Concurrent
function NapiCreateSendableTypedArray(): boolean {
  let value = napitest.NapiCreateSendableTypedArray();
  let res = value.byteLength == 1024;
  return res && napitest.NapiIsSendable(value);
}

@Concurrent
function NapiWrapSendable(): boolean {
  let value = napitest.NapiCreateSendableObject();
  napitest.NapiWrapSendable(value, "data");
  let res1 = napitest.NapiUnwrapSendable(value) == "data";
  let res2 = napitest.NapiRemoveWrapSendable(value) == "data";
  let res3 = napitest.NapiUnwrapSendable(value) == undefined;
  return res1 && res2 && res3;
}

@Concurrent
function NapiWrapSendableWithSize(): boolean {
  let value = napitest.NapiCreateSendableObject();
  napitest.NapiWrapSendableWithSize(value, "data");
  let res1 = napitest.NapiUnwrapSendable(value) == "data";
  let res2 = napitest.NapiRemoveWrapSendable(value) == "data";
  let res3 = napitest.NapiUnwrapSendable(value) == undefined;
  return res1 && res2 && res3;
}

export default function NapiSendableTaskTest() {

  describe('napiSendableTaskTest', () => {

    beforeEach(async () => {
      await sleep(50);
    });

    afterEach(async () => {
      console.info('[napiSendableTaskTest] after each called')
    });

    /**
     * @tc.name   testNapiSendableTask0001
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0100
     * @tc.desc   NapiTaskTest NapiIsSendable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableTask0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0001';
      console.info(`${caseName} test start`);
      try {
        const promises: Promise<object>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          promises.push(taskpool.execute(napiIsSendableTest));
        }
        const results = await Promise.all(promises);
        for (const value of results) {
          expect(value).assertEqual(false);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testNapiSendableTask0002
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0200
     * @tc.desc   NapiTaskTest NapiCreateSendableObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableTask0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0002';
      console.info(`${caseName} test start`);
      try {
        const promises: Promise<object>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          promises.push(taskpool.execute(NapiCreateSendableObject));
        }
        const results = await Promise.all(promises);
        for (const value of results) {
          expect(value).assertEqual(true);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testNapiSendableTask0003
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0300
     * @tc.desc   NapiTaskTest NapiCreateSendableArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableTask0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0003';
      console.info(`${caseName} test start`);
      try {
        const promises: Promise<object>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          promises.push(taskpool.execute(NapiCreateSendableArray));
        }
        const results = await Promise.all(promises);
        for (const value of results) {
          expect(value).assertEqual(true);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testNapiSendableTask0004
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0400
     * @tc.desc   NapiTaskTest NapiCreateSendableArrayWithLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableTask0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0004';
      console.info(`${caseName} test start`);
      try {
        const promises: Promise<object>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          promises.push(taskpool.execute(NapiCreateSendableArrayWithLength));
        }
        const results = await Promise.all(promises);
        for (const value of results) {
          expect(value).assertEqual(true);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testNapiSendableTask0005
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0500
     * @tc.desc   NapiTaskTest NapiCreateSendableArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableTask0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0005';
      console.info(`${caseName} test start`);
      try {
        const promises: Promise<object>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          promises.push(taskpool.execute(NapiCreateSendableArrayBuffer));
        }
        const results = await Promise.all(promises);
        for (const value of results) {
          expect(value).assertEqual(true);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testNapiSendableTask0006
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0600
     * @tc.desc   NapiTaskTest NapiCreateSendableTypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableTask0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0006';
      console.info(`${caseName} test start`);
      try {
        const promises: Promise<object>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          promises.push(taskpool.execute(NapiCreateSendableTypedArray));
        }
        const results = await Promise.all(promises);
        for (const value of results) {
          expect(value).assertEqual(true);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testNapiSendableTask0007
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0700
     * @tc.desc   NapiTaskTest NapiWrapSendable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableTask0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0007';
      console.info(`${caseName} test start`);
      try {
        const promises: Promise<object>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          promises.push(taskpool.execute(NapiWrapSendable));
        }
        const results = await Promise.all(promises);
        for (const value of results) {
          expect(value).assertEqual(true);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testNapiSendableTask0008
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0800
     * @tc.desc   NapiTaskTest NapiWrapSendableWithSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableTask0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0008';
      console.info(`${caseName} test start`);
      try {
        const promises: Promise<object>[] = [];
        for (let i = 0; i < TASK_COUNT; i++) {
          promises.push(taskpool.execute(NapiWrapSendableWithSize));
        }
        const results = await Promise.all(promises);
        for (const value of results) {
          expect(value).assertEqual(true);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
  })
}
