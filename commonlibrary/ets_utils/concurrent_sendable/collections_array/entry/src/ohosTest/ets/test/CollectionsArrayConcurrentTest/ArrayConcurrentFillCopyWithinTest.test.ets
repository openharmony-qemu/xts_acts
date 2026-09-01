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
async function lockedFillTask(arr: collections.Array<number>, value: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    arr.fill(value);
    return arr.length;
  });
}

@Concurrent
async function lockedFillRangeTask(arr: collections.Array<number>, value: number,
  start: number, end: number, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    arr.fill(value, start, end);
    return arr.length;
  });
}

@Concurrent
async function lockedCopyWithinTask(arr: collections.Array<number>, target: number,
  start: number, end: number, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    arr.copyWithin(target, start, end);
    return arr.length;
  });
}

export default function arrayConcurrentFillCopyWithinTest(): void {
  describe("arrayConcurrentFillCopyWithinTest", (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_FILL_0100
     * @tc.name      testArrayConcurrentFill0001
     * @tc.desc      Verify concurrent fill with different values on a collections.Array
     *               with AsyncLock does not cause data corruption.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentFill0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentFill0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 500; i++) {
          arr.push(i);
        }
        const threadCount: number = 4;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedFillTask, arr, i * 10, lock));
        }
        try {
          await Promise.all(tasks);
        } catch (err) {
          console.error(`Promise.all failed: ${JSON.stringify(err)}`);
        }
        expect(arr.length).assertEqual(500);
        const finalValue: number = arr[0];
        const isExpectedValue: boolean =
          finalValue === 0 || finalValue === 10 || finalValue === 20 || finalValue === 30;
        expect(isExpectedValue).assertTrue();
        for (let i: number = 0; i < arr.length; i++) {
          expect(arr[i]).assertEqual(finalValue);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_FILL_0200
     * @tc.name      testArrayConcurrentFill0002
     * @tc.desc      Verify concurrent fill with different ranges on a collections.Array
     *               with AsyncLock fills the correct ranges.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentFill0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentFill0002";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 200; i++) {
          arr.push(i);
        }
        const threadCount: number = 4;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedFillRangeTask, arr, i, i * 10, (i + 1) * 10, lock));
        }
        try {
          await Promise.all(tasks);
        } catch (err) {
          console.error(`await Promise.all failed: ${JSON.stringify(err)}`);
        }
        expect(arr.length).assertEqual(200);
        for (let i: number = 0; i < 40; i++) {
          expect(arr[i]).assertEqual(Math.floor(i / 10));
        }
        for (let i: number = 40; i < arr.length; i++) {
          expect(arr[i]).assertEqual(i);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_COPYWITHIN_0300
     * @tc.name      testArrayConcurrentCopyWithin0001
     * @tc.desc      Verify concurrent copyWithin operations on a collections.Array
     *               with AsyncLock do not cause data corruption.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentCopyWithin0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentCopyWithin0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 500; i++) {
          arr.push(i);
        }
        const threadCount: number = 4;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedCopyWithinTask, arr, 100 + i * 100, 0, 100, lock));
        }
        try {
          await Promise.all(tasks);
        } catch (err) {
          console.error(`await Promise.all failed: ${JSON.stringify(err)}`);
        }
        expect(arr.length).assertEqual(500);
        for (let i: number = 0; i < arr.length; i++) {
          expect(arr[i]).assertEqual(i % 100);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  });
}
