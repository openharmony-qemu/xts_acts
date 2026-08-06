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
import { collections, taskpool } from "@kit.ArkTS";

@Concurrent
async function findTask(arr: collections.Array<number>, target: number): Promise<number | undefined> {
  return arr.find((value: number): boolean => value === target);
}

@Concurrent
async function findIndexTask(arr: collections.Array<number>, target: number): Promise<number> {
  return arr.findIndex((value: number): boolean => value === target);
}

export default function arrayConcurrentQueryFindTest(): void {
  describe("arrayConcurrentQueryFindTest", (): void => {
    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_QUERY_0500
     * @tc.name      testArrayConcurrentFind0001
     * @tc.desc      Verify multiple TaskPool tasks can concurrently find elements in a
     *               collections.Array and all tasks return the correct value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentFind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentFind0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 500; i++) {
          arr.push(i);
        }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(findTask, arr, 100));
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
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_QUERY_0600
     * @tc.name      testArrayConcurrentFind0002
     * @tc.desc      Verify concurrent find for a non-existent element on a
     *               collections.Array returns undefined in all tasks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentFind0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentFind0002";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 500; i++) {
          arr.push(i);
        }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(findTask, arr, 9999));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number | undefined).assertEqual(undefined);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_QUERY_0700
     * @tc.name      testArrayConcurrentFindIndex0001
     * @tc.desc      Verify multiple TaskPool tasks can concurrently findIndex in a
     *               collections.Array and all tasks return the correct index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentFindIndex0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentFindIndex0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 500; i++) {
          arr.push(i);
        }
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(findIndexTask, arr, 200));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(200);
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  });
}
