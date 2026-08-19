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
async function lockedForEachTask(arr: collections.Array<number>,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    let count: number = 0;
    arr.forEach((value: number): void => { count++; });
    await Promise.resolve();
    return count;
  });
}

@Concurrent
async function lockedPushTask(arr: collections.Array<number>,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    arr.push(9999);
    return arr.length;
  });
}

@Concurrent
async function lockedPopTask(arr: collections.Array<number>,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    const val: number | undefined = arr.pop();
    return val !== undefined ? 1 : 0;
  });
}

@Concurrent
async function lockedSpliceTask(arr: collections.Array<number>,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    const deleted: collections.Array<number> = arr.splice(0, 10);
    return deleted.length;
  });
}

export default function arrayConcurrentLockTest(): void {
  describe("arrayConcurrentLockTest", (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_LOCK_0100
     * @tc.name      testArrayConcurrentLock0001
     * @tc.desc      Verify AsyncLock ensures forEach and push on the same
     *               collections.Array execute without concurrent modification error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentLock0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentLock0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 200; i++) { arr.push(i); }
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let results: Object[] = [];
        try {
          results = [await taskpool.execute(lockedForEachTask, arr, lock)];
        } catch (err) {
          console.error(`results await taskpool.execute failed: ${JSON.stringify(err)}`);
        }
        try {
          await lock.lockAsync(async (err?: Error): Promise<void> => {
            if (err !== undefined) {
              console.error(`lockAsync callback error: ${err.message}`);
            }
            arr.push(9999);
          });
        } catch (err) {
          console.error(`lockAsync failed: ${JSON.stringify(err)}`);
        }
        expect(results[0] as number).assertEqual(200);
        expect(arr.length).assertEqual(201);
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_LOCK_0200
     * @tc.name      testArrayConcurrentLock0002
     * @tc.desc      Verify AsyncLock ensures push and pop on the same
     *               collections.Array execute sequentially without error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentLock0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentLock0002";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 200; i++) { arr.push(i); }
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        try {
          await Promise.all([
          taskpool.execute(lockedPushTask, arr, lock),
          taskpool.execute(lockedPopTask, arr, lock)
        ]);
        } catch (err) {
          console.error(`await Promise.all failed: ${JSON.stringify(err)}`);
        }
        expect(arr.length).assertEqual(200);
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_LOCK_0300
     * @tc.name      testArrayConcurrentLock0003
     * @tc.desc      Verify AsyncLock ensures splice and splice on the same
     *               collections.Array execute sequentially without error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentLock0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentLock0003";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 500; i++) { arr.push(i); }
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let results: Object[] = [];
        try {
          results = await Promise.all([
          taskpool.execute(lockedSpliceTask, arr, lock),
          taskpool.execute(lockedSpliceTask, arr, lock)
        ]);
        } catch (err) {
          console.error(`results await Promise.all failed: ${JSON.stringify(err)}`);
        }
        let totalDeleted: number = 0;
        for (let i: number = 0; i < results.length; i++) {
          totalDeleted += results[i] as number;
        }
        expect(totalDeleted + arr.length).assertEqual(500);
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });
  });
}
