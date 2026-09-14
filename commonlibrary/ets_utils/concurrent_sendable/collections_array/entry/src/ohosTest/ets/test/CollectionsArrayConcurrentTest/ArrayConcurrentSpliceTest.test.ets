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
import { collections, taskpool, ArkTSUtils } from "@kit.ArkTS";

@Concurrent
async function lockedSpliceDeleteTask(arr: collections.Array<number>, start: number, count: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    const deleted: collections.Array<number> = arr.splice(start, count);
    return deleted.length;
  });
}

@Concurrent
async function lockedSpliceInsertTask(arr: collections.Array<number>, start: number, count: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    for (let i: number = 0; i < count; i++) {
      arr.splice(start, 0, i);
    }
    return count;
  });
}

export default function arrayConcurrentSpliceTest(): void {
  describe("arrayConcurrentSpliceTest", (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_SPLICE_0100
     * @tc.name      testArrayConcurrentSplice0001
     * @tc.desc      Verify concurrent splice delete operations on a collections.Array
     *               with AsyncLock delete the correct total number of elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentSplice0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentSplice0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const initialCount: number = 500;
        for (let i: number = 0; i < initialCount; i++) {
          arr.push(i);
        }
        const threadCount: number = 4;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedSpliceDeleteTask, arr, i * 10, 10, lock));
        }
        let results: Object[] = [];
        try {
          results = await Promise.all(tasks) as Object[];
        } catch (err) {
          console.error(`results await Promise.all failed: ${JSON.stringify(err)}`);
        }
        let totalDeleted: number = 0;
        for (let i: number = 0; i < results.length; i++) {
          totalDeleted += results[i] as number;
        }
        expect(totalDeleted + arr.length).assertEqual(initialCount);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_SPLICE_0200
     * @tc.name      testArrayConcurrentSplice0002
     * @tc.desc      Verify concurrent splice insert operations on a collections.Array
     *               with AsyncLock insert the correct total number of elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentSplice0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentSplice0002";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 100; i++) {
          arr.push(i);
        }
        const insertPerThread: number = 20;
        const threadCount: number = 4;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedSpliceInsertTask, arr, i * 10, insertPerThread, lock));
        }
        try {
          await Promise.all(tasks);
        } catch (err) {
          console.error(`await Promise.all failed: ${JSON.stringify(err)}`);
        }
        expect(arr.length).assertEqual(100 + insertPerThread * threadCount);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_SPLICE_0300
     * @tc.name      testArrayConcurrentSplice0003
     * @tc.desc      Verify concurrent splice delete and insert on a collections.Array
     *               with AsyncLock results in consistent final length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentSplice0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentSplice0003";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const initialCount: number = 200;
        for (let i: number = 0; i < initialCount; i++) {
          arr.push(i);
        }
        const threadCount: number = 4;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedSpliceDeleteTask, arr, i * 10, 5, lock));
          tasks.push(taskpool.execute(lockedSpliceInsertTask, arr, i * 10, 3, lock));
        }
        let results: Object[] = [];
        try {
          results = await Promise.all(tasks) as Object[];
        } catch (err) {
          console.error(`results await Promise.all failed: ${JSON.stringify(err)}`);
        }
        let totalDeleted: number = 0;
        for (let i: number = 0; i < results.length; i += 2) {
          totalDeleted += results[i] as number;
        }
        let totalInserted: number = 0;
        for (let i: number = 1; i < results.length; i += 2) {
          totalInserted += results[i] as number;
        }
        expect(totalDeleted + arr.length - totalInserted).assertEqual(initialCount);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  });
}
