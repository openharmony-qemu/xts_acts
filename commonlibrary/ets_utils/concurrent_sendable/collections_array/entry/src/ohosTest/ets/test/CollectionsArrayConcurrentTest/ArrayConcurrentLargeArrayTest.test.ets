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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium";
import { collections, taskpool, ArkTSUtils } from "@kit.ArkTS";

@Concurrent
async function largeForEachTask(arr: collections.Array<number>): Promise<number> {
  const startTime: number = Date.now();
  let count: number = 0;
  arr.forEach((value: number): void => { count++; });
  return Date.now() - startTime;
}

@Concurrent
async function largeEntriesTask(arr: collections.Array<number>): Promise<number> {
  const startTime: number = Date.now();
  let count: number = 0;
  const iterator: IterableIterator<[number, number]> = arr.entries();
  let entry: IteratorResult<[number, number]> = iterator.next();
  while (!entry.done) { count++; entry = iterator.next(); }
  return Date.now() - startTime;
}

@Concurrent
async function largeValuesTask(arr: collections.Array<number>): Promise<number> {
  const startTime: number = Date.now();
  let count: number = 0;
  const iterator: IterableIterator<number> = arr.values();
  let val: IteratorResult<number> = iterator.next();
  while (!val.done) { count++; val = iterator.next(); }
  return Date.now() - startTime;
}

@Concurrent
async function largePushTask(arr: collections.Array<number>, count: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    const startTime: number = Date.now();
    for (let i: number = 0; i < count; i++) { arr.push(i); }
    return Date.now() - startTime;
  });
}

@Concurrent
async function largePopTask(arr: collections.Array<number>, count: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    const startTime: number = Date.now();
    for (let i: number = 0; i < count; i++) { arr.pop(); }
    return Date.now() - startTime;
  });
}

@Concurrent
async function largeSpliceTask(arr: collections.Array<number>, start: number, count: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    const startTime: number = Date.now();
    arr.splice(start, count);
    return Date.now() - startTime;
  });
}

export default function arrayConcurrentLargeArrayTest(): void {
  describe("arrayConcurrentLargeArrayTest", (): void => {
    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_LARGE_0100
     * @tc.name      testArrayConcurrentLargeArrayForEach0001
     * @tc.desc      Verify forEach traversal on length=10000 collections.Array with
     *               8 concurrent TaskPool tasks completes within 1000ms.
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentLargeArrayForEach0001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentLargeArrayForEach0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10000; i++) { arr.push(i); }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 8; i++) {
          tasks.push(taskpool.execute(largeForEachTask, arr));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          const traversalTime: number = results[i] as number;
          console.log(TAG + " task[" + i + "] time: " + traversalTime + "ms");
          expect(traversalTime >= 0).assertTrue();
          expect(traversalTime < 1000).assertTrue();
        }
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_LARGE_0200
     * @tc.name      testArrayConcurrentLargeArrayForEach0002
     * @tc.desc      Verify forEach traversal on length=50000 collections.Array with
     *               16 concurrent TaskPool tasks completes within 5000ms.
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentLargeArrayForEach0002", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentLargeArrayForEach0002";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 50000; i++) { arr.push(i); }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 16; i++) {
          tasks.push(taskpool.execute(largeForEachTask, arr));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          const traversalTime: number = results[i] as number;
          console.log(TAG + " task[" + i + "] time: " + traversalTime + "ms");
          expect(traversalTime >= 0).assertTrue();
          expect(traversalTime < 5000).assertTrue();
        }
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_LARGE_0300
     * @tc.name      testArrayConcurrentLargeArrayEntries0001
     * @tc.desc      Verify entries traversal on length=10000 collections.Array with
     *               8 concurrent TaskPool tasks completes within 1000ms.
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentLargeArrayEntries0001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentLargeArrayEntries0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10000; i++) { arr.push(i); }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 8; i++) {
          tasks.push(taskpool.execute(largeEntriesTask, arr));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          const traversalTime: number = results[i] as number;
          console.log(TAG + " task[" + i + "] time: " + traversalTime + "ms");
          expect(traversalTime >= 0).assertTrue();
          expect(traversalTime < 1000).assertTrue();
        }
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_LARGE_0400
     * @tc.name      testArrayConcurrentLargeArrayValues0001
     * @tc.desc      Verify values traversal on length=10000 collections.Array with
     *               8 concurrent TaskPool tasks completes within 1000ms.
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentLargeArrayValues0001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentLargeArrayValues0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10000; i++) { arr.push(i); }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 8; i++) {
          tasks.push(taskpool.execute(largeValuesTask, arr));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          const traversalTime: number = results[i] as number;
          console.log(TAG + " task[" + i + "] time: " + traversalTime + "ms");
          expect(traversalTime >= 0).assertTrue();
          expect(traversalTime < 1000).assertTrue();
        }
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_LARGE_0500
     * @tc.name      testArrayConcurrentLargeArrayPush0001
     * @tc.desc      Verify push operations on length=1000 collections.Array with
     *               8 concurrent TaskPool tasks and AsyncLock complete within 2000ms.
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentLargeArrayPush0001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentLargeArrayPush0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 1000; i++) { arr.push(i); }
        const tasks: Promise<Object>[] = [];
        const lockPush: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        for (let i: number = 0; i < 8; i++) {
          tasks.push(taskpool.execute(largePushTask, arr, 500, lockPush));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          const elapsed: number = results[i] as number;
          console.log(TAG + " task[" + i + "] time: " + elapsed + "ms");
          expect(elapsed >= 0).assertTrue();
          expect(elapsed < 2000).assertTrue();
        }
        expect(arr.length).assertEqual(5000);
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_LARGE_0600
     * @tc.name      testArrayConcurrentLargeArrayPop0001
     * @tc.desc      Verify pop operations on length=5000 collections.Array with
     *               8 concurrent TaskPool tasks and AsyncLock complete within 2000ms.
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentLargeArrayPop0001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentLargeArrayPop0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 5000; i++) { arr.push(i); }
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 8; i++) {
          tasks.push(taskpool.execute(largePopTask, arr, 500, lock));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          const elapsed: number = results[i] as number;
          console.log(TAG + " task[" + i + "] time: " + elapsed + "ms");
          expect(elapsed >= 0).assertTrue();
          expect(elapsed < 2000).assertTrue();
        }
        expect(arr.length).assertEqual(1000);
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_LARGE_0700
     * @tc.name      testArrayConcurrentLargeArraySplice0001
     * @tc.desc      Verify splice operations on length=5000 collections.Array with
     *               8 concurrent TaskPool tasks and AsyncLock complete within 3000ms.
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentLargeArraySplice0001", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentLargeArraySplice0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 5000; i++) { arr.push(i); }
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 8; i++) {
          tasks.push(taskpool.execute(largeSpliceTask, arr, i * 100, 50, lock));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          const elapsed: number = results[i] as number;
          console.log(TAG + " task[" + i + "] time: " + elapsed + "ms");
          expect(elapsed >= 0).assertTrue();
          expect(elapsed < 3000).assertTrue();
        }
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_LARGE_0800
     * @tc.name      testArrayConcurrentLargeArrayForEach0003
     * @tc.desc      Verify forEach traversal on length=100000 collections.Array with
     *               8 concurrent TaskPool tasks completes within 10000ms.
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentLargeArrayForEach0003", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentLargeArrayForEach0003";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 100000; i++) { arr.push(i); }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 8; i++) {
          tasks.push(taskpool.execute(largeForEachTask, arr));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          const traversalTime: number = results[i] as number;
          console.log(TAG + " task[" + i + "] time: " + traversalTime + "ms");
          expect(traversalTime >= 0).assertTrue();
          expect(traversalTime < 10000).assertTrue();
        }
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });
  });
}