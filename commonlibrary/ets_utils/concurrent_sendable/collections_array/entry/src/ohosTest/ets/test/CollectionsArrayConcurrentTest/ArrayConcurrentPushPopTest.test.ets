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
import { collections, taskpool, worker, MessageEvents, ArkTSUtils } from "@kit.ArkTS";

@Concurrent
async function pushTask(arr: collections.Array<number>, count: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    for (let i: number = 0; i < count; i++) {
      arr.push(i);
    }
    return arr.length;
  });
}

@Concurrent
async function pushNumberMixedTask(arr: collections.Array<number | string>,
  count: number, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    for (let i: number = 0; i < count; i++) {
      arr.push(i);
    }
    return arr.length;
  });
}

@Concurrent
async function pushStringMixedTask(arr: collections.Array<number | string>,
  count: number, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    for (let i: number = 0; i < count; i++) {
      arr.push("str" + i);
    }
    return arr.length;
  });
}

@Concurrent
async function lockedPopTask(arr: collections.Array<number>, count: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    let popCount: number = 0;
    for (let i: number = 0; i < count; i++) {
      const val: number | undefined = arr.pop();
      if (val !== undefined) {
        popCount++;
      }
    }
    return popCount;
  });
}

@Concurrent
async function lockedPushPopTask(arr: collections.Array<number>, count: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    for (let i: number = 0; i < count; i++) {
      arr.push(i);
      arr.pop();
    }
    return arr.length;
  });
}

function executeArrayWorker(path: string, arr: collections.Array<number>, count: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return new Promise<number>((resolve: (value: number) => void): void => {
    const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(path);
    workerInstance.onmessage = (event: MessageEvents): void => {
      resolve(event.data as number);
      workerInstance.terminate();
    };
    workerInstance.onerror = (): void => {
      resolve(-1);
      workerInstance.terminate();
    };
    workerInstance.postMessageWithSharedSendable({
      arr: arr,
      count: count,
      lock: lock
    });
  });
}

export default function arrayConcurrentPushPopTest(): void {
  describe("arrayConcurrentPushPopTest", (): void => {
    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_PUSHPOP_0100
     * @tc.name      testArrayConcurrentPush0001
     * @tc.desc      Verify multiple TaskPool tasks can concurrently push elements into a
     *               collections.Array and the final length equals the total number of pushes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentPush0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentPush0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const pushPerThread: number = 100;
        const threadCount: number = 8;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(pushTask, arr, pushPerThread, lock));
        }
        await Promise.all(tasks);
        expect(arr.length).assertEqual(pushPerThread * threadCount);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_PUSHPOP_0200
     * @tc.name      testArrayConcurrentPush0002
     * @tc.desc      Verify 4 Worker threads can concurrently push elements into a
     *               collections.Array with AsyncLock and final length is correct.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentPush0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentPush0002";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const pushPerWorker: number = 100;
        const workerCount: number = 4;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<number>[] = [];
        for (let i: number = 0; i < workerCount; i++) {
          tasks.push(executeArrayWorker("./workers/ArrayPushWorker",
            arr, pushPerWorker, lock));
        }
        const results: number[] = await Promise.all(tasks);
        let totalPushed: number = 0;
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i]).assertEqual(pushPerWorker);
          totalPushed += results[i];
        }
        expect(totalPushed).assertEqual(pushPerWorker * workerCount);
        expect(arr.length).assertEqual(totalPushed);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_PUSHPOP_0300
     * @tc.name      testArrayConcurrentPush0003
     * @tc.desc      Verify concurrent push of number and string values into a
     *               collections.Array and verify both types are present with correct length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentPush0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentPush0003";
        console.log(TAG + " start");
        const arr: collections.Array<number | string> =
          new collections.Array<number | string>();
        const tasks: Promise<Object>[] = [];
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        tasks.push(taskpool.execute(pushNumberMixedTask, arr, 30, lock));
        tasks.push(taskpool.execute(pushStringMixedTask, arr, 40, lock));
        tasks.push(taskpool.execute(pushNumberMixedTask, arr, 50, lock));
        tasks.push(taskpool.execute(pushStringMixedTask, arr, 60, lock));
        await Promise.all(tasks);
        const expectedLength: number = 30 + 40 + 50 + 60;
        expect(arr.length).assertEqual(expectedLength);
        let hasNumber: boolean = false;
        let hasString: boolean = false;
        for (let i: number = 0; i < arr.length; i++) {
          if (typeof arr[i] === "number") {
            hasNumber = true;
          }
          if (typeof arr[i] === "string") {
            hasString = true;
          }
        }
        expect(hasNumber).assertTrue();
        expect(hasString).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_PUSHPOP_0400
     * @tc.name      testArrayConcurrentPop0001
     * @tc.desc      Verify multiple TaskPool tasks can pop elements from a
     *               collections.Array with AsyncLock and pop count plus final length
     *               equals initial length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentPop0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentPop0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const initialCount: number = 1000;
        for (let i: number = 0; i < initialCount; i++) {
          arr.push(i);
        }
        const popPerThread: number = 100;
        const threadCount: number = 8;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedPopTask, arr, popPerThread, lock));
        }
        const results: Object[] = await Promise.all(tasks);
        let totalPopped: number = 0;
        for (let i: number = 0; i < results.length; i++) {
          totalPopped += results[i] as number;
        }
        expect(totalPopped + arr.length).assertEqual(initialCount);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_PUSHPOP_0500
     * @tc.name      testArrayConcurrentPop0002
     * @tc.desc      Verify 4 Worker threads can concurrently pop elements from a
     *               collections.Array with AsyncLock and pop count plus final length
     *               equals initial length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentPop0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentPop0002";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const initialCount: number = 1000;
        for (let i: number = 0; i < initialCount; i++) {
          arr.push(i);
        }
        const popPerWorker: number = 100;
        const workerCount: number = 4;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<number>[] = [];
        for (let i: number = 0; i < workerCount; i++) {
          tasks.push(executeArrayWorker("./workers/ArrayPopWorker",
            arr, popPerWorker, lock));
        }
        const results: number[] = await Promise.all(tasks);
        let totalPopped: number = 0;
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] >= 0).assertTrue();
          totalPopped += results[i];
        }
        expect(totalPopped + arr.length).assertEqual(initialCount);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_PUSHPOP_0600
     * @tc.name      testArrayConcurrentPushPop0001
     * @tc.desc      Verify concurrent push and pop operations on a collections.Array
     *               with AsyncLock result in consistent final length equal to initial.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentPushPop0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentPushPop0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const initialCount: number = 200;
        for (let i: number = 0; i < initialCount; i++) {
          arr.push(i);
        }
        const threadCount: number = 8;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedPushPopTask, arr, 50, lock));
        }
        await Promise.all(tasks);
        expect(arr.length).assertEqual(initialCount);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_PUSHPOP_0700
     * @tc.name      testArrayConcurrentPushPop0002
     * @tc.desc      Verify concurrent push and pop on a large collections.Array with
     *               AsyncLock and high concurrency completes within performance threshold.
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentPushPop0002", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentPushPop0002";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const initialCount: number = 10000;
        for (let i: number = 0; i < initialCount; i++) {
          arr.push(i);
        }
        const threadCount: number = 16;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedPushPopTask, arr, 100, lock));
        }
        const startTime: number = Date.now();
        await Promise.all(tasks);
        const endTime: number = Date.now();
        const duration: number = endTime - startTime;
        console.log(`${TAG} duration: ${duration}ms`);
        expect(arr.length).assertEqual(initialCount);
        expect(duration < 5000).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  });
}
