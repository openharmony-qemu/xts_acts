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
async function createSameLengthTask(length: number, value: number, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    const arr: collections.Array<number> = collections.Array.create<number>(length, value);
    return arr.length;
  });
}

@Concurrent
async function fromArrayLikeTask(source: number[], lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    const arr: collections.Array<number> = collections.Array.from<number>(source);
    return arr.length;
  });
}

@Concurrent
async function fromIterableTask(source: collections.Array<number>, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    const arr: collections.Array<number> = collections.Array.from<number>(source);
    return arr.length;
  });
}

export default function arrayConcurrentCreateFromTest(): void {
  describe("arrayConcurrentCreateFromTest", (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CREATE_0100
     * @tc.name      testArrayConcurrentCreate0001
     * @tc.desc      Verify concurrent collections.Array.create with same parameters
     *               produces instances with correct length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentCreate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentCreate0001";
        console.log(TAG + " start");
        const threadCount: number = 8;
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < threadCount; i++) {
          tasks.push(taskpool.execute(createSameLengthTask, 100, 0, lock));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(100);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CREATE_0200
     * @tc.name      testArrayConcurrentCreate0002
     * @tc.desc      Verify concurrent collections.Array.create with different parameters
     *               produces instances with correct respective lengths.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentCreate0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentCreate0002";
        console.log(TAG + " start");
        const tasks: Promise<Object>[] = [];
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        tasks.push(taskpool.execute(createSameLengthTask, 50, 1, lock));
        tasks.push(taskpool.execute(createSameLengthTask, 200, 2, lock));
        tasks.push(taskpool.execute(createSameLengthTask, 10, 3, lock));
        tasks.push(taskpool.execute(createSameLengthTask, 500, 4, lock));
        const results: Object[] = await Promise.all(tasks);
        expect(results[0] as number).assertEqual(50);
        expect(results[1] as number).assertEqual(200);
        expect(results[2] as number).assertEqual(10);
        expect(results[3] as number).assertEqual(500);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_FROM_0300
     * @tc.name      testArrayConcurrentFrom0001
     * @tc.desc      Verify concurrent collections.Array.from with ArrayLike source
     *               produces instances with correct length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentFrom0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentFrom0001";
        console.log(TAG + " start");
        const source: number[] = [1, 2, 3, 4, 5];
        const tasks: Promise<Object>[] = [];
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(fromArrayLikeTask, source, lock));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(5);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_FROM_0400
     * @tc.name      testArrayConcurrentFrom0002
     * @tc.desc      Verify concurrent collections.Array.from with Iterable source
     *               produces instances with correct length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentFrom0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentFrom0002";
        console.log(TAG + " start");
        const source: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10; i++) {
          source.push(i);
        }
        const tasks: Promise<Object>[] = [];
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(fromIterableTask, source, lock));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(10);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  });
}
