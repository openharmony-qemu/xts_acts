/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
import { collections, ArkTSUtils, lang } from '@kit.ArkTS';
import napitest from 'libentry.so';
import { sleep } from './Utils';

const GC_WAIT_MS: number = 500;
const LARGE_CAPACITY: number = 1025;
const CONCURRENT_THREAD_COUNT: number = 10;

class NonSendableObj {
  key: string = '';
  index: number = 0;
}

@Concurrent
function taskCreateSendableObject(): lang.ISendable {
  return napitest.NapiCreateSendableObject();
}

@Concurrent
function taskVerifyIsSendable(obj: lang.ISendable): boolean {
  return napitest.NapiIsSendable(obj);
}

@Concurrent
function taskPassSendableObject(obj: lang.ISendable): boolean {
  return napitest.NapiIsSendable(obj);
}

@Concurrent
function taskReturnSendableObject(obj: lang.ISendable): lang.ISendable {
  return obj;
}

@Concurrent
function taskWrapSendable(obj: lang.ISendable, data: string): void {
  napitest.NapiWrapSendable(obj, data.toString());
}

@Concurrent
function taskUnwrapSendable(obj: lang.ISendable): string {
  return napitest.NapiUnwrapSendable(obj);
}

@Concurrent
function taskRemoveWrapSendable(obj: lang.ISendable): string {
  return napitest.NapiRemoveWrapSendable(obj);
}

@Concurrent
function taskCreateFloat64Array(): boolean {
  return napitest.createSendableFloat64ArrayTest();
}

@Concurrent
function taskAccessFloat64ArrayElement(arr: Float64Array, index: number): number {
  return arr[index];
}

@Concurrent
function taskCreateStrongRef(): boolean {
  return napitest.NapiCreateStrongSendableRef();
}

@Concurrent
async function concurrentCreateObjectWithLock(lock: ArkTSUtils.locks.AsyncLock,
  arr: collections.Array<lang.ISendable>): Promise<number> {
  return await lock.lockAsync((): number => {
    const obj: lang.ISendable = napitest.NapiCreateSendableObject();
    arr.push(obj);
    return arr.length;
  });
}

@Concurrent
async function concurrentVerifyIsSendableWithLock(lock: ArkTSUtils.locks.AsyncLock,
  obj: lang.ISendable): Promise<boolean> {
  return await lock.lockAsync((): boolean => {
    return napitest.NapiIsSendable(obj);
  });
}

@Concurrent
async function concurrentPassObjectWithLock(lock: ArkTSUtils.locks.AsyncLock,
  obj: lang.ISendable): Promise<lang.ISendable> {
  return await lock.lockAsync((): lang.ISendable => {
    return obj;
  });
}

@Concurrent
async function concurrentWrapWithLock(lock: ArkTSUtils.locks.AsyncLock, obj: lang.ISendable,
  data: string): Promise<void> {
  return await lock.lockAsync((): void => {
    napitest.NapiWrapSendable(obj, data.toString());
  });
}

@Concurrent
async function concurrentUnwrapWithLock(lock: ArkTSUtils.locks.AsyncLock, obj: lang.ISendable): Promise<string> {
  return await lock.lockAsync((): string => {
    return napitest.NapiUnwrapSendable(obj);
  });
}

@Concurrent
async function concurrentRemoveWrapWithLock(lock: ArkTSUtils.locks.AsyncLock, obj: lang.ISendable): Promise<string> {
  return await lock.lockAsync((): string => {
    return napitest.NapiRemoveWrapSendable(obj);
  });
}

@Concurrent
function concurrentIsSendableCheck(obj: lang.ISendable): boolean {
  return napitest.NapiIsSendable(obj);
}

@Concurrent
function concurrentCreateFloat64ArrayTryCatch(): boolean {
  try {
    return napitest.createSendableFloat64ArrayTest();
  } catch (e) {
    return false;
  }
}

@Concurrent
async function concurrentCreateFloat64ArrayWithLock(lock: ArkTSUtils.locks.AsyncLock): Promise<boolean> {
  return await lock.lockAsync((): boolean => {
    return napitest.createSendableFloat64ArrayTest();
  });
}

@Concurrent
async function concurrentAccessTypedArrayWithLock(lock: ArkTSUtils.locks.AsyncLock, arr: Float64Array, index: number):
  Promise<number> {
  return await lock.lockAsync((): number => {
    return arr[index];
  });
}

@Concurrent
async function concurrentCreateStrongRefWithLock(lock: ArkTSUtils.locks.AsyncLock): Promise<boolean> {
  return await lock.lockAsync((): boolean => {
    return napitest.NapiCreateStrongSendableRef();
  });
}

@Concurrent
function taskCreateAndVerifySendable(obj: lang.ISendable): boolean {
  return napitest.NapiIsSendable(obj);
}

@Concurrent
function taskCreateObjectForGC(): Object {
  return napitest.NapiCreateSendableObject();
}

export default function NativeSendableObjectTest() {
  describe('NativeSendableObjectStressTest', (): void => {
    beforeAll((): void => {
      console.info('NativeSendableObjectStressTest beforeAll called');
    });

    beforeEach((): void => {
      console.info('NativeSendableObjectStressTest beforeEach called');
    });

    afterEach((): void => {
      console.info('NativeSendableObjectStressTest afterEach called');
    });

    afterAll((): void => {
      console.info('NativeSendableObjectStressTest afterAll called');
    });

    // ==================== 1. Object creation - Large volume (5 tests) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_0100
     * @tc.name   testNapiCreateSendableObject0001
     * @tc.desc   Test NapiCreateSendableObject with normal parameters in large volume.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiCreateSendableObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiCreateSendableObject0001';
      console.info(`${caseName} test start`);
      try {
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: Object = napitest.NapiCreateSendableObject();
          expect(obj !== null).assertTrue();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_0200
     * @tc.name   testNapiCreateSendableObject0002
     * @tc.desc   Test NapiCreateSendableObject pushed to collections.Array in large volume.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiCreateSendableObject0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiCreateSendableObject0002';
      console.info(`${caseName} test start`);
      try {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          arr.push(obj);
        }
        expect(arr.length).assertEqual(LARGE_CAPACITY);
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_0300
     * @tc.name   testNapiIsSendable0001
     * @tc.desc   Test NapiIsSendable with sendable objects in large volume.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiIsSendable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const caseName: string = 'testNapiIsSendable0001';
      console.info(`${caseName} test start`);
      try {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          arr.push(obj);
        }
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          expect(napitest.NapiIsSendable(arr[i])).assertTrue();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_0400
     * @tc.name   testNapiCreateSendableArrayWithLength0001
     * @tc.desc   Test NapiCreateSendableArrayWithLength with large capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiCreateSendableArrayWithLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiCreateSendableArrayWithLength0001';
      console.info(`${caseName} test start`);
      try {
        const nativeArr: lang.ISendable = napitest.NapiCreateSendableArrayWithLength(LARGE_CAPACITY);
        expect(nativeArr !== null).assertTrue();
        expect((nativeArr as Array<lang.ISendable>).length).assertEqual(LARGE_CAPACITY);
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_0500
     * @tc.name   testNapiCreateSendableArrayBuffer0001
     * @tc.desc   Test NapiCreateSendableArrayBuffer with large capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiCreateSendableArrayBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiCreateSendableArrayBuffer0001';
      console.info(`${caseName} test start`);
      try {
        const bufferSize: number = LARGE_CAPACITY * 8;
        const buffer: ArrayBuffer = napitest.NapiCreateSendableArrayBuffer(bufferSize) as ArrayBuffer;
        expect(buffer !== null).assertTrue();
        expect(buffer.byteLength).assertEqual(bufferSize);
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    // ==================== 2. Object creation - Concurrent WITH AsyncLock (3 tests) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_0600
     * @tc.name   testConcurrentCreateObjectWithLock0001
     * @tc.desc   Test concurrent NapiCreateSendableObject with AsyncLock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentCreateObjectWithLock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testConcurrentCreateObjectWithLock0001';
      console.info(`${caseName} test start`);
      try {
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        const tasks: Promise<number>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(concurrentCreateObjectWithLock, lock, arr) as Promise<number>);
        }

        const results: number[] = await Promise.all(tasks);
        expect(arr.length).assertEqual(CONCURRENT_THREAD_COUNT);
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_0700
     * @tc.name   testConcurrentVerifyIsSendableWithLock0001
     * @tc.desc   Test concurrent NapiIsSendable with AsyncLock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentVerifyIsSendableWithLock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testConcurrentVerifyIsSendableWithLock0001';
      console.info(`${caseName} test start`);
      try {
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const objs: lang.ISendable[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          objs.push(napitest.NapiCreateSendableObject());
        }
        const tasks: Promise<boolean>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(concurrentVerifyIsSendableWithLock, lock, objs[i]) as Promise<boolean>);
        }

        const results: boolean[] = await Promise.all(tasks);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i]).assertTrue();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_0800
     * @tc.name   testConcurrentPassObjectWithLock0001
     * @tc.desc   Test concurrent pass sendable object with AsyncLock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentPassObjectWithLock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testConcurrentPassObjectWithLock0001';
      console.info(`${caseName} test start`);
      try {
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const objs: lang.ISendable[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          objs.push(napitest.NapiCreateSendableObject());
        }
        const tasks: Promise<lang.ISendable>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(concurrentPassObjectWithLock, lock, objs[i]) as Promise<lang.ISendable>);
        }

        const results: lang.ISendable[] = await Promise.all(tasks);
        expect(results.length).assertEqual(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i] === objs[i]).assertTrue();
          expect(napitest.NapiIsSendable(results[i])).assertTrue();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    // ==================== 3. Object creation - Concurrent WITHOUT lock (3 tests) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_0900
     * @tc.name   testConcurrentCreateObjectWithoutLock0001
     * @tc.desc   Test concurrent NapiCreateSendableObject without lock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentCreateObjectWithoutLock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testConcurrentCreateObjectWithoutLock0001';
      console.info(`${caseName} test start`);
      try {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        const tasks: Promise<lang.ISendable>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(taskCreateSendableObject) as Promise<lang.ISendable>);
        }

        const results: lang.ISendable[] = await Promise.all(tasks);
        expect(results.length).assertEqual(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i] !== null).assertTrue();
          expect(napitest.NapiIsSendable(results[i])).assertTrue();
          arr.push(results[i]);
        }
        expect(arr.length).assertEqual(CONCURRENT_THREAD_COUNT);
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_1000
     * @tc.name   testConcurrentIsSendableCheck0001
     * @tc.desc   Test concurrent NapiIsSendable check without lock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentIsSendableCheck0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testConcurrentIsSendableCheck0001';
      console.info(`${caseName} test start`);
      try {
        const objs: lang.ISendable[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          objs.push(napitest.NapiCreateSendableObject());
        }
        const tasks: Promise<boolean>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(concurrentIsSendableCheck, objs[i]) as Promise<boolean>);
        }

        const results: boolean[] = await Promise.all(tasks);
        expect(results.length).assertEqual(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i]).assertTrue();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_1100
     * @tc.name   testNapiPassSendableObjectConcurrent0001
     * @tc.desc   Test NapiCreateSendableObject and NapiIsSendable in TaskPool threads concurrently.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiPassSendableObjectConcurrent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiPassSendableObjectConcurrent0001';
      console.info(`${caseName} test start`);
      try {
        const objs: lang.ISendable[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          objs.push(napitest.NapiCreateSendableObject());
        }
        const tasks: Promise<lang.ISendable>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(taskReturnSendableObject, objs[i]) as Promise<lang.ISendable>);
        }

        const results: lang.ISendable[] = await Promise.all(tasks);
        expect(results.length).assertEqual(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i] === objs[i]).assertTrue();
          expect(napitest.NapiIsSendable(results[i])).assertTrue();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    // ==================== 4. NapiIsSendable - Large volume (3 tests) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_1200
     * @tc.name   testNapiIsSendableLargeVolumeTrue0001
     * @tc.desc   Test NapiIsSendable with 1025 sendable objects, all return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiIsSendableLargeVolumeTrue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiIsSendableLargeVolumeTrue0001';
      console.info(`${caseName} test start`);
      try {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          arr.push(obj);
        }
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          expect(napitest.NapiIsSendable(arr[i])).assertTrue();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_1300
     * @tc.name   testNapiIsSendableLargeVolumeFalse0001
     * @tc.desc   Test NapiIsSendable with 1025 non-sendable objects, all return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiIsSendableLargeVolumeFalse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiIsSendableLargeVolumeFalse0001';
      console.info(`${caseName} test start`);
      try {
        const arr: Object[] = [];
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const plainObj: NonSendableObj = { key: 'value', index: i };
          arr.push(plainObj);
        }
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          expect(napitest.NapiIsSendable(arr[i])).assertFalse();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_1400
     * @tc.name   testNapiIsSendableMixedLargeVolume0001
     * @tc.desc   Test NapiIsSendable with 1025 mixed sendable/non-sendable objects alternately.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiIsSendableMixedLargeVolume0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiIsSendableMixedLargeVolume0001';
      console.info(`${caseName} test start`);
      try {
        const mixedArr: Object[] = [];
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          if (i % 2 === 0) {
            mixedArr.push(napitest.NapiCreateSendableObject());
          } else {
            const plainObj: NonSendableObj = { key: 'value', index: i };
            mixedArr.push(plainObj);
          }
        }
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          if (i % 2 === 0) {
            expect(napitest.NapiIsSendable(mixedArr[i])).assertTrue();
          } else {
            expect(napitest.NapiIsSendable(mixedArr[i])).assertFalse();
          }
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    // ==================== 5. NapiIsSendable - Concurrent (5 tests) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_1500
     * @tc.name   testNapiIsSendableConcurrentWithLock0001
     * @tc.desc   Test NapiIsSendable concurrently with AsyncLock protection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiIsSendableConcurrentWithLock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiIsSendableConcurrentWithLock0001';
      console.info(`${caseName} test start`);
      try {
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          arr.push(obj);
        }
        const tasks: Promise<boolean>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const obj: lang.ISendable = arr[i * 100];
          tasks.push(taskpool.execute(concurrentVerifyIsSendableWithLock, lock, obj) as Promise<boolean>);
        }

        const results: boolean[] = await Promise.all(tasks);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i]).assertTrue();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_1600
     * @tc.name   testNapiIsSendableConcurrentWithoutLock0001
     * @tc.desc   Test NapiIsSendable concurrently without AsyncLock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiIsSendableConcurrentWithoutLock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiIsSendableConcurrentWithoutLock0001';
      console.info(`${caseName} test start`);
      try {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          arr.push(obj);
        }
        const tasks: Promise<boolean>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const obj: lang.ISendable = arr[i * 100];
          tasks.push(taskpool.execute(concurrentIsSendableCheck, obj) as Promise<boolean>);
        }

        const results: boolean[] = await Promise.all(tasks);
        expect(results.length).assertEqual(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i]).assertTrue();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_1700
     * @tc.name   testNapiIsSendableTaskPoolCreateVerify0001
     * @tc.desc   Test NapiCreateSendableObject in TaskPool threads then verify with NapiIsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiIsSendableTaskPoolCreateVerify0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiIsSendableTaskPoolCreateVerify0001';
      console.info(`${caseName} test start`);
      try {
        const objs: lang.ISendable[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(taskCreateSendableObject);
          const obj: lang.ISendable = await taskpool.execute(task) as lang.ISendable;
          objs.push(obj);
        }
        const tasks: Promise<boolean>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(taskVerifyIsSendable, objs[i]) as Promise<boolean>);
        }

        const results: boolean[] = await Promise.all(tasks);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i]).assertTrue();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_1800
     * @tc.name   testNapiIsSendableWrappedObjectConcurrent0001
     * @tc.desc   Test NapiWrapSendable then NapiIsSendable verification concurrently.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiIsSendableWrappedObjectConcurrent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiIsSendableWrappedObjectConcurrent0001';
      console.info(`${caseName} test start`);
      try {
        const objs: lang.ISendable[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          napitest.NapiWrapSendable(obj, i.toString());
          objs.push(obj);
        }
        const tasks: Promise<boolean>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(taskVerifyIsSendable, objs[i]) as Promise<boolean>);
        }

        const results: boolean[] = await Promise.all(tasks);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i]).assertTrue();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_1900
     * @tc.name   testNapiIsSendableAfterGcClear0001
     * @tc.desc   Test NapiIsSendable after clearing large volume objects and waiting for GC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiIsSendableAfterGcClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiIsSendableAfterGcClear0001';
      console.info(`${caseName} test start`);
      try {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          arr.push(obj);
        }
        expect(napitest.NapiIsSendable(arr[0])).assertTrue();
        for (let j: number = arr.length - 1; j >= 0; j--) {
          arr.pop();
        }
        await sleep(GC_WAIT_MS);
        expect(arr.length).assertEqual(0);
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    // ==================== 6. Wrap/Unwrap - Large volume (3 tests) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_2000
     * @tc.name   testNapiWrapSendableLargeVolume0001
     * @tc.desc   Test NapiWrapSendable with 1025 objects in large volume.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWrapSendableLargeVolume0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiWrapSendableLargeVolume0001';
      console.info(`${caseName} test start`);
      try {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          napitest.NapiWrapSendable(obj, i.toString());
          arr.push(obj);
        }
        expect(arr.length).assertEqual(LARGE_CAPACITY);
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const data: string = napitest.NapiUnwrapSendable(arr[i]);
          expect(data).assertEqual(i.toString());
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_2100
     * @tc.name   testNapiUnwrapSendableLargeVolume0001
     * @tc.desc   Test NapiUnwrapSendable with 1025 wrapped objects in large volume.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiUnwrapSendableLargeVolume0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiUnwrapSendableLargeVolume0001';
      console.info(`${caseName} test start`);
      try {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          napitest.NapiWrapSendable(obj, (i * 10).toString());
          arr.push(obj);
        }
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const data: string = napitest.NapiUnwrapSendable(arr[i]);
          expect(data).assertEqual((i * 10).toString());
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_2200
     * @tc.name   testNapiRemoveWrapSendableLargeVolume0001
     * @tc.desc   Test NapiRemoveWrapSendable with 1025 wrapped objects in large volume.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiRemoveWrapSendableLargeVolume0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiRemoveWrapSendableLargeVolume0001';
      console.info(`${caseName} test start`);
      try {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        const dataArr: string[] = [];
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          napitest.NapiWrapSendable(obj, (i * 100).toString());
          arr.push(obj);
          dataArr.push((i * 100).toString());
        }
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const removed: string = napitest.NapiRemoveWrapSendable(arr[i]);
          expect(removed).assertEqual(dataArr[i].toString());
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    // ==================== 7. Wrap/Unwrap - Concurrent WITH lock (3 tests) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_2300
     * @tc.name   testNapiWrapSendableConcurrentWithLock0001
     * @tc.desc   Test NapiWrapSendable concurrently with AsyncLock protection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWrapSendableConcurrentWithLock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiWrapSendableConcurrentWithLock0001';
      console.info(`${caseName} test start`);
      try {
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          arr.push(obj);
        }
        const tasks: Promise<Object>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const obj: lang.ISendable = arr[i * 100];
          tasks.push(taskpool.execute(concurrentWrapWithLock, lock, obj, i.toString()) as Promise<Object>);
        }

        await Promise.all(tasks);
        expect(tasks.length).assertEqual(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const unwrappedData: string = napitest.NapiUnwrapSendable(arr[i * 100]);
          expect(unwrappedData).assertEqual(i.toString());
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_2400
     * @tc.name   testNapiUnwrapSendableConcurrentWithLock0001
     * @tc.desc   Test NapiUnwrapSendable concurrently with AsyncLock protection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiUnwrapSendableConcurrentWithLock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiUnwrapSendableConcurrentWithLock0001';
      console.info(`${caseName} test start`);
      try {
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          napitest.NapiWrapSendable(obj, (i * 1000).toString());
          arr.push(obj);
        }
        const tasks: Promise<string>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(concurrentUnwrapWithLock, lock, arr[i]) as Promise<string>);
        }

        const results: string[] = await Promise.all(tasks);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i]).assertEqual((i * 1000).toString());
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_2500
     * @tc.name   testNapiRemoveWrapSendableConcurrentWithLock0001
     * @tc.desc   Test NapiRemoveWrapSendable concurrently with AsyncLock protection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiRemoveWrapSendableConcurrentWithLock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiRemoveWrapSendableConcurrentWithLock0001';
      console.info(`${caseName} test start`);
      try {
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        const dataArr: string[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          napitest.NapiWrapSendable(obj, (i * 5000).toString());
          arr.push(obj);
          dataArr.push((i * 5000).toString());
        }
        const tasks: Promise<string>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(concurrentRemoveWrapWithLock, lock, arr[i]) as Promise<string>);
        }

        const results: string[] = await Promise.all(tasks);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i]).assertEqual(dataArr[i].toString());
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    // ==================== 8. Wrap/Unwrap - Concurrent WITHOUT lock (3 tests) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_2600
     * @tc.name   testNapiWrapSendableConcurrentWithoutLock0001
     * @tc.desc   Test NapiWrapSendable concurrently without AsyncLock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWrapSendableConcurrentWithoutLock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiWrapSendableConcurrentWithoutLock0001';
      console.info(`${caseName} test start`);
      try {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          arr.push(obj);
        }
        const tasks: Promise<Object>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(taskWrapSendable, arr[i], i.toString());
          tasks.push(taskpool.execute(task) as Promise<Object>);
        }

        await Promise.all(tasks);
        expect(tasks.length).assertEqual(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const unwrappedData: string = napitest.NapiUnwrapSendable(arr[i]);
          expect(unwrappedData).assertEqual(i.toString());
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_2700
     * @tc.name   testNapiUnwrapSendableConcurrentWithoutLock0001
     * @tc.desc   Test NapiUnwrapSendable concurrently without AsyncLock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiUnwrapSendableConcurrentWithoutLock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiUnwrapSendableConcurrentWithoutLock0001';
      console.info(`${caseName} test start`);
      try {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          napitest.NapiWrapSendable(obj, (i * 100).toString());
          arr.push(obj);
        }
        const tasks: Promise<string>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(taskUnwrapSendable, arr[i]);
          tasks.push(taskpool.execute(task) as Promise<string>);
        }

        const results: string[] = await Promise.all(tasks);
        expect(results.length).assertEqual(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i]).assertEqual((i * 100).toString());
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_2800
     * @tc.name   testNapiRemoveWrapSendableConcurrentWithoutLock0001
     * @tc.desc   Test NapiRemoveWrapSendable concurrently without AsyncLock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiRemoveWrapSendableConcurrentWithoutLock0001', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiRemoveWrapSendableConcurrentWithoutLock0001';
      console.info(`${caseName} test start`);
      try {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          napitest.NapiWrapSendable(obj, (i * 200).toString());
          arr.push(obj);
        }
        const tasks: Promise<string>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const task: taskpool.Task = new taskpool.Task(taskRemoveWrapSendable, arr[i]);
          tasks.push(taskpool.execute(task) as Promise<string>);
        }

        const results: string[] = await Promise.all(tasks);
        expect(results.length).assertEqual(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i]).assertEqual((i * 200).toString());
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    // ==================== 9. TypedArray stress (3 tests) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_2900
     * @tc.name   testCreateSendableFloat64Array0001
     * @tc.desc   Test createSendableFloat64ArrayTest normal call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it('testCreateSendableFloat64Array0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testCreateSendableFloat64Array0001';
      console.info(`${caseName} test start`);
      try {
        const arr: collections.Array<boolean> = new collections.Array<boolean>();
        for (let i: number = 0; i < 10; i++) {
          const result: boolean = napitest.createSendableFloat64ArrayTest();
          expect(result).assertEqual(1);
          arr.push(result);
        }
        expect(arr.length).assertEqual(10);
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('AssertException');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_3000
     * @tc.name   testConcurrentCreateSendableFloat64Array0001
     * @tc.desc   Test concurrent createSendableFloat64ArrayTest.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentCreateSendableFloat64Array0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testConcurrentCreateSendableFloat64Array0001';
      console.info(`${caseName} test start`);
      try {
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const arr: collections.Array<boolean> = new collections.Array<boolean>();
        const tasks: Promise<boolean>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(concurrentCreateFloat64ArrayWithLock, lock) as Promise<boolean>);
        }

        const results: boolean[] = await Promise.all(tasks);
        expect(results.length).assertEqual(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          arr.push(results[i]);
        }
        expect(arr.length).assertEqual(CONCURRENT_THREAD_COUNT);
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_3100
     * @tc.name   testConcurrentAccessTypedArrayWithLock0001
     * @tc.desc   Test concurrent access typed array with AsyncLock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentAccessTypedArrayWithLock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testConcurrentAccessTypedArrayWithLock0001';
      console.info(`${caseName} test start`);
      try {
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const result: boolean = napitest.createSendableFloat64ArrayTest();
        expect(result).assertEqual(1);
        const typedArr: Float64Array = new Float64Array(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          typedArr[i] = i * 100;
        }
        const tasks: Promise<number>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(concurrentAccessTypedArrayWithLock, lock, typedArr, i) as Promise<number>);
        }

        const results: number[] = await Promise.all(tasks);
        expect(results.length).assertEqual(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i]).assertEqual(i * 100);
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('AssertException');
      }
    });

    // ==================== 10. Strong reference stress (3 tests) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_3200
     * @tc.name   testNapiCreateStrongSendableRef0001
     * @tc.desc   Test NapiCreateStrongSendableRef in large volume.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiCreateStrongSendableRef0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiCreateStrongSendableRef0001';
      console.info(`${caseName} test start`);
      try {
        const refs: boolean[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const ref: boolean = napitest.NapiCreateStrongSendableRef();
          expect(ref).assertTrue();
          refs.push(ref);
        }
        expect(refs.length).assertEqual(CONCURRENT_THREAD_COUNT);
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('AssertException');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_3300
     * @tc.name   testConcurrentCreateStrongSendableRef0001
     * @tc.desc   Test concurrent NapiCreateStrongSendableRef with AsyncLock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentCreateStrongSendableRef0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testConcurrentCreateStrongSendableRef0001';
      console.info(`${caseName} test start`);
      try {
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const refs: boolean[] = [];
        const tasks: Promise<boolean>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(concurrentCreateStrongRefWithLock, lock) as Promise<boolean>);
        }

        const results: boolean[] = await Promise.all(tasks);
        expect(results.length).assertEqual(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i]).assertTrue();
          refs.push(results[i]);
        }
        expect(refs.length).assertEqual(CONCURRENT_THREAD_COUNT);
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NATIVESENDABLEOBJECT_3400
     * @tc.name   testNapiDelStrongSendableRef0001
     * @tc.desc   Test NapiDelStrongSendableRef in large volume.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiDelStrongSendableRef0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():
      Promise<void> => {
      const caseName: string = 'testNapiDelStrongSendableRef0001';
      console.info(`${caseName} test start`);
      try {
        const refs: boolean[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const ref: boolean = napitest.NapiCreateStrongSendableRef();
          expect(ref).assertTrue();
          refs.push(ref);
        }
        expect(refs.length).assertEqual(CONCURRENT_THREAD_COUNT);
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const result: boolean = napitest.NapiDelStrongSendableRef();
          expect(result).assertTrue();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error(`${caseName} failed, error: ${error}`);
        expect(error.name).assertEqual('AssertException');
      }
    });
  });
}
