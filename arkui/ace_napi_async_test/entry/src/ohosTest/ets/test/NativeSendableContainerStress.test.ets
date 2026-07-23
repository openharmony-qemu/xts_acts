/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { collections, lang, ArkTSUtils } from '@kit.ArkTS';
import napitest from 'libentry.so';
import { SharedSingleton } from './SharedSingleton';
import { createSharedLock, withLock } from './SharedLock';
const LARGE_CAPACITY: number = 1025;
const CONCURRENT_THREAD_COUNT: number = 10;
const SLEEP_INTERVAL_MS: number = 100;

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: Function): void => {
    setTimeout(resolve, ms);
  });
}


@Concurrent
function stressArrayPushWithLock(
  lockBuffer: SharedArrayBuffer,
  arr: collections.Array<lang.ISendable>,
  obj: lang.ISendable
): number {
  return withLock(lockBuffer, (): number => {
    return arr.push(obj);
  });
}

@Concurrent
function stressArrayPopWithLock(
  lockBuffer: SharedArrayBuffer,
  arr: collections.Array<lang.ISendable>
): lang.ISendable | undefined {
  return withLock(lockBuffer, (): lang.ISendable | undefined => {
    return arr.pop();
  });
}

@Concurrent
function stressArrayReadWithLock(
  lockBuffer: SharedArrayBuffer,
  arr: collections.Array<lang.ISendable>,
  index: number
): lang.ISendable | undefined {
  return withLock(lockBuffer, (): lang.ISendable | undefined => {
    return arr[index];
  });
}

@Concurrent
function stressArrayModifyWithLock(
  lockBuffer: SharedArrayBuffer,
  arr: collections.Array<lang.ISendable>,
  index: number,
  obj: lang.ISendable
): void {
  return withLock(lockBuffer, (): void => {
    arr[index] = obj;
  });
}

@Concurrent
function stressArrayForEachWithLock(
  lockBuffer: SharedArrayBuffer,
  arr: collections.Array<lang.ISendable>
): void {
  return withLock(lockBuffer, (): void => {
    arr.forEach((item: lang.ISendable): void => {
      // forEach 回调不需要额外操作
    });
  });
}

@Concurrent
function stressArrayPushNoLock(
  arr: collections.Array<lang.ISendable>,
  obj: lang.ISendable
): number {
  try {
    return arr.push(obj);
  } catch (e) {
    return -1;
  }
}


@Concurrent
function stressArrayPopNoLock(
  arr: collections.Array<lang.ISendable>
): lang.ISendable | undefined {
  try {
    return arr.pop();
  } catch (e) {
    return undefined;
  }
}


@Concurrent
function stressArrayReadNoLock(
  arr: collections.Array<lang.ISendable>,
  index: number
): lang.ISendable | undefined {
  try {
    return arr[index];
  } catch (e) {
    return undefined;
  }
}


@Concurrent
function stressArrayIndexOfNoLock(
  arr: collections.Array<lang.ISendable>,
  obj: lang.ISendable
): number {
  try {
    return arr.indexOf(obj);
  } catch (e) {
    return -1;
  }
}


@Concurrent
function stressArrayIncludesNoLock(
  arr: collections.Array<lang.ISendable>,
  obj: lang.ISendable
): boolean {
  try {
    return arr.includes(obj);
  } catch (e) {
    return false;
  }
}


@Concurrent
function stressSetAddWithLock(
  lockBuffer: SharedArrayBuffer,
  set: collections.Set<lang.ISendable>,
  obj: lang.ISendable
): number {
  return withLock(lockBuffer, (): number => {
    set.add(obj);
    return set.size;
  });
}

@Concurrent
function stressSetHasWithLock(
  lockBuffer: SharedArrayBuffer,
  set: collections.Set<lang.ISendable>,
  obj: lang.ISendable
): boolean {
  return withLock(lockBuffer, (): boolean => {
    return set.has(obj);
  });
}

@Concurrent
function stressSetDeleteWithLock(
  lockBuffer: SharedArrayBuffer,
  set: collections.Set<lang.ISendable>,
  obj: lang.ISendable
): boolean {
  return withLock(lockBuffer, (): boolean => {
    return set.delete(obj);
  });
}


@Concurrent
function stressSetAddNoLock(
  set: collections.Set<lang.ISendable>,
  obj: lang.ISendable
): number {
  try {
    set.add(obj);
    return set.size;
  } catch (e) {
    return -1;
  }
}


@Concurrent
function stressSetHasNoLock(
  set: collections.Set<lang.ISendable>,
  obj: lang.ISendable
): boolean {
  try {
    return set.has(obj);
  } catch (e) {
    return false;
  }
}


@Concurrent
function stressSetDeleteNoLock(
  set: collections.Set<lang.ISendable>,
  obj: lang.ISendable
): boolean {
  try {
    return set.delete(obj);
  } catch (e) {
    return false;
  }
}


@Concurrent
function stressMapSetWithLock(
  lockBuffer: SharedArrayBuffer,
  map: collections.Map<lang.ISendable, lang.ISendable>,
  key: lang.ISendable,
  value: lang.ISendable
): number {
  return withLock(lockBuffer, (): number => {
    map.set(key, value);
    return map.size;
  });
}

@Concurrent
function stressMapGetWithLock(
  lockBuffer: SharedArrayBuffer,
  map: collections.Map<lang.ISendable, lang.ISendable>,
  key: lang.ISendable
): lang.ISendable | undefined {
  return withLock(lockBuffer, (): lang.ISendable | undefined => {
    return map.get(key);
  });
}

@Concurrent
function stressMapDeleteWithLock(
  lockBuffer: SharedArrayBuffer,
  map: collections.Map<lang.ISendable, lang.ISendable>,
  key: lang.ISendable
): boolean {
  return withLock(lockBuffer, (): boolean => {
    return map.delete(key);
  });
}


@Concurrent
function stressMapSetNoLock(
  map: collections.Map<lang.ISendable, lang.ISendable>,
  key: lang.ISendable,
  value: lang.ISendable
): number {
  try {
    map.set(key, value);
    return map.size;
  } catch (e) {
    return -1;
  }
}


@Concurrent
function stressMapGetNoLock(
  map: collections.Map<lang.ISendable, lang.ISendable>,
  key: lang.ISendable
): lang.ISendable | undefined {
  try {
    return map.get(key);
  } catch (e) {
    return undefined;
  }
}


@Concurrent
function stressMapDeleteNoLock(
  map: collections.Map<lang.ISendable, lang.ISendable>,
  key: lang.ISendable
): boolean {
  try {
    return map.delete(key);
  } catch (e) {
    return false;
  }
}


@Concurrent
function stressSingletonIncrement(
  lock: ArkTSUtils.locks.AsyncLock,
  singleton: SharedSingleton
): Promise<number> {
  return singleton.incrementCounter();
}

@Concurrent
function stressSingletonGetArray(
  singleton: SharedSingleton
): collections.Array<lang.ISendable> {
  return singleton.getArray();
}

@Concurrent
function stressSingletonGetMap(
  singleton: SharedSingleton
): collections.Map<string, lang.ISendable> {
  return singleton.getMap();
}

@Concurrent
function stressTransferSingleton(
  singleton: SharedSingleton
): SharedSingleton {
  return singleton;
}

export default function NativeSendableContainerStressTest() {
  describe('NativeSendableContainerStressTest', (): void => {
    beforeAll((): void => {
      console.info('NativeSendableContainerStressTest beforeAll called');
    });

    beforeEach(async (): Promise<void> => {
      await sleep(SLEEP_INTERVAL_MS);
    });

    afterEach((): void => {
      console.info('NativeSendableContainerStressTest afterEach called');
    });

    afterAll((): void => {
      console.info('NativeSendableContainerStressTest afterAll called');
    });

    // ==================== Array 基础操作 ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_0100
     * @tc.name testNativeSendableArrayCreate0001
     * @tc.desc Verify that a sendable array can store a large number of sendable objects.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableArrayCreate0001',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          arr.push(obj);
        }

        expect(arr.length).assertEqual(LARGE_CAPACITY);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_0200
     * @tc.name testNativeSendableContainerStressArray0002
     * @tc.desc Test accessing and verifying elements in a sendable array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0002',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const arr: collections.Array<lang.ISendable> =
          new collections.Array<lang.ISendable>();
        const objs: lang.ISendable[] = [];

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          arr.push(obj);
          objs.push(obj);
        }

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          expect(arr[i]).assertEqual(objs[i]);
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_0300
     * @tc.name testNativeSendableContainerStressArray0003
     * @tc.desc Test modifying elements at specified positions in a sendable array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0003',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const arr: collections.Array<lang.ISendable> =
          new collections.Array<lang.ISendable>();

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          arr.push(napitest.NapiCreateSendableObject());
        }

        const newObj0: lang.ISendable = napitest.NapiCreateSendableObject();
        const newObj512: lang.ISendable = napitest.NapiCreateSendableObject();
        const newObj1024: lang.ISendable = napitest.NapiCreateSendableObject();

        arr[0] = newObj0;
        arr[512] = newObj512;
        arr[1024] = newObj1024;

        expect(arr[0]).assertEqual(newObj0);
        expect(arr[512]).assertEqual(newObj512);
        expect(arr[1024]).assertEqual(newObj1024);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_0400
     * @tc.name testNativeSendableContainerStressArray0004
     * @tc.desc Test removing all elements from a sendable array using pop.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0004',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const arr: collections.Array<lang.ISendable> =
          new collections.Array<lang.ISendable>();

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          arr.push(napitest.NapiCreateSendableObject());
        }

        expect(arr.length).assertEqual(LARGE_CAPACITY);

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const popped: lang.ISendable | undefined = arr.pop();
          expect(popped !== undefined).assertTrue();
        }

        expect(arr.length).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_0500
     * @tc.name testNativeSendableContainerStressArray0005
     * @tc.desc Test removing and replacing elements in a sendable array using splice.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0005',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const arr: collections.Array<lang.ISendable> =
          new collections.Array<lang.ISendable>();

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          arr.push(napitest.NapiCreateSendableObject());
        }

        const removed: collections.Array<lang.ISendable> = arr.splice(0, 100);

        expect(removed.length).assertEqual(100);
        expect(arr.length).assertEqual(LARGE_CAPACITY - 100);

        const newObj: lang.ISendable = napitest.NapiCreateSendableObject();
        arr.splice(500, 50, newObj);

        expect(arr.length).assertEqual(LARGE_CAPACITY - 100 - 50 + 1);
        expect(arr[500]).assertEqual(newObj);
      }
    );

    // ==================== Array 并发操作 ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_0600
     * @tc.name testNativeSendableContainerStressArray0006
     * @tc.desc Test concurrent push operations on a sendable array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0006',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const lockBuffer: SharedArrayBuffer = createSharedLock();
        const arr: collections.Array<lang.ISendable> =
          new collections.Array<lang.ISendable>();
        const tasks: Promise<Object>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          tasks.push(taskpool.execute(stressArrayPushWithLock, lockBuffer, arr, obj));
        }

        const results: number[] = await Promise.all(tasks) as number[];

        expect(arr.length).assertEqual(CONCURRENT_THREAD_COUNT);

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i] >= 1).assertTrue();
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_0700
     * @tc.name testNativeSendableContainerStressArray0007
     * @tc.desc Test concurrent pop operations on a sendable array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0007',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const lockBuffer: SharedArrayBuffer = createSharedLock();
        const arr: collections.Array<lang.ISendable> =
          new collections.Array<lang.ISendable>();

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          arr.push(napitest.NapiCreateSendableObject());
        }

        const tasks: Promise<Object>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(stressArrayPopWithLock, lockBuffer, arr));
        }

        const results: (lang.ISendable | undefined)[] =
          await Promise.all(tasks) as (lang.ISendable | undefined)[];

        let popCount: number = 0;
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          if (results[i] !== undefined) {
            popCount++;
          }
        }
        expect(popCount).assertEqual(CONCURRENT_THREAD_COUNT);
        expect(arr.length).assertEqual(LARGE_CAPACITY - CONCURRENT_THREAD_COUNT);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_0800
     * @tc.name testNativeSendableContainerStressArray0008
     * @tc.desc Test concurrent read operations on a sendable array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0008',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const lockBuffer: SharedArrayBuffer = createSharedLock();
        const arr: collections.Array<lang.ISendable> =
          new collections.Array<lang.ISendable>();

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          arr.push(napitest.NapiCreateSendableObject());
        }

        const tasks: Promise<Object>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const index: number = i * 100;
          tasks.push(taskpool.execute(stressArrayReadWithLock, lockBuffer, arr, index));
        }

        const results: (lang.ISendable | undefined)[] =
          await Promise.all(tasks) as (lang.ISendable | undefined)[];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i] !== undefined).assertTrue();
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_0900
     * @tc.name testNativeSendableContainerStressArray0009
     * @tc.desc Test concurrent modification operations on a sendable array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0009',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const lockBuffer: SharedArrayBuffer = createSharedLock();
        const arr: collections.Array<lang.ISendable> =
          new collections.Array<lang.ISendable>();

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          arr.push(napitest.NapiCreateSendableObject());
        }

        const newObj: lang.ISendable = napitest.NapiCreateSendableObject();

        const tasks: Promise<Object>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(
            taskpool.execute(
              stressArrayModifyWithLock,
              lockBuffer,
              arr,
              i,
              newObj
            )
          );
        }

        await Promise.all(tasks);

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(arr[i]).assertEqual(newObj);
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_1000
     * @tc.name testNativeSendableContainerStressArray0010
     * @tc.desc Test concurrent forEach operations on a sendable array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0010',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const lockBuffer: SharedArrayBuffer = createSharedLock();
        const arr: collections.Array<lang.ISendable> =
          new collections.Array<lang.ISendable>();

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          arr.push(napitest.NapiCreateSendableObject());
        }

        const tasks: Promise<Object>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(
            taskpool.execute(
              stressArrayForEachWithLock,
              lockBuffer,
              arr
            )
          );
        }

        await Promise.all(tasks);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_1100
     * @tc.name testNativeSendableContainerStressArray0011
     * @tc.desc Test concurrent push operations on a sendable array without lock.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0011',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          tasks.push(taskpool.execute(stressArrayPushNoLock, arr, obj));
        }
        let hasException: boolean = false;
        let successCount: number = 0;
        try {
          const results: number[] = await Promise.all(tasks) as number[];
          successCount = results.length;
        } catch (e) {
          hasException = true;
        }
        expect(hasException || successCount === CONCURRENT_THREAD_COUNT).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_1200
     * @tc.name testNativeSendableContainerStressArray0012
     * @tc.desc Test concurrent pop operations on a sendable array without lock.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0012',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          arr.push(napitest.NapiCreateSendableObject());
        }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(stressArrayPopNoLock, arr));
        }
        let hasException: boolean = false;
        let popCount: number = 0;
        try {
          const results: (lang.ISendable | undefined)[] = await Promise.all(tasks) as (lang.ISendable | undefined)[];
          for (let i: number = 0; i < results.length; i++) {
            if (results[i] !== undefined) {
              popCount++;
            }
          }
        } catch (e) {
          hasException = true;
        }
        expect(hasException || popCount > 0).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_1300
     * @tc.name testNativeSendableContainerStressArray0013
     * @tc.desc Test concurrent read operations on a sendable array without lock.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0013',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          arr.push(napitest.NapiCreateSendableObject());
        }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const index: number = i * 100;
          tasks.push(taskpool.execute(stressArrayReadNoLock, arr, index));
        }
        let hasException: boolean = false;
        let readCount: number = 0;
        try {
          const results: (lang.ISendable | undefined)[] = await Promise.all(tasks) as (lang.ISendable | undefined)[];
          for (let i: number = 0; i < results.length; i++) {
            if (results[i] !== undefined) {
              readCount++;
            }
          }
        } catch (e) {
          hasException = true;
        }
        expect(hasException || readCount > 0).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_1400
     * @tc.name testNativeSendableContainerStressArray0014
     * @tc.desc Test concurrent indexOf operations on a sendable array without lock.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0014',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        const targetObj: lang.ISendable = napitest.NapiCreateSendableObject();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          arr.push(napitest.NapiCreateSendableObject());
        }
        arr[500] = targetObj;
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(stressArrayIndexOfNoLock, arr, targetObj));
        }
        let hasException: boolean = false;
        let foundCount: number = 0;
        try {
          const results: number[] = await Promise.all(tasks) as number[];
          for (let i: number = 0; i < results.length; i++) {
            if (results[i] >= 0) {
              foundCount++;
            }
          }
        } catch (e) {
          hasException = true;
        }
        expect(hasException || foundCount > 0).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_1500
     * @tc.name testNativeSendableContainerStressArray0015
     * @tc.desc Test concurrent includes operations on a sendable array without lock.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressArray0015',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
        const targetObj: lang.ISendable = napitest.NapiCreateSendableObject();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          arr.push(napitest.NapiCreateSendableObject());
        }
        arr[0] = targetObj;
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(stressArrayIncludesNoLock, arr, targetObj));
        }
        let hasException: boolean = false;
        let foundCount: number = 0;
        try {
          const results: boolean[] = await Promise.all(tasks) as boolean[];
          for (let i: number = 0; i < results.length; i++) {
            if (results[i]) {
              foundCount++;
            }
          }
        } catch (e) {
          hasException = true;
        }
        expect(hasException || foundCount > 0).assertTrue();
      }
    );

    // ==================== Set 基础操作 ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_1600
     * @tc.name testNativeSendableContainerStressSet0001
     * @tc.desc Test basic add operations on a sendable set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSet0001',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const set: collections.Set<lang.ISendable> = new collections.Set<lang.ISendable>();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          set.add(obj);
        }
        expect(set.size).assertEqual(LARGE_CAPACITY);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_1700
     * @tc.name testNativeSendableContainerStressSet0002
     * @tc.desc Test basic has operations on a sendable set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSet0002',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const set: collections.Set<lang.ISendable> = new collections.Set<lang.ISendable>();
        const objs: lang.ISendable[] = [];
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          set.add(obj);
          objs.push(obj);
        }
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          expect(set.has(objs[i])).assertTrue();
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_1800
     * @tc.name testNativeSendableContainerStressSet0003
     * @tc.desc Test basic delete operations on a sendable set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSet0003',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const set: collections.Set<lang.ISendable> = new collections.Set<lang.ISendable>();
        const objs: lang.ISendable[] = [];
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          set.add(obj);
          objs.push(obj);
        }
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const deleted: boolean = set.delete(objs[i]);
          expect(deleted).assertTrue();
        }
        expect(set.size).assertEqual(0);
      }
    );

    // ==================== Set 并发操作 ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_1900
     * @tc.name testNativeSendableContainerStressSet0004
     * @tc.desc Test concurrent add operations on a sendable set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSet0004',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const lockBuffer: SharedArrayBuffer = createSharedLock();
        const set: collections.Set<lang.ISendable> = new collections.Set<lang.ISendable>();
        const tasks: Promise<Object>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          tasks.push(taskpool.execute(stressSetAddWithLock, lockBuffer, set, obj));
        }

        const results: number[] = await Promise.all(tasks) as number[];

        expect(set.size).assertEqual(CONCURRENT_THREAD_COUNT);

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i] >= 1).assertTrue();
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_2000
     * @tc.name testNativeSendableContainerStressSet0005
     * @tc.desc Test concurrent has operations on a sendable set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSet0005',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const lockBuffer: SharedArrayBuffer = createSharedLock();
        const set: collections.Set<lang.ISendable> = new collections.Set<lang.ISendable>();
        const objs: lang.ISendable[] = [];

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          set.add(obj);
          objs.push(obj);
        }

        const tasks: Promise<Object>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(stressSetHasWithLock, lockBuffer, set, objs[i * 100]));
        }

        const results: boolean[] = await Promise.all(tasks) as boolean[];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i]).assertTrue();
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_2100
     * @tc.name testNativeSendableContainerStressSet0006
     * @tc.desc Test concurrent delete operations on a sendable set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSet0006',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const lockBuffer: SharedArrayBuffer = createSharedLock();
        const set: collections.Set<lang.ISendable> = new collections.Set<lang.ISendable>();
        const objs: lang.ISendable[] = [];

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          set.add(obj);
          objs.push(obj);
        }

        const tasks: Promise<Object>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(stressSetDeleteWithLock, lockBuffer, set, objs[i]));
        }

        const results: boolean[] = await Promise.all(tasks) as boolean[];

        let deleteCount: number = 0;
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          if (results[i]) {
            deleteCount++;
          }
        }

        expect(deleteCount).assertEqual(CONCURRENT_THREAD_COUNT);
        expect(set.size).assertEqual(LARGE_CAPACITY - CONCURRENT_THREAD_COUNT);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_2200
     * @tc.name testNativeSendableContainerStressSet0007
     * @tc.desc Test concurrent add operations on a sendable set without lock - exception test.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSet0007',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const set: collections.Set<lang.ISendable> = new collections.Set<lang.ISendable>();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          tasks.push(taskpool.execute(stressSetAddNoLock, set, obj));
        }
        let hasException: boolean = false;
        let successCount: number = 0;
        try {
          const results: number[] = await Promise.all(tasks) as number[];
          successCount = results.length;
        } catch (e) {
          hasException = true;
        }
        expect(hasException || successCount === CONCURRENT_THREAD_COUNT).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_2300
     * @tc.name testNativeSendableContainerStressSet0008
     * @tc.desc Test concurrent has operations on a sendable set without lock - exception test.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSet0008',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const set: collections.Set<lang.ISendable> = new collections.Set<lang.ISendable>();
        const objs: lang.ISendable[] = [];
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          set.add(obj);
          objs.push(obj);
        }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(stressSetHasNoLock, set, objs[i * 100]));
        }
        let hasException: boolean = false;
        let foundCount: number = 0;
        try {
          const results: boolean[] = await Promise.all(tasks) as boolean[];
          for (let i: number = 0; i < results.length; i++) {
            if (results[i]) {
              foundCount++;
            }
          }
        } catch (e) {
          hasException = true;
        }
        expect(hasException || foundCount > 0).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_2400
     * @tc.name testNativeSendableContainerStressSet0009
     * @tc.desc Test concurrent delete operations on a sendable set without lock - exception test.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSet0009',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const set: collections.Set<lang.ISendable> = new collections.Set<lang.ISendable>();
        const objs: lang.ISendable[] = [];
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          set.add(obj);
          objs.push(obj);
        }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(stressSetDeleteNoLock, set, objs[i]));
        }
        let hasException: boolean = false;
        let deleteCount: number = 0;
        try {
          const results: boolean[] = await Promise.all(tasks) as boolean[];
          for (let i: number = 0; i < results.length; i++) {
            if (results[i]) {
              deleteCount++;
            }
          }
        } catch (e) {
          hasException = true;
        }
        expect(hasException || deleteCount > 0).assertTrue();
      }
    );

    // ==================== Map 基础操作 ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_2500
     * @tc.name testNativeSendableContainerStressMap0001
     * @tc.desc Test basic set operations on a sendable map.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressMap0001',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const map: collections.Map<lang.ISendable, lang.ISendable> =
          new collections.Map<lang.ISendable, lang.ISendable>();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const key: lang.ISendable = napitest.NapiCreateSendableObject();
          const value: lang.ISendable = napitest.NapiCreateSendableObject();
          map.set(key, value);
        }
        expect(map.size).assertEqual(LARGE_CAPACITY);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_2600
     * @tc.name testNativeSendableContainerStressMap0002
     * @tc.desc Test basic get operations on a sendable map.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressMap0002',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const map: collections.Map<lang.ISendable, lang.ISendable> =
          new collections.Map<lang.ISendable, lang.ISendable>();
        const entries: [lang.ISendable, lang.ISendable][] = [];
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const key: lang.ISendable = napitest.NapiCreateSendableObject();
          const value: lang.ISendable = napitest.NapiCreateSendableObject();
          map.set(key, value);
          entries.push([key, value]);
        }
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const retrieved: lang.ISendable | undefined = map.get(entries[i][0]);
          expect(retrieved).assertEqual(entries[i][1]);
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_2700
     * @tc.name testNativeSendableContainerStressMap0003
     * @tc.desc Test basic delete operations on a sendable map.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressMap0003',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const map: collections.Map<lang.ISendable, lang.ISendable> =
          new collections.Map<lang.ISendable, lang.ISendable>();
        const keys: lang.ISendable[] = [];
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const key: lang.ISendable = napitest.NapiCreateSendableObject();
          const value: lang.ISendable = napitest.NapiCreateSendableObject();
          map.set(key, value);
          keys.push(key);
        }
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const deleted: boolean = map.delete(keys[i]);
          expect(deleted).assertTrue();
        }
        expect(map.size).assertEqual(0);
      }
    );

    // ==================== Map 并发操作 ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_2800
     * @tc.name testNativeSendableContainerStressMap0004
     * @tc.desc Test concurrent set operations on a sendable map.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressMap0004',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const lockBuffer: SharedArrayBuffer = createSharedLock();
        const map: collections.Map<lang.ISendable, lang.ISendable> =
          new collections.Map<lang.ISendable, lang.ISendable>();
        const tasks: Promise<Object>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const key: lang.ISendable = napitest.NapiCreateSendableObject();
          const value: lang.ISendable = napitest.NapiCreateSendableObject();
          tasks.push(taskpool.execute(stressMapSetWithLock, lockBuffer, map, key, value));
        }

        const results: number[] = await Promise.all(tasks) as number[];

        expect(map.size).assertEqual(CONCURRENT_THREAD_COUNT);

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i] >= 1).assertTrue();
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_2900
     * @tc.name testNativeSendableContainerStressMap0005
     * @tc.desc Test concurrent get operations on a sendable map.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressMap0005',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const lockBuffer: SharedArrayBuffer = createSharedLock();
        const map: collections.Map<lang.ISendable, lang.ISendable> =
          new collections.Map<lang.ISendable, lang.ISendable>();
        const entries: [lang.ISendable, lang.ISendable][] = [];

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const key: lang.ISendable = napitest.NapiCreateSendableObject();
          const value: lang.ISendable = napitest.NapiCreateSendableObject();
          map.set(key, value);
          entries.push([key, value]);
        }

        const tasks: Promise<Object>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(stressMapGetWithLock, lockBuffer, map, entries[i * 100][0]));
        }

        const results: (lang.ISendable | undefined)[] =
          await Promise.all(tasks) as (lang.ISendable | undefined)[];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          expect(results[i]).assertEqual(entries[i * 100][1]);
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_3000
     * @tc.name testNativeSendableContainerStressMap0006
     * @tc.desc Test concurrent delete operations on a sendable map.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressMap0006',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const lockBuffer: SharedArrayBuffer = createSharedLock();
        const map: collections.Map<lang.ISendable, lang.ISendable> =
          new collections.Map<lang.ISendable, lang.ISendable>();
        const keys: lang.ISendable[] = [];

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const key: lang.ISendable = napitest.NapiCreateSendableObject();
          const value: lang.ISendable = napitest.NapiCreateSendableObject();
          map.set(key, value);
          keys.push(key);
        }

        const tasks: Promise<Object>[] = [];

        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(stressMapDeleteWithLock, lockBuffer, map, keys[i]));
        }

        const results: boolean[] = await Promise.all(tasks) as boolean[];

        let deleteCount: number = 0;
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          if (results[i]) {
            deleteCount++;
          }
        }

        expect(deleteCount).assertEqual(CONCURRENT_THREAD_COUNT);
        expect(map.size).assertEqual(LARGE_CAPACITY - CONCURRENT_THREAD_COUNT);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_3100
     * @tc.name testNativeSendableContainerStressMap0007
     * @tc.desc Test concurrent set operations on a sendable map without lock - exception test.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressMap0007',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const map: collections.Map<lang.ISendable, lang.ISendable> =
          new collections.Map<lang.ISendable, lang.ISendable>();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          const key: lang.ISendable = napitest.NapiCreateSendableObject();
          const value: lang.ISendable = napitest.NapiCreateSendableObject();
          tasks.push(taskpool.execute(stressMapSetNoLock, map, key, value));
        }
        let hasException: boolean = false;
        let successCount: number = 0;
        try {
          const results: number[] = await Promise.all(tasks) as number[];
          successCount = results.length;
        } catch (e) {
          hasException = true;
        }
        expect(hasException || successCount === CONCURRENT_THREAD_COUNT).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_3200
     * @tc.name testNativeSendableContainerStressMap0008
     * @tc.desc Test concurrent get operations on a sendable map without lock - exception test.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressMap0008',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const map: collections.Map<lang.ISendable, lang.ISendable> =
          new collections.Map<lang.ISendable, lang.ISendable>();
        const entries: [lang.ISendable, lang.ISendable][] = [];
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const key: lang.ISendable = napitest.NapiCreateSendableObject();
          const value: lang.ISendable = napitest.NapiCreateSendableObject();
          map.set(key, value);
          entries.push([key, value]);
        }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(stressMapGetNoLock, map, entries[i * 100][0]));
        }
        let hasException: boolean = false;
        let getCount: number = 0;
        try {
          const results: (lang.ISendable | undefined)[] = await Promise.all(tasks) as (lang.ISendable | undefined)[];
          for (let i: number = 0; i < results.length; i++) {
            if (results[i] !== undefined) {
              getCount++;
            }
          }
        } catch (e) {
          hasException = true;
        }
        expect(hasException || getCount > 0).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_3300
     * @tc.name testNativeSendableContainerStressMap0009
     * @tc.desc Test concurrent delete operations on a sendable map without lock - exception test.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressMap0009',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const map: collections.Map<lang.ISendable, lang.ISendable> =
          new collections.Map<lang.ISendable, lang.ISendable>();
        const keys: lang.ISendable[] = [];
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const key: lang.ISendable = napitest.NapiCreateSendableObject();
          const value: lang.ISendable = napitest.NapiCreateSendableObject();
          map.set(key, value);
          keys.push(key);
        }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
          tasks.push(taskpool.execute(stressMapDeleteNoLock, map, keys[i]));
        }
        let hasException: boolean = false;
        let deleteCount: number = 0;
        try {
          const results: boolean[] = await Promise.all(tasks) as boolean[];
          for (let i: number = 0; i < results.length; i++) {
            if (results[i]) {
              deleteCount++;
            }
          }
        } catch (e) {
          hasException = true;
        }
        expect(hasException || deleteCount > 0).assertTrue();
      }
    );

    // ==================== Singleton 综合测试 ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_3400
     * @tc.name testNativeSendableContainerStressSingleton0001
     * @tc.desc Test singleton array operations.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSingleton0001',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const singleton: SharedSingleton = SharedSingleton.getInstance();
        singleton.reset();
        const arr: collections.Array<lang.ISendable> = singleton.getArray();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          arr.push(obj);
        }
        expect(arr.length).assertEqual(LARGE_CAPACITY);
        singleton.reset();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_3500
     * @tc.name testNativeSendableContainerStressSingleton0002
     * @tc.desc Test singleton counter operations.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSingleton0002',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const singleton: SharedSingleton = SharedSingleton.getInstance();
        singleton.reset();
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

        await lock.lockAsync(async () => {
          const tasks: Promise<number>[] = [];

          for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
            tasks.push(singleton.incrementCounter());
          }

          const results: number[] = await Promise.all(tasks);

          for (let i: number = 0; i < CONCURRENT_THREAD_COUNT; i++) {
            expect(results[i] > 0).assertTrue();
          }

          const finalCounter: number = singleton.getCounter();
          expect(finalCounter).assertEqual(CONCURRENT_THREAD_COUNT);
        });

        singleton.reset();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_3600
     * @tc.name testNativeSendableContainerStressSingleton0003
     * @tc.desc Test singleton map operations.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSingleton0003',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const singleton: SharedSingleton = SharedSingleton.getInstance();
        singleton.reset();
        const map: collections.Map<string, lang.ISendable> = singleton.getMap();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          const obj: lang.ISendable = napitest.NapiCreateSendableObject();
          map.set('key_' + i.toString(), obj);
        }
        expect(map.size).assertEqual(LARGE_CAPACITY);
        singleton.reset();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_3700
     * @tc.name testNativeSendableContainerStressSingleton0004
     * @tc.desc Test singleton array reference consistency.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSingleton0004',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const singleton: SharedSingleton = SharedSingleton.getInstance();
        singleton.reset();
        const arr: collections.Array<lang.ISendable> = singleton.getArray();
        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          arr.push(napitest.NapiCreateSendableObject());
        }

        const retrievedArr: collections.Array<lang.ISendable> = singleton.getArray();
        expect(retrievedArr === arr).assertTrue();
        expect(retrievedArr.length).assertEqual(LARGE_CAPACITY);

        singleton.reset();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLE_CONTAINER_3800
     * @tc.name testNativeSendableContainerStressSingleton0005
     * @tc.desc Test singleton full container operations and reset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(
      'testNativeSendableContainerStressSingleton0005',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const singleton: SharedSingleton = SharedSingleton.getInstance();
        singleton.reset();
        const arr: collections.Array<lang.ISendable> = singleton.getArray();
        const map: collections.Map<string, lang.ISendable> = singleton.getMap();
        const set: collections.Set<lang.ISendable> = singleton.getSet();

        for (let i: number = 0; i < LARGE_CAPACITY; i++) {
          arr.push(napitest.NapiCreateSendableObject());
          map.set('key_' + i.toString(), napitest.NapiCreateSendableObject());
          set.add(napitest.NapiCreateSendableObject());
        }
        expect(arr.length).assertEqual(LARGE_CAPACITY);
        expect(map.size).assertEqual(LARGE_CAPACITY);
        expect(set.size).assertEqual(LARGE_CAPACITY);
        singleton.reset();
        expect(singleton.getArray().length).assertEqual(0);
        expect(singleton.getMap().size).assertEqual(0);
        expect(singleton.getSet().size).assertEqual(0);
      }
    );
  });
}
