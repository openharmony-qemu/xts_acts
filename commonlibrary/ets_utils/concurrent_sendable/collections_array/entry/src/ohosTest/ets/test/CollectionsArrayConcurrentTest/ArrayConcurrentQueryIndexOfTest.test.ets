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
async function indexOfTask(arr: collections.Array<number>, target: number, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    return arr.indexOf(target);
  });
}

@Concurrent
async function includesTask(arr: collections.Array<number>, target: number, lock: ArkTSUtils.locks.AsyncLock): Promise<boolean> {
  return await lock.lockAsync(async (): Promise<boolean> => {
    return arr.includes(target);
  });
}

export default function arrayConcurrentQueryIndexOfTest(): void {
  describe("arrayConcurrentQueryIndexOfTest", (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_QUERY_0100
     * @tc.name      testArrayConcurrentIndexOf0001
     * @tc.desc      Verify multiple TaskPool tasks can concurrently query a
     *               collections.Array using indexOf and all tasks return correct index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentIndexOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentIndexOf0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        // 对齐设计文档 Section 2.3.1: length=1000, 8并发
        for (let i: number = 0; i < 1000; i++) {
          arr.push(i);
        }
        const tasks: Promise<Object>[] = [];
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        // 对齐设计文档 Section 2.3.1: 8并发
        for (let i: number = 0; i < 8; i++) {
          tasks.push(taskpool.execute(indexOfTask, arr, 250, lock));
        }
        let results: Object[] = [];
        try {
          results = await Promise.all(tasks) as Object[];
        } catch (err) {
          console.error(`Promise.all failed: ${JSON.stringify(err)}`);
        }
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(250);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_QUERY_0200
     * @tc.name      testArrayConcurrentIndexOf0002
     * @tc.desc      Verify concurrent indexOf on a collections.Array for a non-existent
     *               element returns -1 in all tasks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentIndexOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentIndexOf0002";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        // 对齐设计文档 Section 2.3.1: length=1000, 4并发
        for (let i: number = 0; i < 1000; i++) {
          arr.push(i);
        }
        const tasks: Promise<Object>[] = [];
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(indexOfTask, arr, 9999, lock));
        }
        let results: Object[] = [];
        try {
          results = await Promise.all(tasks) as Object[];
        } catch (err) {
          console.error(`results await Promise.all failed: ${JSON.stringify(err)}`);
        }
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(-1);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_QUERY_0300
     * @tc.name      testArrayConcurrentIncludes0001
     * @tc.desc      Verify multiple TaskPool tasks can concurrently query a
     *               collections.Array using includes and all tasks return correct value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentIncludes0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentIncludes0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        // 对齐设计文档 Section 2.3.1: length=1000, 8并发
        for (let i: number = 0; i < 1000; i++) {
          arr.push(i);
        }
        const tasks: Promise<Object>[] = [];
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        // 对齐设计文档 Section 2.3.1: 8并发
        for (let i: number = 0; i < 8; i++) {
          tasks.push(taskpool.execute(includesTask, arr, 100, lock));
        }
        let results: Object[] = [];
        try {
          results = await Promise.all(tasks) as Object[];
        } catch (err) {
          console.error(`results await Promise.all failed: ${JSON.stringify(err)}`);
        }
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as boolean).assertTrue();
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_QUERY_0400
     * @tc.name      testArrayConcurrentIncludes0002
     * @tc.desc      Verify concurrent includes on a collections.Array for a boundary
     *               element returns correct result in all tasks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentIncludes0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentIncludes0002";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        // 对齐设计文档 Section 2.3.1: length=1000, 4并发
        for (let i: number = 0; i < 1000; i++) {
          arr.push(i);
        }
        const tasks: Promise<Object>[] = [];
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(includesTask, arr, 0, lock));
        }
        let results: Object[] = [];
        try {
          results = await Promise.all(tasks) as Object[];
        } catch (err) {
          console.error(`results await Promise.all failed: ${JSON.stringify(err)}`);
        }
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as boolean).assertTrue();
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  });
}
