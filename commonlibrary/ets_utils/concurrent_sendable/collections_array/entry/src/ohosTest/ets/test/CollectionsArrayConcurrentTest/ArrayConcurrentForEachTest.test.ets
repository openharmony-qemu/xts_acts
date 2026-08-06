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
import { collections, taskpool, worker, MessageEvents } from "@kit.ArkTS";

@Concurrent
async function concurrentForEachTask(arr: collections.Array<number>): Promise<number> {
  let count: number = 0;
  arr.forEach((value: number, index: number): void => {
    count++;
  });
  return count;
}

export default function arrayConcurrentForEachTest(): void {
  describe("arrayConcurrentForEachTest", (): void => {
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
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(concurrentForEachTask, arr));
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
        const workers: worker.ThreadWorker[] = [];
        const resultPromises: Promise<Object>[] = [];
        for (let i: number = 0; i < workerCount; i++) {
          const workerInstance: worker.ThreadWorker =
            new worker.ThreadWorker("./workers/ArrayForEachWorker");
          workers.push(workerInstance);
          resultPromises.push(new Promise<Object>(
            (resolve: (value: Object) => void): void => {
              workerInstance.onmessage = (event: MessageEvents): void => {
                resolve(event.data as Object);
              };
            }
          ));
          workerInstance.postMessage(arr);
        }

        const results: Object[] = await Promise.all(resultPromises);
        for (let i: number = 0; i < workers.length; i++) {
          workers[i].terminate();
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
