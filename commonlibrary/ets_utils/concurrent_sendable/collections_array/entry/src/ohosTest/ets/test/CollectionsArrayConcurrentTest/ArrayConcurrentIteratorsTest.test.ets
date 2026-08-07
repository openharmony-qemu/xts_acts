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
import { collections, taskpool, worker, MessageEvents } from "@kit.ArkTS";

@Concurrent
async function entriesTraverseTask(arr: collections.Array<number>): Promise<number> {
  let count: number = 0;
  const iterator: IterableIterator<[number, number]> = arr.entries();
  let entry: IteratorResult<[number, number]> = iterator.next();
  while (!entry.done) {
    count++;
    entry = iterator.next();
  }
  return count;
}

@Concurrent
async function keysTraverseTask(arr: collections.Array<number>): Promise<number> {
  let count: number = 0;
  const iterator: IterableIterator<number> = arr.keys();
  let key: IteratorResult<number> = iterator.next();
  while (!key.done) {
    count++;
    key = iterator.next();
  }
  return count;
}

@Concurrent
async function valuesTraverseTask(arr: collections.Array<number>): Promise<number> {
  let count: number = 0;
  const iterator: IterableIterator<number> = arr.values();
  let val: IteratorResult<number> = iterator.next();
  while (!val.done) {
    count++;
    val = iterator.next();
  }
  return count;
}

function executeArrayEntriesWorker(arr: collections.Array<number>): Promise<Object> {
  return new Promise<Object>((resolve: (value: Object) => void,
    reject: (reason: Error) => void): void => {
    const workerInstance: worker.ThreadWorker =
      new worker.ThreadWorker("./workers/ArrayEntriesWorker");
    let settled: boolean = false;
    workerInstance.onmessage = (event: MessageEvents): void => {
      settled = true;
      resolve(event.data as Object);
      workerInstance.terminate();
    };
    workerInstance.onerror = (): void => {
      if (!settled) {
        settled = true;
        reject(new Error("ArrayEntriesWorker error"));
      }
      workerInstance.terminate();
    };
    workerInstance.onexit = (): void => {
      if (!settled) {
        settled = true;
        reject(new Error("ArrayEntriesWorker exited before posting result"));
      }
    };
    workerInstance.postMessage(arr);
  });
}

export default function arrayConcurrentIteratorsTest(): void {
  describe("arrayConcurrentIteratorsTest", (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_ITERS_0100
     * @tc.name      testArrayConcurrentEntries0001
     * @tc.desc      Verify multiple TaskPool tasks can concurrently traverse a
     *               collections.Array using entries without data loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentEntries0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentEntries0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const elementCount: number = 100;
        for (let i: number = 0; i < elementCount; i++) {
          arr.push(i);
        }
        const threadCount: number = 4;
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(entriesTraverseTask, arr));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(elementCount);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_ITERS_0200
     * @tc.name      testArrayConcurrentEntries0002
     * @tc.desc      Verify multiple Worker threads can concurrently traverse a
     *               collections.Array using entries without data loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentEntries0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentEntries0002";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const elementCount: number = 100;
        for (let i: number = 0; i < elementCount; i++) {
          arr.push(i);
        }
        const workerCount: number = 2;
        const resultPromises: Promise<Object>[] = [];
        for (let i: number = 0; i < workerCount; i++) {
          resultPromises.push(executeArrayEntriesWorker(arr));
        }
        const results: Object[] = await Promise.all(resultPromises);
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(elementCount);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_ITERS_0300
     * @tc.name      testArrayConcurrentKeys0001
     * @tc.desc      Verify multiple TaskPool tasks can concurrently traverse a
     *               collections.Array using keys without data loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentKeys0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentKeys0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const elementCount: number = 100;
        for (let i: number = 0; i < elementCount; i++) {
          arr.push(i);
        }
        const threadCount: number = 4;
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(keysTraverseTask, arr));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(elementCount);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_ITERS_0400
     * @tc.name      testArrayConcurrentValues0001
     * @tc.desc      Verify multiple TaskPool tasks can concurrently traverse a
     *               collections.Array using values without data loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentValues0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentValues0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const elementCount: number = 100;
        for (let i: number = 0; i < elementCount; i++) {
          arr.push(i);
        }
        const threadCount: number = 4;
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(valuesTraverseTask, arr));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(elementCount);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  });
}
