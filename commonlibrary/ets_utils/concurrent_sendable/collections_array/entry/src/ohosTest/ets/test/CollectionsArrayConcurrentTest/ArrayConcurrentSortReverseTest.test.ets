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
async function lockedSortTask(arr: collections.Array<number>,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    arr.sort((a: number, b: number): number => a - b);
    return arr.length;
  });
}

@Concurrent
async function lockedReverseTask(arr: collections.Array<number>,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    arr.reverse();
    return arr.length;
  });
}

export default function arrayConcurrentSortReverseTest(): void {
  describe("arrayConcurrentSortReverseTest", (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_SORT_0100
     * @tc.name      testArrayConcurrentSort0001
     * @tc.desc      Verify concurrent sort operations on a collections.Array
     *               with AsyncLock do not cause data corruption.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentSort0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentSort0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 500; i++) {
          arr.push(500 - i);
        }
        const threadCount: number = 4;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedSortTask, arr, lock));
        }
        try {
          await Promise.all(tasks);
        } catch (err) {
          console.error(`await Promise.all failed: ${JSON.stringify(err)}`);
        }
        expect(arr.length).assertEqual(500);
        for (let i: number = 0; i < arr.length; i++) {
          expect(arr[i]).assertEqual(i + 1);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_REVERSE_0200
     * @tc.name      testArrayConcurrentReverse0001
     * @tc.desc      Verify concurrent reverse operations on a collections.Array
     *               with AsyncLock do not cause data corruption.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentReverse0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentReverse0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 500; i++) {
          arr.push(i);
        }
        const threadCount: number = 4;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedReverseTask, arr, lock));
        }
        try {
          await Promise.all(tasks);
        } catch (err) {
          console.error(`await Promise.all failed: ${JSON.stringify(err)}`);
        }
        expect(arr.length).assertEqual(500);
        for (let i: number = 0; i < arr.length; i++) {
          expect(arr[i]).assertEqual(i);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  });
}
