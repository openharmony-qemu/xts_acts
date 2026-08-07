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
import { collections, taskpool } from "@kit.ArkTS";

@Concurrent
async function indexOfTask(arr: collections.Array<number>, target: number): Promise<number> {
  return arr.indexOf(target);
}

@Concurrent
async function includesTask(arr: collections.Array<number>, target: number): Promise<boolean> {
  return arr.includes(target);
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
        for (let i: number = 0; i < 500; i++) {
          arr.push(i);
        }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(indexOfTask, arr, 250));
        }
        const results: Object[] = await Promise.all(tasks);
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
        for (let i: number = 0; i < 500; i++) {
          arr.push(i);
        }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(indexOfTask, arr, 9999));
        }
        const results: Object[] = await Promise.all(tasks);
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
        for (let i: number = 0; i < 500; i++) {
          arr.push(i);
        }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(includesTask, arr, 100));
        }
        const results: Object[] = await Promise.all(tasks);
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
        for (let i: number = 0; i < 500; i++) {
          arr.push(i);
        }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(includesTask, arr, 0));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as boolean).assertTrue();
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  });
}
