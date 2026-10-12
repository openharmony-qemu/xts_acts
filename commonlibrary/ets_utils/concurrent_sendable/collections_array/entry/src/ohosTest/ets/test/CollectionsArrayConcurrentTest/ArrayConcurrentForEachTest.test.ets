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

import { describe, beforeEach, it, expect, TestType, Size, Level } from "@ohos/hypium";
import { collections, taskpool, worker, MessageEvents, ArkTSUtils } from "@kit.ArkTS";

@Concurrent
async function concurrentForEachTask(arr: collections.Array<number>, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    let count: number = 0;
    arr.forEach((value: number, index: number): void => {
      count++;
    });
    return count;
  });
}

function executeArrayForEachWorker(arr: collections.Array<number>, lock: ArkTSUtils.locks.AsyncLock): Promise<Object> {
  return new Promise<Object>((resolve: (value: Object) => void,
    reject: (reason: Error) => void): void => {
    const workerInstance: worker.ThreadWorker =
      new worker.ThreadWorker("./workers/ArrayForEachWorker");
    let settled: boolean = false;
    workerInstance.onmessage = (event: MessageEvents): void => {
      settled = true;
      resolve(event.data as Object);
      workerInstance.terminate();
    };
    workerInstance.onerror = (): void => {
      if (!settled) {
        settled = true;
        reject(new Error("ArrayForEachWorker error"));
      }
      workerInstance.terminate();
    };
    workerInstance.onexit = (): void => {
      if (!settled) {
        settled = true;
        reject(new Error("ArrayForEachWorker exited before posting result"));
      }
    };
    workerInstance.postMessageWithSharedSendable({
      arr: arr,
      lock: lock
    });
  });
}

export default function arrayConcurrentForEachTest(): void {
  describe("arrayConcurrentForEachTest", (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_FOREACH_0100
     * @tc.name      testArrayConcurrentForEach0001
     * @tc.desc      Verify multiple TaskPool tasks can concurrently traverse a
     *               collections.Array using forEach without data loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentForEach0001";
        console.log(TAG + " start");

        const arr: collections.Array<number> = new collections.Array<number>();
        const elementCount: number = 100;
        for (let i: number = 0; i < elementCount; i++) {
          arr.push(i);
        }

        const threadCount: number = 4;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(concurrentForEachTask, arr, lock));
        }

        let results: Object[] = [];
        try {
          results = await Promise.all(tasks) as Object[];
        } catch (err) {
          console.error(`results await Promise.all failed: ${JSON.stringify(err)}`);
        }
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(elementCount);
        }

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_FOREACH_0200
     * @tc.name      testArrayConcurrentForEach0002
     * @tc.desc      Verify multiple Worker threads can concurrently traverse a
     *               collections.Array using forEach without data loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentForEach0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentForEach0002";
        console.log(TAG + " start");

        const arr: collections.Array<number> = new collections.Array<number>();
        const elementCount: number = 100;
        for (let i: number = 0; i < elementCount; i++) {
          arr.push(i);
        }

        const workerCount: number = 2;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const resultPromises: Promise<Object>[] = [];
        for (let i: number = 0; i < workerCount; i++) {
          resultPromises.push(executeArrayForEachWorker(arr, lock));
        }

        let results: Object[] = [];
        try {
          results = await Promise.all(resultPromises);
        } catch (err) {
          console.error(`results await Promise.all failed: ${JSON.stringify(err)}`);
        }
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(elementCount);
        }

        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  });
}
