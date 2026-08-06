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
async function lockedUnshiftTask(arr: collections.Array<number>, count: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    for (let i: number = 0; i < count; i++) {
      arr.unshift(i);
    }
    return arr.length;
  });
}

@Concurrent
async function lockedShiftTask(arr: collections.Array<number>, count: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    let shiftCount: number = 0;
    for (let i: number = 0; i < count; i++) {
      const val: number | undefined = arr.shift();
      if (val !== undefined) {
        shiftCount++;
      }
    }
    return shiftCount;
  });
}

@Concurrent
async function lockedUnshiftShiftTask(arr: collections.Array<number>, count: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    for (let i: number = 0; i < count; i++) {
      arr.unshift(i);
      arr.shift();
    }
    return arr.length;
  });
}

export default function arrayConcurrentUnshiftShiftTest(): void {
  describe("arrayConcurrentUnshiftShiftTest", (): void => {
    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_UNSHIFT_0100
     * @tc.name      testArrayConcurrentUnshift0001
     * @tc.desc      Verify multiple TaskPool tasks can concurrently unshift elements
     *               into a collections.Array with AsyncLock and final length is correct.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentUnshift0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentUnshift0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const countPerThread: number = 50;
        const threadCount: number = 8;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedUnshiftTask, arr, countPerThread, lock));
        }
        await Promise.all(tasks);
        expect(arr.length).assertEqual(countPerThread * threadCount);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_SHIFT_0200
     * @tc.name      testArrayConcurrentShift0001
     * @tc.desc      Verify multiple TaskPool tasks can concurrently shift elements from a
     *               collections.Array with AsyncLock and shift count plus final length
     *               equals initial length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentShift0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentShift0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const initialCount: number = 500;
        for (let i: number = 0; i < initialCount; i++) {
          arr.push(i);
        }
        const shiftPerThread: number = 50;
        const threadCount: number = 8;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedShiftTask, arr, shiftPerThread, lock));
        }
        const results: Object[] = await Promise.all(tasks);
        let totalShifted: number = 0;
        for (let i: number = 0; i < results.length; i++) {
          totalShifted += results[i] as number;
        }
        expect(totalShifted + arr.length).assertEqual(initialCount);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_UNSHIFTSHIFT_0300
     * @tc.name      testArrayConcurrentUnshiftShift0001
     * @tc.desc      Verify concurrent unshift and shift operations on a collections.Array
     *               with AsyncLock result in consistent final length equal to initial.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentUnshiftShift0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentUnshiftShift0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const initialCount: number = 100;
        for (let i: number = 0; i < initialCount; i++) {
          arr.push(i);
        }
        const threadCount: number = 8;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(lockedUnshiftShiftTask, arr, 20, lock));
        }
        await Promise.all(tasks);
        expect(arr.length).assertEqual(initialCount);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  });
}
